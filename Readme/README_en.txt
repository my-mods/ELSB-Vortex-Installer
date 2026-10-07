================================================================
 ELSB - Character Body Customization Toolkit   v1.1.1   *** UNOFFICIAL ***
================================================================

 This text was translated from Japanese using translation tools,
 so some expressions may be unnatural.


■ What is this

  A tool to choose how Coen and his romance partners Anca, Lacra and Marat look.
  Body, hairstyle, hair color, beard, eye color, skin and naked scenes, all in one window,
  with a preview picture for every choice.
  The new bodies still show the scars, blood and markings where the story puts them.
  You can also import other authors' appearance mods and choose them in the same window.


■ How to use

  1. Extract the whole zip into a folder outside the game folder
  2. Run Start_ELSB.bat
  3. Make your choices on the Coen, Anca, Lacra and Marat tabs
  4. Press Apply
  5. Launch the game

  ELSB finds the game on its own (Steam and GOG). If it does not, press Browse...
  and pick the folder that holds Dawnwalker and Engine.
  ELSB remembers your choices, so you can open it again any time to change them.
  The window language (English / 日本語) can be changed from the list at the top right.


■ Updating from an earlier version

  Extract the new version into a new folder.
  To keep the mods you imported and your choices, copy these two from the old
  folder to the same place in the new folder before you run the new Start_ELSB.bat:
    modules\external   (imported mods)
    ELSB.ini           (your choices)

  If you did not copy them, select a mod that now shows as "Mod in ~mods" in the
  Mods tab and press Import to import it again.
  If you press Apply without importing, ELSB's fitted versions of those mods are
  taken out (ELSB asks you first).


■ Please note

  - Close the game before you press Apply.

  - Never put the ELSB folder in the game's Paks or ~mods folder.
    The game would load every file in it at once.

  - A black window appears as well. This is normal. Leave it minimized;
    it closes together with the ELSB window.

  - Anca, Lacra and Marat use their new body in naked scenes only at first.
    To keep it with clothes on too, set Body scenes to All scenes.
    Their outfits are refit to the new bodies.

  - The first launch right after Apply can take a little longer, because your
    antivirus checks the new files.

  - After a game update, check whether a new version of ELSB is out.


■ Uninstall

  Press Remove all (back to vanilla). It takes out every file ELSB placed
  and leaves your other mods alone.

  By hand, ELSB's files are the ones starting with ELSB_. Files from v1.0 start with
  Goldwalker (its working title):
    <Game>\Dawnwalker\Content\Paks\~mods\ELSB_*_P       (.pak / .ucas / .utoc)
    <Game>\Dawnwalker\Content\Paks\~mods\Goldwalker*_P   (v1.0)
  Compatibility patches start with 0ELSB_Compat, and imported skin, makeup and
  tattoo mods start with 0ELSB_Skin_:
    <Game>\Dawnwalker\Content\Paks\~mods\0ELSB_*_P

  Mods you turned off in the Mods tab were moved here, not deleted:
    <Game>\Dawnwalker\Content\ELSB_DisabledMods


■ Safety

  ELSB never changes a file the game shipped with. It only adds files to ~mods,
  so taking them out brings vanilla back.

    - Does not touch the game executable
    - Does not touch the game's own PAK files
    - Writes nothing to your save data
    - Never overwrites another mod (mods you turn off are moved, never deleted)
    - Uses no loader such as UE4SS

  ELSB.ps1 is plain text. You can read it in Notepad before running it.


■ Using other mods

  - Works alongside BoDQS and Bloodywalker (they change different data).

  - Drag another appearance mod's zip (or folder) onto the Mods tab to import it.
    A mod that changes the same parts as an ELSB item becomes one more choice
    in that item, so you run one or the other. Mods that overlap nothing just
    switch on and off with the check box.

  - Skin, makeup and tattoo mods (ones that only change a character's head or body
    textures) are listed under that character's "Skin, makeup and tattoos". They go in
    alongside the ELSB body. Where both change the same texture, the mod's is used,
    except for textures that a compatibility patch changes.

  - The list in the Mods tab shows whether each mod works with ELSB
    (Works with ELSB, Replaces part of ELSB, Conflicts with part of ELSB),
    even for mods you have not chosen yet. Select a mod to see the details below.

  - Mods you put in ~mods yourself show as "Mod in ~mods". Select one and press
    Import to import it (no zip needed), so you can choose it on the character tabs.
    Imported mods can be removed with "Remove from list" (for mods imported from
    ~mods, the files in ~mods are left in place).


