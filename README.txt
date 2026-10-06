ELSB - Vortex Installer
Personal development package based on ELSB 1.1.1

Choose Coen, Anca, Lacra and Marat's existing ELSB body, hairstyle, colour,
beard, eye, outfit and scene options in Vortex. Anca and Lacra independently
offer Vanilla, ELSB, or ELSB + Pussy Walker. Neither add-on body is selected
by default on a fresh install. First-install suggestions reflect the saved
toolkit preferences at preparation.

The original ELSB module files are unchanged. The personal body add-on and
Lacra hair/texture compatibility containers are separate additions. Original
third-party mods are not bundled. You manage their activation in Vortex.
No ELSB toolkit program, configuration or direct-copy operation is installed.

Every wizard choice has a picture. Original ELSB previews are reused unchanged;
the Lacra hair and chest patches use their Nexus images. The two personal body
choices show a clearly identified ELSB body reference; their added geometry is
not pictured. Preview images remain in the installer and are not game files.

Each compatibility choice starts with an activation warning naming the Nexus
mod and exact supported archive. Activate and deploy that original as its own
Vortex entry when using the patch. The wizard does not check or change its
activation state. See Compatibility.txt for the same archive names.

Installation
- Vortex: Complete Migration.txt, install ELSB - Vortex Installer.zip, choose options, enable this entry and deploy. Keep required third-party originals as separate entries.
- Manual: This archive contains alternative payloads and requires its FOMOD wizard. Do not copy the whole Payload directory into the game.

Changing choices
Use Reinstall on this same Vortex entry, adjust the wizard and deploy.
Install the companion ELSB - Saved Installer Choices.zip through Vortex's
Extensions page once, then restart Vortex. With that helper enabled, rerunning
the wizard or replacing/updating this entry keeps saved choices by default
when the same options still exist and remain usable. New or removed choices
use the wizard's defaults. You can change every preselection normally.
The helper also supports the original personal installer entry. It is needed
because Vortex 2.7.2 does not consistently forward saved choices for local ZIP
replacements or different-version updates. XML alone cannot recover them.
Keep the existing mod entry when starting its replacement; deleting it first
deletes its saved choices. An ambiguous match between multiple variants asks
you to review the wizard rather than choosing another variant's preferences.
See the companion archive's README.txt for installation and diagnostics.
Choosing Vanilla removes this entry's corresponding options on reinstall.
Disabling this entry removes its managed files on deployment. It does not
disable third-party originals. Avoid installing a second copy of this entry.
Deployment alone does not rerun the wizard.

Scene and outfit choices
An ELSB partner body initially affects naked scenes. All scenes extends it
to clothed scenes. Selecting an outfit also extends an ELSB body to all
scenes, matching the toolkit's outfit dependency. Fitted third-party outfits
require the corresponding ELSB body; both personal variants count as ELSB.
Vanilla-body choices remain independent for each character.
Story scars, wounds and skin states use the original ELSB options. The
personal add-on keeps the original torso meshes and supplies its own legs.

Compatibility and audit
See Compatibility.txt for the reviewed combinations and exact versions.
Run the optional read-only audit outside the game to show patches for
currently deployed originals. It distinguishes deployment from staging,
checks known container hashes and lists internal Unreal asset overlaps.
See Audit/README.txt. It never activates, disables, installs or removes mods.
The FOMOD wizard cannot automatically detect arbitrary active Dawnwalker
containers, source hashes or mesh compatibility. Choose patches explicitly
after enabling their matching originals. An unknown mod is not automatically
incompatible; review its relevant assets before adding a new patch.

Requirements
Tested installer: Vortex 2.7.2 with Dawnwalker extension 1.1.0. This is the
tested environment, not a whole-game version lock. No UE4SS dependency is
introduced by this installer. Optional audit: Python 3.11+; retoc is optional
for listing assets in unknown containers and is not bundled.

Ownership
Runtime containers go to Dawnwalker/Content/Paks/~mods relative to the game
root. Only selected options and required shared modules are installed.
A small entry receipt goes to ELSB-Vortex/Installed.txt outside Paks.
Documentation, provenance and audit files remain in the archive and are not
deployed by the wizard. Extract them somewhere outside the game when needed.
Keep the original ELSB toolkit as a preserved reference outside the game;
after migration, use Vortex exclusively for these installed assets.

Personal use
This is an unofficial personal development package. No public redistribution
permission is granted. See CREDITS.txt and LICENSE.txt. Asset/package checks
are documented separately in Verification.txt; gameplay acceptance is pending.
