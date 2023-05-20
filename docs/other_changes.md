[Return to Features](./features.md)

## Miscellaneous Changes

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

<details>
  <summary>
    <b><code>Heap Overflow Crash Fix</code></b>
  </summary>
  
```Inherited from hifi's p-series```

A crash relating to the a max limit being reached (e.g. that of airplanes) has been fixed. When a max unit limit has been reached the game will play the "unable to build more sound".

</details>

<details>
  <summary>
    <b><code>OOS Fix</code></b>
  </summary>
  
```Inherited from hifi's p-series```

FunkyFr3sh's OOS-FIX.INI file will be loaded (if it's found) while still being compatible online with 3.03 players not using this fix. This fix prevents desyncing after playing certain (most?) modded maps online and then playing another map. It also fixes the cause of the desync itself, namely that after playing certain modded maps/missions certain memory used by the game for its settings (e.g. unit cost) won't be reset when playing a normal map/mission. This has to do with some really terrible programming but is a bit technical to explain. Suffice to say this fixes things like the Mobile Radar Jammer gaining a Tesla weapon after playing certain Counterstrike expansion missions, etc.

</details>

<details>
  <summary>
    <b><code>Fence Crash Fix</code></b>
  </summary>
  
```Inherited from hifi's p-series```

Fixed a crash with fences placed on the northern border of the map that are destroyed.

</details>

<details>
  <summary>
    <b><code>Overriding Building Power Supply/Drain</code></b>
  </summary>

```New logic```

Originally, if the power of the original building was negative (drains power), modifications by ini with a positive number will still perform the drain.

The drain amount is now reset when a positive power supply is defined for a building.

</details>

<details>
  <summary>
    <b><code>Free Disk Space</code></b>
  </summary>

```Inherited from iran's r-series```

Fix for a rare issue where the game would report there is barely any free disk space left when there's plenty. The game now skips this check.

</details>

<details>
  <summary>
    <b><code>Credits Crash Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

Fix added for cnc-ddraw crash in the credits slide show screen once the first text reaches the top of the screen. This fix causes slight graphical glitching sadly and as a result the loading of background images was removed from the credits screen.

</details>

<details>
  <summary>
    <b><code>mpgdll.dll Dependency Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

The game no longer requires mpgdll.dll. This DLL was never used and contains MPEG-2 video loading code for a never released Red Alert 1 DVD with higher quality movies.

</details>

<details>
  <summary>
    <b><code>Skirmish Settings Persistence Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

Fixed a bug where Skirmish menu nick name/color/side settings aren't saved when you modify them, unless you also modify your nick name. (Thanks to Arda.dll.inj by AlexB)

</details>

<details>
  <summary>
    <b><code>LAN Settings Persistence Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

Fixed a bug where LAN menu nick name/color/side settings aren't saved. You still need to create a new game or join an existing one for these settings to be saved though.

</details>

<details>
  <summary>
    <b><code>LAN Lobby Lag Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

Fixed lag when leaving the Network/LAN menu when there are many players in the menu, for example while playing on CnCNet.

</details>

<details>
  <summary>
    <b><code>conquer.eng Deletion Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

The game will no longer delete conquer.eng if it's inside the game folder. (Thanks to Arda.dll.inj by AlexB)

</details>

<details>
  <summary>
    <b><code>Off-Map Projectile Crash Fix</code></b>
  </summary>
  
```Inherited from hifi's p-series```

Fix for projectile off map crash (code from hifi, original fix by AlexB)

</details>

<details>
  <summary>
    <b><code>Movies2 Load Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

Fixed a bug with loading movies2.mix. If movies1.mix is found this file wasn't loaded. Now it always is loaded. This affects The First Decade where the Soviet campaign movies (stored in movies2.mix) would never play because TFD Red Alert 1 comes with both MIX files. 

</details>

<details>
  <summary>
    <b><code>Arazoid Song Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

The game will now try to read ARAZOID.AUD and ARAZIOD.AUD. The game originally would only load ARAZOID.AUD but because the file name is misspelled as 'ARAZIOD.AUD' in the game's data files it was never read and the song didn't work inside the game because of this. 

</details>

<details>
  <summary>
    <b><code>Resign Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

The resign hotkey now actually works. There wasn't any code to do anything when the resign hotkey was pressed, even though the game read this hotkey from REDALERT.INI and also put it back in **REDALERT.INI**.

