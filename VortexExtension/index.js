'use strict';

const path = require('path');
const GAME = 'thebloodofdawnwalker';
const IDENTITY = 'ELSBVortexInstaller';
const MODULE = 'ELSB - Vortex Installer';
const DIALOG = ['session', 'fomod', 'installer', 'dialog'];
const clone = value => JSON.parse(JSON.stringify(value));
const unique = (items, predicate) => {
  const matches = (items || []).filter(predicate);
  return matches.length === 1 ? matches[0] : undefined;
};

function validChoices(value) {
  return value?.type === 'fomod' && Array.isArray(value.options)
    && value.options.every(s => s && typeof s.name === 'string' && Array.isArray(s.groups)
      && s.groups.every(g => g && typeof g.name === 'string' && Array.isArray(g.choices)
        && g.choices.every(c => c && typeof c.name === 'string')));
}

function records(state) {
  return Object.entries(state.persistent?.mods?.[GAME] || {}).flatMap(([id, mod]) => {
    const attrs = mod?.attributes || {};
    if (!validChoices(attrs.installerChoices)) return [];
    // Bootstrap the original personal package, which predates the identity attribute.
    const legacy = (id === MODULE || id.startsWith(MODULE + '+'))
      && ['Coen', 'Anca', 'Lacra', 'Marat'].every(who => ['Body and scenes', 'Hair and eyes']
        .every(section => attrs.installerChoices.options.some(s => s.name === `${who} - ${section}`)));
    if (attrs.elsbInstallerIdentity !== IDENTITY && !legacy) return [];
    return [{ id, installationPath: mod.installationPath || id, choices: clone(attrs.installerChoices) }];
  });
}

function createController(api, log = () => {}, debugLogging = false) {
  let snapshot;
  let installGame;
  let installInfo;
  let queued = false;
  const sessions = new Map();
  const diagnostic = (message, data) => { if (debugLogging) log('info', `ELSB choices: ${message}`, data); };

  function capture(gameId, _archiveId, _modId, info) {
    installGame = gameId;
    // Vortex fills previous after its Replace/Variant decision. Keep the reference
    // so an explicit opt-out and the exact selected predecessor are respected.
    installInfo = info;
    snapshot = gameId === GAME ? records(api.getState()) : [];
  }

  function notify(id, message) {
    api.sendNotification?.({ id: `elsb-choices-${id}`, type: 'warning', title: 'ELSB saved choices', message });
  }

  function drive() {
    const state = api.getState();
    const dialog = state.session?.fomod?.installer?.dialog;
    for (const [id, session] of sessions) {
      if (!dialog?.instances?.[id]?.info) {
        diagnostic('wizard closed', { restored: session.restored, unavailable: session.unavailable });
        sessions.delete(id);
      }
    }
    if (installGame !== GAME) return;
    if (installInfo?.previous && !installInfo.previous.installerChoices) return;
    const id = dialog?.activeInstanceId;
    const instance = dialog?.instances?.[id];
    if (!id || instance?.info?.moduleName !== MODULE || !Array.isArray(instance.state?.installSteps)) return;
    const current = instance.state.installSteps[instance.state.currentStep];
    if (!current || current.visible === false) return;
    let session = sessions.get(id);
    if (!session) {
      const available = snapshot ?? records(state);
      const target = path.win32.basename(instance.info.dataPath || '').replace(/\.installing$/i, '');
      const exact = unique(available, r => r.id.toLowerCase() === target.toLowerCase()
        || path.win32.basename(r.installationPath).toLowerCase() === target.toLowerCase());
      const previous = installInfo?.previous?.installerChoices;
      const source = validChoices(previous) ? { id: target, choices: clone(previous) }
        : exact || (available.length === 1 ? available[0] : undefined);
      session = { source, done: new Set(), restored: 0, unavailable: 0 };
      sessions.set(id, session);
      if (!source && available.length > 1) notify(id, 'Several ELSB variants have saved choices. This installer could not identify a unique previous entry. Review the wizard selections.');
    }
    if (!session.source) return;
    const oldStep = unique(session.source.choices.options, s => s.name === current.name);
    for (const group of current.optionalFileGroups?.group || []) {
      const key = `${current.id}:${group.id}`;
      if (session.done.has(key)) continue;
      session.done.add(key);
      // Native presets (including explicit collection choices) take precedence.
      if (group.options?.some(o => o.preset)) continue;
      const oldGroup = unique(oldStep?.groups, g => g.name === group.name);
      if (!oldGroup || oldGroup.choices.length !== 1 || group.type !== 'SelectExactlyOne') continue;
      const option = unique(group.options, o => o.name === oldGroup.choices[0].name);
      if (!option || !['Optional', 'Recommended', 'Required'].includes(option.type)) {
        session.unavailable++;
        continue;
      }
      if (option.selected && group.options.filter(o => o.selected).length === 1) continue;
      const event = `fomod-installer-select-${id}`;
      if (api.events.listenerCount(event) === 0) {
        notify(id, 'The FOMOD selection interface is unavailable. Saved choices could not be restored; review this wizard.');
        session.source = undefined;
        return;
      }
      session.restored++;
      api.events.emit(event, String(current.id), String(group.id), [String(option.id)]);
      // Wait for the engine to recalculate dependencies before restoring the next group.
      return;
    }
  }

  function schedule() {
    if (queued) return;
    queued = true;
    setImmediate(() => {
      queued = false;
      try { drive(); }
      catch (error) {
        diagnostic('restoration failed', { message: error.message });
        notify('failed', 'Saved choices could not be restored. Review the ELSB wizard selections.');
      }
    });
  }

  api.onAsync('will-install-mod', async (...args) => { capture(...args); });
  api.onStateChange(DIALOG, schedule);
  return { capture, schedule, drive };
}

function main(context) {
  const { log } = require('vortex-api');
  const { debugLogging } = require('./config.json');
  context.once(() => {
    const api = context.api;
    if (typeof api.onStateChange !== 'function' || typeof api.onAsync !== 'function'
      || typeof api.events?.listenerCount !== 'function') {
      api.sendNotification?.({ type: 'warning', title: 'ELSB saved choices',
        message: 'This Vortex installation does not expose the required installer events. Review ELSB choices manually.' });
      return;
    }
    createController(api, log, debugLogging === true);
  });
  return true;
}

module.exports = { default: main, createController, records, validChoices };
