<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>UnitTypes</kbd></kbd><br>
<h2 align="center">UnitTypes</h2>

UnitTypes represent vehicles, and are in essence play the second most major role, second to BuildingTypes, having the most amount of logic not available to other types. This includes MCV deployment, harvesting, generalized turrets, and several customized visual animation aspects.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 
 - [Turret Adjustments](#turret-adjustments) 
 - [Deploys To Building](#deploys-to-building) 
 - [Reload Logic](#reload-logic) 
 - [Custom Voices](#custom-voices) 
 - [Visual Settings](#visual-settings) 
 - [AI AutoBase Controls](#ai-autobase-controls) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
### New Type Extensions
<br>

These settings enable you to define new types, expanding modding capabilities.

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [UnitTypes]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new UnitType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[UnitTypes]
0=5TNK
1=SAPC
```
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [StringTableOffsets] ► Unit
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Unit` is set to 400 and `[UnitTypes] ► 2` is set to SAPC, then the string table entry for `[SAPC]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional unit types will default their names to the 'Civilian' text entry.
</details></td></tr></table>


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
### TechnoTypes
<br>

TechnoType settings are also available to UnitTypes. See [TechnoTypes](./technotypes.md) for more details.


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
### General Settings
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsCrateGoodie
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsCrateGoodie```

Determines if this unit can be spawned from a goodie crate.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► Crusher
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsCrusher```

Determines if this unit can crush infantry that does not have `Crushable` set. By default, wheeled units (such as the Ranger) do not crush infantry, while tracked units (such as the tanks) do.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsHarvester
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsToHarvest```

Determines if this unit performs harvesting operations when over an ore patch.
The harvester will interact with any building with `IsRefinery`=true for undocking operations. It faces west when unloading the ore.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsRotatingTurret
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsRadarEquipped```

Determines if this unit renders a rotating radar dish above its sprite. If set to true, the unit uses its turret frames for its radar dish.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsFireAnim
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsFireAnim```

Determines if this unit renders a firing animation when firing.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsLockTurret
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsLockTurret```

*Functionality to be determined*
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► Large
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsGigundo```

Determines if the image of this unit is larger than the cell size of 24x24 pixels.\
This allows the adjecent cells to be re-rendered and prevent clipping and other graphical distortions. Note that this is supported for images up to 96x96 pixels, due to the new refresh window of 3x3 cells.

Note that this does not determine the size of the unit select box. This is determined solely by the size of the unit's image.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsAnimating
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsAnimating```

Determines if this unit constantly animates, like a Visceroid. *Does not work as expected, consider using IsRotatingTurret with customized turret settings instead.*
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsJammer
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsJammer```

Determines if this unit acts like the Radar Jammer and can jam nearby radar domes.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsGapper
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsGapper```

Determines if this unit acts like the Mobile Gap Generator and produces shroud around its vicinity.
</details></td></tr></table>


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
### Turret Adjustments
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;VesselType&gt;]  ► TurretOffset
</samp></td><td width="120"><samp>Signed Byte</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->TurretOffset```

Determines the offset of the turret, in pixels, towards the front of the unit. Negative values will move the turret backwards, like the Destroyer's turret.

Note that the firing offsets are not yet adjusted.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► TurretAdjustX
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the horizontal turret offset
</details></td></tr></table>

 
<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► TurretAdjustY
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the vertical turret offset
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► TurretFrameStart
</samp></td><td width="120"><samp>Short</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the frame of the image used for the start of the turret animation. Useful in conjunction with `IsRotatingTurret` for objects that sport a custom turret.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► TurretFrameCount
</samp></td><td width="120"><samp>Short</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the number of frames used for the turret animation. Useful in conjunction with `IsRotatingTurret` for objects that sport a custom turret.
</details></td></tr></table>


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
### Deploys To Building
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► DeploysInto
</samp></td><td width="120"><samp><a href="./defines.md#buildingtypes">BuildingType</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Allows the unit to unpack into the indicated structure. Also enables the deploy cursor when hovering over the unit while selected, if not already enabled. Defaults to YARD for the MCV, none otherwise. Invalid buildingtype strings are treated as none.

The created building will be offset at the cell -1,-1 (directly north-west) from the unit's location. This may change in the future towards an automatic centering.

When the Home key is pressed and the player does not have a construction yard, any unit with this deploy function may be centered by this key.

For the moment, teams with units with this modified characteristic may use the Undeploy mission to deploy.

Interactions with other deploy logic (such as unloading passengers) are not presently known.
</details></td></tr></table>


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
### Reload Logic
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► AmmoReloadRate
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set, enables timed reload of ammunition, in seconds, up to the maximum defined by `Ammo`. Has no effect on units without `Ammo`.

This is applicable to both units with weapons and the Minelayer's mines.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► AmmoReloadAmount
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set, determines the number of ammo resupplied for each reload cycle. The ammunition restored will never allow the unit to exceed its maximum defined by `Ammo`

This is applicable to both units with weapons and the Minelayer's mines.

For example, setting `AmmoReloadRate` to 20 and `AmmoReloadAmount` to 2 for Minelayer will cause the Minelayer to restore 2 units of mines every 20 seconds.
</details></td></tr></table>


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
### Custom Voices
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► ResponseSelect<br>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► ResponseMove<br>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► ResponseHarvest<br>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► ResponseEnter<br>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► ResponseDeploy<br>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► ResponseAttack

</samp></td><td width="120"><samp>List<br>
List<br>
List<br>
List<br>
List<br>
List
</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```New Logic```

If defined, replaces the voice response when selected or given an order. Up to 16 entries (16 for Select, 16 for Move, 16 for Attack) can be supported. Each entry must be an existing <a href="./defines.md#soundeffects">SoundEffect</a> or defined in `[SoundEffects]`. Entries can be repeated for higher probability.
 
Each entry are as follows:

<samp>

|Stage             |Explanation             
:------------------|:------------
|`ResponseSelect`  |Response when selected
|`ResponseMove`    |Response when ordered to move to a location
|`ResponseHarvest` |Response when ordered to harvest.<br>If not defined, falls back to `ResponseMove`
|`ResponseEnter`   |Response when ordered to enter a building (Refinery, Service Depot), or a transport.<br>If not defined, falls back to `ResponseMove`
|`ResponseDeploy`  |Response when ordered to unload (passengers, or a mine), or deploy into a building.<br>If not defined, falls back to `ResponseMove`
|`ResponseAttack`  |Response when ordered to attack a target

</samp>
</details></td></tr></table>


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
### Visual Settings
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► ExplosionAnim
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->Explosion```

Overrides the animation produced when the unit is destroyed.
V2 Launchers with the ammo loaded will still produce a NAPALM3 animation when destroyed.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► UsePrimaryColor
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set to true, the unit will retain the use of the Primary color when [HouseType]  ► `SecondaryColor` is used.

Defaults to yes for the Ore Truck and MCV, no to every other unit.

</samp>
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► HasAPCDoor

</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set to true, the unit will use APC graphics sequences. In essence, 6 frames are added to the body frames for door animations. That is:
 - Frames 0-31: Normal body
 - Frames 32-35: NE door animation (the vehicle itself faces NE)
 - Frames 36-38: NW door animation
 - Frames 39-69: Turret (if turret is defined, such as [STNK])

Defaults to yes for APC and STNK, no to every other unit.
You are expected to supply the appropriate graphics to match.

</samp>
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► AmmoImageCount

</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set, the unit will use additional body frames for depleted Ammo sequences. That means:
 - If `AmmoImageCount`-`Ammo` is less than 0 (you defined more Ammo than image sequences), the body frame number is not incremented.
 - The body frame number is incremented by 32 * (`AmmoImageCount`-`Ammo`).
 - If `HasAPCDoor`=true, the body frame number is incremented by 38 * (`AmmoImageCount`-`Ammo`) instead.
 - Turret images are similarly incremented - they will start after the body/door sequence

Works best with `AmmoImageCount` matching `Ammo`.

Defaults to 1 for V2RL, 0 to every other unit.
You are expected to supply the appropriate graphics to match.

</samp>
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► AmmoTurretCount

</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set, the unit will use additional turret frames for depleted Ammo sequences. That means:
 - If `AmmoTurretCount`-`Ammo` is less than 0 (you defined more Ammo than image sequences), the turret frame number is not incremented.
 - The turret frame number is incremented by 32 * (`AmmoTurretCount`-`Ammo`).

Defaults to 0.
This control can be use to emulate the C&C SSM unit, using `AmmoTurretCount`=2.
You are expected to supply the appropriate graphics to match.

</samp>
</details></td></tr></table>


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
### AI AutoBase Controls
<br>

Auto AI production now take into account new technotypes. Additional controls are provided below.

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► AIBuildWeight
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
Determines the weightage given to this unittype when the AI wishes to build a new unit. The higher the number, the more likely AI will build it.
Defaults to 20 for units with weapons, 1 for all else.

The Harvester has special logic and will disregard these settings.

To disable the unit from being built by the AutoBase AI, use `AIBuildWeight`=0.

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► AIBuildLimit
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
Determines the maximum number of unittype instances that the new AutoBase AI can build.
If the value is 0, the AutoBase AI will treat the value as unlimited (no limit).
Defaults to 0 (unlimited).

The Harvester has special logic and will disregard these settings.

To disable the unit from being built by the AutoBase AI, use `AIBuildWeight`=0 instead.

Note that the AI might surpass the limit if it has multiple factories.

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► AIDeployBuildLimit
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This control is used for Units that have `DeploysInto` set to some BuildingType.

Determines the maximum number of unittype instances + their DeploysInto buildings that the new AutoBase AI can build.
If the value is 0, the AutoBase AI will treat the value as unlimited (no limit).
Defaults to 0 (unlimited).

This allows the modder to place a limit to the number of MCVs the AI can build, and the ConYards that are deployed from these MCVs would be counted in this configuration.

The Harvester has special logic and will disregard these settings.

Note that the AI might surpass the limit if it has multiple factories.

</details></td></tr></table>


<a href="#unittypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>UnitTypes</kbd></kbd><br>

