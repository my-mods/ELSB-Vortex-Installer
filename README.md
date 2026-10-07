# ELSB - Vortex Installer

Choose bodies, hair, colours, faces, outfits and scene options for Coen, Anca,
Lacra and Marat through Vortex or the original ELSB toolkit interface. Both
installers share the same predefined choices and file-selection rules. Fresh
installations start with the game's unchanged appearance.

Based on ELSB 1.1.1 by Akazonae36. Existing compatibility choices remain available;
their descriptions name the original downloads they require. Those originals
are separate dependencies, not included imports.

## Installation

- **Vortex:** Install `ELSB - Vortex Installer.zip`, choose options in the FOMOD, enable the entry and deploy.
- **Manual:** Extract the complete ZIP outside the game, run `Start_ELSB.bat`, select the game folder and your choices, then click Apply.

Use one installation method for ELSB at a time. Before switching from Vortex
to the script, disable the ELSB entry and deploy in Vortex. Before switching
from the script to Vortex, use the script's Remove all action for its ELSB
files. Imported third-party mods can still be managed separately. Never copy
the entire `Payload` folder into the game: it contains mutually exclusive
alternatives.

## Choosing options

The manual toolkit retains its character tabs, preview gallery, mod imports,
and mod-management screen. Unavailable options show their requirements and
cannot be applied. Imported mods are additional manual-toolkit choices;
predefined FOMOD choices are available through either installer.

For Vortex, the optional **The Blood of Dawnwalker ELSB Extension** adds
expandable groups, selected-choice previews on header hover, availability
hints and restoration of previous choices. Install its separate ZIP through
Vortex Extensions and restart Vortex. The standard FOMOD works without it.
Use Reinstall on the existing ELSB entry to change selections.

Gothic variants belong in Lacra's body choices and include the complete face
and body skin. Separate face and chest choices cannot accompany those bodies.
See `Compatibility.txt` for the supported original downloads.

## Preferences

The script keeps `ELSB.ini` beside the launcher and preserves existing choices,
unrelated settings and comments. Earlier body-option names and moved choices
are migrated. Changed settings receive a timestamped backup. Keep your existing
INI and `modules/external` imports when updating a manual toolkit; the archive
does not supply personal preferences or imported mods.

The script checks required files before Apply, records the files it owns, and
restores previous files if applying fails. Files changed outside the toolkit
are reported instead of silently overwritten. A failed recovery retains its
backup folder and reports its location.

## Requirements

Manual toolkit: Windows PowerShell 5.1 and Windows Forms, included with Windows.
Vortex installation uses the Dawnwalker game extension. No UE4SS dependency is
introduced. Required third-party originals are named beside the relevant
choices; use their exact supported versions. The optional read-only audit is
documented in `Audit/README.txt` and requires Python 3.11 or later.

## Source repository and local assembly

This repository contains code and installer metadata. It does **not** contain
game assets, meshes, textures, preview images or imported mods. GitHub's source
ZIP is therefore not an installable mod package.

To prepare a complete working tree, copy the matching `Payload`, `fomod/images`
and `assets` directories from a verified full ELSB installer package into the
checkout. The original ELSB archive alone does not contain the additional
integrated payloads. `Provenance/package-assets.json` records every required
non-code file, its destination, size and SHA-256. Keep those assets local.

The archive root must contain the launcher, both PowerShell files, `fomod`,
`Payload`, `assets`, `Readme`, `Data`, player documentation, `Provenance`, the
optional audit, `mod.manifest`, and `vortex_override_instructions.json`.
Exclude `.git`, `.local`, personal INIs/backups, `modules/external`, reports,
and the separately packaged `VortexExtension` directory. Create a ZIP from
those root entries without adding an enclosing directory. The Vortex extension
is packaged separately from the files inside `VortexExtension`.

`fomod/ModuleConfig.xml` is authoritative for predefined choices and selected
runtime files. `SharedInstaller.ps1` evaluates it for the manual toolkit.
Unsupported dependencies and conflicting destination files stop installation.

For a read-only plan, use `powershell -NoProfile -ExecutionPolicy Bypass -File ELSB.ps1 -Plan`.
Add `-SelectionFile choices.json` to provide a JSON object mapping stable group
identifiers to option identifiers from `Provenance/option-identifiers.json`.
Existing named toolkit parameters remain supported and override the corresponding
JSON selection. Plan mode does not install files or save preferences.

## Credits

ELSB toolkit and original modules: **Akazonae36**.
The maintainer confirms permission to use, modify and redistribute ELSB.
Additional authors and sources are recorded in `CREDITS.txt` and `Provenance`.
Permission for ELSB does not grant new rights to other authors' work or game
assets. See `LICENSE.txt` for ownership and permission scope.
