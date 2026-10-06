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

function unavailableReason(option) {
  if (option?.type !== 'NotUsable') return undefined;
  const hint = /^Availability: ([^\r\n]+)/m.exec(option.description || '')?.[1];
  return hint ? `Unavailable with the current choices. ${hint}` : option.conditionMsg || undefined;
}

// Presentation only: use the native dialog, controls and preview handler.
// This module never selects an option or emits an installer action.
function createPresentation(api, doc, log = () => {}, debugLogging = false) {
  if (!doc?.body?.classList || typeof api.onStateChange !== 'function') return undefined;
  let enabled;
  let stopped = false;
  let frame;
  const changed = new Map();
  const setAttribute = (node, name, value) => {
    if (!node) return;
    let attrs = changed.get(node);
    if (!attrs) { attrs = new Map(); changed.set(node, attrs); }
    if (!attrs.has(name)) attrs.set(name, { before: node.getAttribute(name) });
    attrs.get(name).after = value;
    node.setAttribute(name, value);
  };
  const restore = node => {
    for (const [name, value] of changed.get(node) || []) {
      if (node.getAttribute(name) !== value.after) continue;
      if (value.before === null) node.removeAttribute(name);
      else node.setAttribute(name, value.before);
    }
    changed.delete(node);
  };
  const decorate = label => {
    const input = label.querySelector('input[type="radio"]');
    const match = /^radio-(\d+)-(\d+)-(\d+)$/.exec(input?.id || '');
    const dialog = api.getState()?.session?.fomod?.installer?.dialog;
    const steps = dialog?.instances?.[dialog.activeInstanceId]?.state?.installSteps;
    const step = steps?.find(s => String(s.id) === match?.[1]);
    const group = step?.optionalFileGroups?.group?.find(g => String(g.id) === match?.[2]);
    const option = group?.options?.find(o => String(o.id) === match?.[3]);
    const link = label.querySelector('a.fake-link[data-value]');
    const reason = unavailableReason(option);
    if (!reason) { restore(label); if (link) restore(link); return; }
    setAttribute(label, 'title', reason);
    setAttribute(link, 'title', reason);
    // Disabled native inputs cannot receive Tab. Their existing preview labels can.
    setAttribute(link, 'tabindex', '0');
    setAttribute(link, 'aria-label', `${option.name}. ${reason}`);
  };
  const refresh = () => {
    frame = undefined;
    for (const node of changed.keys()) restore(node);
    if (!enabled || stopped) return;
    for (const label of doc.querySelectorAll?.('#fomod-installer-dialog #fomod-installer-form .radio label') || []) decorate(label);
  };
  const schedule = () => {
    const requestFrame = doc.defaultView?.requestAnimationFrame;
    if (requestFrame) {
      if (frame === undefined) frame = requestFrame.call(doc.defaultView, refresh);
    } else refresh();
  };
  const sync = () => {
    if (stopped) return;
    const next = activeDialog(api.getState());
    if (next !== enabled) {
      enabled = next;
      doc.body.classList.toggle(CLASS, enabled);
      if (debugLogging) log('info', 'ELSB installer layout', { enabled });
    }
    schedule();
  };
  const hoverReason = event => {
    if (!enabled) return;
    const label = event.target?.closest?.('#fomod-installer-form .radio label');
    if (label?.closest('#fomod-installer-dialog')) decorate(label);
  };
  const focusPreview = event => {
    if (!enabled) return;
    const input = event.target;
    const isInput = input?.matches?.('#fomod-installer-form input[type="radio"]');
    const isLink = input?.matches?.('#fomod-installer-form a.fake-link[data-value]');
    if (!isInput && !isLink) return;
    if (!input.closest('#fomod-installer-dialog')) return;
    const link = isLink ? input : input.closest('label')?.querySelector('a.fake-link[data-value]');
    const MouseEvent = doc.defaultView?.MouseEvent;
    if (link && MouseEvent) link.dispatchEvent(new MouseEvent('mouseover', { bubbles: true }));
  };
  api.onStateChange(DIALOG, sync);
  doc.addEventListener('focusin', focusPreview);
  doc.addEventListener('mouseover', hoverReason);
  sync();
  return { sync, stop() {
    stopped = true;
    enabled = false;
    doc.body.classList.remove(CLASS);
    doc.removeEventListener('focusin', focusPreview);
    doc.removeEventListener('mouseover', hoverReason);
    if (frame !== undefined) doc.defaultView?.cancelAnimationFrame?.(frame);
    for (const node of changed.keys()) restore(node);
  } };
}

module.exports = { activeDialog, createPresentation, unavailableReason };
