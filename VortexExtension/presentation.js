'use strict';

const MODULE = 'ELSB - Vortex Installer';
const CLASS = 'elsb-fomod-active';
const DIALOG = ['session', 'fomod', 'installer', 'dialog'];

function activeDialog(state) {
  const dialog = state?.session?.fomod?.installer?.dialog;
  const instance = dialog?.instances?.[dialog.activeInstanceId];
  return Boolean(dialog?.activeInstanceId && instance?.info?.moduleName === MODULE
    && Array.isArray(instance.state?.installSteps));
}

// Presentation only: use the native dialog, controls and preview handler.
// This module never selects an option or emits an installer action.
function createPresentation(api, doc, log = () => {}, debugLogging = false) {
  if (!doc?.body?.classList || typeof api.onStateChange !== 'function') return undefined;
  let enabled;
  let stopped = false;
  const sync = () => {
    if (stopped) return;
    const next = activeDialog(api.getState());
    if (next === enabled) return;
    enabled = next;
    doc.body.classList.toggle(CLASS, enabled);
    if (debugLogging) log('info', 'ELSB installer layout', { enabled });
  };
  const focusPreview = event => {
    if (!enabled) return;
    const input = event.target;
    if (!input?.matches?.('#fomod-installer-form input[type="radio"]')) return;
    if (!input.closest('#fomod-installer-dialog')) return;
    const link = input.closest('label')?.querySelector('a.fake-link[data-value]');
    const MouseEvent = doc.defaultView?.MouseEvent;
    if (link && MouseEvent) link.dispatchEvent(new MouseEvent('mouseover', { bubbles: true }));
  };
  api.onStateChange(DIALOG, sync);
  doc.addEventListener('focusin', focusPreview);
  sync();
  return { sync, stop() {
    stopped = true;
    enabled = false;
    doc.body.classList.remove(CLASS);
    doc.removeEventListener('focusin', focusPreview);
  } };
}

module.exports = { activeDialog, createPresentation };
