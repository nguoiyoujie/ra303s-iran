[Return to Features](./features.md)

## AircraftTypes

AircraftTypes represent things that... fly. They include fixed-wing and rotor-wing aircrafts. These units are generally not bound by terrain during movement.

-------

 - [Feature Availability](#feature-availability)
 - [Modification References](#modification-references) 
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 

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
  <summary><b><code>{Rules} ► [AircraftTypes]</code></b></summary>

```New logic```

This section carries a zero-based list of IDs to be recognized as new AircraftType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[AircraftTypes]
0=ORCA
1=A10
```

</details>

<details>
  <summary><b><code>{Rules} ► [StringTableOffsets] ► Aircrafts (integer)</code></b></summary>

```New logic```

The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Aircrafts` is set to 400 and `[AircraftTypes] ► 2` is set to ORCA, then the string table entry for `[ORCA]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional unit types will default their names to the 'Civilian' text entry.

</details>

-------

### TechnoTypes

TechnoType settings are also available to AircraftTypes. See [TechnoTypes](./technotypes.md) for more details.

-------

### General Settings

<details>
  <summary><b><code>{Rules/Map} ► [&lt;AircraftType&gt;]  ► IsFixedWing (boolean)</code></b></summary>

```Exposed AircraftTypeClass->IsFixedWing```

Determines if this aircraft type behaves like a fixed wing aircraft (such as the Mig or the Yak), or a gunship (such as the Longbow). Setting yes also sets the preferred docking building as an Airfield, while setting no sets the preferred docking building to the Helipad.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;AircraftType&gt;]  ► IsLandable (boolean)</code></b></summary>

```Exposed AircraftTypeClass->IsLandable```

Has no impact on the unit or the game. Supposedly this determines whether this aircraft type can land on terrain, but this appears to be overriden by IsFixedWing, and the source code from Remastered does not appear to use it.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;AircraftType&gt;]  ► IsRotorEquipped (boolean)</code></b></summary>

```Exposed AircraftTypeClass->IsRotorEquipped```

Determines if additional aircraft rotor should be drawn on top of the aircraft. The game is presently hardcoded to draw two rotors for the transport heli `TRAN`.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;AircraftType&gt;]  ► IsRotorCustom (boolean)</code></b></summary>

```Exposed AircraftTypeClass->IsRotorCustom```

Has no impact on the unit or the game. The transport heli is presently hardcoded to draw two rotors after checking for `IsRotorEquipped`, and `IsRotorCustom` does not appear to be used.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;AircraftType&gt;]  ► LandingSpeed (integer)</code></b></summary>

```Exposed AircraftTypeClass->LandingSpeed```

Determines the landing speed of the aircraft. For fixed wing aircraft, the landing speed should be adjusted with `Speed` so that the aircraft lands correctly on the airfield.

When using the Airfield, the game does no checks on the aircraft's descent against its forward motion. The position of descent is fixed. You may get strange results when the aircraft speed changes without corresponding changes with the landing speed. This includes any applied House bias to the aircraft speeds.

</details>
