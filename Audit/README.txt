Read-only ELSB compatibility audit

Requires Python 3.11 or newer. Extract Audit somewhere outside the game and
Vortex staging. Run from a terminal (replace the example paths):

py -3 CompatibilityAudit.py --game "<game-root>" --staging "<Vortex-staging>" --output "<report-folder>"

Open Compatibility-Audit.html in the output folder. Its main list shows
patches for originals whose exact supported bytes are currently deployed.
Staged/inactive originals are listed separately. Missing or changed originals
never qualify for a known patch merely because their filenames match.

The auditor reads game containers and Vortex deployment inventories. It
does not read or write Vortex's profile database, toggle mods, deploy files,
rename containers or clean up the game. It writes only its report directory,
which must be outside the game and the supplied staging directory.

Known internal asset paths come from the exact-hash catalogue. For unknown
containers, optionally add --retoc "path\to\retoc.exe" to list their assets.
Retoc is a separate dependency (https://github.com/trumank/retoc). No AES key
is needed for these unencrypted mod-container listings. Without it, unknown
containers remain explicitly uninspected; the audit does not assume safety.

Active means deployed bytes. Enabling or disabling a mod in a Vortex profile
without deploying has not changed the active game files yet. Re-run after
deployment. Hash/provenance checks cannot establish animation or clothing fit.

Migration-Files.csv is a review list, not an automatic remover. See the
package's Migration.txt before changing any installed file.
