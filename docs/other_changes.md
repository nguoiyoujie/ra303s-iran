<a href="../readme.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Miscellaneous Changes</kbd></kbd><br>
<h2 align="center">Miscellaneous Changes</h2>

This section covers changes that are not part of other sections. Usually these have no controls, so they are either fixes or breaking changes. These should ideally contain only fixes

-------

 - [Fixes](#fixes) 
 - [Combat Changes](#combat-changes)
 - [Visual Changes](#visual-changes)
 - [Gamemode Changes](#gamemode-changes)
 - [QoL Changes](#qol-changes)
 - [Discontinued Changes](#discontinued-changes)


-------
### Fixes
<br>


<table><tr><td width="1012"><samp>
Heap Overflow Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

A crash relating to the a max limit being reached (e.g. that of airplanes) has been fixed. When a max unit limit has been reached the game will play the "unable to build more sound".
</details></td></tr></table>


<table><tr><td width="1012"><samp>
OOS Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

FunkyFr3sh's OOS-FIX.INI file will be loaded (if it's found) while still being compatible online with 3.03 players not using this fix. This fix prevents desyncing after playing certain (most?) modded maps online and then playing another map. It also fixes the cause of the desync itself, namely that after playing certain modded maps/missions certain memory used by the game for its settings (e.g. unit cost) won't be reset when playing a normal map/mission. This has to do with some really terrible programming but is a bit technical to explain. Suffice to say this fixes things like the Mobile Radar Jammer gaining a Tesla weapon after playing certain Counterstrike expansion missions, etc.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Fence Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

Fixed a crash with fences placed on the northern border of the map that are destroyed.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Overriding Building Power Supply/Drain
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

Originally, if the power of the original building was negative (drains power), modifications by ini with a positive number will still perform the drain.

The drain amount is now reset when a positive power supply is defined for a building.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Free Disk Space
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

```Inherited from iran's r-series```

Fix for a rare issue where the game would report there is barely any free disk space left when there's plenty. The game now skips this check.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Credits Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fix added for cnc-ddraw crash in the credits slide show screen once the first text reaches the top of the screen. This fix causes slight graphical glitching sadly and as a result the loading of background images was removed from the credits screen.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
mpgdll.dll Dependency Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game no longer requires mpgdll.dll. This DLL was never used and contains MPEG-2 video loading code for a never released Red Alert 1 DVD with higher quality movies.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Skirmish Settings Persistence Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fixed a bug where Skirmish menu nick name/color/side settings aren't saved when you modify them, unless you also modify your nick name. (Thanks to Arda.dll.inj by AlexB)
</details></td></tr></table>


<table><tr><td width="1012"><samp>
LAN Settings Persistence Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fixed a bug where LAN menu nick name/color/side settings aren't saved. You still need to create a new game or join an existing one for these settings to be saved though.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
LAN Lobby Lag Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fixed lag when leaving the Network/LAN menu when there are many players in the menu, for example while playing on CnCNet.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
conquer.eng Deletion Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game will no longer delete conquer.eng if it's inside the game folder. (Thanks to Arda.dll.inj by AlexB)
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Off-Map Projectile Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

Fix for projectile off map crash (code from hifi, original fix by AlexB)
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Movies2 Load Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fixed a bug with loading movies2.mix. If movies1.mix is found this file wasn't loaded. Now it always is loaded. This affects The First Decade where the Soviet campaign movies (stored in movies2.mix) would never play because TFD Red Alert 1 comes with both MIX files. 
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Arazoid Song Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game will now try to read ARAZOID.AUD and ARAZIOD.AUD. The game originally would only load ARAZOID.AUD but because the file name is misspelled as 'ARAZIOD.AUD' in the game's data files it was never read and the song didn't work inside the game because of this. 
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Resign Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The resign hotkey now actually works. There wasn't any code to do anything when the resign hotkey was pressed, even though the game read this hotkey from REDALERT.INI and also put it back in **REDALERT.INI**.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Crash Dump
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

When the game crashes it will now generate a crashdump file (ra95crash.dmp) with more possibly useful info that might help determine what caused the crash. (Code by hifi)
</details></td></tr></table>



<a href="#miscellaneous-changes"><kbd>Top</kbd></a><br>
-------
### Combat Changes
<br>

<table><tr><td width="1012"><samp>
Explosion without Animination Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

In the original game, if a unit using a `Primary` weapon with a warhead with `Anim=NONE` is set to `Explodes=true`, the game will try to animate the null animation ANIM_NONE, which crashes the game.

Now this defaults to ANIM_NAPALM2 (the flame animation). A modder may use a unit's `DeathWeapon` to customize a unit's explosion behavior.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Negative Damage Weapons
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

In the original game, there are checks to restrict the use of negative damage to the Medic and the Mechanic. Moreover, the game restricts the area of effect of such weapons to 8 leptons. Now all weapons can deal negative damage, and the area of effect of the weapon follows the warhead spread factor.

The mechanics of healing is not yet fully unraveled, so negative weapons may not mix nicely with combat weapons.
</details></td></tr></table>



<a href="#miscellaneous-changes"><kbd>Top</kbd></a><br>
-------
### Visual Changes
<br>

<table><tr><td width="1012"><samp>
VQA640 Centering
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

VQA640 playback is now centered when playing in higher resolutions. This impacts the game intro sequence with a Longbow helicopter hitting a Mammoth Tank, which is the only VQA640 file playback in the original game. 
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Longer Message Persistence
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Messages sent by other players during a match now appear for 15 seconds in the top left corner now, instead of the previous 9 seconds.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
The Lost Files
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game now supports loading The Lost Files movies compiled by Nyerguds.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Sneak Preview Movies
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game will now load and play sizzle3.vqa, sizzle4.vqa and introx.vqa in the sneak preview menu if found.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Corrected Song Names
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Some songs had been misnamed in the in-game song menu, such as Twin Cannon, which was misnamed as "Twin". This is now fixed.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Map Radar Zoom
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

When first buying a Radar Dome the top of the sidebar will now show the zoomed out map, instead of the zoomed in one. Thanks to Nyerguds for showing me how he did this for his C&C95 patch and giving me pointers for Red Alert.
	 </details></td></tr></table>


<table><tr><td width="1012"><samp>
Green Shadow Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fix for green shadow issue on units like the Phase Transport. (Taken from Arda.dll.inj by AlexB)
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Building Cameos Load Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Building icons/cameos are now loaded even when a building is `TechLevel` -1 in **RULES.INI** under [General]. This fixes an issue where enabling building buildings like the Construction Yard with a map mod still caused the icon/cameo graphics not to be loaded for the structure in the sidebar. This was fixed by patching out a specific check that didn't load these graphics if TechLevel was equal to -1 on the building. Other objects in the game like infantry use the same loading logic, but without this extra check.
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
Greece, Spain and Turkey in Multiplayer
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Greece, Spain and Turkey are now all selectable in multiplayer.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
{Rules} ► [Aftermath] ► AftermathFastBuildSpeed (boolean)
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

New **RULES.INI** `AftermathFastBuildSpeed`= yes/no keyword under the section [Aftermath], with this enabled there won't be a cap for build speed increase when you buy additional production facilities of the same type (e.g. more than two Barracks)and the Aftermath expansion is installed. If you want to use this online you need to play versus other players running this patch and the "Force AM fast build speed" RULES.INI file (this is also available as a RedAlertConfig.exe option).
</details></td></tr></table>


<table><tr><td width="1012"><samp>
{Rules} ► [AI] ► RemoveAITechupCheck (boolean)
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a new **RULES.INI** keyword `RemoveAITechupCheck`= (yes/no) under the [AI] section, when set to yes the AI will tech up to Radar Dome and beyond even when there are no Helipads or Airfields on the map. This fix is always enabled in skirmish.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
{Rules} ► [AI] ► FixAIParanoid (boolean)
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a keyword `FixAIParanoid`= (yes/no) under the [AI] section of **RULES.INI**, when set to yes the Paranoid= setting will be fixed. This Paranoid= setting controls whether all the AI should ally among themselves to fight you when one player is defeated. Paranoid=yes enables this, but this was broken in patch 3.03. This fix is always enabled in skirmish.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
{Rules} ► [AI] ► FixAIAlly (boolean)
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a keyword `FixAIAlly`= (yes/no) under the [AI] section of **RULES.INI**, when set to yes you can ally with AI players. This fix is always enabled in skirmish.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
{Rules} ► [General] ► FixFormationSpeed (boolean)
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Optional fix for the formation exploit, the slowest unit speed is used now as formation speed when this fix is enabled. The RULES.INI keyword FixFormationSpeed= (yes/no) keyword under the [General] section controls whether this fix is on or off, it's off when this keyword is missing. This fix is applied by default for skirmish and single player, but not online to stay compatible with 3.03 online. (Taken from Arda.dll.inj by AlexB)
</details></td></tr></table>


<table><tr><td width="1012"><samp>
{Rules} ► [General] ► ParabombsInMultiplayer (boolean)
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a new RULES.INI keyword ParabombsInMultiplayer= (yes/no) under the [General] section, when enabled it will make parabombs available in multiplayer (by default after an Airfield is bought).
</details></td></tr></table>


<table><tr><td width="1012"><samp>
{Rules} ► [General] ► EvacInMP (boolean)
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a new global **RULES.INI** keyword `EvacInMP`= (yes/no) under the [General] section , when enabled GNRL and EINSTEIN get evacuated if they enter a Chinook in multiplayer. If disabled this doesn't happen. Enabled by default to stay compatible with 3.03 online.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Include Maps from Expansions
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game will now try to display maps from the expansions even when the expansions aren't enabled.
</details></td></tr></table>



<a href="#miscellaneous-changes"><kbd>Top</kbd></a><br>
-------
### QoL Changes
<br>

<table><tr><td width="1012"><samp>
Sidebar Scroll
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

It is now possible to scroll the sidebar with the mouse wheel. (code written by CCHyper)
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
<a href="../readme.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Miscellaneous Changes</kbd></kbd><br>