</details>

<details>
  <summary>
    <b><code>Crash Dump</code></b>
  </summary>
  
```Inherited from hifi's p-series```

When the game crashes it will now generate a crashdump file (ra95crash.dmp) with more possibly useful info that might help determine what caused the crash. (Code by hifi)

</details>

-------

### Combat Changes

<details>
  <summary>
    <b><code>Explosion without Animination Crash Fix</code></b>
  </summary>

```New logic```

In the original game, if a unit using a `Primary` weapon with a warhead with `Anim=NONE` is set to `Explodes=true`, the game will try to animate the null animation ANIM_NONE, which crashes the game.

Now this defaults to ANIM_NAPALM2 (the flame animation). A modder may use a unit's `DeathWeapon` to customize a unit's explosion behavior.

</details>

<details>
  <summary>
    <b><code>Negative Damage Weapons</code></b>
  </summary>

```New logic```

In the original game, there are checks to restrict the use of negative damage to the Medic and the Mechanic. Moreover, the game restricts the area of effect of such weapons to 8 leptons. Now all weapons can deal negative damage, and the area of effect of the weapon follows the warhead spread factor.

The mechanics of healing is not yet fully unraveled, so negative weapons may not mix nicely with combat weapons.

</details>

-------

### Visual Changes

<details>
  <summary>
    <b><code>VQA640 Centering</code></b>
  </summary>
  
```Inherited from iran's r-series```

VQA640 playback is now centered when playing in higher resolutions. This impacts the game intro sequence with a Longbow helicopter hitting a Mammoth Tank, which is the only VQA640 file playback in the original game. 

</details>

<details>
  <summary>
    <b><code>Longer Message Persistence</code></b>
  </summary>
  
```Inherited from iran's r-series```

Messages sent by other players during a match now appear for 15 seconds in the top left corner now, instead of the previous 9 seconds.

</details>

<details>
  <summary>
    <b><code>The Lost Files</code></b>
  </summary>
  
```Inherited from iran's r-series```

The game now supports loading The Lost Files movies compiled by Nyerguds.

</details>

<details>
  <summary>
    <b><code>Sneak Preview Movies</code></b>
  </summary>
  
```Inherited from iran's r-series```

The game will now load and play sizzle3.vqa, sizzle4.vqa and introx.vqa in the sneak preview menu if found.

</details>

<details>
  <summary>
    <b><code>Corrected Song Names</code></b>
  </summary>
  
```Inherited from iran's r-series```

Some songs had been misnamed in the in-game song menu, such as Twin Cannon, which was misnamed as "Twin". This is now fixed.

</details>

<details>
  <summary>
    <b><code>Map Radar Zoom</code></b>
  </summary>
  
```Inherited from iran's r-series```

When first buying a Radar Dome the top of the sidebar will now show the zoomed out map, instead of the zoomed in one. Thanks to Nyerguds for showing me how he did this for his C&C95 patch and giving me pointers for Red Alert.
	 
</details>

<details>
  <summary>
    <b><code>Green Shasow Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

Fix for green shadow issue on units like the Phase Transport. (Taken from Arda.dll.inj by AlexB)

</details>

<details>
  <summary>
    <b><code>Building Cameos Load Fix</code></b>
  </summary>
  
```Inherited from iran's r-series```

Building icons/cameos are now loaded even when a building is `TechLevel` -1 in **RULES.INI** under [General]. This fixes an issue where enabling building buildings like the Construction Yard with a map mod still caused the icon/cameo graphics not to be loaded for the structure in the sidebar. This was fixed by patching out a specific check that didn't load these graphics if TechLevel was equal to -1 on the building. Other objects in the game like infantry use the same loading logic, but without this extra check.

</details>

-------

### Gamemode Changes

<details>
  <summary>
    <b><code>Capture the Flag</code></b>
  </summary>
  
```Inherited from iran's r-series```

Capture the flag can now be enabled for skirmish. Westwood added specific checks to disable this game mode for skirmish, but I don't know why. Be warned.

</details>

<details>
  <summary>
    <b><code>Greece, Spain and Turkey in Multiplayer</code></b>
  </summary>
  
```Inherited from iran's r-series```

Greece, Spain and Turkey are now all selectable in multiplayer.

