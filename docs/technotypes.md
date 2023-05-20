[Return to Features](./features.md)

## TechnoTypes

Technotypes represent common elements between [BuildingTypes](../buildingtypes.md), [UnitTypes](../unittypes.md), [InfantryTypes](../infantrytypes.md), [VesselTypes](../vesseltypes.md) and [AircraftTypes](../aircrafttypes.md)

-------

 - [Feature Availability](#feature-availability)
 - [Modification References](#modification-references) 
 - [New Type Extensions](#new-type-extensions) 
 - [New Armor-types](#new-armor-types) 
 - [QoL Changes](#gol-changes) 
 - [Prerequisite System](#prerequisite-system) 
 - [General Settings](#general-settings) 
 - [Firing Offsets](#firing-offsets) 
 - [Death Weapons](#death-weapons) 

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

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

Check the following specific types to learn how to introduce new types:

 - [BuildingTypes](./buildingtypes.md#new-type-extensions)
 - [UnitTypes](./unittypes.md#new-type-extensions)
 - [InfantryTypes](./infantrytypes.md#new-type-extensions)
 - [VesselTypes](./vesseltypes.md#new-type-extensions) 
 - [AircraftTypes](./aircrafttypes.md#new-type-extensions)

-------

### New Armor-types

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► Armor (strings)</code></b></summary>
  
```Modified TechnoTypeClass->Armor```

The number of supported types have been increased to 9, matching the first nine armortypes used in Red Alert 2. For compatibility, the original armor types are not changed.

You are expected to modify the existing Warhead entries to make use of them. See [Warheads ► New Armor-types](./warheads.md#new-armor-types).

 > 0 = None\
 > 1 = Wood\
 > 2 = Light\
 > 3 = Heavy\
 > 4 = Concrete\
 > 5 = Flak\
 > 6 = Plate\
 > 7 = Medium\
 > 8 = Steel

Special_1 and Special_2 are not yet supported in this version, but may be in the future.

</details>

-------

### QoL Changes

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► Image (strings)</code></b></summary>
  
```Inherited from iran's r-series```

The Image= keyword now works in a map file, instead of just globally in RULES.INI.

</details>

-------

### Prerequisite System

**New Prerequisite-types**\
*This constitutes a breaking change, therefore this system may be subject to change in the future in case of work to make it compatible with unmodified RA.*

*As far as possible, the list of broken compatibility will be listed at the end of the section.*

The prerequisite system has been extended to aid with the overall softcoding of the interconnected web of building behaviors and checks. The center of this change lies in the implementation of Prerequisite Types.

This is analogus to the Prerequisite Groups system implemented in Tiberian Sun and beyond. Unlike Tiberian Sun, a building does not (yet) belong to more than one Type.

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► PrerequisiteType (string)</code></b></summary>

```New logic```

Each building can be assigned one of several Prerequisite types. A total of 32 are supported, as below.

 > 0 = NONE\
 > 1 = CONYARD\
 > 2 = POWER\
 > 3 = ADV.POWER\
 > 4 = REFINERY\
 > 5 = ORESILO\
 > 6 = BARRACKS\
 > 7 = WARFACTORY\
 > 8 = RADAR\
 > 9 = REPAIR\
 > 10 = DEFENSE\
 > 11 = ADV.DEFENSE\
 > 12 = AA.DEFENSE\
 > 13 = TECH\
 > 14 = AIRSTRIP\
 > 15 = HELIPAD\
 > 16 = SHIPYARD\
 > 17 = LAB\
 > 18 = ADV.LAB\
 > 19 = ADV.WEAPON1\
 > 20 = ADV.WEAPON2\
 > 21 = FAKES\
 > 22 = USER.22\
 > 23 = USER.23\
 > 24 = USER.24\
 > 25 = USER.25\
 > 26 = USER.26\
 > 27 = USER.27\
 > 28 = USER.28\
 > 29 = USER.29\
 > 30 = MISC\
 > 31 = CIVBUILDING

NONE effectively excludes the building from PrerequisiteType checks, as Prerequisite= is set to ignore 'none'.

Defaults to the following values, depending on the building in question:
 > CONYARD: [FACT]\
 > POWER: [POWR], [APWR]\
 > REFINERY: [PROC]\
 > ORESILO: [SILO]\
 > BARRACKS: [BARR], [TENT]\
 > WARFACTORY: [WEAP]\
 > RADAR: [DOME]\
 > REPAIR: [FIX]\
 > DEFENSE: [PBOX], [HBOX], [GUN], [FTUR]\
 > ADV.DEFENSE: [TSLA]\
 > AA.DEFENSE: [AGUN], [SAM]\
 > TECH: [ATEK], [STEK]\
 > AIRSTRIP: [AFLD]\
 > HELIPAD: [HPAD]\
 > SHIPYARD: [SYRD], [SPEN]\
 > ADV.WEAPON1: [IRON], [PDOX]\
 > ADV.WEAPON2: [MSLO]\
 > FAKES: [WEAF], [FACF], [SYRF], [SPEF], [DOMF]\
 > NONE: All other buildings
</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► Prerequisite (comma-delimited list of strings)</code></b></summary>
 
```Modified TechnoTypeClass->Prerequisite```

Extended behavior: The list of valid prerequisite strings now include any of the PrerequisiteTypes. This inclusion works like prerequisite groups in Tiberian Sun onwards; any building type with the appropriate PrerequisiteType may fulfill the prerequisite.

Like the original, the game checks for at least one item fulfilling each of the listed prerequisites. 

Example: If a unit has Prerequisite=POWER,BARRACKS,FIX,STEK. The prerequisite requirements are:
 - At least one building with PrerequisiteType=POWER (by default this is POWR or APWR)\
 - At least one building with PrerequisiteType=BARRACKS (by default this is BARR or TENT)\
 - At least one [FIX] (Service Depot)\
 - At least one [STEK] (Soviet Tech Center)

</details>

<details>
<summary><i>Compatibility Notices:</i></summary>

**Broken Compatibility**

 - *Original RA allowed the Advanced Power Plant to count as a Power Plant. This behavior has been removed. To allow this behavior to be restored, ensure both [POWR] and [APWR] have PrerequisiteType=POWER (set by default), and replace the appropriate pre-requisites with the Prerequisite type name (required addition).*

 - *Similarly, in singleplayer, original RA allowed the Allied Tech Center and Soviet Tech Center to count as each other. This behavior has been removed. To allow this behavior to be restored, set both [ATEK] and [STEK] with PrerequisiteType=TECH (set by default), and replace the appropriate pre-requisites with the Prerequisite type name (required addition).*

**Other Information:** 

 - *All refinery checks (harvesting, docking targets, AI build queue) have been de-hardcoded, and check for PrerequisiteType=REFINERY instead. This does mean that Harvesters **stop working** if PrerequisiteType=REFINERY is overrriden for the [PROC] building.*

 - *All advanced defense checks (AI build queue) have been de-hardcoded, and check for PrerequisiteType=ADV.DEFENSE and PrerequisiteType=AA.DEFENSE instead.*

 - *The Map Trigger Event [Destroyed, All Fakes] will now count all buildings with the PrerequisiteType=FAKES attribute. Fake Structures will need to be set with PrerequisiteType=FAKES to enable this function. (Technically this is not broken behavior because the event didn't even work in the original RA)*

 - *The Map Trigger Event [Destroyed, All Factories] as well as the AI Fire Sale will now count all buildings with the PrerequisiteType= attribute being one of the following: CONYARD, BARRACKS, WARFACTORY, AIRSTRIP, HELIPAD or SHIPYARD. Structures will need to be set with appropriate PrerequisiteType= to be included this function.*

</details>

-------

### General Settings

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► IsNominal (boolean)</code></b></summary>
 
```Exposed TechnoTypeClass->IsNominal```

Determines whether this object uses its true name. Overrides the name behaviour from `IsCivilian`.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► IsTheater (boolean)</code></b></summary>

```Exposed TechnoTypeClass->IsTheater```

Determines if the artwork for this object is theater specific.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► HasTurret (boolean)</code></b></summary>
 
```Exposed TechnoTypeClass->IsTurretEquipped```

Determines if this object has a turret. For buildings, if set to true, the object will use 64 frames for each of its rotation stages, and another 64 frames for each of its damaged rotation stages. For units, if set to true, the object will use 32 frames for its turret rotation stages.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► Facings (values 8, 16, 32)</code></b></summary>

```Exposed TechnoTypeClass->Rotation```

Determines if the number of directions applicable for this object's rotation. Only certain values have an impact. Has no impact for buildings (fixed to 64) and infantry. For a unit, special logic may occur if set other than the default.

</details>

-------

### Firing Offsets

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► VerticalOffset (integer)</code></b></summary>

```Exposed TechnoTypeClass->VerticalOffset```

Determines the upward offset of the firing animation relative to the unit's center.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► PrimaryOffset (integer)</code></b></summary>

```Exposed TechnoTypeClass->PrimaryOffset```

Determines the forward offset of the firing animation relative to the unit's line of fire.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► PrimaryLateral (integer)</code></b></summary>

```Exposed TechnoTypeClass->PrimaryLateral```

Determines the offset of the firing animation perpendicular to the unit's line of fire. Units with `Burst=2` will shoot their second bullet at the opposite offset.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► SecondaryOffset (integer)</code></b></summary>

```Exposed TechnoTypeClass->SecondaryOffset```

Determines the forward offset of the firing animation relative to the unit's line of fire. This is used for the secondary weapon.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► SecondaryLateral (integer)</code></b></summary>

```Exposed TechnoTypeClass->SecondaryLateral```

Determines the offset of the firing animation perpendicular to the unit's line of fire. Units with `Burst=2` will shoot their second bullet at the opposite offset. This is used for the secondary weapon.

</details>

-------

### Death Weapons

<details>
  <summary><b><code>{Rules/Map} ► [&lt;TechnoType&gt;] ► DeathWeapon (string)</code></b></summary>

```New logic```

Determines the damage and warhead that is released on this technotype's death. Setting this entry overrides the original behavior of using the technotype's Primary weapon and the technotype's MaxStrength.

Note that the explosion type and spread of the damage is still determined by the damage value (the stellar examples being Mammoth Tank explosion and the Monster Tank explosion), though this is now tied to the weapon's damage.

</details>
