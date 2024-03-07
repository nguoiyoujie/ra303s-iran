<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Red Alert INI Options</kbd></kbd><br>
<h2 align="center">Red Alert INI Options</h2>

Preload options can be customized on redalert.ini, which may improve the quality of the game experience.

-------

 - [Custom Resolutions](#custom-resolutions)
 - [No CD](#no-cd) 
 - [Enable Expansions](#enable-expansions) 
 - [Language Support](#language-support) 
 - [Music Listing](#music-listing) 
 - [Map Listing](#map-listing) 
 - [Multiplayer Defaults](#multiplayer-defaults) 
 - [English Intro](#english-intro) 
 - [Video Interlacing](#video-interlacing) 
 - [Sound Overrides](#sound-overrides) 
 - [Visual Overrides](#visual-overrides) 
 - [Gameplay Fixes](#gameplay-fixes) 
 - [Hotkeys](#hotkeys) 


-------
### Custom Resolutions 
<br>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► Width<br>
<code>{redalert.ini}</code> ► [Options]  ► Height
</samp></td><td width="120"><samp>Integer<br>Integer</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from hifi's p-series```
```Modified in iran's s-series```

The game can support custom resolutions. Generally, this means higher resolutions.

The original code for this high resolution feature was written by hifi. Additional improvements had been provided by Iran with the following descriptions:

 - The invisible Ant Missions stereo and Westwood Logo credits selection areas are now adjusted for hi-res, meaning if you click their area on the main menu graphics they'll be activated, like they should.
 - Fixes for the border around the main menu graphics glitching after playing a game, graphical glitching when showing the "restate briefing" screen and some other graphical glitches. Thanks to Nyerguds for practically writing this for me!
 - If a TITLE.PCX is found that doesn't have the same dimensions as the original TITLE.PCX file, it will be displayed on the screen in the top left, this allows people to create their own custom main menu title graphics and have them work with hi-res.
 - The timer tab for maps that use them (e.g. the second Allies mission) has its width adjusted.
 - The expansion missions dialogs are now adjusted for hires, instead of appearing in the top left of the screen.
 - Screenshake should be adjusted for high res now. (Thanks to Arda.dll.inj by AlexB)
 - The "Mission Accomplished", "Mission Failed" and "The Game is a Draw" red text now have their height and width adjusted for high res (Thanks to Arda.dll.inj by AlexB)
 - The score screen is now fully displayed in the top left, instead of showing the score background in the middle
 - Fixed the power indicator displaying glitched when there's no power and in certain other scenarios
 - Added extended sidebar (using graphics and memory addresses taken from Arda, by AlexB)
 - 640x480 does not show black bars on the top and bottom of the screen anymore.
 - You no longer need to scroll the map and open the options menu to fix glitching with maps smaller than your resolution.
 - VQA640 playback is now centered when playing in higher resolutions. This impacts the game intro sequence with a Longbow helicopter hitting a Mammoth Tank, which is the only VQA640 file playback in the original game. 
 - Fix for savegame loading with high resolution, when you save a game the positioning info of a bunch of sidebar elements is saved and they are loaded when you load the save game. I have no idea why Westwood made the game save and load the positioning of sidebar elements. This is fixed now. (Thanks to Nyerguds for giving an explanation how he did this for C&C95)
   
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### No CD
<br>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► NoCD
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from hifi's p-series```

No-CD mode can be enabled/disabled with the `NoCD`= (yes/no) keyword under the [Options] section of **REDALERT.INI**. (from hifi's p-series)
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Enable Expansions
<br>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► CounterstrikeEnabled<br>
<code>{redalert.ini}</code> ► [Options]  ► AftermathEnabled
</samp></td><td width="120"><samp>Boolean<br>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

The Counterstrike expansion can be enabled/disabled with the `CounterstrikeEnabled`= (yes/no) keyword under the [Options] section of **REDALERT.INI**. Likewise there's a `AftermathEnabled`= (yes/no) keyword to enable/disable the Aftermath expansion.
</details></td></tr></table>


<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► ForceAMUnitsInMissions
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Added a REDALERT.INI options called "ForceAMUnitsInMissions" under the [Options] section. When enabled missions will always have Aftermath units enabled.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Language Support
<br>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► GameLanguage<br>
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's r-series```

Support for a language pack system, the game's language is decided by the GameLanguage= keyword
under the [Options] section of redalert.ini. This option determines whether a corresponding mix
file for the language should be loaded, there's these following values:

1. (English)           - No additional `.MIX` file is loaded
2. (German)            - `germanlanguagepack.MIX` is loaded
3. (German censored)   - `germancensoredlanguagepack.MIX` is loaded
4. (German uncensored) - `germanuncensoredlanguagepack.MIX` is loaded
5. (French)            - `frenchlanguagepack.MIX` is loaded
6. (Spanish)           - `spanishlanguagepack.MIX` is loaded
7. (Russian)           - `russianlanguagepack.MIX` is loaded

E.g.: `GameLanguage=6` to load a Spanish language pack.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Music Listing
<br>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► ShowAllMusic
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Added an **REDALERT.INI** keyword `ShowAllMusic`= (yes/no) under the [Options] section to enable/disable showing all the game's music, normally the game only shows some music depending on what side you're playing as. With this option enabled it always shows all music except for the score, map and main menu music.	 
</details></td></tr></table>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► RandomStartingSong
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

It's now possible to have a random starting song start after a map is loaded, the keyword `RandomStartingSong`= (yes/no) under [Options] in **REDALERT.INI** controls this.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Map Listing
<br>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► DisplayOriginalMultiplayerMaps<br>
<code>{redalert.ini}</code> ► [Options]  ► DisplayCounterstrikeMultiplayerMaps<br>
<code>{redalert.ini}</code> ► [Options]  ► DisplayAftermathMultiplayerMaps
</samp></td><td width="120"><samp>Boolean<br>Boolean<br>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Official non-expansion, Counterstrike, and Aftermath maps display in the multiplayer menus can be enabled/disabled. Setting any option to 'yes' will signal the game to load official map packs:

<samp>

|Key                                   |Map Pack       |
|:-------------------------------------|:--------------|
|`DisplayOriginalMultiplayerMaps`      |MISSIONS.PKT   |
|`DisplayCounterstrikeMultiplayerMaps` |CSTRIKE.PKT    |
|`DisplayAftermathMultiplayerMaps`     |AFTMATH.PKT    |
</samp>
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Multiplayer Defaults
<br>

All multiplayer settings are now configurable.

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► Money
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Sets the initial cash that each player receives at the start of the game.
</details></td></tr></table>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► ShroudRegrows
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether shroud regrows over time. The regrowth rate is determined by `{Rules/Map} ► [General] ► ShroudRate`, defaulting to 4 in-game minutes.
</details></td></tr></table>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► CaptureTheFlag
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether the Capture The Flag game mode is active.
</details></td></tr></table>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► Crates
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether crates will spawn periodically on the map.
</details></td></tr></table>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► Bases
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether each player receives an MCV at the start of the game.
</details></td></tr></table>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► OreRegenerates
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether ore regenerates over time. Essentially this overrides `{Rules/Map} ► [General] ► OreGrows` and `{Rules/Map} ► [General] ► OreSpreads`. The regrowth rate is determined by `{Rules/Map} ► [General] ► GrowthRate`, defaulting to 2 in-game minutes.
</details></td></tr></table>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► UnitCount
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines the number of units each player receives at the start of the game.
</details></td></tr></table>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► TechLevel
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines each player techlevel at the start of the game. (It is possible to modify the techlevel via a map trigger action.)
</details></td></tr></table>


<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► AIDifficulty
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines the AI players' difficulty setting for the game. (0 = easy, 1 = Medium, 2 = Hard)
</details></td></tr></table>


<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► AIPlayers
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines the number of AI players for the game.
</details></td></tr></table>

Note the following:

 - You can start a skirmish game with no AI players by setting AIPlayers to 0, note that after
   playing a game like this the game will automatically set the AI players slider to 1.
 - You can start a game with a max of 2.7 billion credits, this works online too even if other
   players don't run my patch.
 - If UnitCount multiplied by players is too high, the game will crash.
 - Setting AIPlayers to higher than 7 causes the game to freeze.


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### English Intro
<br>
</details></td></tr></table>


<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► PlayEnglishIntro
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Playing the ENGLISH.VQA intro is now optional. a new **REDALERT.INI** boolean option `PlayEnglishIntro`= under the [Options] section controls this.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Video Interlacing
<br>


<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► VideoInterlaceMode
</samp></td><td width="120"><samp>0, 1 or 2</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Optional deinterlacing of videos, this is controlled by the VideoInterlaceMode= keyword in REDALERT.INI under the [Options] section, if set to 2 videos are deinterlaced, if set to 0 they're horizontally interlaced and when set to 1 they're supposed to be vertically interlaced (though the vertical interlacing doesn't seem to work). The game's previously unknown deinterlacing feature was discovered by AlexB, he also wrote a fix for a bit of graphical glitching at the bottom of the screen.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Skipping Scores
<br>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► SkipScoreScreen
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Added a `SkipScoreScreen`= (yes/no) keyword under [Options] in **REDALERT.INI**, when set to 'yes' the single player and multiplayer score screens won't be shown.

If the score screen is not shown, no new entry will be generated into HALLFAME.DAT because the player will not be given an opportunity to enter his name.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Sound Overrides
<br>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► AlternativeRifleSound<br>
<code>{redalert.ini}</code> ► [Options]  ► UseGrenadeThrowingSound
</samp></td><td width="120"><samp>Boolean<br>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Setting any option to 'yes' will signal the game to override the `Report=` property of certain weapons and replace them with an alternative sound:

<samp>

|Key                     |Affected weapon           |Replacement sound         |
|:-----------------------|:-------------------------|:-------------------------|
|`UseBetaTeslaTank`      |M1Carbine (Rifle Infantry)|MGUNINF1                  |
|`UseBetaDestroyer`      |Grenade (Grenadier)       |GRENADE1                  |
</samp>
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Visual Overrides
<br>

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► UseSmallInfantry<br>
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Setting this option to 'yes' will signal the game to load the corresponding mix file containing the relevant asset:

<samp>

|Key                     |Mix file                  |
|:-----------------------|:-------------------------|
|`UseSmallInfantry`      |smallinfantry.MIX         |
</samp>

The mix files are expected to contain small versions of infantry sprites, akin to C&C.
</details></td></tr></table>


<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaTeslaTank<br>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaDestroyer<br>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaSubmarine<br>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaCruiser<br>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaGunboat  
</samp></td><td width="120"><samp>Boolean<br>Boolean<br>Boolean<br>Boolean<br>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Setting any option to 'yes' will signal the game to load the corresponding mix files containing the relevant asset:

<samp>

|Key                     |Mix file                  |
|:-----------------------|:-------------------------|
|`UseBetaTeslaTank`      |betateslatank.MIX         |
|`UseBetaDestroyer`      |betadestroyer.MIX         |
|`UseBetaSubmarine`      |betasubmarine.MIX         |
|`UseBetaCruiser`        |betacruiser.MIX           |
|`UseBetaGunboat`        |betagunboat.MIX           |
</samp>

The mix files are expected to contain recreations of beta graphics.
The recreation for the beta Tesla Tank was made by Nyerguds, and the recreations of naval units were made by Allen262. 
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
## Gameplay Fixes
<br>

<table><tr><td width="892"><samp>
<code>{Rules}</code> ► [AI]  ► FixAISendingTanksTopLeft
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Fixed a bug that caused the multiplayer AI to sometimes send tanks to the top left corner of the map. Because this fix desyncs online with 3.03 players it's added as a RULES.INI keyword. 

This fix is applied by default in skirmish mode.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Hotkeys
<br>

Hotkeys are now configurable.

<table><tr><td width="892"><samp>
<code>{redalert.ini}</code> ► [WinHotkeys]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

```Inherited from hifi's p-series```
```Modified by iran's s-series```

The following hotkeys are supported. The values are keyboard codes, which loosely correspond with byte representations of ASCII characters.

<samp>

|Key                     |Default Value |Explanation             |
|:-----------------------|:-------------|:-----------------------|
|KeySidebarToggle        |9   (Tab)     |Shows/Hides the sidebar
|KeyQuickSave            |80  (P)       |Does nothing
|KeyQuickLoad            |76  (L)       |Does nothing
|KeyDebug                |73  (I)       |Does nothing
|KeyMapSnapshot          |85  (U)       |Creates a map snapshot and saves it as "MapSnap.MPR"
|KeyForceMove1           |18  (Alt)     |Force move, overriding any attack command
|KeyForceMove2           |18  (Alt)     |Force move, overriding any attack command
|KeyForceAttack1         |17  (Ctrl)    |Force attack, overriding any move command
|KeyForceAttack2         |17  (Ctrl)    |Force attack, overriding any move command
|KeySelect1              |16  (Shift)   |Add to selection
|KeySelect2              |16  (Shift)   |Add to selection
|KeyScatter              |88  (X)       |Scatter selected units
|KeyStop                 |83  (S)       |Stop move or attack of selected units
|KeyGuard                |71  (G)       |Set selected units to `Area Guard` mission
|KeyNext                 |78  (N)       |Select next unit by cell order
|KeyPrevious             |66  (B)       |Select previous unit by cell order
|KeyFormation            |70  (F)       |When units are in a team, toggle formation mode
|KeyHome1                |36  (Home)    |Jumps camera to home cell
|KeyHome2                |103 (NumHome) |Jumps camera to home cell
|KeyBase                 |72  (H)       |Jumps camera to center of base, or MCV
|KeyResign               |82  (R)       |When in skirmish or multiplayer, brings up the Resign confirmation dialog
|KeyAlliance             |65  (A)       |When in skirmish or multiplayer, set selected object's house to ally or enemy
|KeyBookmark1            |120 (F9)      |Jump to saved bookmark location. Use with held Ctrl to save current position as bookmark.
|KeyBookmark2            |121 (F10)     |Jump to saved bookmark location. Use with held Ctrl to save current position as bookmark.
|KeyBookmark3            |122 (F11)     |Jump to saved bookmark location. Use with held Ctrl to save current position as bookmark.
|KeyBookmark4            |123 (F12)     |Jump to saved bookmark location. Use with held Ctrl to save current position as bookmark.
|KeySelectView           |69  (E)       |Selects all units in the view screen
|KeyRepairToggle         |84  (T)       |Toggles the Repair mouse function
|KeyRepairOn             |0   (unused)  |Sets the Repair mouse function on
|KeyRepairOff            |0   (unused)  |Sets the Repair mouse function off
|KeySellToggle           |89  (Y)       |Toggles the Sell mouse function
|KeySellOn               |0   (unused)  |Sets the Sell mouse function on
|KeySellOff              |0   (unused)  |Sets the Sell mouse function off
|KeyMapToggle            |85  (U)       |Toggles map zoom mode.
|KeySidebarUp            |38  (Up)      |Sidebar scroll
|KeySidebarDown          |40  (Down)    |Sidebar scroll
|KeyOption1              |27  (Escape)  |Opens the Options dialog
|KeyOption2              |32  (Spacebar)|Opens the Options dialog
|KeyScrollLeft           |0   (unused)  |Map scroll
|KeyScrollRight          |0   (unused)  |Map scroll
|KeyScrollUp             |0   (unused)  |Map scroll
|KeyScrollDown           |0   (unused)  |Map scroll
|KeyQueueMove1           |81  (Q)       |When held, new orders are queued after the currently executing order
|KeyQueueMove2           |81  (Q)       |When held, new orders are queued after the currently executing order
|KeyTeam1                |49  (1)       |Selects members in team. Use with held Ctrl to save selected units as team.
|KeyTeam2                |50  (2)       |Selects members in team. Use with held Ctrl to save selected units as team.
|KeyTeam3                |51  (3)       |Selects members in team. Use with held Ctrl to save selected units as team.
|KeyTeam4                |52  (4)       |Selects members in team. Use with held Ctrl to save selected units as team.
|KeyTeam5                |53  (5)       |Selects members in team. Use with held Ctrl to save selected units as team.
|KeyTeam6                |54  (6)       |Selects members in team. Use with held Ctrl to save selected units as team.
|KeyTeam7                |55  (7)       |Selects members in team. Use with held Ctrl to save selected units as team.
|KeyTeam8                |56  (8)       |Selects members in team. Use with held Ctrl to save selected units as team.
|KeyTeam9                |57  (9)       |Selects members in team. Use with held Ctrl to save selected units as team.
|KeyTeam10               |48  (0)       |Selects members in team. Use with held Ctrl to save selected units as team.
</samp>
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Red Alert INI Options</kbd></kbd><br>

