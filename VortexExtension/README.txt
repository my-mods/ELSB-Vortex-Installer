ELSB - Saved Installer Choices

This companion Vortex extension restores existing ELSB choices when its normal
FOMOD wizard opens, including local ZIP replacements and version updates.
It also gives the ELSB wizard a larger window, clearer option groups, readable
descriptions and more space for pictures. Selected options are highlighted.
Keyboard focus previews an option without selecting it; image zoom remains
available. Narrow windows stack the panes while keeping navigation visible.
It uses choices saved in the existing Vortex entry. No game files are read or
changed by the extension, and it does not activate or deactivate mods.

Installation
- Vortex: Open Extensions, use Install From File with ELSB - Saved Installer Choices.zip to install or replace this extension, enable it and restart Vortex.
- Manual: Use Vortex's extension installer; do not copy this ZIP into the game or install it from the game's Mods page.

The extension keeps its existing name and ID. Replacing it adds the layout
improvements without requiring a replacement of the ELSB game-mod archive.
The new layout is active only while the ELSB - Vortex Installer wizard is open.
Other installers keep their normal appearance. Fonts, theme colors, controls,
page order and installer choices remain Vortex-managed.

Use the same ELSB mod entry when updating or reinstalling. Existing choices
are preselected when their page, group and option still exist and the option
is usable. Removed or unavailable choices use the wizard's defaults. New
groups also use their defaults. You can change any preselection normally;
going back to an earlier page will not undo your changes in that wizard run.
Explicit presets already supplied by Vortex take precedence.

Choices are matched by names, never by a stale numeric position. If multiple
ELSB variants exist and the previous entry cannot be identified uniquely,
the extension leaves the wizard alone and asks you to review its selections.
Fresh installs and other mods' installers retain their own defaults.

Keep the existing ELSB entry until starting its replacement. Removing it first
also removes the saved choices; this extension does not keep a separate history.
For a deliberate reset to first-install defaults, decline Vortex's option
to reuse choices when it is offered. The helper respects that explicit reset.

The helper requires Vortex's installer events and dialog state. Styling also
requires its extension stylesheet interface; when that interface is unavailable,
the standard layout remains usable. It does not patch the Vortex application or
game extension. Unattended installs using explicit presets remain Vortex-managed.

Diagnostics are off by default. Set debugLogging to true in this extension's
config.json and restart Vortex to log aggregate restoration counts/errors in
Vortex's normal vortex.log. No individual choices are written to that log.

Personal development companion for ELSB - Vortex Installer. No upstream game
assets or Vortex source code are included. No public release is authorized.
