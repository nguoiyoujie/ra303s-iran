[Return to Features](./features.md)

## BuildingTypes

BuildingTypes represent static structures (there is a notable exception in C&C). There is no base, and no production, without them.

-------

 - [Feature Availability](#feature-availability)
 - [Modification References](#modification-references) 
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 
 - [Factory Production](#factory-production)
 - [War Factory Settings](#war-factory-settings)
 - [Building Foundations](#building-foundations)
 - [Building Animations](#building-animations) 
 - [Radar Buildings](#radar-buildings) 
 - [Jamming Buildings](#jamming-buildings) 
 - [Superweapons](#superweapons) 

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
  <summary><b><code>{Rules} ► [BuildingTypes]</code></b></summary>

```New logic```
  
This section carries a zero-based list of IDs to be recognized as new BuildingType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

**[BuildingTypes]**\
0=COMM\
1=EYE

</details>

<details>
  <summary><b><code>{Rules} ► [StringTableOffsets] ► Buildings (integer)</code></b></summary>

```New logic```
  
The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Buildings` is set to 400 and `[BuildingTypes] ► 2` is set to ATWR, then the string table entry for `[ATWR]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional building types will default their names to the 'Civilian Building' text entry.

</details>

-------

### TechnoTypes

TechnoType settings are also available to BuildingTypes. See [TechnoTypes](./technotypes.md) for more details.

-------

### General Settings

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► IsSimpleDamage (boolean)</code></b></summary>
  
```Exposed BuildingTypeClass->IsSimpleDamage```

In Tiberium Dawn, this was used for the oil pump to determine the damaged frames. This appears to be obsolete and unused by the game code, in favour for customizable anim frames.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► ConstantAnimation (boolean)</code></b></summary>

```Exposed BuildingTypeClass->IsRegulated```

Determines if the building plays its animation throughout its operation. The building will always play its animation for the Construction stage no matter the value of this setting.

</details>

<details>
  <summary>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► ExitCoordX (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► ExitCoordY (integer)</code></b>
  </summary>

```Exposed BuildingTypeClass->ExitCoordinate```

Determines the exit coordinates, in leptons, from the top-left corner of the building.

</details>

-------

### Factory Production

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► FactoryType (string: AircraftType, BuildingType, InfantryType, UnitType, VesselType)</code></b></summary>

```Exposed BuildingTypeClass->ToBuild```

Determines if the building is a factory for a certain techno class. If BuildingType is used, the building will also play its Active animation (if defined) when a building is constructed and this building is the primary building.

Note: *The Map Trigger Event [Destroyed, All Factories] as well as the AI Fire Sale check does not check for FactoryType. But checks for the PrerequisiteType= attribute. See [TechnoTypes ► Prerequisite System](./technotypes.md#prerequisite-system).*

</details>

-------

### War Factory Settings

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► ExitList (-1, 0, 1, 2) </code></b></summary>

```Exposed BuildingTypeClass->ExitList```

Determines the exit destinations of an object produced from this building. Units created will attempt to move to these locations. Infantry and vehicles will attempt to scatter from these locations to make way for newly built units. The following values are supported:

 > -1 = No exit list\
 > 0 = Units exit the factory like it is leaving a Barracks\
 > 1 = Units exit the factory like it is leaving a Naval Yard or Sub Pen\
 > 2 = Units exit the factory like it is leaving a War Factory\
 > 3 = Units exit the factory like it is leaving a C&C Hand of Nod\
 > 4 = Units exit the factory like it is leaving a C&C Weapons Factory\
 > 5 = Units exit the factory like it is leaving a C&C Nod Airstrip

</details>

<details>
  <summary>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► WarFactoryOverlayAnim (string: image name)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► WarFactoryOverlayFrames (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► WarFactoryOverlayRate (integer)</code></b>
  </summary>

```New Logic```

If defined on a building with `FactoryType = UnitType`, overrides the factory door overlay as well as its animation sequence. This sequence plays as the War Factory. This can be used to implement the opening doors of different war factories, as they are rendered abov the unit. Defaults to the default War Factory door animation parameters (WEAP2) for the War Factory and its fake counterpart, none (no animation) otherwise. If the animation does not exist, use default.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► WarFactoryExitFacing (byte) </code></b></summary>

```New Logic```

If defined on a building with `FactoryType = UnitType`, overrides the starting rotation of the unit being ejected from the factory. This can be used to emulate the slightly offset angle used by the C&C GDI Weapons Factory. Defaults to 128, which is facing directly south.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► WarFactoryExitTrack (byte: up to 67) </code></b></summary>

```New Logic```

If defined on a building with `FactoryType = UnitType`, overrides the initial fixed movement track of the unit being ejected from the factory. Generally, a unit on a track cannot be redirected until the movement is over. Defaults to 66, which is the default exit track for War Factory.

A new unit exit track (ID 67) has been created to emulate the exit track used by the C&C GDI Weapons Factory. The available tracks are:

 > 0-63: Unit locomotion and rotation along the 8 directions\
 > 64: C&C Harvester docking to Refinery track (unused in RA1)\
 > 65: C&C Harvester undocking from Refinery track (unused in RA1)\
 > 66: Default War Factory exit track\
 > 67: Emulated C&C GDI Weapons Factory exit track (new)

</details>

-------

### Building Foundations

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► BSize (byte) </code></b></summary>

```Exposed BuildingTypeClass->BSize```

Determines the size occupied by this building, not inclusive of the bib. This affects the placement of the image, but not the cells the building occupies. The following values are supported:

 > 0 = 1x1 (most base defenses)\
 > 1 = 2x1 (SAM Site)\
 > 2 = 1x2 (Tesla Coil, Gap Generator)\
 > 3 = 2x2 (Power Plant, Chronosphere)\
 > 4 = 2x3 (C&C Hand of Nod)\
 > 5 = 3x2 (War Factory, Airfield)\
 > 6 = 3x3 (Adv. Power Plant, Refinery)\
 > 7 = 4x2 (C&C Airfield)\
 > 8 = 5x5 

</details>

<details>
  <summary>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► OccupyList (byte)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► OverlapList (byte)</code></b>
  </summary>

```Exposed BuildingTypeClass->OccupyList```\
```Exposed BuildingTypeClass->OverlapList```

Determines the combinations of cells occupied by this building. The `OccupyList` determines cells that are not passable to ground units and is combined with the bib to determine the building outline for placement.

The `OverlapList` determines cells that are passable to ground units, and is used for proper image rendering.

The following values for both entries are supported. *Note that this syntax is experimental and is subject to change*:

 > Syntax: [S(row above the image)][first row][second row][third row]...\
 >\
 > The first row is aligned to the top of the image\
 > X denotes occupied, - denotes clear\
 > Example: A 2x3 grid is [XXX][XXX]\
 > Example: A 2x2 grid occupying one row above the image and the first row of the image is [SXX][XX]\
 >\
 > -1 = []\
 > 0 = [X]\
 > 1 = [-][X]\
 > 2 = [X][X]\
 > 3 = [-X]\
 > 4 = [XX]\
 > 5 = [XXX]\
 > 6 = [--][XX]\
 > 7 = [-X][-X]\
 > 8 = [-X][XX]\
 > 9 = [X-][XX] (occupy list for the C&C Power Plant)\
 > 10 = [XX][-X]\
 > 11 = [XX][XX]\
 > 12 = [XXX][XXX]\
 > 13 = [XXXX][XXXX]\
 > 14 = [---][XXX][XXX] (occupy list for the Advanced Power Plant)\
 > 15 = [-X-][XXX][X--] (occupy list for the Refinery)\
 > 16 = [-X-][XXX][--X] (occupy list for C&C Refinery)\
 > 17 = [X-X][---][-XX] (overlap list for the Refinery)\
 > 18 = [X-X][---][XX-] (overlap list for C&C Refinery)\
 > 19 = [-X-][XXX][-X-] (occupy list for the Service Depot)\
 > 20 = [X-X][---][X-X] (overlap list for the Service Depot)\
 > 21 = [XXX][XXX][XXX]\
 > 22 = [SXX] (overlap list used for sam sites, to prevent graphical issues with the firing animation)\
 > 23 = [SXXX]\
 > 24 = [SXX][--][--][XX]\
 > 25 = [SXXX][---][---][XXX]\
 > 26 = [---][XXX][-XX]\
 > 27 = [XXX][---][X--]\
 > 28 = [--][XX][-X] (occupy list for the C&C Hand of Nod)

</details>

-------

### Building Animations

<details>
  <summary>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Construct_Start (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Construct_Count (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Construct_Rate (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Idle_Start (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Idle_Count (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Idle_Rate (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Active_Start (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Active_Count (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Active_Rate (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Full_Start (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Full_Count (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Full_Rate (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Aux1_Start (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Aux1_Count (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Aux1_Rate (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Aux2_Start (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Aux2_Count (integer)</code></b><br>
    <b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► Anim_Aux2_Rate (integer)</code></b>
  </summary>

```Exposed BuildingTypeClass->Anims[BSTATE_COUNT]```

Determines the animation settings for each stage of the building. The three options for each stage are as follows:

 - **Start** : The frame index within the shp file to use as the first frame of this stage

 - **Count** : The number of frames used in this stage, some stages may loop back to Start after the last frame is reached.

 - **Rate** : The number of in-game frames to pass before rendering the next animation frame.

The stages are as follows:

 - **Construct**: The build-up animation. The deconstruction animation is the reverse of this animation.

 - **Idle**: The idle animation. Use with `ConstantAnimation` to allow idle animation, such as the rotating radar dish for C&C-style communication centers.

 - **Active**: The active animation. Used by various buildings, such as Chronosphere discharging, Construction Yard handling materials, and the Service Depot repair animation.

 - **Full**: Used only by the C&C Refinery when docked with a Harvester. Has no use in Red Alert.

 - **Aux1, Aux2**: Alternative sequences, used only by the Missile Silo. The Missile Silo uses **Active** for its door opening animation, **Aux1** for the launch, and **Aux2** for the closing of the door.

</details>

-------

### Radar Buildings

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► IsRadar (boolean)</code></b></summary>

```New Logic```

Allows a building to provide Radar capabilities to the player, given sufficient power. If combined with `IsJammable=true`, will also generate the static jam effect when a jammer unit is close to it.

</details>

-------

### Jamming Buildings

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► IsJammable (boolean)</code></b></summary>

```New Logic```

If set to true, has the following effects:
 - If the building provides radar, and the player as no other active/unjammed radar, wipes the radar screen with static
 - If the building has a weapon, it will be unable to fire.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [General] ► RemapJammedBuildings (boolean)</code></b></summary>

```New Logic```

Remaps jammed buildings using the Shade remap.

</details>

-------

### Superweapons

<details>
  <summary><b><code>{Rules/Map} ► [&lt;BuildingType&gt;] ► SpecialWeapons (comma-delimited list of strings)</code></b></summary>

```New Logic```

Determines the Special Weapons that may be fired by this building. Note that some buildings require some animations to be enabled for the special weapon to work properly. Global overrides, such the Nuke being a fluke below TechLevel=10, still apply.

For a building with existing special weapons, they can be overriden (not appended) if SpecialWeapons is defined in ini.

The list of supported SpecialWeapons are:

> SONARPULSE, the sonar pulse. SpecialWeapons= has no affect due to the special spy requirements.\
> NUCLEARBOMB, the nuke. Requires the building to have the animations ACTIVE, AUX1 and AUX2 to create the actual Nuke.\
> CHRONOSPHERE, the chrono warp.\
> PARABOMB, the parabomb.\
> PARAINFANTRY, the paradrop.\
> SPYPLANE, the spy plane.\
> IRONCURTAIN, the iron curtain effect.\
> GPS, the satellite launch. Creates a GPS satellite animation at launch, which may look weird depending on the building you hook into

For example, `SpecialWeapons=GPS,SPYPLANE` grants both spy plane and GPS special powers while the building remains standing.

</details>

