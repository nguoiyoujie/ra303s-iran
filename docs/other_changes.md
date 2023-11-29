<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Miscellaneous Changes</kbd></kbd><br>
<h2 align="center">Miscellaneous Changes</h2>

This section covers changes that are not part of other sections. Usually these have no controls, operating in the background.

-------

 - [Visual Changes](#visual-changes)
   - Longer Message Persistence
   - Localization String Changes
   - Custom Missions Menu
   

 - [Gamemode Changes](#gamemode-changes)
   - Capture the Flag
   - Enable Greece, Spain and Turkey in Multiplayer
   - <code>{Rules}</code> ► [Aftermath] ► AftermathFastBuildSpeed
   - <code>{Rules}</code> ► [AI] ► RemoveAITechupCheck
   - <code>{Rules}</code> ► [AI] ► FixAIParanoid
   - <code>{Rules}</code> ► [AI] ► FixAIAlly
   - <code>{Rules}</code> ► [AI] ► ComputerParanoidForceDisabledSkirmish
   - <code>{Rules}</code> ► [General] ► FixFormationSpeed
   - <code>{Rules}</code> ► [General] ► ParabombsInMultiplayer
   - <code>{Rules}</code> ► [General] ► EvacInMP
   - Include Maps from Expansions
   - Allied Victory with AI


 - [QoL Changes](#qol-changes)
   - Save, Load, Delete Skirmish Games
   - Difficulty Affecting Gamespeed
   - Sidebar Scroll
   - Map Radar Zoom
   - Save Game Names
   - No Icon Cameos
 
 
 - [Discontinued Changes](#discontinued-changes)


-------
### Visual Changes
<br>

<table><tr><td width="1012"><samp>
Longer Message Persistence
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Messages sent by other players during a match now appear for 15 seconds in the top left corner now, instead of the previous 9 seconds.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Localization String Changes

```diff
- Review (non-EXE change)
```
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Localization strings have been changed:

```
CONQUER.ENG string: 121            Value:    Custom Missions
CONQUER.ENG string: 120            Value:    Expansions Missions
CONQUER.ENG string: 119            Value:    The Game is a Draw
CONQUER.ENG string: 118            Value:    %s has retracted the offer of a draw.
CONQUER.ENG string: 116            Value:    You have retracted your offer of a draw.
CONQUER.ENG string: 115            Value:    %s has proposed that the game be declared a draw.
CONQUER.ENG string: 114            Value:    You have proposed that the game be declared a draw.
CONQUER.ENG string: 113            Value:    Are you sure you want to accept a draw?
CONQUER.ENG string: 112            Value:    Are you sure you want to propose a draw
CONQUER.ENG string: 111            Value:    Accept Proposed Draw
CONQUER.ENG string: 110            Value:    Retract Draw Proposal
CONQUER.ENG string: 109            Value:    Propose a Draw

CONQUER.ENG string: 424            Value:    Invulnerability Device >> Invulnerability
CONQUER.ENG string: 427            Value:    V2 Rocket >> V2 Rocket Launcher
CONQUER.ENG string: 467            Value:    Missle Silo >> Missile Silo
```
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Custom Missions Menu
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

The "Counterstrike Missions" option on the main menu has been renamed to "Custom Missions" one. Likewise, "Aftermath Missions" has been renamed to "Expansions Missions". 

Missions from both official expansions will now be displayed in "Expansions Missions". 

The "Custom Missions" option now loads and displays maps files from `CMU01EA.INI` up to `CMU999EA.INI`. 

Ensure the custom mission has [Basic] ► `OneTimeOnly`= set to 'Yes' (like the expansion missions) or the game may crash after showing the score screen due to its attempt to load the campaign map. 

Ensure the [Basic] section of the map is at the top, or the game might not read it (this happens with all maps).

</details></td></tr></table>



<a href="#miscellaneous-changes"><kbd>Top</kbd></a><br>
-------
### Gamemode Changes
<br>

<table><tr><td width="1012"><samp>
Capture the Flag
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Capture the flag can now be enabled for skirmish. Westwood added specific checks to disable this game mode for skirmish, but I don't know why. Be warned.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Enable Greece, Spain and Turkey in Multiplayer
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Greece, Spain and Turkey are now all selectable in multiplayer.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [Aftermath] ► AftermathFastBuildSpeed
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series```

New **RULES.INI** `AftermathFastBuildSpeed`= yes/no keyword under the section [Aftermath], with this enabled there won't be a cap for build speed increase when you buy additional production facilities of the same type (e.g. more than two Barracks)and the Aftermath expansion is installed. If you want to use this online you need to play versus other players running this patch and the "Force AM fast build speed" RULES.INI file (this is also available as a RedAlertConfig.exe option).
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [AI] ► RemoveAITechupCheck
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a new **RULES.INI** keyword `RemoveAITechupCheck`= (yes/no) under the [AI] section, when set to yes the AI will tech up to Radar Dome and beyond even when there are no Helipads or Airfields on the map. This fix is always enabled in skirmish.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [AI] ► FixAIParanoid
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a keyword `FixAIParanoid`= (yes/no) under the [AI] section of **RULES.INI**, when set to yes the Paranoid= setting will be fixed. This Paranoid= setting controls whether all the AI should ally among themselves to fight you when one player is defeated. Paranoid=yes enables this, but this was broken in patch 3.03. This fix is always enabled in skirmish.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [AI] ► FixAIAlly
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a keyword `FixAIAlly`= (yes/no) under the [AI] section of **RULES.INI**, when set to yes you can ally with AI players. This fix is always enabled in skirmish.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [AI] ► ComputerParanoidForceDisabledSkirmish
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The "computer paranoid" setting has been forced off in skirmish. To disable this, under the [AI] section of RULES.INI set ComputerParanoidForceDisabledSkirmish=no. This keyword is only read at startup from RULES.INI (aka globally).
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► FixFormationSpeed
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Optional fix for the formation exploit, the slowest unit speed is used now as formation speed when this fix is enabled. The RULES.INI keyword FixFormationSpeed= (yes/no) keyword under the [General] section controls whether this fix is on or off, it's off when this keyword is missing. This fix is applied by default for skirmish and single player, but not online to stay compatible with 3.03 online. (Taken from Arda.dll.inj by AlexB)
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► ParabombsInMultiplayer
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a new RULES.INI keyword ParabombsInMultiplayer= (yes/no) under the [General] section, when enabled it will make parabombs available in multiplayer (by default after an Airfield is bought).
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► EvacInMP
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a new global **RULES.INI** keyword `EvacInMP`= (yes/no) under the [General] section , when enabled GNRL and EINSTEIN get evacuated if they enter a Chinook in multiplayer. If disabled this doesn't happen. Enabled by default to stay compatible with 3.03 online.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Include Maps from Expansions
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game will now try to display maps from the expansions even when the expansions aren't enabled.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Allied Victory with AI
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game will now end in skirmish if you have allied AI players. 

Note that all players must be mutually allied to each other, but AI players to not ally each other. So this only works if you ally only one player in skirmish.

However, with the use of map scripts, you could force AI players to ally each other.
</details></td></tr></table>



<a href="#miscellaneous-changes"><kbd>Top</kbd></a><br>
-------
### QoL Changes
<br>

<table><tr><td width="1012"><samp>
Save, Load, Delete Skirmish Games</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added the option to save/load/delete games while playing skirmish. This allows you to save skirmish games.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Difficulty Affecting Gamespeed
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Game difficulty will no longer affect game speed in offline games (on top of the normal game speed slider setting).
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Sidebar Scroll
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

It is now possible to scroll the sidebar with the mouse wheel. (code written by CCHyper)
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Map Radar Zoom
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

When first buying a Radar Dome the top of the sidebar will now show the zoomed out map, instead of the zoomed in one. Thanks to Nyerguds for showing me how he did this for his C&C95 patch and giving me pointers for Red Alert.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Save Game Names
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The name of the side the player plays as is no longer prepended to the names of missions in the mission dialogs. Thanks to Arda.dll.inj by AlexB for showing me where this prepending is done.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
No Icon Cameos
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```New logic```

If the cameo icon for a unit or building is missing, load 'NOICON.SHP' instead. This allows for quick resolution of visual tearing in the sidebar without having to cater for every affected unit.
</details></td></tr></table>


<a href="#miscellaneous-changes"><kbd>Top</kbd></a><br>
-------
### Discontinued Changes
<br>

Changes listed here are not in effect. They may make a return at some point if it makes sense to do so.

<table><tr><td width="1012"><samp>
Bullet - BallisticScatter, HomingScatter
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

*This experimental change has been reverted for the moment. Expect finer controls in the future.*

Scattering behaviour had changed, which may mean a greater spread of bullets for units with `Inaccurate` set to true, as well as situations that the game applies inaccuracy to. This may change in the future.
</details></td></tr></table>



<a href="#miscellaneous-changes"><kbd>Top</kbd></a><br>
------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Miscellaneous Changes</kbd></kbd><br>
