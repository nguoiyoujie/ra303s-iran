### Rules.ini Features

-------

*The list of features added by Iran's work is not yet added here. This will be done in the future*

-------

##### Feature Availability

Most extended features can applied by setting the value on the Rules ini or the map specific ini (e.g. SCG01EA.ini). Reloading the map refreshes such values. These features are indicated with `{Rules/Map}`.

However, some features are only effective on game engine initialization, and can only be used on rules.ini. For example, some settings modify the memory heap size allocated by the game to store certain elements, which cannot be resized without resetting the game. These features are indicated with `{Rules}`.

`{Rules}` include both rules.ini and aftrmath.ini. `{Rules/Map}` includes any multiplayer spawn.ini that may be used by your choice of multiplayer client.

-------

##### General Rules

**`{Rules/Map} ► [General] ► AtomRange (integer)`**

The range of nuclear warheards in the scenario. Effectively the blast covers a square area of  `AtomRange * 2 + 1`. The nuke decreases in strength closer to the center; the lack of smudges will become apparent above range 40.

-------

##### New Type Extensions

**`{Rules} ► [AircraftTypes]`**

This section carries a zero-based list of IDs to be recognized as new AircraftTypes.

Example as follows:

**[AircraftTypes]**\
0=ORCA\
1=A10

**`{Rules} ► [BuildingTypes]`**

This section carries a zero-based list of IDs to be recognized as new InfantryTypes.

Example as follows:

**[BuildingTypes]**\
0=COMM\
1=EYE

**`{Rules} ► [InfantryTypes]`**

This section carries a zero-based list of IDs to be recognized as new InfantryTypes.

Example as follows:

**[InfantryTypes]**\
0=RMBO\
1=DOCTOR

**`{Rules} ► [UnitTypes]`**

This section carries a zero-based list of IDs to be recognized as new UnitTypes.

Example as follows:

**[UnitTypes]**\
0=GTNK\
1=SAPC

**`{Rules} ► [VesselTypes]`**

This section carries a zero-based list of IDs to be recognized as new UnitTypes.

Example as follows:

**[VesselTypes]**\
0=BSHIP\
1=SSCARR

**`{Rules} ► [AnimTypes]`**

This section carries a zero-based list of IDs to be recognized as new animations. These animations can then be used with Image=

Example as follows:

**[AnimTypes]**\
0=BLUEFLAME

**`{Rules} ► [DirectionalAnimTypes]`**

This section carries a zero-based list of IDs to be recognized as new directional animations. These animations can then be used with Image=

For the moment the image is split into 8 directions in order N,NW,W,SW,S,SE,E,NE, each with 18 frames, the same way SAMFIRE is handled. *Note that this is not the same as MINIGUN which uses 6 frames per direction*

Example as follows:

**[DirectionalAnimTypes]**\
0=CHEMSPRAY

**`{Rules} ► [BulletTypes]`**

This section carries a zero-based list of IDs to be recognized as new BulletTypes.

Example as follows:

**[BulletTypes]**\
0=HeatSeekerAA

**`{Rules} ► [Warheads]`**

This section carries a zero-based list of IDs to be recognized as new Warheads.

Example as follows:

**[Warheads]**\
0=SA_BIG_SPREAD\
1=HE_BIG_SPREAD

**`{Rules} ► [SoundEffects]`**

This section carries a zero-based list of IDs to be recognized as new Sound Effects.

Example as follows:

**[SoundEffects]**\
0=BAZOOK1\
1=GUN13

**`{Rules} ► [StringTableOffsets] ► Infantry (integer)`**\
**`{Rules} ► [StringTableOffsets] ► Units (integer)`**\
**`{Rules} ► [StringTableOffsets] ► Aircrafts (integer)`**\
**`{Rules} ► [StringTableOffsets] ► Vessels (integer)`**\
**`{Rules} ► [StringTableOffsets] ► Buildings (integer)`**

