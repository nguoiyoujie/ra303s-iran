[Return to Features](./features.md)

## UnitTypes

UnitTypes represent vehicles, and are in essence play the second most major role, second to BuildingTypes, having the most amount of logic not available to other types. This includes MCV deployment, harvesting, generalized turrets, and several customized visual animation aspects.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 
 - [Turret Adjustments](#turret-adjustments) 
 - [Deploys To Building](#deploys-to-building) 
 - [Reload Logic](#reload-logic) 


-------
### Documentation Guide
[Top](#unittypes)

A guide on how to interpret the information is available [here](./dockeys.md).


-------
### New Type Extensions
[Top](#unittypes)

These settings enable you to define new types, expanding modding capabilities.

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [UnitTypes]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new UnitType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[UnitTypes]
0=5TNK
1=SAPC
```
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [StringTableOffsets] ► Unit
</td><td width="50">Integer</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Unit` is set to 400 and `[UnitTypes] ► 2` is set to SAPC, then the string table entry for `[SAPC]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional unit types will default their names to the 'Civilian' text entry.
</details></td></tr></table>


-------
### TechnoTypes
[Top](#unittypes)

TechnoType settings are also available to UnitTypes. See [TechnoTypes](./technotypes.md) for more details.


-------
### General Settings
[Top](#unittypes)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsCrateGoodie
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsCrateGoodie```

Determines if this unit can be spawned from a goodie crate.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► Crusher
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsCrusher```

Determines if this unit can crush infantry that does not have `Crushable` set. By default, wheeled units (such as the Ranger) do not crush infantry, while tracked units (such as the tanks) do.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsToHarvest
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsToHarvest```

Determines if this unit performs harvesting operations when over an ore patch. *The harvester behavior overrides have not yet been fully dehardcoded, so this switch does not have much use.*
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsRotatingTurret
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsRadarEquipped```

Determines if this unit renders a rotating radar dish above its sprite. If set to true, the unit uses its turret frames for its radar dish.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsFireAnim
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsFireAnim```

Determines if this unit renders a firing animation when firing.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsLockTurret
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsLockTurret```

*Functionality to be determined*
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► Large
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsGigundo```

Determines if the image of this unit is larger than the cell size of 24x24 pixels.\
This allows the adjecent cells to be re-rendered and prevent clipping and other graphical distortions. Note that this is supported for images up to 96x96 pixels, due to the new refresh window of 3x3 cells.

Note that this does not determine the size of the unit select box. This is determined solely by the size of the unit's image.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsAnimating
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsAnimating```

Determines if this unit constantly animates, like a Visceroid. *Does not work as expected, consider using IsRotatingTurret with customized turret settings instead.*
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsJammer
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsJammer```

Determines if this unit acts like the Radar Jammer and can jam nearby radar domes.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► IsGapper
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsGapper```

Determines if this unit acts like the Mobile Gap Generator and produces shroud around its vicinity.
</details></td></tr></table>

-------
### Turret Adjustments
[Top](#unittypes)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► TurretAdjustX
</td><td width="50">Integer</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the horizontal turret offset
</details></td></tr></table>

 
<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► TurretAdjustY
</td><td width="50">Integer</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the vertical turret offset
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► TurretFrameStart
</td><td width="50">Short</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the frame of the image used for the start of the turret animation. Useful in conjunction with `IsRotatingTurret` for objects that sport a custom turret.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► TurretFrameCount
</td><td width="50">Short</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the number of frames used for the turret animation. Useful in conjunction with `IsRotatingTurret` for objects that sport a custom turret.
</details></td></tr></table>


-------
### Deploys To Building
[Top](#unittypes)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► DeploysInto
</td><td width="50"><a href="./defines.md#buildingtypes">BuildingType</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Allows the unit to unpack into the indicated structure. Also enables the deploy cursor when hovering over the unit while selected, if not already enabled. Defaults to YARD for the MCV, none otherwise. Invalid buildingtype strings are treated as none.

The created building will be offset at the cell -1,-1 (directly north-west) from the unit's location. This may change in the future towards an automatic centering.

For the moment, teams with units with this modified characteristic may use the Undeploy mission to deploy.

Interactions with other deploy logic (such as unloading passengers) are not presently known.
</details></td></tr></table>


-------
### Reload Logic
[Top](#unittypes)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► AmmoReloadRate
</td><td width="50">Integer</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set, enables timed reload of ammunition, in seconds, up to the maximum defined by `Ammo`. Has no effect on units without `Ammo`.

This is applicable to both units with weapons and the Minelayer's mines.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;UnitType&gt;]  ► AmmoReloadAmount
</td><td width="50">Integer</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set, determines the number of ammo resupplied for each reload cycle. The ammunition restored will never allow the unit to exceed its maximum defined by `Ammo`

This is applicable to both units with weapons and the Minelayer's mines.

For example, setting `AmmoReloadRate` to 20 and `AmmoReloadAmount` to 2 for Minelayer will cause the Minelayer to restore 2 units of mines every 20 seconds.
</details></td></tr></table>


-------
[Return to Features](./features.md)

