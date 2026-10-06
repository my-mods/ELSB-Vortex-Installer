ELSB - Saved Installer Choices

This companion Vortex extension restores existing ELSB choices when its normal
FOMOD wizard opens, including local ZIP replacements and version updates.
It uses choices saved in the existing Vortex entry. No game files are read or
changed by the extension, and it does not activate or deactivate mods.

Installation
- Vortex: Open Extensions, use Install From File with ELSB - Saved Installer Choices.zip, enable the extension and restart Vortex. This is an extension, not a game mod.
- Manual: Use Vortex's extension installer; do not copy this ZIP into the game or install it from the game's Mods page.

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

Vortex 2.7.2's installer callbacks and native FOMOD engine were checked in
disposable fixtures. The helper requires these capabilities rather than a
specific version number. It does not change the Vortex application or game
extension. Unattended installs using explicit presets remain Vortex-managed.

Diagnostics are off by default. Set debugLogging to true in this extension's
config.json and restart Vortex to log aggregate restoration counts/errors in
Vortex's normal vortex.log. No individual choices are written to that log.

Personal development companion for ELSB - Vortex Installer. No upstream game
assets or Vortex source code are included. No public release is authorized.
