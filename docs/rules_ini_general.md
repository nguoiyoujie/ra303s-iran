<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>AI Controls</kbd></kbd><br>
<h2 align="center">Rules General Controls</h2>

General configuration

-------

 - [Documentation Guide](#documentation-guide)
 - [Gamemode Controls](#gamemode-controls)
 - [Audio Visual Enhancements](#audio-visual-enhancements) 
 - [Fix Toggles](#fix-toggles) 
 - [Base Building](#base-building) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#rules-general-controls"><kbd>Top</kbd></a><br>
-------
### Gamemode Controls
<br>


<table><tr><td width="1012"><samp>
Capture the Flag
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Capture the flag can now be enabled for skirmish. Westwood added specific checks to disable this game mode for skirmish, but I don't know why. Be warned.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [Aftermath] ► AftermathFastBuildSpeed
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series```

New **RULES.INI** `AftermathFastBuildSpeed`= yes/no keyword under the section [Aftermath], with this enabled there won't be a cap for build speed increase when you buy additional production facilities of the same type (e.g. more than two Barracks)and the Aftermath expansion is installed. If you want to use this online you need to play versus other players running this patch and the "Force AM fast build speed" RULES.INI file (this is also available as a RedAlertConfig.exe option).
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► ParabombsInMultiplayer
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

When enabled it will make parabombs available in multiplayer.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► EvacInMP
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

When enabled, the infantry `GNRL` and `EINSTEIN` get evacuated if they enter a Chinook in multiplayer. Enabled by default.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► BuildOffAlly
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Allows the player to build off ally buildings.
</details></td></tr></table>


<a href="#rules-general-controls"><kbd>Top</kbd></a><br>
-------
### Audio Visual Enhancements
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► NoTeslaZapEffectDelay
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Suppresses the tesla zap drawing effect, removing artificial latency from the rendering. This may cause tesla bolts to be invisible.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► NoScreenShake
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

Suppresses full screen shake, removing artificial latency from the rendering, especially if there are several explosions happening at once. 
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► ScalePowerBar
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
Changes in the power meter is hardly seen when the player has above 1600 power or drain.
If enabled, the power bar will scale with increased power generation and consumption. 
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [General]  ► TanyaDeathReport<br>
<code>{Rules/Map}</code> ► [General]  ► DogDeathReport<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport1<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport2<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport3<br>
<code>{Rules/Map}</code> ► [General]  ► DeathReport4

</samp></td><td width="120"><samp>List<br>
List<br>
List<br>
List<br>
List<br>
List<br>
List<br>
List
</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```New Logic```

Replaces defaults for the infantry responses. See <a href="./infantrytypes.md/#custom-voices">InfantryTypes</a> for more details.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [General] ► RemapJammedBuildings
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set to true, remaps jammed buildings using the Shade remap. See <a href="./buildingtypes.md/#jamming-buildings">BuildingTypes</a> for more details. 
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [General]  ► UseAtomWhiteScreenEffectInMP<br>
[General]  ► UseSinglePlayerAtomDamage<br>
[General]  ► AtomRadius
</samp></td><td width="120"><samp>Boolean<br>Boolean<br>Integer</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series)```

Atomic weapon controls. See <a href="./warheads.md/#atomic-weapons">Warheads</a> for more details. 
</details></td></tr></table>


<a href="#rules-general-controls"><kbd>Top</kbd></a><br>
-------
### Fix Toggles
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [General] ► FixFormationSpeed
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from AlexB's Arda / iran's r-series```

Optional fix for the formation exploit, the slowest unit speed is used now as formation speed when this fix is enabled. This fix is applied by default for skirmish and single player, but not in multiplayer.
</details></td></tr></table>


<table><tr><td width="892"><samp>
<code>{Rules}</code> ► [General]  ► FixWideAreaDamage
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="2"><details><summary><b>View</b></summary>

Large explosions with a very large area of effect (Nuke, Monster Tank explosions) had their damage values calculated incorrectly - the damage increases the further it is from the epicenter.

This fix inverts the relationship so that the epicenter receives the maximum damage, and the radial edge receives 0 damage. 
</details></td></tr></table>



<a href="#rules-general-controls"><kbd>Top</kbd></a><br>
-------
### Base Building
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [AI]  ► UseNewBuildingAI
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
If set to true, an AutoBase AI will use [<BuildingType>] ► `AIBuildType` and `AIBuildLimit` to queue its structures. Prerequisite checks, Owner checks and tech levels are honored.
This allows several modding improvements to the Skirmish/Multiplayer AI, and Singleplayer AI if AutoBase is triggered. Examples include:

 - Allowing new buildings to be considered by the AI.
 - Existing buildings can now be considered by the AI. This includes the Service Depot, Camo Pillbox and superweapons.
 - The AI no longer builds buildings that it is not an Owner of (unless DoubleOwned is in play). This allows you to use faction-specific replacements, and the AI can build them instead of the original. 
 - Muitlple buildings can be sloted into the same `AIBuildType` category. You are no longer stuck with hardcoded structures like Ore Refinery, Barracks, War Factory, Tesla Coil, Helipad, Airfield checks  

The new BaseBuilding base plan is as follows:

|Step              |Condition                                                                                     |Build (`AIBuildType`)    |Priority
:------------------|:---------------------------------------------------------------------------------------------|:------------------------|:--------------------------------------------------
|Refinery          |Number of refineries below [AI] ► `RefineryLimit` <br>and below [AI] ► `RefineryRatio`        |REFINERY                 |If no refinery, `HIGH`. <br>Otherwise, `NORMAL`
|Low Power         |Base at low power                                                                             |POWER                    |`HIGH`
|Power             |Base excess power below [AI] ► `PowerSurplus`                                                 |POWER                    |If no refinery, `LOW`. <br>Otherwise, `NORMAL`
|Barracks          |Number of barracks below [AI] ► `BarracksLimit` <br>and below [AI] ► `BarracksRatio`          |BARRACKS                 |If no barracks, `NORMAL`. <br>Otherwise, `LOW`
|War Factory       |Number of war factories below [AI] ► `WarLimit` <br>and below [AI] ► `WarRatio`               |WARFACTORY               |If no factory, `NORMAL`. <br>Otherwise, `LOW`
|Base Defenses     |Number of defenses below [AI] ► `DefenseLimit` <br>and below [AI] ► `DefenseRatio`            |DEFENSE                  |`NORMAL`
|AA Defenses       |Number of AA defenses below [AI] ► `AALimit` <br>and below [AI] ► `AARatio`                   |AA.DEFENSE               |If enemy house aircraft > defenses, `HIGH`. <br>Otherwise, `NORMAL`
|Adv. Defenses     |Number of adv. defenses below [AI] ► `TeslaRatio` <br>and below [AI] ► `TeslaLimit`           |ADV.DEFENSE              |`NORMAL`
|Tech              |A tech building is available                                                                  |TECH                     |`NORMAL`
|Helipads          |Number of barracks below [AI] ► `HelipadLimit` <br>and below [AI] ► `HelipadRatio`            |HELIPAD                  |`NORMAL`
|Airstrips         |Number of barracks below [AI] ► `AirstripLimit` <br>and below [AI] ► `AirstripRatio`          |AIRSTRIP                 |`NORMAL`
|Generic           |Any remaining buildings                                                                       |GENERIC                  |`NORMAL`

 - Amongst all considerations, the first category with the highest priority will be selected for construction.

 - Building types with `AIBuildType`=NONE are never considered for base building. Use it to disable such buildings from the roster.
 - For all checks, any building type that the AI house owns with a count equal or exceeding `AIBuildLimit` will not be considered for building.
 - If `AIBuildLimit` is not specified, assume unlimited, except when considering `AIBuildType`=TECH - then a count of 1 is assumed.

Note: The AI begins considering a new building right after placing that building, before the effects of the new building is applied (especially power drain). This means the AI might build another power-consuming building before building a power plant.

Note2: The AI will not cancel its building even if prerequisites can no longer be met during the 'building' phase.

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [AI]  ► PowerExcess
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The AI will start selling power plants if the base has net power supply above this value. It is intended to provide the AI with some cash flow to help with the defense. 
Original Red Alert AI will only sell Power Plant (`POWR`) and Advanced Power Plant (`APWR`). The AI will now consider any building that has net positive power generation and is not a factory. 

The default value is 300.

</details></td></tr></table>



<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [AI]  ► PowerEmergencyMinimum
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The AI has a hidden condition within its `PowerEmergency` logic. In addition to the base power below the `PowerEmergency` percentage value, the power deficit must also be more than this value in order to trigger the AI to start selling structures to restore power.

The default value is 400.

</details></td></tr></table>



<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [AI]  ► ForceSingleTileClearing
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set to true, the AutoBase AI will ensure a 3x3 clearing when placing a 1x1 structure, by checking that the same structure can be placed in all 8 surrounding tiles. This effectively reduces clutter by forcing spacing between its small structures, and also biases them towards the edge of the bases due to the larger effective footprint.

This option is effective regardless of whether `UseNewBuildingAI` is enabled.

Only two types of foundations are supported - the 1x1 size shared by most base defenses and the Silo, and the 'tall' 1x1 size shared by the AA Gun, Tesla Coil, and Gap Generator. New buildings that use these foundations are subject to the same behavior.

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [AI]  ► GuardAreaLoadTransportsInSingleplayer
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

When an AI transport unit is assigned the Guard Area mission in Skirmish or Multiplayer mode, the AI will load the unit with available infantry with mission Guard or Guard Area in the map.

This options re-enables the same behavior in Singleplayer mode. This may break mission behavior due to normally team-unrecruitable Guard Area infantry being put inside APC units, so it is recommended to apply it per map basis.

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [AI]  ► RepairConstructedBuildingsInSingleplayer
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Singleplayer AI never repairs newly constructed buildings, even if [IQ] ► RepairSell values are met.
This key enables this behavior. Note that other checks still need to be fulfilled (RepairSell, credits above CreditsReserve) in order for repair to actually occur.

Note that enabling this will override the repair setting on preplaced buildings, unless you use a Map Action to manipulate IQ value to toggle this behavior.

</details></td></tr></table>


<a href="#rules-general-controls"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>AI Controls</kbd></kbd><br>

