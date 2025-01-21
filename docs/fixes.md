<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Fixes</kbd></kbd><br>
<h2 align="center">Fixes</h2>

This section covers changes that are intended to fix a broken feature, or prevent crashes in the original game.

-------

 - [Crash Fixes](#crash-fixes) 
   - Heap Overflow Crash Fix
   - Fence Crash Fix
   - Score Screen Crash Fix
   - Credits Crash Fix
   - Null Target Crash Fix
   - Off-Map Projectile Crash Fix
   - Explosion without Animination Crash Fix
   - Crash Dump
   
 - [Desync Fixes](#desync-fixes) 
   - OOS Fix
   
 - [Gameplay Corrections](#gameplay-corrections) 
   - Overriding Building Power Supply/Drain
   - Unaccounted Removal Power Drain and Storage Capacity
   - Resign Fix
   - Engineer Q Move Fix
   - Ore Mine Foundation Fix
   - Persistent Chrono Vortex Fix
   - Stuck Infantry from Sold Building Fix
   - Magic Build Fix
   - Infantry Range Exploit Fix
   - No Explosion Fix

 - [Non-Gameplay Corrections](#non-gameplay-corrections) 
   - Disk Space Check
   - Movies2 Load Fix
   - Arazoid Song Fix

 - [Dependency Clean-Up](#dependency-clean-up) 
   - mpgdll.dll Dependency Fix
   
 - [Persistence Fixes](#persistence-fixes) 
   - conquer.eng Deletion Fix
   - Skirmish Settings Persistence Fix
   - LAN Settings Persistence Fix
   
 - [User Experience](#user-experience) 
   - LAN Lobby Lag Fix
   - Green Shadow Fix
   - Building Cameos Load Fix
   - Score Screen Color Fix
   - Song Names Fix
   - No Music Fix
   - Credit Tick Fix


-------
### Crash Fixes
<br>

The most important fixes prevent game crashes when certain conditions were reached.

<table><tr><td width="1012"><samp>
Heap Overflow Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

A crash relating to the a max limit being reached (e.g. that of airplanes) has been fixed. When a max unit limit has been reached the game will play the "unable to build more sound".
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Fence Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

Fixed a crash with fences placed on the northern border of the map that are destroyed.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Score Screen Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fixed a crash while trying to animate part of the score screen.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Credits Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fix added for cnc-ddraw crash in the credits slide show screen once the first text reaches the top of the screen. This fix causes slight graphical glitching sadly and as a result the loading of background images was removed from the credits screen.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Null Target Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fixed a crash while the game is determine what weapon a unit should use against another unit. The game would get an object reference from an object ID for the target unit, but this reference could be invalid (NULL) and the game didn't check for that, which causes a crash. Added a check.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Off-Map Projectile Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

Fix for projectile off map crash (code from hifi, original fix by AlexB)
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Explosion without Animination Crash Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

In the original game, if a unit using a `Primary` weapon with a warhead with `Anim=NONE` is set to `Explodes=true`, the game will try to animate the null animation ANIM_NONE, which crashes the game.

Now this defaults to ANIM_NAPALM2 (the flame animation). A modder may use a unit's `DeathWeapon` to customize a unit's explosion behavior.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Crash Dump
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

When the game crashes it will now generate a crashdump file (ra95crash.dmp) with more possibly useful info that might help determine what caused the crash. (Code by hifi)
</details></td></tr></table>


<a href="#fixes"><kbd>Top</kbd></a><br>
-------
### Desync Fixes
<br>

Theses fixes resolve or prevent desynchronization between players on online play. Only compatibility with other 3.03s copies are supported.

<table><tr><td width="1012"><samp>
OOS Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from hifi's p-series```

FunkyFr3sh's OOS-FIX.INI file will be loaded (if it's found) while still being compatible online with 3.03 players not using this fix. This fix prevents desyncing after playing certain (most?) modded maps online and then playing another map. It also fixes the cause of the desync itself, namely that after playing certain modded maps/missions certain memory used by the game for its settings (e.g. unit cost) won't be reset when playing a normal map/mission. This has to do with some really terrible programming but is a bit technical to explain. Suffice to say this fixes things like the Mobile Radar Jammer gaining a Tesla weapon after playing certain Counterstrike expansion missions, etc.
</details></td></tr></table>


<a href="#fixes"><kbd>Top</kbd></a><br>
-------
### Gameplay Corrections
<br>

Illogical behavior during gameplay has been modified to show more useful and intuitive behaviour.

<table><tr><td width="1012"><samp>
Overriding Building Power Supply/Drain
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

Originally, if the power of the original building was negative (drains power), modifications by ini with a positive number will still perform the drain.

The drain amount is now reset when a positive power supply is defined for a building.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Unaccounted Removal Power Drain and Storage Capacity
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

When a building is placed, power drain and ore storage capacity are applied after the buildup animation is done. However, if the building is deleted or destroyed without before the animation is complete, the effects are deducted without being applied. This is both advantageous (effectively more power) and disadvantageous (less ore storage), but ultimately confusing.

The deduction is now avoided if the buildup is not complete.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Resign Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The resign hotkey now actually works. There wasn't any code to do anything when the resign hotkey was pressed, even though the game read this hotkey from REDALERT.INI and also put it back in **REDALERT.INI**.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Engineer Q Move Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a fix for a bug where using the Q hotkey with a tank group that includes engineers would sometimes cause the game to freeze. Note that instead of when this bug would normally happen engineers will start moving to the top left of the map unless giving a new move order.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Ore Mine Foundation Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a fix for the Ore Mine foundation. This fix is only applied in single player and skirmish. The problem is that the Ore Mine doesn't spread ore on the cell directly below it because it uses the foundation of the Blossom Tree from C&C1, which has a height of two cells, while the Ore Mine is only one cell. This fix was taken from Arda by AlexB.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Persistent Chrono Vortex Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Any previous active chrono vortex is now destroyed while loading a map or savegame. Previously chrono vortex would persist in single player missions after (re)starting one. Thanks to djohe for reporting the bug.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Stuck Infantry from Sold Building Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a fix for building crew from certain buildings like the Tesla Coil getting stuck one cell above the buildings foundations. This fix is applied to single player and skirmish, but to remain online compatible with 3.03 it isn't applied online and in LAN. (Fix made with help from CCHyper and code reverse engineered from Arda by AlexB)
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Magic Build Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fix for an exploit dubbed "magic build". When you're selecting a spot to place a building and white rectangles for the building foundations are showing, indicating that the building is place-able at that spot, even if every close by building of you dies the rectangles for the building foundation stay white, allowing you to still build at that location. In practice when a player is base crawling really quickly and you destroy any of his buildings close to where he wants to place, if the white rectangles are shown he can still place the building (unexpectedly) at that location. If he doesn't yet place the building but moves the mouse instead the rectangles will be red.

This fix is applied to single player and skirmish by default, but not online by default to stay compatible with 3.03 online.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Infantry Range Exploit Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a fix for an infantry range exploit that allows you to have infantry fire across the map. This fix is applied to skirmish and single player by default, but not online to stay compatible with 3.03. (Fix reverse engineered from Arda by AlexB)
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Invisible Explosion Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Added a fix for certain invisible explosions that affects certain warheads when shooting buildings. For example this affects the Chrono Tank shooting its missiles at a Construction Yard, the missiles are invisible from most angles. This fix is applied to single player and skirmish, but disabled online to remain 3.03 online compatible. (Fix made by AlexB)
</details></td></tr></table>


<a href="#fixes"><kbd>Top</kbd></a><br>
-------
### Non-Gameplay Corrections
<br>

Illogical behavior outside of gameplay has been modified to show more useful and intuitive behaviour.

<table><tr><td width="1012"><samp>
Disk Space Check
</samp></td></tr><tr><td><details><summary><b>View</b></summary>

```Inherited from iran's r-series```

Fix for a rare issue where the game would report there is barely any free disk space left when there's plenty. The game now skips this check.
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


<a href="#fixes"><kbd>Top</kbd></a><br>
-------
### Dependency Clean-Up
<br>

Some unnecessary dependencies present for the original game are cleaned up.

<table><tr><td width="1012"><samp>
mpgdll.dll Dependency Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game no longer requires mpgdll.dll. This DLL was never used and contains MPEG-2 video loading code for a never released Red Alert 1 DVD with higher quality movies.
</details></td></tr></table>


<a href="#fixes"><kbd>Top</kbd></a><br>
-------
### Persistence Fixes
<br>

Some settings that were expected to be saved weren't. Missing files, deleted files, and so on. This section describes those fixes.

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
conquer.eng Deletion Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game will no longer delete conquer.eng if it's inside the game folder. (Thanks to Arda.dll.inj by AlexB)
</details></td></tr></table>


<a href="#fixes"><kbd>Top</kbd></a><br>
-------
### User Experience
<br>

Broken UI, performance or unnecessary lag are resolved here

<table><tr><td width="1012"><samp>
LAN Lobby Lag Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Fixed lag when leaving the Network/LAN menu when there are many players in the menu, for example while playing on CnCNet.
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


<table><tr><td width="1012"><samp>
Score Screen Color Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Sometimes the causalities number printed for the first side shown in the score screen would use the wrong side's color. This has been fixed.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Song Names Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Some songs had been misnamed in the in-game song menu, such as Twin Cannon, which was misnamed as "Twin". This is now fixed.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
No Music Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Sometimes the music would stop playing after loading multiple savegames, this has been fixed.
</details></td></tr></table>


<table><tr><td width="1012"><samp>
Credit Tick Fix
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

When loading a scenario, the game would not reset the current amount of credits shown on the credits tab in the top right of the screen. So if you have 1.4 billion credits then start another scenario, the game would start decrementing the credits count on the top right of the screen back to the actual amount (starting with the previous 1.4 billion credits), usually 10000 when playing skirmish games. This process could take up to one hour if you start with 1.4 billion credits. This has been fixed and the amount of credits to display will be reset to 0 when a scenario is loaded. This does not affect the actual money you have, just what is displayed.
</details></td></tr></table>



<a href="#fixes"><kbd>Top</kbd></a><br>
------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Miscellaneous Changes</kbd></kbd><br>
