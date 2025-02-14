<a href="../README.md"><kbd>ra303s</kbd></a> :: <kbd><kbd>Progress Tracking</kbd></kbd><br>
<h2 align="center">Progress Tracking</h2>

This place is an attempt to track various features and internal work that is ongoing or thought of. Think of this as a 'To-Do' list.

-------

 - [Type Definition Documentation and Extension](#type-definition-documentation-and-extension)
 - [Notable C&C Features](#notable-C&C-features)

-------
### Type Definition Documentation and Extension
<br>

At the heart of customization comes the need to move some of the hardcoded behavior from code to configuration. This means that in general, memory for interal objects should be expanded to store these options. Usually, this has to be done before any new feature is possible.

Documentation of these types is maintained within the `/inc/types` source folder.

Generally, object classes have other classes inherit from them cannot be extended due to the memory layout. However, some functions may still be able to be inserted within those classes due to the packing alignment of booleans.

<details><summary><b>Flyweight-type Definitions</b></summary><samp>

|Type                            |Parent Class                 |Documented? |Verified?  |Extended?    |Max Entries  |New Entries Possible?                    
|:-------------------------------|:----------------------------|:-----------|:----------|:------------|:------------|:------------
|`AbstractTypeClass`             |none                         |Yes         |Yes        |NA           |NA           |NA
|`ObjectTypeClass`               |`AbstractTypeClass`          |Yes         |Yes        |NA           |NA           |NA
|`TechnoTypeClass`               |`ObjectTypeClass`            |Yes         |Yes        |NA           |NA           |NA
|`AircraftTypeClass`             |`TechnoTypeClass`            |Yes         |Yes        |Yes          |255          |<a href="./aircrafttypes.md#new-type-extensions">Yes</a>
|`BuildingTypeClass`             |`TechnoTypeClass`            |Yes         |Yes        |Yes          |255          |<a href="./buildingtypes.md#new-type-extensions">Yes</a>
|`InfantryTypeClass`             |`TechnoTypeClass`            |Yes         |Yes        |Yes          |255          |<a href="./infantrytypes.md#new-type-extensions">Yes</a>
|`UnitTypeClass`                 |`TechnoTypeClass`            |Yes         |Yes        |Yes          |255          |<a href="./unittypes.md#new-type-extensions">Yes</a>
|`VesselTypeClass`               |`TechnoTypeClass`            |Yes         |Yes        |Yes          |255          |<a href="./vesseltypes.md#new-type-extensions">Yes</a>
|`WeaponTypeClass`               |none                         |Yes         |Yes        |No           |255          |<a href="./weapontypes.md#new-entries">Yes</a>
|`WarheadTypeClass`              |none                         |Yes         |Yes        |No           |255          |<a href="./warheadtypes.md#new-entries">Yes</a>
|`BulletTypeClass`               |`ObjectTypeClass`            |No          |No         |No           |255          |<a href="./bullettypes.md#new-entries">Yes</a>
|`AnimTypeClass`                 |none                         |Yes         |Yes        |No           |255          |<a href="./animtypes.md#new-entries">Yes</a>
|`TemplateTypeClass`             |none                         |No          |No         |No           |NA           |No
|`TerrainTypeClass`              |none                         |No          |No         |No           |NA           |No
|`OverlayTypeClass`              |none                         |No          |No         |No           |NA           |No
|`SmudgeTypeClass`               |none                         |No          |No         |No           |NA           |No
|`HouseTypeClass`                |none                         |Yes         |Yes        |Yes          |32           |<a href="./housetypes.md#expanded-house-roster">Fixed</a>
|`SoundEffects`                  |none                         |Yes         |Yes        |No           |65535        |<a href="./sounds.md#new-entries">Yes</a>
|`TriggerTypeClass`              |`AbstractTypeClass`          |No          |No         |No           |NA           |Managed by <code>{Rules}</code> ► [Maximums]
|`TeamTypeClass`                 |`AbstractTypeClass`          |No          |No         |No           |NA           |Managed by <code>{Rules}</code> ► [Maximums]
|`TeamTypeClass`                 |`AbstractTypeClass`          |No          |No         |No           |NA           |Managed by <code>{Rules}</code> ► [Maximums]

</samp>
</details>


<details><summary><b>Instance Object Definitions</b></summary><samp>

|Type                            |Parent Class                 |Documented? |Verified?  |Extended?    |Max Entries                 
|:-------------------------------|:----------------------------|:-----------|:----------|:------------|:------------
|`AbstractClass`                 |none                         |Yes         |Yes        |NA           |NA
|`ObjectClass`                   |`AbstractClass`              |Yes         |Yes        |NA           |NA
|`MissionClass`                  |`ObjectClass`                |Yes         |Partial    |NA           |NA
|`RadioClass`                    |`MissionClass`               |Yes         |Partial    |NA           |NA
|`FlasherClass`                  |none                         |Yes         |Partial    |NA           |NA
|`StageClass`                    |none                         |Yes         |Partial    |NA           |NA
|`CargoClass`                    |none                         |Yes         |Partial    |NA           |NA
|`DoorClass`                     |none                         |Yes         |Partial    |NA           |NA
|`TechnoClass`                   |`RadioClass`,`FlasherClass`,`StageClass`,`CargoClass`,`DoorClass` |Yes         |Partial    |NA           |NA           |NA
|`FootClass`                     |`TechnoClass`                |Yes         |Partial    |NA           |NA
|`DriveClass`                    |`FootClass`                  |Yes         |Partial    |NA           |NA
|`FlyClass`                      |none                         |Yes         |Partial    |NA           |NA
|`AircraftClass`                 |`FootClass`,`FlyClass`       |Yes         |Yes        |No           |Managed by <code>{Rules}</code> ► [Maximums] 
|`BuildingClass`                 |`TechnoClass`                |Yes         |Yes        |No           |Managed by <code>{Rules}</code> ► [Maximums] 
|`InfantryClass`                 |`FootClass`                  |Yes         |Yes        |No           |Managed by <code>{Rules}</code> ► [Maximums] 
|`UnitClass`                     |`DriveClass`                 |Yes         |Yes        |No           |Managed by <code>{Rules}</code> ► [Maximums] 
|`VesselClass`                   |`DriveClass`                 |Yes         |Yes        |No           |Managed by <code>{Rules}</code> ► [Maximums] 
|`CellClass`                     |none                         |Partial     |Partial    |No           |NA
|`AnimClass`                     |none                         |No          |No         |No           |Managed by <code>{Rules}</code> ► [Maximums] 
|`FactoryClass`                  |`StageClass`                 |No          |No         |No           |Managed by <code>{Rules}</code> ► [Maximums] 
|`HouseClass`                    |none                         |Yes         |Yes        |Yes          |32
|`FuseClass`                     |none                         |No          |No         |NA           |NA
|`BulletClass`                   |`ObjectClass`,`FlyClass`,`FuseClass` |No          |No         |No           |?
|`SmudgeClass`                   |`ObjectClass`                |No          |No         |No           |?
|`TemplateClass`                 |`ObjectClass`                |No          |No         |No           |?
|`TerrainClass`                  |`ObjectClass`                |No          |No         |No           |?
|`OverlayClass`                  |`ObjectClass`,`StageClass`   |No          |No         |No           |?
|`TriggerClass`                  |none                         |No          |No         |No           |Managed by <code>{Rules}</code> ► [Maximums] 
|`TeamClass`                     |`AbstractClass`              |No          |No         |No           |Managed by <code>{Rules}</code> ► [Maximums] 

</samp>
</details>


<a href="#progress-tracking"><kbd>Top</kbd></a><br>
-------
### Notable C&C Features
<br>

Some features present in other C&C (and RTS) games could make an appearence in RA1. Some of them might already be functional! 

<details><summary><b>Tiberium Dawn</b></summary><samp>

|Function                        |Comment                      |Progress           
|:-------------------------------|:----------------------------|:-----------------------
|Custom Building Foundations     |Power Plant, etc.            |<a href="./buildingtypes.md#building-foundations">Implemented</a>
|Custom Building Animations      |Comm Center, etc.            |<a href="./buildingtypes.md#building-animations">Implemented</a>
|Custom Exit Point/Direction     |GDI Weapons Factory          |<a href="./buildingtypes.md#war-factory-settings">Implemented</a>
|Directional Animations          |TD Flamethrower, Flame Tank  |<a href="./animtypes.md#new-entries">Implemented</a>
|Laser Zap Weapon                |Obelisk of Light             |<a href="./weapontypes.md#tesla-charge-settings">Implemented</a>
|True Docking                    |Refinery / Harvester         |Experimenting in progress
|Overlay inflict Damage          |Tiberium Fields              |Not started (Requires `OverlayTypeClass` extension first)
|Aircraft Delivery               |Nod Airstrip                 |Not started
|Additional Para-support Powers  |Airstrike                    |Not started
|Resource Mine Animations        |Tiberium Tree                |Not started (Requires `TerrainTypeClass` extension first)
|Charges + Turret                |SAM Site                     |Not started
|Animation Damage Support Powers |Ion Cannon                   |Not started
|Warhead Animation Customization |TD warheads explode differently |Not started
|Custom Movement                 |GDI Gunboat                  |Not planning to implement

</samp>
</details>

<details><summary><b>Tiberium Sun</b></summary><samp>

|Function                        |Comment                      |Progress           
|:-------------------------------|:----------------------------|:-----------------------
|Amphibious MovementZones        |APC, Hover MRLS              |Not started (Requires `CellClass` extension first)
|Resource Spill                  |Refinery / Silo              |Not started
|Ranged Stealth Detectors        |Sensor Array                 |Not started
|Terrain Modifications           |Destructible Cliffs          |Not started
|Hit Scan Checks                 |Walls can prevent targeting  |Not started
|Environment Effects             |Ion Storm                    |Not planning to implement
|Self-Modifying Foundations      |Gates                        |Not planning to implement
|Building Upgrades               |GDI Upgrade Nodes            |Not planning to implement
|Hover                           |Hover MRLS                   |Not planning to implement
|Flying Infantry                 |Jumpjet Infantry             |Not planning to implement
|Limbo Effects                   |Limpet Drone                 |Not planning to implement

</samp>
</details>

<details><summary><b>Dune 2000</b></summary><samp>

|Function                        |Comment                      |Progress           
|:-------------------------------|:----------------------------|:-----------------------
|Deployable Infantry             |Saboteur                     |Not started (Requires `CellClass` extension first)
|Resource Bloom                  |Spice Bloom                  |Not started (Requires `TerrainTypeClass` extension first)
|Infantry-only MovementZone      |Certain Template Tiles       |Not started
|Airstike Entry Formation        |Orinthopher                  |Not started
|Order & Delivery                |Starport                     |Not started
|Bullet Constant Damage          |Sonic Tank                   |Not started
|Buildable Overlay               |Concrete Foundations         |Not planning to implement
|Mind Control                    |Deviator                     |<a href="./warheads.md#capture-weapons">Partially implemented</a>, Capture chance and reversion by damage not yet implemented

</samp>
</details>

<details><summary><b>Red Alert 2 / Yuri's Revenge</b></summary><samp>

|Function                        |Comment                      |Progress           
|:-------------------------------|:----------------------------|:-----------------------
|Chrono Infantry                 |Chrono Legionarie            |Not planning to implement
|Amphibious Infantry             |SEAL, Tanya                  |Not started (Requires alternate movementzones first)
|Targetable 'Bullets'            |V3 Rocket, Drednought        |Not started
|Spawners                        |Aircraft Carrier, Destroyer  |Not started
|Immediate SpySat                |Say Sat                      |Not started
|Ranged Chronosphere Target      |Chronosphere                 |Not started
|Ranged Iron Curtain Target      |Iron Curtain                 |Not started
|Ground Radiation                |Radiation                    |Not started
|Garrison Weapons                |Garrison                     |Not started
|Turret / Weapon Mods            |IFV                          |Not started
|Garrison Provides Power         |Bio Reactor                  |Not started
|Bullet Spread                   |Prism Tank                   |Not started
|Chain Damage Mod                |Tesla Coil, Prism Tower      |Not started
|Spy Disguise on Units           |Mirage Tank                  |Not started
|Multiple Air Docks              |Airforce Command (4 docks)   |Not planning to implement
|Balloon Hover                   |Nighthawk, Kirov             |Not planning to implement
|Limbo Damage                    |Terror Drone                 |Not planning to implement
|Mind Control                    |Yuri                         |<a href="./warheads.md#capture-weapons">Partially implemented</a>, Capture limits and reversion by killing controller not yet implemented

</samp>
</details>

<a href="#progress-tracking"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <kbd><kbd>Progress Tracking</kbd></kbd><br>
