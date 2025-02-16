<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>BuildingTypes</kbd></kbd><br>
<h2 align="center">BuildingTypes</h2>

BuildingTypes represent static structures (there is a notable exception in C&C). There is no base, and no production, without them.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 
 - [Special Buildings](#special-buildings) 
 - [Factory Production](#factory-production)
 - [War Factory Settings](#war-factory-settings)
 - [Building Foundations](#building-foundations)
 - [Building Animations](#building-animations) 
 - [Jamming Buildings](#jamming-buildings) 
 - [Superweapons](#superweapons) 
 - [Unpacking Buildings](#unpacking-buildings) 
 - [AI AutoBase Controls](#ai-autobase-controls) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### New Type Extensions
<br>

These settings enable you to define new types, expanding modding capabilities.

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [BuildingTypes]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new BuildingType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[BuildingTypes]
0=COMM
1=EYE
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [StringTableOffsets] ► Building
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Building` is set to 400 and `[BuildingTypes] ► 2` is set to ATWR, then the string table entry for `[ATWR]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional building types will default their names to the 'Civilian Building' text entry.
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### TechnoTypes
<br>

TechnoType settings are also available to BuildingTypes. See [TechnoTypes](./technotypes.md) for more details.


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### General Settings
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► IsSimpleDamage
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```Exposed BuildingTypeClass->IsSimpleDamage```

In Tiberium Dawn, this was used for the oil pump to determine the damaged frames. This appears to be obsolete and unused by the game code, in favour for customizable anim frames.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► ConstantAnimation
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed BuildingTypeClass->IsRegulated```

Determines if the building plays its animation throughout its operation. The building will always play its animation for the Construction stage no matter the value of this setting.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► ExitCoordX<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► ExitCoordY
</samp></td><td width="120"><samp>Integer<br>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed BuildingTypeClass->ExitCoordinate```

Determines the exit coordinates, in leptons, from the top-left corner of the building.
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### Special Buildings
<br>

Some buildings are hardcoded to provide special logic. Some of them are unlocked here

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► IsRefinery
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Indicates that this building is a refinery and can be docked by Harvesters. The docking position is strictly the center cell of the building, with non-integer cell values rounded down, dictated by the `BSize` value. For example, the ore refinery center is the 2nd column, 2nd row of the building. Ensure the Harvester can reach this cell, otherwise the docking does not work.

Pips will also be drawn for player-owned, allied, or spied buildings to indicate the overall ore level relative to capacity.

Defaults to true for the Ore Refinery, false for all other buildings.  

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► IsSilo
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Indicates that this building is a silo. It will use 5 frames per building state (Normal, Damaged) to indicate its richness in ore visually. Because this has specific usage of frames, combining this with building animations is not supported. 

Pips will also be drawn for player-owned, allied, or spied buildings to indicate the overall ore level relative to capacity.

Defaults to true for the Ore Silo, false for all other buildings.  

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► IsHelipad
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Indicates that this building is a helipad and can be docked by non-fixed wing aircrafts. The docking position is strictly the center of the building, dictated by the `BSize` value. For example, the ore refinery center is the 2nd column, 2nd row of the building.

The helipad will use the Active state to animate its loading and unloading of aircraft. See this <a href="#building-animations">section</a><br> for animation controls.

Defaults to true for the Helipad, false for all other buildings.  

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► IsAirfield
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Indicates that this building is an airfield and can be docked by fixed wing aircrafts. The docking position is strictly the center of the building, dictated by the `BSize` value. For example, the ore refinery center is the 2nd column, 2nd row of the building.

Defaults to true for the Airfield, false for all other buildings.  

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► IsRepairPad
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Indicates that this building is a repair pad and can be docked by vehicles and aircraft. The docking position is strictly the center of the building, dictated by the `BSize` value. For example, the ore refinery center is the 2nd column, 2nd row of the building.

The repair pad will use the Active state to animate its loading and unloading of aircraft. See this <a href="#building-animations">section</a><br> for animation controls.

Defaults to true for the Service Depot, false for all other buildings.  

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► IsKennel
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

<i>Work in progress</i>
Indicates that this building is a kennel.

This is indended to be used for `IsDog` infantry. However, this implementation is a work in progress

Defaults to true for the Kennel, false for all other buildings.  

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► IsRadar
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Allows a building to provide Radar capabilities to the player, given sufficient power. 
If combined with `IsJammable=true`, will also generate the static jam effect when a jammer unit is close to it.

This logic can be combined with other features (e.g. IsRefinery) without conflicting logic.

Defaults to true for the Radar Dome, false for all other buildings. 

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► FreeUnit
</samp></td><td width="120"><samp>String: UnitType</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

When the building is built, a free unit will be spawned at its center.
When the building is sold, the cost of the free unit will be removed from the solyent value refunded to you.

Note: The Mammoth Tank (`4TNK`) has ID 0, and will be treated as NONE.

Defaults to the Ore Truck (`HARV`) for the Ore Refinery, NONE for all other buildings.  

</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### Factory Production
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► FactoryType
</samp></td><td width="120"><samp>String: AircraftType, BuildingType, InfantryType, UnitType, VesselType</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed BuildingTypeClass->ToBuild```

Determines if the building is a factory for a certain techno class. If BuildingType is used, the building will also play its Active animation (if defined) when a building is constructed and this building is the primary building.

When the Home key is pressed, the game will attempt tocenter around a Construction Yard (`FactoryType`=BuildingType), if any.

Note: The Map Trigger Event [Destroyed, All Factories] as well as the Skirmish AI Fire Sale check does not check for FactoryType. But checks for the PrerequisiteType= attribute. See [TechnoTypes ► Prerequisite System](./technotypes.md#prerequisite-system).
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### War Factory Settings
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► ExitList
</samp></td><td width="120"><samp>Byte: -1 to 5</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed BuildingTypeClass->ExitList```

Determines the exit destinations of an object produced from this building. Units created will attempt to move to these locations. Infantry and vehicles will attempt to scatter from these locations to make way for newly built units. The following values are supported:

 > -1 = No exit list\
 > 0 = Units exit the factory like it is leaving a Barracks\
 > 1 = Units exit the factory like it is leaving a Naval Yard or Sub Pen\
 > 2 = Units exit the factory like it is leaving a War Factory\
 > 3 = Units exit the factory like it is leaving a C&C Hand of Nod\
 > 4 = Units exit the factory like it is leaving a C&C Weapons Factory\
 > 5 = Units exit the factory like it is leaving a C&C Nod Airstrip
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► WarFactoryOverlayAnim<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► WarFactoryOverlayFrames<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► WarFactoryOverlayRate
</samp></td><td width="120"><samp>String<br>Integer<br>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If defined on a building with `FactoryType = UnitType`, overrides the factory door overlay as well as its animation sequence. This sequence plays as the War Factory. This can be used to implement the opening doors of different war factories, as they are rendered abov the unit. Defaults to the default War Factory door animation parameters (WEAP2) for the War Factory and its fake counterpart, none (no animation) otherwise. If the animation does not exist, use default.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► WarFactoryExitFacing
</samp></td><td width="120"><samp>Byte</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If defined on a building with `FactoryType = UnitType`, overrides the starting rotation of the unit being ejected from the factory. This can be used to emulate the slightly offset angle used by the C&C GDI Weapons Factory. Defaults to 128, which is facing directly south.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► WarFactoryExitTrack
</samp></td><td width="120"><samp>Byte: 0 to 67</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If defined on a building with `FactoryType = UnitType`, overrides the initial fixed movement track of the unit being ejected from the factory. Generally, a unit on a track cannot be redirected until the movement is over. Defaults to 66, which is the default exit track for War Factory.

A new unit exit track (ID 67) has been created to emulate the exit track used by the C&C GDI Weapons Factory. The available tracks are:

 > 0-63: Unit locomotion and rotation along the 8 directions\
 > 64: C&C Harvester docking to Refinery track (unused in RA1)\
 > 65: C&C Harvester undocking from Refinery track (unused in RA1)\
 > 66: Default War Factory exit track\
 > 67: Emulated C&C GDI Weapons Factory exit track (new)
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### Building Foundations
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► BSize
</samp></td><td width="120"><samp>Byte: 0 to 8</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

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
</details></td></tr></table>


There are two methods to customize building foundations. One may be easier to use than the other. The second one is kept for compatibility.

**Method 1**

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► CustomFoundationList
</samp></td><td width="120"><samp>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the combined occupy and visual overlap foundations for this building. Takes in a sequence of characters to move the cursor and build the foundation list.
Up to 640 occupancy 'X' cells and 640 overlay 'O' cells can be supported this way. Exceeding the limit may result in undefined behaviour, likely a crash.

The following characters are supported. Note that they are case sensitive.

 >The marking cursor starts at position (0,0), normally the top-left cell of the building\
 >\
 > The first row is aligned to the top of the image\
 > X denotes occupied, - denotes clear\
 > Example: A 2x3 grid is XXX|XXX\
 > Example: A 2x2 grid occupying one row above the image and the first row of the image is SXX|XX\
 >\
 > 'S' -> advances the cursor to the 1st column of the row above. This can be used to begin the sequence at the row above the  building's top-left corner (e.g. SAM Sites)\
 > '-' -> advances the cursor to the right\
 > 'X' -> marks the current location as (impassable) placement foundation, then advances the cursor to the right\
 > 'O' -> marks the current location as overlay tile (not part of the building foundation, but part of the object's refresh area, then advances the cursor to the right\
 > '|' -> marks a new line. advances the cursor to the 1st column of the row below\
 > Any other character terminates the sequence
</details></td></tr></table>


**Method 2**

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► OccupyList<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► OverlapList
</samp></td><td width="120"><samp>String<br>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

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
 > 24 = [SXX][--][X-][XX]\
 > 25 = [SXXX][---][---][XXX]\
 > 26 = [---][XXX][-XX]\
 > 27 = [XXX][---][X--]\
 > 28 = [--][XX][-X] (occupy list for the C&C Hand of Nod)\
 > 29 = [SXX][--][--][XX]\
 > 30 = [--][XX][XX]
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### Building Animations
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Construct_Start<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Construct_Count<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Construct_Rate<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Idle_Start<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Idle_Count<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Idle_Rate<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Active_Start<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Active_Count<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Active_Rate<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Full_Start<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Full_Count<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Full_Rate<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Aux1_Start<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Aux1_Count<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Aux1_Rate<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Aux2_Start<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Aux2_Count<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► Anim_Aux2_Rate
</samp></td><td width="120"><samp>Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>
Integer<br>Integer<br></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed BuildingTypeClass->Anims[BSTATE_COUNT]```

Determines the animation settings for each stage of the building. The three options for each stage are as follows:

<samp>

|Parameter|Explanation             
:---------|:------------
|`Start`  |The frame index within the shp file to use as the first frame of this stage.
|`Count`  |The number of frames used in this stage, some stages may loop back to Start after the last frame is reached.
|`Rate`   |The number of in-game frames to pass before rendering the next animation frame.
</samp>

The stages are as follows:

<samp>

|Stage           |Explanation             
:----------------|:------------
|`Construct`     |The build-up animation.<br>The deconstruction animation is the reverse of this animation.
|`Idle`          |The idle animation.<br>Use with `ConstantAnimation` for repeat animation, such as the rotating radar dish for C&C-style comm center.
|`Active`        |The active animation.<br>Used by various buildings, such as<li>Chronosphere discharging,</li><li>Construction Yard handling materials, and</li><li>the Service Depot repair animation.</li>
|`Full`          |Used only by the C&C Refinery when docked with a Harvester. Has no use in Red Alert.
|`Aux1` / `Aux2` |Alternative sequences, used only by the Missile Silo.<br>The Missile Silo uses <li>`Active` for its door opening animation, </li><li>`Aux1` for the launch, and </li><li>`Aux2` for the closing of the door.</li>
</samp>
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### Jamming Buildings
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► IsJammable
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set to true, has the following effects:
 - If the building provides radar, and the player as no other active/unjammed radar, wipes the radar screen with static
 - If the building has a weapon, it will be unable to fire.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [General] ► RemapJammedBuildings
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set to true, remaps jammed buildings using the Shade remap.
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### Superweapons
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► SpecialWeapons
</samp></td><td width="120"><samp>String Array</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the Special Weapons that may be fired by this building. Note that some buildings require some animations to be enabled for the special weapon to work properly. Global overrides, such the Nuke being a fluke below TechLevel=10, still apply.

For a building with existing special weapons, they can be overriden (not appended) if SpecialWeapons is defined in ini.

The list of supported SpecialWeapons are:

<samp>

|SpecialWeapon |Explanation             
:--------------|:------------
|`SONARPULSE`  |The sonar pulse.<br>SpecialWeapons= has no affect due to the special spy requirements.
|`NUCLEARBOMB` |The nuke.<br>Requires the building to have the animations ACTIVE, AUX1 and AUX2 to create the actual Nuke.
|`CHRONOSPHERE`|The chrono warp.
|`PARABOMB`    |The parabomb.
|`PARAINFANTRY`|The paradrop.
|`SPYPLANE`    |The spy plane.
|`IRONCURTAIN` |The iron curtain effect.
|`GPS`         |The satellite launch.<br>Creates a GPS satellite animation at launch, which may look weird depending on the building you hook into.
</samp>

For example, `SpecialWeapons=GPS,SPYPLANE` grants both spy plane and GPS special powers while the building remains standing.
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### Unpacking Buildings
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► UndeploysInto
</samp></td><td width="120"><samp><a href="./defines.md#unittypes">UnitType</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Allows the building to repack into the indicated unit. The controls to undeploy is the same as repacking an Construction Yard - give the building a move command.

The created building will be offset at the cell +1,+1 (directly south-east) from the building's top right cell. This may change in the future towards an automatic centering.
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### Explosions
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► SpreadExplosionDamage<br>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► SpreadExplosionWarhead
</samp></td><td width="120"><samp>Integer<br>String</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If defined, causes the building to explode like a Barrel, producing secondary explosions in its 4 cardinal directions. Determines the damage and warhead that is released on this building's destruction death. 
The barrel uses 200 damage / Fire warhead.

Note that the explosion center uses cell coordinates, which means a 2x2 building may generate the explosions around the top-left cell.
</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
### AI AutoBase Controls
<br>

Each of the AutoBase controls are only effective the new AutoBase AI is enabled.
Enable it using [AI] ► UseNewBuildingAI. See <a href="./ai.md#base-building">AI Base Building</a> for more information

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► AIBuildType
</samp></td><td width="120"><samp>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Each building can be assigned one of several Prerequisite types. A total of 32 are supported, as below.

 > 0 = NONE\
 > 1 = POWER\
 > 2 = REFINERY\
 > 3 = BARRACKS\
 > 4 = WARFACTORY\
 > 5 = TECH\
 > 6 = DEFENSE\
 > 7 = ADV.DEFENSE\
 > 8 = AA.DEFENSE\
 > 9 = AIRSTRIP\
 > 10 = HELIPAD\
 > 11 = GENERIC

NONE effectively excludes the building from being considered by the new autobase AI

Defaults to the following values, depending on the building in question:
 > POWER: [POWR], [APWR]\
 > REFINERY: [PROC]\
 > BARRACKS: [BARR], [TENT]\
 > WARFACTORY: [WEAP]\
 > DEFENSE: [PBOX], [HBOX], [GUN], [FTUR]\
 > ADV.DEFENSE: [TSLA]\
 > AA.DEFENSE: [AGUN], [SAM]\
 > TECH: [KENN], [DOME], [FIX], [ATEK], [STEK], [GAP], [IRON], [PDOX], [MSLO]\
 > AIRSTRIP: [AFLD]\
 > HELIPAD: [HPAD]\
 > GENERIC: [SILO]\
 > NONE: All other buildings
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► AIBuildLimit
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
Determines the maximum number of building instances that the new AutoBase AI can build, after accounting for all other checks (i.e. Limit / Ratio) 
Defaults to 10 for [SILO], 0 for all else.
If the value is 0, the AutoBase AI will treat the value as:
 - 1 (for `AIBuildType`=TECH)
 - Unlimited otherwise

To disable the building from being built by the AutoBase AI, use `AIBuildType`=NONE instead

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► AILowPowerSellPriority
<code>{Rules/Map}</code> ► [&lt;BuildingType&gt;]  ► AILowMoneySellPriority
</samp></td><td width="120"><samp>0 - 4<br>0 - 4</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The AI may have a need to sell structures to control their money or power situation. The selection of buildings used to be hardcoded. Now they are available for configuration.

Use the values 1 - 4 to determine at which urgency level the building is permitted to be sold. Lower value means that the building can be sold when the situation is less urgent, and higher values prevents the AI from selling the building at low urgency, reserving the control for greater emergencies.

Use the value 0 to prevent the AI from selling it to recover power or money. The AI may still sell the structure by other means (e.g. when damaged to red health via `IQ` ► `Sellback`)

NONE effectively excludes the building from being considered by the new autobase AI

Defaults to the following values, depending on the building in question:
<b>AILowPowerSellPriority</b>
 > 1: [ATEK], [PDOX], [STEK], [SYRD], [SPEN], [FCOM]\
 > 2: [IRON], [DOME], [FIX]\
 > 3: [TSLA]\
 > 0 (disabled): All other buildings

<b>AILowMoneySellPriority</b>
 > 1: [ATEK], [PDOX], [SILO], [STEK], [FIX], [SYRD], [SPEN], [FCOM]\
 > 2: [HPAD], [TSLA]\
 > 3: [AFLD], [POWR]\
 > 4: [FACT]\
 > 0 (disabled): All other buildings

</details></td></tr></table>


<a href="#buildingtypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>BuildingTypes</kbd></kbd><br>