The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Units` is set to 400 and `[UnitTypes] ► 2` is set to FTRK, then the string table entry for `[FTRK]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead.

-------

##### TechnoTypes

TechnoType settings are also available to AircraftTypes, BuildingTypes, InfantryTypes, UnitTypes and VesselTypes

**New Armor-types**

**`{Rules/Map} ► [<TechnoType>] ► Armor (string)`**

The number of supported types have been increased to 9, matching the first nine armortypes used in Red Alert 2. For compatibility, the original armor types are not changed.

You are expected to modify the existing Warhead entries to make use of them

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

**New Prerequisite-types**\
*This constitutes a breaking change, therefore this system may be subject to change in the future in case of work to make it compatible with unmodified RA.*

*As far as possible, the list of broken compatibility will be listed at the end of the section.*

The prerequisite system has been extended to aid with the overall softcoding of the interconnected web of building behaviors and checks. The center of this change lies in the implementation of Prerequisite Types.

This is analogus to the Prerequisite Groups system implemented in Tiberian Sun and beyond. Unlike Tiberian Sun, a building does not (yet) belong to more than one Type.

**`{Rules/Map} ► [<TechnoType>] ► PrerequisiteType (comma-delimited list of strings)`**

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

*Compatibility Notices:*

 - **Broken Compatibility:** *Original RA allowed the Advanced Power Plant to count as a Power Plant. This behavior has been removed. To allow this behavior to be restored, ensure both [POWR] and [APWR] have PrerequisiteType=POWER (set by default), and replace the appropriate pre-requisites with the Prerequisite type name (required addition).*

 - **Broken Compatibility:** *Similarly, in singleplayer, original RA allowed the Allied Tech Center and Soviet Tech Center to count as each other. This behavior has been removed. To allow this behavior to be restored, set both [ATEK] and [STEK] with PrerequisiteType=TECH (set by default), and replace the appropriate pre-requisites with the Prerequisite type name (required addition).*

 - **Compatibility Notice:** *All refinery checks (harvesting, docking targets, AI build queue) have been de-hardcoded, and check for PrerequisiteType=REFINERY instead. This does mean that Harvesters **stop working** if PrerequisiteType=REFINERY is overrriden for the [PROC] building.*

 - **Compatibility Notice:** *All advanced defense checks (AI build queue) have been de-hardcoded, and check for PrerequisiteType=ADV.DEFENSE and PrerequisiteType=AA.DEFENSE instead.*

 - **Compatibility Notice:** *The Map Trigger Event [Destroyed, All Fakes] will now count all buildings with the PrerequisiteType=FAKES attribute. Fake Structures will need to be set with PrerequisiteType=FAKES to enable this function. (Technically this is not broken behavior because the event didn't even work in the original RA)*

 - **Compatibility Notice:** *The Map Trigger Event [Destroyed, All Factories] as well as the AI Fire Sale will now count all buildings with the PrerequisiteType= attribute being one of the following: CONYARD, BARRACKS, WARFACTORY, AIRSTRIP, HELIPAD or SHIPYARD. Structures will need to be set with appropriate PrerequisiteType= to be included this function.*

**`{Rules/Map} ► [<TechnoType>] ► Prerequisite (comma-delimited list of strings)`**

Extended behavior: The list of valid prerequisite strings now include any of the PrerequisiteTypes. This inclusion works like prerequisite groups in Tiberian Sun onwards; any building type with the appropriate PrerequisiteType may fulfill the prerequisite.

Like the original, the game checks for at least one item fulfilling each of the listed prerequisites. 

Example: If a unit has Prerequisite=POWER,BARRACKS,FIX,STEK. The prerequisite requirements are:
 - At least one building with PrerequisiteType=POWER (by default this is POWR or APWR)\
 - At least one building with PrerequisiteType=BARRACKS (by default this is BARR or TENT)\
 - At least one [FIX] (Service Depot)\
 - At least one [STEK] (Soviet Tech Center)


**`{Rules/Map} ► [<TechnoType>] ► IsNominal (boolean)`**

Determines whether this object uses its true name. Overrides the name behaviour from `IsCivilian`.

**`{Rules/Map} ► [<TechnoType>] ► IsTheater (boolean)`**

Determines if the artwork for this object is theater specific.

**`{Rules/Map} ► [<TechnoType>] ► HasTurret (boolean)`**

Determines if this object has a turret. For buildings, if set to true, the object will use 64 frames for each of its rotation stages, and another 64 frames for each of its damaged rotation stages. For units, if set to true, the object will use 32 frames for its turret rotation stages.

**`{Rules/Map} ► [<TechnoType>] ► Facings (values 8, 16, 32)`**

Determines if the number of directions applicable for this object has a turret. Only certain values have an impact. Has no impact for buildings (fixed to 64) and infantry. For a unit, special logic may occur if set other than the default.

**`{Rules/Map} ► [<TechnoType>] ► VerticalOffset (integer)`**

Determines the upward offset of the firing animation relative to the unit's center.

**`{Rules/Map} ► [<TechnoType>] ► PrimaryOffset (integer)`**

Determines the forward offset of the firing animation relative to the unit's line of fire.

**`{Rules/Map} ► [<TechnoType>] ► PrimaryLateral (integer)`**

Determines the offset of the firing animation perpendicular to the unit's line of fire. Units with `Burst=2` will shoot their second bullet at the opposite offset.

**`{Rules/Map} ► [<TechnoType>] ► SecondaryOffset (integer)`**

Determines the forward offset of the firing animation relative to the unit's line of fire. This is used for the secondary weapon.

**`{Rules/Map} ► [<TechnoType>] ► SecondaryLateral (integer)`**

Determines the offset of the firing animation perpendicular to the unit's line of fire. Units with `Burst=2` will shoot their second bullet at the opposite offset. This is used for the secondary weapon.

**`{Rules/Map} ► [<TechnoType>] ► DeathWeapon (string)`**

Determines the damage and warhead that is released on this technotype's death. Setting this entry overrides the original behavior of using the technotype's Primary weapon and the technotype's MaxStrength.

Note that the explosion type and spread of the damage is still determined by the damage value (the stellar examples being Mammoth Tank explosion and the Monster Tank explosion), though this is now tied to the weapon's damage.

-------

##### AircraftTypes

**`{Rules/Map} ► [<AircraftType>] ► IsFixedWing (boolean)`**

Determines if this aircraft type behaves like a fixed wing aircraft (such as the Mig or the Yak), or a gunship (such as the Longbow). Setting yes also sets the preferred docking building as an Airfield, while setting no sets the preferred docking building to the Helipad.

**`{Rules/Map} ► [<AircraftType>] ► IsLandable (boolean)`**

Has no impact on the unit or the game. Supposedly this determines whether this aircraft type can land on terrain, but this appears to be overriden by IsFixedWing, and the source code from Remastered does not appear to use it.

**`{Rules/Map} ► [<AircraftType>] ► IsRotorEquipped (boolean)`**

Determines if additional aircraft rotor should be drawn on top of the aircraft. The game is presently hardcoded to draw two rotors for the transport heli `TRAN`.

**`{Rules/Map} ► [<AircraftType>] ► IsRotorCustom (boolean)`**

Has no impact on the unit or the game. The transport heli is presently hardcoded to draw two rotors after checking for `IsRotorEquipped`, and `IsRotorCustom` does not appear to be used.

**`{Rules/Map} ► [<AircraftType>] ► LandingSpeed (integer)`**

Determines the landing speed of the aircraft. For fixed wing aircraft, the landing speed should be adjusted with `Speed` so that the aircraft lands correctly on the airfield.

-------

##### InfantryTypes

**`{Rules/Map} ► [<InfantryType>] ► IsFemale (boolean)`**

Determines if this civilian infantry should use the female civilian voice.

**`{Rules/Map} ► [<InfantryType>] ► IsCrawling (boolean)`**

Acts as override switch to `IsFraidyCat`. An infantry that has `IsFraidyCat` set to true and `IsCrawling` set to false will have their speed multiplied by 2 when prone (to emulate the civilian panic sprint). Any other combination will result in the typical reduction of speed by half when prone.

**`{Rules/Map} ► [<InfantryType>] ► IsCivilian (boolean)`**

Determines if this infantry is a civilian, applying the following changes:

 - Civilian voices (combine with `IsFemale` for a second set of voices)\
 - Name description is changed to `Civilian`, unless overriden by the rules / map.\
 - Score counting\
 - If combined with `Cloakable`, does not uncloak to fire.

**`{Rules/Map} ► [<InfantryType>] ► Pip (byte)`**

Sets the pip of the transport when carrying this infantry type. This refers to the indexed entry in pips.shp. An unmodified pips.shp can work with the following values:

> 0 = Empty pip\
> 1 = Green pip\
> 5 = Yellow pip (engineer)\
> 6 = Grey pip (civilian)\
> 7 = Red pip (commando)

**`{Rules/Map} ► [<InfantryType>] ► FireFrame (byte)`**\
**`{Rules/Map} ► [<InfantryType>] ► ProneFireFrame (byte)`**

Determines the frame offset from the begining of the firing sequence when the weapon actually fires. This allows for certain frames of animations to pass before the actual weapon is fired. Examples of infantry with this feature is, the Grenadier, the Medic and the Mechanic.

-------

##### UnitTypes

**`{Rules/Map} ► [<UnitType>] ► IsCrateGoodie (boolean)`**

Determines if this unit can be spawned from a goodie crate.

**`{Rules/Map} ► [<UnitType>] ► Crusher (boolean)`**

Determines if this unit can crush infantry that does not have `Crushable` set. By default, wheeled units (such as the Ranger) do not crush infantry, while tracked units (such as the tanks) do.

**`{Rules/Map} ► [<UnitType>] ► IsToHarvest (boolean)`**

Determines if this unit performs harvesting operations when over an ore patch. *The harvester behavior overrides have not yet been fully dehardcoded, so this switch does not have much use.*

**`{Rules/Map} ► [<UnitType>] ► IsRotatingTurret (boolean)`**

Determines if this unit renders a rotating radar dish above its sprite. If set to true, the unit uses its turret frames for its radar dish.

**`{Rules/Map} ► [<UnitType>] ► IsFireAnim (boolean)`**

Determines if this unit renders a firing animation when firing.

**`{Rules/Map} ► [<UnitType>] ► IsLockTurret (boolean)`**

*Functionality to be determined*

**`{Rules/Map} ► [<UnitType>] ► Large (boolean)`**

Determines if the image of this unit is larger than the cell size of 24x24 pixels.  This allows the adjecent cells to be re-rendered and prevent clipping and other graphical distortions. Note that this is supported for images up to 96x96 pixels, due to the new refresh window of 3x3 cells.

Note that this does not determine the size of the unit select box. This is determined solely by the size of the unit's image.

**`{Rules/Map} ► [<UnitType>] ► IsAnimating (boolean)`**

Determines if this unit constantly animates, like a Visceroid. *Does not work as expected, consider using IsRotatingTurret with customized turret settings instead.*

**`{Rules/Map} ► [<UnitType>] ► IsJammer (boolean)`**

Determines if this unit acts like the Radar Jammer and can jam nearby radar domes.

**`{Rules/Map} ► [<UnitType>] ► IsGapper (boolean)`**

Determines if this unit acts like the Mobile Gap Generator and produces shroud around its vicinity.

**`{Rules/Map} ► [<UnitType>] ► TurretAdjustX (integer)`**

Determines the horizontal turret offset

**`{Rules/Map} ► [<UnitType>] ► TurretAdjustY (integer)`**

Determines the vertical turret offset

**`{Rules/Map} ► [<UnitType>] ► TurretFrameStart (short)`**

Determines the frame of the image used for the start of the turret animation. Useful in conjunction with IsRotatingTurret for objects that sport a custom turret.

**`{Rules/Map} ► [<UnitType>] ► TurretFrameCount (short)`**

Determines the number of frames used for the turret animation. Useful in conjunction with IsRotatingTurret for objects that sport a custom turret.

-------

##### VesselTypes

**`{Rules/Map} ► [<VesselType>] ► IsPieceOfEight (boolean)`**

*Functionality to be determined*

**`{Rules/Map} ► [<VesselType>] ► TurretOffset (byte)`**

*Functionality to be determined*

-------

##### BuildingTypes

**`{Rules/Map} ► [<BuildingType>] ► IsSimpleDamage (boolean)`**

In Tiberium Dawn, this was used for the oil pump to determine the damaged frames. This appears to be obsolete and unused by the game code, in favour for customizable anim frames.

**`{Rules/Map} ► [<BuildingType>] ► ConstantAnimation (boolean)`**

Determines if the building plays its animation throughout its operation. The building will always play its animation for the Construction stage no matter the value of this setting.

**`{Rules/Map} ► [<BuildingType>] ► FactoryType (string: AircraftType, BuildingType, InfantryType, UnitType, VesselType)`**

Determines if the building is a factory for a certain techno class. If BuildingType is used, the building will also play its Active animation (if defined) when a building is constructed and this building is the primary building.

**`{Rules/Map} ► [<BuildingType>] ► ExitCoordX (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► ExitCoordY (integer)`**

Determines the exit coordinates, in leptons, from the top-left corner of the building.

**`{Rules/Map} ► [<BuildingType>] ► ExitList (-1, 0, 1, 2)`**

Determines the exit destinations of an object produced from this building. Units created will attempt to move to these locations. Infantry and vehicles will attempt to scatter from these locations to make way for newly built units. The following values are supported:

> -1 = No exit list\
> 0 = Units exit the factory like it is leaving a Barracks\
> 1 = Units exit the factory like it is leaving a Naval Yard or Sub Pen\
> 2 = Units exit the factory like it is leaving a War Factory\
> 3 = Units exit the factory like it is leaving a C&C Hand of Nod\
> 4 = Units exit the factory like it is leaving a C&C Weapons Factory\
> 5 = Units exit the factory like it is leaving a C&C Nod Airstrip

**`{Rules/Map} ► [<BuildingType>] ► WarFactoryOverlayAnim (string: image name)`**\
**`{Rules/Map} ► [<BuildingType>] ► WarFactoryOverlayFrames (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► WarFactoryOverlayRate (integer)`**

If defined on a building with `FactoryType = UnitType`, overrides the factory door overlay as well as its animation sequence. This sequence plays as the War Factory. This can be used to implement the opening doors of different war factories, as they are rendered above the unit. Defaults to the default War Factory door animation parameters (WEAP2).

**`{Rules/Map} ► [<BuildingType>] ► WarFactoryExitFacing (byte)`**
If defined on a building with `FactoryType = UnitType`, overrides the starting rotation of the unit being ejected from the factory. This can be used to emulate the slightly offset angle used by the C&C GDI Weapons Factory. Defaults to 128, which is facing directly south.

**`{Rules/Map} ► [<BuildingType>] ► WarFactoryExitTrack (byte: up to 67)`**
If defined on a building with `FactoryType = UnitType`, overrides the initial fixed movement track of the unit being ejected from the factory. Generally, a unit on a track cannot be redirected until the movement is over. Defaults to 66, which is the default exit track for War Factory.

A new unit exit track (ID 67) has been created to emulate the exit track used by the C&C GDI Weapons Factory. The available tracks are:

> 0-63: Unit locomotion and rotation along the 8 directions\
> 64: C&C Harvester docking to Refinery track (unused in RA1)\
> 65: C&C Harvester undocking from Refinery track (unused in RA1)\
> 66: Default War Factory exit track\
> 67: Emulated C&C GDI Weapons Factory exit track (new)

**`{Rules/Map} ► [<BuildingType>] ► BSize (byte)`**

Determines the size occupied by this building, not inclusive of the bib. This affects the placement of the image. The following values are supported:

> 0 = 1x1 (most base defenses)\
> 1 = 2x1 (Tesla Coil, Gap Generator)\
> 2 = 1x2 (SAM Site)\
> 3 = 2x2 (Power Plant, Chronosphere)\
> 4 = 2x3 (War Factory, Airfield)\
> 5 = 3x2 \
> 6 = 3x3 (Adv. Power Plant, Refinery)\
> 7 = 4x2 (C&C Airfield)\
> 8 = 5x5 

**`{Rules/Map} ► [<BuildingType>] ► OccupyList (byte)`**\
**`{Rules/Map} ► [<BuildingType>] ► OverlapList (byte)`**

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

**`{Rules/Map} ► [<BuildingType>] ► Anim_Construct_Start (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Construct_Count (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Construct_Rate (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Idle_Start (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Idle_Count (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Idle_Rate (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Active_Start (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Active_Count (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Active_Rate (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Full_Start (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Full_Count (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Full_Rate (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux1_Start (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux1_Count (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux1_Rate (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux2_Start (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux2_Count (integer)`**\
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux2_Rate (integer)`**

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

**`{Rules/Map} ► [<BuildingType>] ► IsRadar (boolean)`**

Allows a building to provide Radar capabilities to the player, given sufficient power. If combined with `IsJammable=true`, will also generate the static jam effect when a jammer unit is close to it.

**`{Rules/Map} ► [<BuildingType>] ► IsJammable (boolean)`**

If set to true, has the following effects:\
 - If the building provides radar, and the player as no other active/unjammed radar, wipes the radar screen with a stati\
 - If the building has a weapon, it will be unable to fire.
 
At the moment there is no visual indicator to show that a building is jammed.

**`{Rules/Map} ► [<BuildingType>] ► SpecialWeapons (comma-delimited list of strings)`**

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


-------

##### WeaponTypes

**`{Rules/Map} ► [<WeaponType>] ► ChargeSound (string)`**

If used on a weapon with Charges=true, overrides the charging sound. This string must be already defined in `[SoundEffects]`. This can be used to emulate the C&C Nod Obelisk. Defaults to the charging sound of the Tesla Coil.


-------

##### Combat Changes

**Explosion no Animination Crash Fix**

In the original game, if a unit using a `Primary` weapon with a warhead with `Anim=NONE` is set to `Explodes=true`, the game will try to animate the null animation ANIM_NONE, which crashes the game.

Now this defaults to ANIM_NAPALM2 (the flame animation). A modder may use a unit's `DeathWeapon` to customize a unit's explosion behavior.

**Negative Damage Weapons**

In the original game, there are checks to restrict the use of negative damage to the Medic and the Mechanic. Moreover, the game restricts the area of effect of such weapons to 8 leptons. of Now all weapons can deal negative damage, and the area of effect of the weapon follows the warhead spread factor.

The mechanics of healing is not yet fully unraveled, so negative weapons may not mix nicely with combat weapons.

**Bullet - BallisticScatter, HomingScatter**\
*This experimental change has been reverted for the moment. Expect finer controls in the future.*

Scattering behaviour had changed, which may mean a greater spread of bullets for units with `Inaccurate` set to true, as well as situations that the game applies inaccuracy to. This may change in the future.

-------

##### Fixes

**Overriding Building Power Supply/Drain**

Originally, if the power of the original building was negative (drains power), modifications by ini with a positive number will still perform the drain.

The drain amount is now reset when a positive power supply is defined for a building.


