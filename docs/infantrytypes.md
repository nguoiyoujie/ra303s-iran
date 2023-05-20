[Return to Features](./features.md)

## InfantryTypes

InfantryTypes represent infantry and creatures that are occupy a subspace of a cell. A cell can contain up to five infantry objects, and they are often eligible for crushing deaths. 

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
  <summary><b><code>{Rules} ► [InfantryTypes]</code></b></summary>

```New logic```

This section carries a zero-based list of IDs to be recognized as new InfantryType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

**[InfantryTypes]**\
0=COMMANDO\
1=E5

</details>

<details>
  <summary><b><code>{Rules} ► [StringTableOffsets] ► Infantry (integer)</code></b></summary>

```New logic```

The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Infantry` is set to 400 and `[InfantryTypes] ► 2` is set to E5, then the string table entry for `[E5]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional unit types will default their names to the 'Civilian' text entry.

</details>

-------

### TechnoTypes

TechnoType settings are also available to InfantryTypes. See [TechnoTypes](./technotypes.md) for more details.

-------

### General Settings

<details>
  <summary><b><code>{Rules/Map} ► [&lt;InfantryType&gt;] ► IsFemale (boolean)</code></b></summary>

```Exposed InfantryTypeClass->IsFemale```

Determines if this civilian infantry should use the female civilian voice.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;InfantryType&gt;] ► IsCrawling (boolean)</code></b></summary>

```Exposed InfantryTypeClass->IsCrawling```

Acts as override switch to `IsFraidyCat`. An infantry that has `IsFraidyCat` set to true and `IsCrawling` set to false will have their speed multiplied by 2 when prone (to emulate the civilian panic sprint). Any other combination will result in the typical reduction of speed by half when prone.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;InfantryType&gt;] ► IsCivilian (boolean)</code></b></summary>

```Exposed InfantryTypeClass->IsCivilian```

Determines if this infantry is a civilian, applying the following changes:

 - Civilian voices (combine with `IsFemale` for a second set of voices)\
 - Name description is changed to `Civilian`, unless overriden by the rules / map.\
 - Score counting\
  - If combined with `Cloakable`, does not uncloak to fire.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;InfantryType&gt;] ► Pip (byte)</code></b></summary>

```Exposed InfantryTypeClass->Pip```

Sets the pip of the transport when carrying this infantry type. This refers to the indexed entry in pips.shp. An unmodified pips.shp can work with the following values:

 > 0 = Empty pip\
 > 1 = Green pip\
 > 5 = Yellow pip (engineer)\
 > 6 = Grey pip (civilian)\
 > 7 = Red pip (commando)

</details>

<details>
  <summary>
    <b><code>{Rules/Map} ► [&lt;InfantryType&gt;] ► FireFrame (byte)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;InfantryType&gt;] ► ProneFireFrame (byte)</code></b>
  </summary>

```Exposed InfantryTypeClass->FireFrame```
```Exposed InfantryTypeClass->ProneFireFrame```

Determines the frame offset from the begining of the firing sequence when the weapon actually fires. This allows for certain frames of animations to pass before the actual weapon is fired. Examples of infantry with this feature is, the Grenadier, the Medic and the Mechanic.

</details>
