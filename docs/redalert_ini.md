<a href="../readme.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Red Alert INI Options</kbd></kbd><br>
<h2 align="center">Red Alert INI Options</h2>

Preload options can be customized on redalert.ini, which may improve the quality of the game experience.

-------

 - [Custom Resolutions](#custom-resolutions)
 - [No CD](#no-cd) 
 - [Enable Expansions](#enable-expansions) 
 - [Music Listing](#music-listing) 
 - [Multiplayer Defaults](#multiplayer-defaults) 
 - [English Intro](#english-intro) 
 - [Video Interlacing](#video-interlacing) 
 - [Sound Overrides](#sound-overrides) 
 - [Visual Overrides](#visual-overrides) 


-------
### Custom Resolutions 
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► Width<br>
<code>{redalert.ini}</code> ► [Options]  ► Height
</samp></td><td width="120"><samp>Integer<br>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from hifi's p-series, modified in iran's s-series```

The game can support custom resolutions. Generally, this means higher resolutions.

The original code for this high resolution feature was written by hifi. Additional improvements had been provided by Iran with the following descriptions:

 - The invisible Ant Missions stereo and Westwood Logo credits selection areas are now adjusted
   for hi-res, meaning if you click their area on the main menu graphics they'll be activated,
   like they should.
 - Fixes for the border around the main menu graphics glitching after playing a game, graphical
   glitching when showing the "restate briefing" screen and some other graphical
   glitches. Thanks to Nyerguds for practically writing this for me!
 - If a TITLE.PCX is found that doesn't have the same dimensions as the original TITLE.PCX
   file, it will be displayed on the screen in the top left, this allows people to create their
   own custom main menu title graphics and have them work with hi-res.
 - The timer tab for maps that use them (e.g. the second Allies mission) has its width
   adjusted.
 - The expansion missions dialogs are now adjusted for hires, instead of appearing in the top
   left of the screen.
 - Screenshake should be adjusted for high res now. (Thanks to Arda.dll.inj by AlexB)
 - The "Mission Accomplished", "Mission Failed" and "The Game is a Draw" red text now have
   their height and width adjusted for high res (Thanks to Arda.dll.inj by AlexB)
 - The score screen is now fully displayed in the top left, instead of showing the score
   background in the middle
 - Fixed the power indicator displaying glitched when there's no power and in certain other
   scenarios
 - Added extended sidebar (using graphics and memory addresses taken from Arda, by AlexB)
 - 640x480 does not show black bars on the top and bottom of the screen anymore.
 - You no longer need to scroll the map and open the options menu to fix glitching with maps
   smaller than your resolution.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### No CD
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► NoCD
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from hifi's p-series```

No-CD mode can be enabled/disabled with the `NoCD`= (yes/no) keyword under the [Options] section of **REDALERT.INI**. (from hifi's p-series)
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Enable Expansions
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► CounterstrikeEnabled<br>
<code>{redalert.ini}</code> ► [Options]  ► AftermathEnabled
</samp></td><td width="120"><samp>Boolean<br>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

The Counterstrike expansion can be enabled/disabled with the `CounterstrikeEnabled`= (yes/no) keyword under the [Options] section of **REDALERT.INI**. Likewise there's a `AftermathEnabled`= (yes/no) keyword to enable/disable the Aftermath expansion.
	 </details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Music Listing
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► ShowAllMusic
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Added an **REDALERT.INI** keyword `ShowAllMusic`= (yes/no) under the [Options] section to enable/disable showing all the game's music, normally the game only shows some music depending on what side you're playing as. With this option enabled it always shows all music except for the score, map and main menu music.	 
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► RandomStartingSong
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

It's now possible to have a random starting song start after a map is loaded, the keyword `RandomStartingSong`= (yes/no) under [Options] in **REDALERT.INI** controls this.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Multiplayer Defaults
<br>

All multiplayer settings are now configurable.

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► Money
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Sets the initial cash that each player receives at the start of the game.
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► ShroudRegrows
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether shroud regrows over time. The regrowth rate is determined by `{Rules/Map} ► [General] ► ShroudRate`, defaulting to 4 in-game minutes.
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► CaptureTheFlag
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether the Capture The Flag game mode is active.
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► Crates
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether crates will spawn periodically on the map.
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► Bases
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether each player receives an MCV at the start of the game.
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► OreRegenerates
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines whether ore regenerates over time. Essentially this overrides `{Rules/Map} ► [General] ► OreGrows` and `{Rules/Map} ► [General] ► OreSpreads`. The regrowth rate is determined by `{Rules/Map} ► [General] ► GrowthRate`, defaulting to 2 in-game minutes.
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► UnitCount
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines the number of units each player receives at the start of the game.
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► TechLevel
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines each player techlevel at the start of the game. (It is possible to modify the techlevel via a map trigger action.)
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► AIDifficulty
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Determines the AI players' difficulty setting for the game. (0 = easy, 1 = Medium, 2 = Hard)
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [MultiplayerDefaults]  ► AIPlayers
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

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


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► PlayEnglishIntro
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Playing the ENGLISH.VQA intro is now optional. a new **REDALERT.INI** boolean option `PlayEnglishIntro`= under the [Options] section controls this.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Video Interlacing
<br>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► SkipScoreScreen
</samp></td><td width="120"><samp>0, 1 or 2</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Optional deinterlacing of videos, this is controlled by the VideoInterlaceMode= keyword in REDALERT.INI under the [Options] section, if set to 2 videos are deinterlaced, if set to 0 they're horizontally interlaced and when set to 1 they're supposed to be vertically interlaced (though the vertical interlacing doesn't seem to work). The game's previously unknown deinterlacing feature was discovered by AlexB, he also wrote a fix for a bit of graphical glitching at the bottom of the screen.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Skipping Scores
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► SkipScoreScreen
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Added a `SkipScoreScreen`= (yes/no) keyword under [Options] in **REDALERT.INI**, when set to 'yes' the single player and multiplayer score screens won't be shown.

If the score screen is not shown, no new entry will be generated into HALLFAME.DAT because the player will not be given an opportunity to enter his name.
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Sound Overrides
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► AlternativeRifleSound
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Added **REDALERT.INI** keyword `AlternativeRifleSound`= (yes/no) under [Options]. If enabled the Rifle Infantry will use an alternative firing sound. MGUNINF1 will be used as firing sound. This overwrites the M1Carbine's `Report`= setting in **RULES.INI**.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► UseGrenadeThrowingSound
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Added **REDALERT.INI** keyword `UseGrenadeThrowingSound`= (yes/no) under [Options]. If enabled the Grenadier will have a throwing sound when throwing his grenades. This overwrites the Grenade's `Report`= setting in **RULES.INI**.
 </details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
### Visual Overrides
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaTeslaTank<br>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaDestroyer<br>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaSubmarine<br>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaCruiser<br>
<code>{redalert.ini}</code> ► [Options]  ► UseBetaGunboat  
</samp></td><td width="120"><samp>Boolean<br>Boolean<br>Boolean<br>Boolean<br>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's s-series```

Added **REDALERT.INI** keyword `UseBetaTeslaTank`= (yes/no) under [Options]. If enabled betateslatank.MIX will be loaded by the game. Likewise `UseBetaDestroyer`= to load betadestroyer.MIX, `UseBetaSubmarine`= to load betasubmarine.MIX, `UseBetaCruiser`= to load betacruiser.MIX, `UseBetaGunboat`= to load betagunboat.MIX. These options load recreations of beta graphics, the recreation for the beta Tesla Tank was made by Nyerguds, the recreations of naval units were made by Allen262. 
</details></td></tr></table>


<a href="#red-alert-ini-options"><kbd>Top</kbd></a><br>
-------
<a href="../readme.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Red Alert INI Options</kbd></kbd><br>

