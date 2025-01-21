<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>AI Controls</kbd></kbd><br>
<h2 align="center">AI Controls</h2>

The computer plays along a script to offer some challenge against the player.

-------

 - [Documentation Guide](#documentation-guide)
 - [AI Production Enhancements](#ai-production-enhancements) 
 - [AI Settings](#ai-settings) 
 - [Base Building](#base-building) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#ai-controls"><kbd>Top</kbd></a><br>
-------
### AI Production Enhancements
<br>

The AI production functions have been enchanced significantly to allow the AI player to use the new features in this engine modification.
For Buildings, the features are listed in a separate <a href="#ai-controls">section</a><br>.

<details><summary><b>Infantry / Unit production</b></summary>
 
For both Infantry and Unit production, priority is given as follows:

|Step          |Condition                                                                   |Comments                                                  
:--------------|:----------------------------------------------- ---------------------------|:------------------------------------------------------
|Teams         |If any team member needs to be built                                        |Prerequisite and owner checks are ignored
|Harvester     |If house AI is above [AI] ► `Harvester`                                     |Only harvesters fulfilling prerequisite checks are respected
|Autobase      |If house AI is above [AI] ► `Production` or Autobase AI is enabled          |Only units fulfilling prerequisite checks are respected

See <a href="./infantrytypes.md/#ai-autobase-controls">InfantryType</a> and <a href="./unittypes.md/#ai-autobase-controls">UnitType</a> AI autobase controls.

</details>


<details><summary><b>Aircraft production</b></summary>
 
For both Infantry and Unit production, priority is given as follows:

|Step          |Condition                                                                   |Comments                                                  
:--------------|:----------------------------------------------- ---------------------------|:------------------------------------------------------
|Autobase      |If house AI is above [AI] ► `Production` or Autobase AI is enabled          |Only units fulfilling prerequisite checks are respected, selected randomly. AI will build helis before airfield-bound aircraft

</details>


<details><summary><b>Building production</b></summary>
 
For both Infantry and Unit production, priority is given as follows:

|Step          |Condition                                                                   |Comments                                                  
:--------------|:----------------------------------------------- ---------------------------|:------------------------------------------------------
|BaseNodes     |If any base node needs to be built                                          |Prerequisite and owner checks are ignored
|Harvester     |If house AI is above [AI] ► `Harvester`                                     |Only harvesters fulfilling prerequisite checks are respected
|Autobase      |If house AI is above [AI] ► `Production` or Autobase AI is enabled          |Only units fulfilling prerequisite checks are respected

See this <a href="#base-building">section</a> for AI autobase controls.

</details>



<a href="#ai-controls"><kbd>Top</kbd></a><br>
-------
### AI Settings
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [AI]  ► EasyAIGoldValue<br>
<code>{Rules/Map}</code> ► [AI]  ► EasyAIGemValue<br>
<code>{Rules/Map}</code> ► [AI]  ► NormalAIGoldValue<br>
<code>{Rules/Map}</code> ► [AI]  ► NormalAIGemValue<br>
<code>{Rules/Map}</code> ► [AI]  ► HardAIGoldValue<br>
<code>{Rules/Map}</code> ► [AI]  ► HardAIGemValue
</samp></td><td width="120"><samp>Integer<br>Integer<br>Integer<br>Integer<br>Integer<br>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```New Logic```

When an Ore Truck belonging to an AI dumps its ore into a Refinery, the value received are replaced by these amount.
If not specified, reverts to [General] ► `GoldValue` and `GemValue`.

</details></td></tr></table>


<a href="#ai-controls"><kbd>Top</kbd></a><br>
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

Thw new BaseBuilding base plan is as follows:

|Step              |Condition                                                                                     |Build                                              |Priority
:------------------|:---------------------------------------------------------------------------------------------|:--------------------------------------------------|:--------------------------------------------------
|Refinery          |Number of refineries below [AI] ► `RefineryLimit` and below [AI] ► `RefineryRatio`            |Any Refinery (`AIBuildType`=REFINERY)              |If no refinery, `HIGH`. Otherwise, `NORMAL`
|Low Power         |Base at low power                                                                             |Any Power (`AIBuildType`=POWER)                    |`HIGH`
|Power             |Base excess power below [AI] ► `PowerSurplus`                                                 |Any Power (`AIBuildType`=POWER)                    |If no refinery, `LOW`. Otherwise, `NORMAL`
|Barracks          |Number of barracks below [AI] ► `BarracksLimit` and below [AI] ► `BarracksRatio`              |Any Barracks (`AIBuildType`=BARRACKS)              |If no barracks, `NORMAL`. Otherwise, `LOW`
|War Factory       |Number of war factories below [AI] ► `WarLimit` and below [AI] ► `WarRatio`                   |Any War Factory (`AIBuildType`=WARFACTORY)         |If no factory, `NORMAL`. Otherwise, `LOW`
|Base Defenses     |Number of defenses below [AI] ► `DefenseLimit` and below [AI] ► `DefenseRatio`                |Any Defense (`AIBuildType`=DEFENSE)                |`NORMAL`
|AA Defenses       |Number of AA defenses below [AI] ► `AALimit` and below [AI] ► `AARatio`                       |Any AA Defense (`AIBuildType`=AA.DEFENSE)          |If enemy house aircraft > defenses, `HIGH`. Otherwise, `NORMAL`
|Adv. Defenses     |Number of adv. defenses below [AI] ► `TeslaRatio` and below [AI] ► `TeslaLimit`               |Any Advanced Defense (`AIBuildType`=ADV.DEFENSE)   |`NORMAL`
|Tech              |A tech building is available                                                                  |Any Tech (`AIBuildType`=TECH)                      |`NORMAL`
|Helipads          |Number of barracks below [AI] ► `HelipadLimit` and below [AI] ► `HelipadRatio`                |Any Barracks (`AIBuildType`=HELIPAD)               |`NORMAL`
|Airstrips         |Number of barracks below [AI] ► `AirstripLimit` and below [AI] ► `AirstripRatio`              |Any Barracks (`AIBuildType`=AIRSTRIP)              |`NORMAL`
|Generic           |Any remaining buildings                                                                       |Any Generic (`AIBuildType`=GENERIC)                |`NORMAL`

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

If set to true, the AutoBase AI will ensure a 3x3 clearing when placing a 1x1 structure, by checking that the same structure can be placed in all 8 tiles. This effectively reduces clutter by forcing spacing between its small structures, and also biases them towards the edge of the bases due to the larger effective footprint.

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


<a href="#ai-controls"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>AI Controls</kbd></kbd><br>

