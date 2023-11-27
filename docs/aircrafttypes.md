[Return to Features](./features.md)

## AircraftTypes

AircraftTypes represent things that... fly. They include fixed-wing and rotor-wing aircrafts. These units are generally not bound by terrain during movement.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 
 - [Rotor Wing Flight Controls](#rotor-wing-flight-controls) 
 - [Fixed Wing Flight Controls](#fixed-wing-flight-controls) 

-------
### Documentation Guide
[Top](#aircrafttypes)

A guide on how to interpret the information is available [here](./dockeys.md).

-------
### New Type Extensions
[Top](#aircrafttypes)

These settings enable you to define new types, expanding modding capabilities.

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [AircraftTypes]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new AircraftType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[AircraftTypes]
0=ORCA
1=A10
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [StringTableOffsets] ► Aircraft
</td><td width="50">Integer</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Aircraft` is set to 400 and `[AircraftTypes] ► 2` is set to ORCA, then the string table entry for `[ORCA]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional unit types will default their names to the 'Civilian' text entry.
</details></td></tr></table>

-------
### TechnoTypes
[Top](#aircrafttypes)

TechnoType settings are also available to AircraftTypes. See [TechnoTypes](./technotypes.md) for more details.

-------
### General Settings
[Top](#aircrafttypes)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;AircraftType&gt;]  ► IsFixedWing
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed AircraftTypeClass->IsFixedWing```

Determines if this aircraft type behaves like a fixed wing aircraft (such as the Mig or the Yak), or a gunship (such as the Longbow). Setting yes also sets the preferred docking building as an Airfield, while setting no sets the preferred docking building to the Helipad.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;AircraftType&gt;]  ► IsLandable
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed AircraftTypeClass->IsLandable```

Has no impact on the unit or the game. Supposedly this determines whether this aircraft type can land on terrain, but this appears to be overriden by IsFixedWing, and the source code from Remastered does not appear to use it.
</details></td></tr></table>

-------
### Rotor Wing Flight Controls
[Top](#aircrafttypes)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;AircraftType&gt;]  ► IsRotorEquipped
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed AircraftTypeClass->IsRotorEquipped```

Determines if additional aircraft rotor should be drawn on top of the aircraft. The game is presently hardcoded to draw two rotors for the transport heli `TRAN`.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;AircraftType&gt;]  ► IsRotorCustom
</td><td width="50">Boolean</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed AircraftTypeClass->IsRotorCustom```

Has no impact on the unit or the game. The transport heli is presently hardcoded to draw two rotors after checking for `IsRotorEquipped`, and `IsRotorCustom` does not appear to be used.
</details></td></tr></table>

-------
### Fixed Wing Flight Controls
[Top](#aircrafttypes)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;AircraftType&gt;]  ► LandingSpeed
</td><td width="50">Integer</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed AircraftTypeClass->LandingSpeed```

Determines the landing speed of the aircraft. For fixed wing aircraft, the landing speed should be adjusted with `Speed` so that the aircraft lands correctly on the airfield.

When using the Airfield, the game does no checks on the aircraft's descent against its forward motion. The position of descent is fixed. You may get strange results when the aircraft speed changes without corresponding changes with the landing speed. This includes any applied House bias to the aircraft speeds.
</details></td></tr></table>


-------
[Return to Features](./features.md)