</details>

<details>
  <summary>
    <b><code>{Rules} ► [Aftermath] ► AftermathFastBuildSpeed (boolean)</code></b>
  </summary>
  
```Inherited from iran's r-series```

New **RULES.INI** `AftermathFastBuildSpeed`= yes/no keyword under the section [Aftermath], with this enabled there won't be a cap for build speed increase when you buy additional production facilities of the same type (e.g. more than two Barracks)and the Aftermath expansion is installed. If you want to use this online you need to play versus other players running this patch and the "Force AM fast build speed" RULES.INI file (this is also available as a RedAlertConfig.exe option).

</details>

<details>
  <summary>
    <b><code>{Rules} ► [AI] ► RemoveAITechupCheck (boolean)</code></b>
  </summary>
  
```Inherited from iran's r-series```

Added a new **RULES.INI** keyword `RemoveAITechupCheck`= (yes/no) under the [AI] section, when set to yes the AI will tech up to Radar Dome and beyond even when there are no Helipads or Airfields on the map. This fix is always enabled in skirmish.

</details>

<details>
  <summary>
    <b><code>{Rules} ► [AI] ► FixAIParanoid (boolean)</code></b>
  </summary>
  
```Inherited from iran's r-series```

Added a keyword `FixAIParanoid`= (yes/no) under the [AI] section of **RULES.INI**, when set to yes the Paranoid= setting will be fixed. This Paranoid= setting controls whether all the AI should ally among themselves to fight you when one player is defeated. Paranoid=yes enables this, but this was broken in patch 3.03. This fix is always enabled in skirmish.

</details>

<details>
  <summary>
    <b><code>{Rules} ► [AI] ► FixAIAlly (boolean)</code></b>
  </summary>
  
```Inherited from iran's r-series```

Added a keyword `FixAIAlly`= (yes/no) under the [AI] section of **RULES.INI**, when set to yes you can ally with AI players. This fix is always enabled in skirmish.

</details>

<details>
  <summary>
    <b><code>{Rules} ► [General] ► FixFormationSpeed (boolean)</code></b>
  </summary>
  
```Inherited from iran's r-series```

Optional fix for the formation exploit, the slowest unit speed is used now as formation speed when this fix is enabled. The RULES.INI keyword FixFormationSpeed= (yes/no) keyword under the [General] section controls whether this fix is on or off, it's off when this keyword is missing. This fix is applied by default for skirmish and single player, but not online to stay compatible with 3.03 online. (Taken from Arda.dll.inj by AlexB)

</details>

<details>
  <summary>
    <b><code>{Rules} ► [General] ► ParabombsInMultiplayer (boolean)</code></b>
  </summary>
  
```Inherited from iran's r-series```

Added a new RULES.INI keyword ParabombsInMultiplayer= (yes/no) under the [General] section, when enabled it will make parabombs available in multiplayer (by default after an Airfield is bought).

</details>

<details>
  <summary>
    <b><code>{Rules} ► [General] ► EvacInMP (boolean)</code></b>
  </summary>
  
```Inherited from iran's r-series```

Added a new global **RULES.INI** keyword `EvacInMP`= (yes/no) under the [General] section , when enabled GNRL and EINSTEIN get evacuated if they enter a Chinook in multiplayer. If disabled this doesn't happen. Enabled by default to stay compatible with 3.03 online.

</details>

<details>
  <summary>
    <b><code>Include Maps from Expansions</code></b>
  </summary>
  
```Inherited from iran's r-series```

The game will now try to display maps from the expansions even when the expansions aren't enabled.

</details>

-------

### QoL Changes

<details>
  <summary>
    <b><code>Sidebar Scroll</code></b>
  </summary>
  
```Inherited from iran's r-series```

It is now possible to scroll the sidebar with the mouse wheel. (code written by CCHyper)

</details>

-------

### Discontinued Changes

Changes listed here are not in effect. They may make a return at some point if it makes sense to do so.

<details>
  <summary>
    <b><code>Bullet - BallisticScatter, HomingScatter</code></b>
  </summary>

*This experimental change has been reverted for the moment. Expect finer controls in the future.*

Scattering behaviour had changed, which may mean a greater spread of bullets for units with `Inaccurate` set to true, as well as situations that the game applies inaccuracy to. This may change in the future.

</details>
