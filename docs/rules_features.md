### Rules.ini Features ###
-------
*The list of features added by Iran's work is not yet added here. This will be done in the future*

-------
##### Feature Availability #####
Most extended features can applied by setting the value on the Rules ini or the map specific ini (e.g. SCG01EA.ini). Reloading the map refreshes such values. These features are indicated with `{Rules/Map}`.

However, some features are only effective on game engine initialization, and can only be used on rules.ini. For example, some settings modify the memory heap size allocated by the game to store certain elements, which cannot be resized without resetting the game. These features are indicated with `{Rules}`.

-------
##### General Rules #####

**`{Rules/Map} ► [General] ► AtomRange (integer)`**
The range of nuclear warheards in the scenario. Effectively the blast covers a square area of  `AtomRange * 2 + 1`. The nuke decreases in strength closer to the center; the lack of smudges will become apparent above range 40.

-------
##### New Type Extensions #####

**`{Rules} ► [AircraftTypes]`**
This section carries a zero-based list of IDs to be recognized as new AircraftTypes.
Example as follows:
**[AircraftTypes]**
0=ORCA
1=A10

**`{Rules} ► [BuildingTypes]`**
This section carries a zero-based list of IDs to be recognized as new InfantryTypes.
Example as follows:
**[InfantryTypes]**
0=COMM
1=EYE

**`{Rules} ► [InfantryTypes]`**
This section carries a zero-based list of IDs to be recognized as new InfantryTypes.
Example as follows:
**[InfantryTypes]**
0=RMBO
1=DOCTOR

**`{Rules} ► [UnitTypes]`**
This section carries a zero-based list of IDs to be recognized as new UnitTypes.
Example as follows:
**[UnitTypes]**
0=GTNK
1=SAPC

**`{Rules} ► [AnimTypes]`**
This section carries a zero-based list of IDs to be recognized as new animations. These animations can then be used with Image=
Example as follows:
**[AnimTypes]**
0=BLUEFLAME

**`{Rules} ► [BulletTypes]`**
This section carries a zero-based list of IDs to be recognized as new BulletTypes.
Example as follows:
**[BulletTypes]**
0=HeatSeekerAA

**`{Rules} ► [VesselTypes]`**
This section carries a zero-based list of IDs to be recognized as new UnitTypes.
Example as follows:
**[VesselTypes]**
0=BSHIP
1=SSCARR

**`{Rules} ► [Warheads]`**
This section carries a zero-based list of IDs to be recognized as new Warheads.
Example as follows:
**[Warheads]**
0=SA_BIG_SPREAD
1=HE_BIG_SPREAD

**`{Rules} ► [StringTableOffsets] ► Infantry (integer)`**
**`{Rules} ► [StringTableOffsets] ► Units (integer)`**
**`{Rules} ► [StringTableOffsets] ► Aircrafts (integer)`**
**`{Rules} ► [StringTableOffsets] ► Vessels (integer)`**
**`{Rules} ► [StringTableOffsets] ► Buildings (integer)`**
The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Units` is set to 400 and `[UnitTypes] ► 2` is set to FTRK, then the string table entry for `[FTRK]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead.

-------
##### TechnoTypes #####
TechnoType settings are also available to AircraftTypes, BuildingTypes, InfantryTypes, UnitTypes and VesselTypes

**New Armor-types**
**`{Rules/Map} ► [<TechnoType>] ► Armor (string)`**
The number of supported types have been increased to 11, matching the armortypes used in Red Alert 2.

You are expected to modify the existing Warhead entries to make use of them
 > 0 = None
 > 1 = Wood
 > 2 = Light
 > 3 = Heavy
 > 4 = Concrete
 > 5 = Flak
 > 6 = Plate
 > 7 = Medium
 > 8 = Steel
 > 9 = Special_1
 > 10 = Special_2

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

-------
##### AircraftTypes #####

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
##### InfantryTypes #####

**`{Rules/Map} ► [<InfantryType>] ► IsFemale (boolean)`**
Determines if this civilian infantry should use the female civilian voice.

**`{Rules/Map} ► [<InfantryType>] ► IsCrawling (boolean)`**
Acts as override switch to `IsFraidyCat`. An infantry that has `IsFraidyCat` set to true and `IsCrawling` set to false will have their speed multiplied by 2 when prone (to emulate the civilian panic sprint). Any other combination will result in the typical reduction of speed by half when prone.

