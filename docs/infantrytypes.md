[Return to Features](./features.md)

## InfantryTypes

InfantryTypes represent infantry and creatures that are occupy a subspace of a cell. A cell can contain up to five infantry objects, and they are often eligible for crushing deaths. 

-------

 - [Documentation Guide](#documentation-guide)
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 

-------
### Documentation Guide
[Top](#infantrytypes)

A guide on how to interpret the information is available [here](./dockeys.md).


-------
### New Type Extensions
[Top](#infantrytypes)

These settings enable you to define new types, expanding modding capabilities.

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [InfantryTypes]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new InfantryType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[InfantryTypes]
0=COMMANDO
1=E5
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [StringTableOffsets] ► Infantry
</td><td width="50">Integer</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Infantry` is set to 400 and `[InfantryTypes] ► 2` is set to E5, then the string table entry for `[E5]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional unit types will default their names to the 'Civilian' text entry.
</details></td></tr></table>


-------
### TechnoTypes
[Top](#infantrytypes)

TechnoType settings are also available to InfantryTypes. See [TechnoTypes](./technotypes.md) for more details.


-------
### General Settings
[Top](#infantrytypes)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► IsFemale
</td><td width="50">Boolean</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->IsFemale```

Determines if this civilian infantry should use the female civilian voice.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► IsCrawling
</td><td width="50">Boolean</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->IsCrawling```

Acts as override switch to `IsFraidyCat`. An infantry that has `IsFraidyCat` set to true and `IsCrawling` set to false will have their speed multiplied by 2 when prone (to emulate the civilian panic sprint). Any other combination will result in the typical reduction of speed by half when prone.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► IsCivilian
</td><td width="50">Boolean</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->IsCivilian```

Determines if this infantry is a civilian, applying the following changes:

 - Civilian voices (combine with `IsFemale` for a second set of voices)
 - Name description is changed to `Civilian`, unless overriden by the rules / map.
 - Score counting
  - If combined with `Cloakable`, does not uncloak to fire.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► Pip
</td><td width="50">Byte</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->Pip```

Sets the pip of the transport when carrying this infantry type. This refers to the indexed entry in pips.shp. An unmodified pips.shp can work with the following values:

 > 0 = Empty pip\
 > 1 = Green pip\
 > 5 = Yellow pip (engineer)\
 > 6 = Grey pip (civilian)\
 > 7 = Red pip (commando)
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► DoControls
</td><td width="50"><a href="./defines.md#infantrytypes">InfantryType</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->DoControls```

If specified, loads that units' animation control frames for the infantry. Only the original units (up to MECHANIC) are supported.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/b4a458/331?text=ref"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► FireFrame<br>
<code>{Rules/Map}</code> ► [&lt;InfantryType&gt;]  ► ProneFireFrame
</td><td width="50">Byte<br>Byte</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed InfantryTypeClass->FireFrame```\
```Exposed InfantryTypeClass->ProneFireFrame```

Determines the frame offset from the begining of the firing sequence when the weapon actually fires. This allows for certain frames of animations to pass before the actual weapon is fired. Examples of infantry with this feature is, the Grenadier, the Medic and the Mechanic.
</details></td></tr></table>



-------
[Return to Features](./features.md)

