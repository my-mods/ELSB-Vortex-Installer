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

function createDisclosures(api, doc, schedule, setAttribute, restore) {
  if (!doc.createElement || !doc.querySelectorAll) return undefined;
  const records = new Map();
  const expanded = new Map();
  let observer;
  let stopped = false;
  const toggleClass = (node, name, on) => {
    if (node.classList.contains(name) !== on) node.classList.toggle(name, on);
  };
  const setText = (node, value) => { if (node.textContent !== value) node.textContent = value; };
  const dialogState = () => api.getState()?.session?.fomod?.installer?.dialog;
  const read = record => {
    const dialog = dialogState();
    if (dialog?.activeInstanceId !== record.instanceId) return undefined;
    const instance = dialog.instances?.[record.instanceId];
    const step = instance?.state?.installSteps?.[instance.state.currentStep];
    const group = step?.optionalFileGroups?.group?.find(g => String(g.id) === record.groupId);
    if (String(step?.id) !== record.stepId || group?.type !== 'SelectExactlyOne') return undefined;
    const inputs = [...record.node.querySelectorAll('.radio input[type="radio"]')];
    const selected = inputs.filter(input => input.checked);
    const optionId = selected[0]?.id.split('-')[3];
    const option = group.options.find(o => String(o.id) === optionId);
    const invalid = record.node.classList.contains('has-error') || selected.length !== 1
      || !option || option.type === 'NotUsable';
    return { group, selected, option, invalid };
  };
  const paint = record => {
    const current = read(record);
    if (!current) return;
    // Keep an invalid group open after correction too, so its focused radio stays visible.
    if (current.invalid) expanded.set(record.key, true);
    const open = expanded.get(record.key);
    setText(record.title, record.heading.textContent.trim());
    setText(record.value, current.selected.length === 1 && current.option
      ? current.option.name + (current.option.type === 'NotUsable' ? ' (unavailable)' : '')
      : 'Choose an option');
    record.button.setAttribute('aria-expanded', String(open));
    record.button.setAttribute('aria-disabled', String(current.invalid));
    if (current.invalid) record.button.title = 'Choose an available option before closing this group.';
    else record.button.removeAttribute('title');
    toggleClass(record.node, 'elsb-group-collapsed', !open);
  };
  const preview = record => {
    paint(record);
    const current = read(record);
    if (current?.selected.length !== 1) return;
    const link = current.selected[0].closest('label')?.querySelector('a.fake-link[data-value]');
    const MouseEvent = doc.defaultView?.MouseEvent;
    if (link && MouseEvent) link.dispatchEvent(new MouseEvent('mouseover', { bubbles: true }));
  };
  const remove = record => {
    record.button.remove();
    record.node.classList.remove('elsb-group', 'elsb-group-collapsed');
    restore(record.node);
    records.delete(record.node);
  };
  const add = (node, heading, instanceId, step, group, index) => {
    const key = JSON.stringify([instanceId, String(step.id), String(group.id)]);
    if (!expanded.has(key)) expanded.set(key, index === 0);
    const button = doc.createElement('button');
    button.type = 'button';
    button.className = 'elsb-group-toggle';
    const chevron = doc.createElementNS('http://www.w3.org/2000/svg', 'svg');
    chevron.setAttribute('viewBox', '0 0 16 16');
    chevron.setAttribute('aria-hidden', 'true');
    chevron.setAttribute('focusable', 'false');
    const path = doc.createElementNS('http://www.w3.org/2000/svg', 'path');
    path.setAttribute('d', 'M6 3.5 10.5 8 6 12.5');
    chevron.appendChild(path);
    const title = doc.createElement('span');title.className = 'elsb-group-name';
    const value = doc.createElement('span');value.className = 'elsb-group-value';
    button.append(chevron, title, value);
    const record = { node, heading, button, title, value, instanceId, key,
      stepId: String(step.id), groupId: String(group.id) };
    button.addEventListener('mouseenter', () => preview(record));
    button.addEventListener('focus', () => preview(record));
    button.addEventListener('click', () => {
      preview(record);
      const current = read(record);
      if (current && !current.invalid) {
        expanded.set(key, !expanded.get(key));
        paint(record);
      }
    });
    // Insert a sibling only. React retains ownership and position of every native control.
    node.insertBefore(button, heading);
    records.set(node, record);
    return record;
  };
  const ownClass = value => (value || '').split(/\s+/).filter(c => !c.startsWith('elsb-')).join(' ');
  const observe = () => {
    if (observer || !doc.defaultView?.MutationObserver) return;
    observer = new doc.defaultView.MutationObserver(mutations => {
      if (stopped) return;
      const relevant = mutations.some(mutation => {
        const target = mutation.target.nodeType === 1 ? mutation.target : mutation.target.parentElement;
        if (target?.closest('.elsb-group-toggle')) return false;
        if (mutation.type === 'attributes' && mutation.attributeName === 'class'
          && ownClass(mutation.oldValue) === ownClass(target?.getAttribute('class'))) return false;
        const nodes = [...(mutation.addedNodes || []), ...(mutation.removedNodes || [])];
        if (nodes.length && nodes.every(n => n.nodeType === 1 && n.matches('.elsb-group-toggle'))) return false;
        return target?.closest('#fomod-installer-dialog')
          || nodes.some(n => n.nodeType === 1
            && (n.id === 'fomod-installer-dialog' || n.querySelector('#fomod-installer-dialog')));
      });
      if (relevant) schedule();
    });
    // Watch native mounts, validation and dependency updates only while ELSB is active.
    observer.observe(doc.body, { childList: true, subtree: true, characterData: true,
      attributes: true, attributeFilter: ['class', 'disabled', 'checked'], attributeOldValue: true });
  };
  const refresh = enabled => {
    const dialog = dialogState();
    for (const key of expanded.keys()) {
      if (!dialog?.instances?.[JSON.parse(key)[0]]) expanded.delete(key);
    }
    if (!enabled || stopped) {
      observer?.disconnect();observer = undefined;
      for (const record of records.values()) remove(record);
      return;
    }
    observe();
    const instanceId = dialog.activeInstanceId;
    const instance = dialog.instances[instanceId];
    const step = instance.state.installSteps[instance.state.currentStep];
    const groups = step?.optionalFileGroups?.group || [];
    const found = new Set();
    for (const node of doc.querySelectorAll('#fomod-installer-dialog #fomod-installer-form .form-group')) {
      const input = node.querySelector('.radio input[type="radio"]');
      const match = /^radio-(\d+)-(\d+)-(\d+)$/.exec(input?.id || '');
      const group = groups.find(g => String(g.id) === match?.[2]);
      const heading = [...node.children].find(n => n.classList.contains('control-label'));
      if (!heading || String(step?.id) !== match?.[1] || group?.type !== 'SelectExactlyOne'
        || node.querySelectorAll('.radio input[type="radio"]').length !== group.options.length) continue;
      let record = records.get(node);
      if (record && (record.instanceId !== instanceId || record.stepId !== match[1]
        || record.groupId !== match[2] || record.heading !== heading || record.button.parentElement !== node)) {
        remove(record);record = undefined;
      }
      record = record || add(node, heading, instanceId, step, group, groups.indexOf(group));
      found.add(node);
      if (!node.id) setAttribute(node, 'id', `elsb-options-${step.id}-${group.id}`);
      record.button.setAttribute('aria-controls', node.id);
      toggleClass(node, 'elsb-group', true);
      paint(record);
    }
    for (const record of records.values()) if (!found.has(record.node)) remove(record);
  };
  return { refresh, stop() { stopped = true;refresh(false);expanded.clear(); } };
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
    disclosures?.refresh(enabled && !stopped);
    if (!enabled || stopped) return;
    for (const label of doc.querySelectorAll?.('#fomod-installer-dialog #fomod-installer-form .radio label') || []) decorate(label);
  };
  const schedule = () => {
    const requestFrame = doc.defaultView?.requestAnimationFrame;
    if (requestFrame) {
      if (frame === undefined) frame = requestFrame.call(doc.defaultView, refresh);
    } else refresh();
  };
  const disclosures = createDisclosures(api, doc, schedule, setAttribute, restore);
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
  const selectionChanged = event => {
    if (enabled && event.target?.matches?.('#fomod-installer-dialog #fomod-installer-form input[type="radio"]')) schedule();
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
  doc.addEventListener('change', selectionChanged);
  sync();
  return { sync, stop() {
    stopped = true;
    enabled = false;
    doc.body.classList.remove(CLASS);
    doc.removeEventListener('focusin', focusPreview);
    doc.removeEventListener('mouseover', hoverReason);
    doc.removeEventListener('change', selectionChanged);
    disclosures?.stop();
    if (frame !== undefined) doc.defaultView?.cancelAnimationFrame?.(frame);
    for (const node of changed.keys()) restore(node);
  } };
}

module.exports = { activeDialog, createPresentation, unavailableReason };