**`{Rules/Map} ► [<InfantryType>] ► IsCivilian (boolean)`**
Determines if this infantry is a civilian, applying the following changes:
 - Civilian voices (combine with `IsFemale` for a second set of voices)
 - Name description is changed to `Civilian`, unless overriden by the rules / map. 
 - Score counting
 - If combined with `Cloakable`, does not uncloak to fire.

**`{Rules/Map} ► [<InfantryType>] ► Pip (byte)`**
Sets the pip of the transport when carrying this infantry type. This refers to the indexed entry in pips.shp. An unmodified pips.shp can work with the following values:
> 0 = Empty pip
> 1 = Green pip
> 5 = Yellow pip (engineer)
> 6 = Grey pip (civilian)
> 7 = Red pip (commando)

**`{Rules/Map} ► [<InfantryType>] ► FireFrame (byte)`**
**`{Rules/Map} ► [<InfantryType>] ► ProneFireFrame (byte)`**
Determines the frame offset from the begining of the firing sequence when the weapon actually fires. This allows for certain frames of animations to pass before the actual weapon is fired. Examples of infantry with this feature is, the Grenadier, the Medic and the Mechanic.

-------
##### UnitTypes #####

**`{Rules/Map} ► [<UnitType>] ► IsCrateGoodie (boolean)`**
Determines if this unit can be spawned from a goodie crate.

**`{Rules/Map} ► [<UnitType>] ► Crusher (boolean)`**
Determines if this unit can crush infantry that does not have `Crushable` set. By default, wheeled units (such as the Ranger) do not crush infantry, while tracked units (such as the tanks) do. 

**`{Rules/Map} ► [<UnitType>] ► IsToHarvest (boolean)`**
Determines if this unit performs harvesting operations when over an ore patch. The harvester behavior overrides have not yet been fully dehardcoded, so this switch does not have much use.

**`{Rules/Map} ► [<UnitType>] ► IsRotatingTurret (boolean)`**
Determines if this unit renders a rotating radar dish above its sprite. If set to true, the unit uses its turret frames for its radar dish. 

**`{Rules/Map} ► [<UnitType>] ► IsFireAnim (boolean)`**
Determines if this unit renders a firing animation when firing.

**`{Rules/Map} ► [<UnitType>] ► IsLockTurret (boolean)`**
*Functionality to be determined*

**`{Rules/Map} ► [<UnitType>] ► IsGigundo (boolean)`**
Determines if the image of this unit is larger than the cell size of 24x24 pixels.  This allows the adjecent cells to be re-rendered and prevent clipping and other graphical distortions.

**`{Rules/Map} ► [<UnitType>] ► IsAnimating (boolean)`**
Determines if this unit constantly animates, like a Visceroid.

**`{Rules/Map} ► [<UnitType>] ► IsJammer (boolean)`**
Determines if this unit acts like the Radar Jammer and can jam nearby radar domes.

**`{Rules/Map} ► [<UnitType>] ► IsGapper (boolean)`**
Determines if this unit acts like the Mobile Gap Generator and produces shroud around its vicinity.

-------
##### VesselTypes #####

**`{Rules/Map} ► [<VesselType>] ► IsPieceOfEight (boolean)`**
*Functionality to be determined*


**`{Rules/Map} ► [<VesselType>] ► TurretOffset (byte)`**
*Functionality to be determined*


-------
##### BuildingTypes #####

**`{Rules/Map} ► [<BuildingType>] ► IsSimpleDamage (boolean)`**
In Tiberium Dawn, this was used for the oil pump to determine the damaged frames. This appears to be obsolete and unused by the game code, in favour for customizable anim frames.

**`{Rules/Map} ► [<BuildingType>] ► ConstantAnimation (boolean)`**
Determines if the building plays its animation throughout its operation. The building will always play its animation for the Construction stage no matter the value of this setting.

**`{Rules/Map} ► [<BuildingType>] ► FactoryType (string: AircraftType, BuildingType, InfantryType, UnitType, VesselType)`**
Determines if the building is a factory for a certain techno class. If BuildingType is used, the building will also play its Active animation (if defined) when a building is constructed and this building is the primary building.

**`{Rules/Map} ► [<BuildingType>] ► ExitCoordX (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► ExitCoordY (integer)`**
Determines the exit coordinates, in leptons, from the top-left corner of the building.