■ Compatibility with other mods (v1.1)

  ELSB includes fitted versions (compatibility patches) for the mods below.
  Import the mod in the "Mods" tab and use an ELSB body for that character,
  and the patch is used automatically.
  The original mod is required. The patch alone changes nothing.

    Mod (author)                                        Where to choose it
    Thicc Anca by MM (MistrianMilker)                    Anca's outfit
    Revealing Thicc Anca by MM (ScrumpChewie)            Anca's outfit
    Wrong Sized Tanktop For Thicc Anca (ScrumpChewie)    Anca's outfit
    Revealing Anca (Joell560)                            Anca's outfit
    Revealing Lacra (Joell560)                           Lacra's outfit
    Coen's Nude Mod (dakyoz)                             Coen's genitals / Marat's genitals

  - Once imported, the mod shows "ELSB-ready" in the Mods tab.
  - When you choose one of the outfit mods, "Anca's body scenes" or
    "Lacra's body scenes" is set to "All scenes" automatically.
  - With Coen's Nude Mod imported, "Genitals" appears on Coen's tab and
    "Marat's genitals" on Marat's tab. They can be chosen separately.
    They are visible in naked scenes and in scenes where ELSB removes
    the underwear.
  - To see how to use the patch and whether it is in the game now, select the mod
    in the "Mods" tab and read the description below the list.
  - If your copy of the mod is a different version (for example, the
    author updated it), the patch is not used and the original mod is
    placed as it is.


■ Troubleshooting

  - The window does not appear
      Extract the whole zip again. Keep Start_ELSB.bat, ELSB.ps1, modules and
      assets together.

  - Nothing changes in the game
      Restart the game. In the Mods tab, check whether the mod shows "Not used now".

  - Xbox / Game Pass version
      Not supported yet.


■ For mod authors (getting your mod into ELSB)

  - Put elsb_preview.png (.jpg and .webp work too) in your archive (zip / rar / 7z).
    It becomes the preview of your choice when a player imports the mod.
    Images over 1600 px on the long side are scaled down. Without that name,
    ELSB uses an image only when it is the only one in the archive
    (images starting with T_ are never used).

  - Put elsb_item.txt in your archive with an item key (list below) on the first line,
    and your mod is listed under that item. Write none to keep it out of the lists;
    it then only switches on and off. The key only counts when your mod replaces
    files of that item; otherwise ELSB picks the item itself.
    The genitals and skin items are the exception: they take a mod even when no file overlaps.

  - Upload colors or styles as separate files, or put each variant in its own folder
    inside one archive. Folders that replace the same files become one choice each
    ("archive name - folder name"). Put elsb_preview.png and elsb_item.txt in each
    variant folder. Files that no variant overlaps are shared by all of them.
    FOMOD installers are not supported.

  - Skin, makeup and tattoo mods (only head or body textures of a character) are listed
    under that character's "Skin, makeup and tattoos" and go in alongside the ELSB body.
    ELSB puts 0ELSB_Skin_ in front of their file names so that their textures win.

  - ELSB's files start with ELSB_. In ~mods the file whose name sorts first wins.

  - When players import an update of your mod, the item they chose and any preview
    they set themselves stay as they were.

  Item keys for elsb_item.txt:
    Coen   body, hair, hair_color, beard, beard_color, eyes, romance, coen_uw, genitals, skin
    Anca   anca_body, anca_scope, anca_outfit, anca_skin, anca_hair, anca_hair_color
    Lacra  lacra_body, lacra_scope, lacra_outfit, lacra_skin, lacra_hair, lacra_hair_color,
           lacra_eyes
    Marat  marat_body, marat_scope, marat_outfit, marat_skin, marat_romance, marat_hair,
           marat_hair_color, marat_beard, marat_beard_color

  How to fit outfits to the ELSB bodies is under FOR MOD AUTHORS on ELSB's Nexus page.


================================================================
 This is UNOFFICIAL fan-made content, not affiliated with or
 endorsed by Rebel Wolves or Bandai Namco Entertainment.
 Non-commercial. Use at your own risk.
================================================================
