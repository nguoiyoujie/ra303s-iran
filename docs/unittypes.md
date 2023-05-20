[Return to Features](./features.md)

## UnitTypes

UnitTypes represent vehicles, and are in essence play the second most major role, second to BuildingTypes, having the most amount of logic not available to other types. This includes MCV deployment, harvesting, generalized turrets, and several customized visual animation aspects.

-------

 - [Feature Availability](#feature-availability)
 - [Modification References](#modification-references) 
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 
 - [Turret Adjustments](#turret-adjustments) 
 - [Deploys To Building](#deploys-to-building) 

-------

### Feature Availability

Most extended features can applied by setting the value on the Rules ini or the map specific ini (e.g. SCG01EA.ini). Reloading the map refreshes such values. These features are indicated with `{Rules/Map}`.

However, some features are only effective on game engine initialization, and can only be used on rules.ini. For example, some settings modify the memory heap size allocated by the game to store certain elements, which cannot be resized without resetting the game. These features are indicated with `{Rules}`.

`{Rules}` include both rules.ini and aftrmath.ini. `{Rules/Map}` includes any multiplayer spawn.ini that may be used by your choice of multiplayer client.

-------

### Modification References

Much of the inner workings of the Red Alert game engine was unraveled by the release of the source code in the Remastered release. While not exact, the source code provides an easy reference point for the usage of internal variables, allowing easier debugging and research. The chief aim of the project is to allow prospective modders and mappers greater flexibility in their project by exposing some of the hidden or hardcoded logic into modifiable entries in the existant INI read system.

The following desciptions can be used as a reference point to its relationship with Remastered source code.

 - ```Exposed <Reference>```
   
   The variable, usually defined in an internal class, is now exposed via this INI key.

 - ```Modified <Reference>```
   
   Modifications have been applied to the meaning or use of this variable.

 - ```New logic```

   The Remastered source code does not have a reference point for this key. This may happen if original implementation is baked into game logic without the use of stored variables.

Warning: Remastered source code is not exact with legacy Red Alert. Keep this in mind if you wish to dabble into forking and modifying this project!

-------

### New Type Extensions

These settings enable you to define new types, expanding modding capabilities.

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

<details>
  <summary><b><code>{Rules} ► [UnitTypes]</code></b></summary>

```New logic```

This section carries a zero-based list of IDs to be recognized as new UnitType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[UnitTypes]
0=5TNK
1=SAPC
```

</details>

<details>
  <summary><b><code>{Rules} ► [StringTableOffsets] ► Units (integer)</code></b></summary>

```New logic```
  
The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Units` is set to 400 and `[UnitTypes] ► 2` is set to SAPC, then the string table entry for `[SAPC]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional unit types will default their names to the 'Civilian' text entry.

</details>

-------

### TechnoTypes

TechnoType settings are also available to UnitTypes. See [TechnoTypes](./technotypes.md) for more details.

-------

### General Settings

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► IsCrateGoodie (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsCrateGoodie```

Determines if this unit can be spawned from a goodie crate.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► Crusher (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsCrusher```

Determines if this unit can crush infantry that does not have `Crushable` set. By default, wheeled units (such as the Ranger) do not crush infantry, while tracked units (such as the tanks) do.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► IsToHarvest (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsToHarvest```

Determines if this unit performs harvesting operations when over an ore patch. *The harvester behavior overrides have not yet been fully dehardcoded, so this switch does not have much use.*

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► IsRotatingTurret (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsRadarEquipped```

Determines if this unit renders a rotating radar dish above its sprite. If set to true, the unit uses its turret frames for its radar dish.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► IsFireAnim (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsFireAnim```

Determines if this unit renders a firing animation when firing.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► IsLockTurret (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsLockTurret```

*Functionality to be determined*

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► Large (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsGigundo```

Determines if the image of this unit is larger than the cell size of 24x24 pixels.\
This allows the adjecent cells to be re-rendered and prevent clipping and other graphical distortions. Note that this is supported for images up to 96x96 pixels, due to the new refresh window of 3x3 cells.

Note that this does not determine the size of the unit select box. This is determined solely by the size of the unit's image.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► IsAnimating (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsAnimating```

Determines if this unit constantly animates, like a Visceroid. *Does not work as expected, consider using IsRotatingTurret with customized turret settings instead.*

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► IsJammer (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsJammer```

Determines if this unit acts like the Radar Jammer and can jam nearby radar domes.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► IsGapper (boolean)</code></b></summary>

```Exposed UnitTypeClass->IsGapper```

Determines if this unit acts like the Mobile Gap Generator and produces shroud around its vicinity.

</details>

-------

### Turret Adjustments

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► TurretAdjustX (integer)</code></b></summary>

```New logic```

Determines the horizontal turret offset

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► TurretAdjustY (integer)</code></b></summary>

```New logic```

Determines the vertical turret offset

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► TurretFrameStart (short)</code></b></summary>

```New logic```

Determines the frame of the image used for the start of the turret animation. Useful in conjunction with `IsRotatingTurret` for objects that sport a custom turret.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► TurretFrameCount (short)</code></b></summary>

```New logic```

Determines the number of frames used for the turret animation. Useful in conjunction with `IsRotatingTurret` for objects that sport a custom turret.

</details>

-------

### Deploys To Building

<details>
  <summary><b><code>{Rules/Map} ► [&lt;UnitType&gt;] ► DeploysInto (string representing BuildingType)</code></b></summary>

```New logic```

Allows the unit to unpack into the indicated structure. Also enables the deploy cursor when hovering over the unit while selected, if not already enabled. Defaults to YARD for the MCV, none otherwise. Invalid buildingtype strings are treated as none.

The created building will be offset at the cell -1,-1 (directly north-west) from the unit's location. This may change in the future towards an automatic centering.

For the moment, teams with units with this modified characteristic may use the Undeploy mission to deploy.

Interactions with other deploy logic (such as unloading passengers) are not presently known.

</details>
