<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>AI Controls</kbd></kbd><br>
<h2 align="center">AI Controls</h2>

The computer plays along a script to offer some challenge against the player.

-------

 - [Documentation Guide](#documentation-guide)
 - [AI Settings](#ai-settings) 
 - [Base Building](#base-building) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#ai-controls"><kbd>Top</kbd></a><br>
-------
### AI Settings
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [AI]  ► EasyAIGoldValue
<code>{Rules/Map}</code> ► [AI]  ► EasyAIGemValue
<code>{Rules/Map}</code> ► [AI]  ► NormalAIGoldValue
<code>{Rules/Map}</code> ► [AI]  ► NormalAIGemValue
<code>{Rules/Map}</code> ► [AI]  ► HardAIGoldValue
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

 - If the number of Refineries (`AIBuildType`=REFINERY) is below [AI] ► `RefineryLimit` and below [AI] ► `RefineryRatio` fraction of total base buildings, consider a random Reinfery.
 - If there is no Refinery, building a new Refinery takes high priority. Otherwise, it takes normal priority.
 - If the base is at low power, consider a random power plant (`AIBuildType`=POWER) at high priority
 - If the base has excess power less than [AI] ► `PowerSurplus`, consider a random power plant (`AIBuildType`=POWER) at normal priority. If there is no Refinery, power plant priority is dropped to low.
 - If the number of Barracks (`AIBuildType`=BARRACKS) is below [AI] ► `BarracksLimit` and below [AI] ► `BarracksRatio` fraction of total base buildings, consider a random Barracks.
 - If there is no Barracks, building a new Barracks takes normal priority. Otherwise, it takes low priority.
 - If the number of War Factory (`AIBuildType`=WARFACTORY) is below [AI] ► `WarLimit` and below [AI] ► `WarRatio` fraction of total base buildings, consider a random War Factory.
 - If there is no War Factory, building a new War Factory takes normal priority. Otherwise, it takes low priority.
 - If the number of defense buildings (`AIBuildType`=DEFENSE) is below [AI] ► `DefenseLimit` and below [AI] ► `DefenseRatio` fraction of total base buildings, consider a random defense at normal priority.
 - If the number of AA defense buildings (`AIBuildType`=AA.DEFENSE) is below [AI] ► `AALimit` and below [AI] ► `AARatio` fraction of total base buildings, consider a random defense at normal priority.
 - If AI has considered an enemy house, and the enemy has more Aircraft than this AI has AA defenses, building a new AA defense takes high priority. Otherwise, it takes normal priority.
 - If the number of advanced defense buildings (`AIBuildType`=ADV.DEFENSE) is below [AI] ► `TeslaLimit` and below [AI] ► `TeslaRatio` fraction of total base buildings, consider a random advanced defense at normal priority.
 - If there is a Tech building available that has not yet being built (`AIBuildType`=TECH), consider building it at normal priority.
 - If the number of helipads (`AIBuildType`=HELIPAD) is below [AI] ► `HelipadLimit` and below [AI] ► `HelipadRatio` fraction of total base buildings, consider a random helipad at normal priority.
 - If the number of airstrip (`AIBuildType`=AIRSTRIP) is below [AI] ► `AirstripLimit` and below [AI] ► `AirstripRatio` fraction of total base buildings, consider a random airstrip at normal priority.
 - Consider building any other applicable building (`AIBuildType`=GENERIC) at normal priority.
 - Amongst all considerations, the first category with the highest priority will be selected for construction.

 - Building types with `AIBuildType`=NONE are never considered for base building. Use it to disable such buildings from the roster.
 - For all checks, any building type that the AI house owns with a count equal or exceeding `AIBuildLimit` will not be considered for building.
 - If `AIBuildLimit` is not specified, assume unlimited, except when considering `AIBuildType`=TECH - then a count of 1 is assumed.

Note: The AI begins considering a new building right after placing that building, before the effects of the new building is applied (especially power drain). This means the AI might build another power-consuming building before building a power plant.

Note2: The AI will not cancel its building even if prerequisites can no longer be met during the 'building' phase.

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


<a href="#housetypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>HouseTypes</kbd></kbd><br>