**`{Rules/Map} ► [<BuildingType>] ► ExitList (-1, 0, 1, 2)`**
Determines the exit destinations of an object produced from this building. The following values are supported:
> -1 = No exit list
> 0 = Units exit the factory like it is leaving a Barracks
> 1 = Units exit the factory like it is leaving a Naval Yard or Sub Pen
> 2 = Units exit the factory like it is leaving a War Factory

**`{Rules/Map} ► [<BuildingType>] ► BSize (byte)`**
Determines the size occupied by this building, not inclusive of the bib. This affects the placement of the image. The following values are supported:
> 0 = 1x1 (most base defenses)
> 1 = 2x1 (Tesla Coil, Gap Generator)
> 2 = 1x2 (SAM Site)
> 3 = 2x2 (Power Plant, Chronosphere)
> 4 = 2x3 (War Factory, Airfield)
> 5 = 3x2
> 6 = 3x3 (Adv. Power Plant, Refinery)
> 7 = 4x2 (C&C Airfield)
> 8 = 5x5

**`{Rules/Map} ► [<BuildingType>] ► OccupyList (byte)`**
**`{Rules/Map} ► [<BuildingType>] ► OverlapList (byte)`**
Determines the combinations of cells occupied by this building. The `OccupyList` determines cells that are not passable to ground units and is combined with the bib to determine the building outline for placement.

The `OverlapList` determines cells that are passable to ground units, and is used for proper image rendering.

The following values for both entries are supported:
> Syntax: [S(row above the image)][first row][second row][third row]...
> The first row is aligned to the top of the image
> X denotes occupied, - denotes clear
> Example: A 2x3 grid is [XXX][XXX]
> Example: A 2x2 grid occupying one row above the image and the first row of the image is [SXX][XX]
> -1 = []
> 0 = [X]
> 1 = [-][X]
> 2 = [X][X]
> 3 = [-X]
> 4 = [XX]
> 5 = [XXX]
> 6 = [--][XX]
> 7 = [-X][-X]
> 8 = [-X][XX]
> 9 = [X-][XX] (occupy list for the C&C Power Plant)
> 10 = [XX][-X] (occupy list for the C&C Hand of Nod)
> 11 = [XX][XX]
> 12 = [XXX][XXX]
> 13 = [XXXX][XXXX]
> 14 = [---][XXX][XXX] (occupy list for the Advanced Power Plant)
> 15 = [-X-][XXX][X--] (occupy list for the Refinery)
> 16 = [-X-][XXX][--X] (occupy list for C&C Refinery)
> 17 = [X-X][---][-XX] (overlap list for the Refinery)
> 18 = [X-X][---][XX-] (overlap list for C&C Refinery)
> 19 = [-X-][XXX][-X-] (occupy list for the Service Depot)
> 20 = [X-X][---][X-X] (overlap list for the Service Depot)
> 21 = [XXX][XXX][XXX]
> 22 = [SXX] (overlap list used for sam sites, to prevent graphical issues with the firing animation)
> 23 = [SXXX]
> 24 = [SXX][--][--][XX] (overlap list used for the C&C Hand of Nod, to prevent graphical issues both on top and below the image)
> 25 = [SXXX][---][---][XXX]

**`{Rules/Map} ► [<BuildingType>] ► Anim_Construct_Start (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Construct_Count (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Construct_Rate (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Idle_Start (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Idle_Count (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Idle_Rate (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Active_Start (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Active_Count (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Active_Rate (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Full_Start (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Full_Count (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Full_Rate (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux1_Start (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux1_Count (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux1_Rate (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux2_Start (integer)`**
**`{Rules/Map} ► [<BuildingType>] ► Anim_Aux2_Count (integer)`**
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

-------
##### Combat Changes #####

**Negative Damage Weapons**
In the original game, there are checks to restrict the use of negative damage to the Medic and the Mechanic. Moreover, the game restricts the area of effect of such weapons to 8 leptons. of Now all weapons can deal negative damage, and the area of effect of the weapon follows the warhead spread factor.

The mechanics of healing is not yet fully unraveled, so negative weapons may not mix nicely with combat weapons.

**Bullet - BallisticScatter, HomingScatter**
Scattering behaviour had changed, which may mean a greater spread of bullets for units with `Inaccurate` set to true, as well as situations that the game applies inaccuracy to. This may change in the future.

-------

