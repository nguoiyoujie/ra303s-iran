<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>TechnoTypes</kbd></kbd><br>
<h2 align="center">TechnoTypes</h2>

Technotypes represent common elements between [BuildingTypes](../buildingtypes.md), [UnitTypes](../unittypes.md), [InfantryTypes](../infantrytypes.md), [VesselTypes](../vesseltypes.md) and [AircraftTypes](../aircrafttypes.md)

-------

 - [Documentation Guide](#documentation-guide)
 - [New Type Extensions](#new-type-extensions) 
 - [New Armor-types](#new-armor-types) 
 - [QoL Changes](#qol-changes) 
 - [Prerequisite System](#prerequisite-system) 
 - [General Settings](#general-settings) 
 - [Firing Offsets](#firing-offsets) 
 - [Death Weapons](#death-weapons) 
 - [Manual Targeting](#manual-targeting) 
 - [Cloaking](#cloaking) 
 - [Mirage](#mirage)
 - [AI Superweapons](#ai-superweapons) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### New Type Extensions
<br>

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

Check the following specific types to learn how to introduce new types:

 - [BuildingTypes](./buildingtypes.md#new-type-extensions)
 - [UnitTypes](./unittypes.md#new-type-extensions)
 - [InfantryTypes](./infantrytypes.md#new-type-extensions)
 - [VesselTypes](./vesseltypes.md#new-type-extensions) 
 - [AircraftTypes](./aircrafttypes.md#new-type-extensions)


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### New Armor-types
<br>

<table><tr><td width="50"><a href="#"><img title="Modified Reference" src="./img/30x15/mod.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;] ► Armor
</samp></td><td width="120"><samp>String</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Modified TechnoTypeClass->Armor```

The number of supported types have been increased to 11, matching the armortypes used in Red Alert 2. For compatibility, the original armor types are not changed, therefore the order of armors are different from that of RA2.

You are expected to modify the existing Warhead entries to make use of them. See [Warheads ► New Armor-types](./warheads.md#new-armor-types).

 > 0 = None\
 > 1 = Wood\
 > 2 = Light\
 > 3 = Heavy\
 > 4 = Concrete\
 > 5 = Flak\
 > 6 = Plate\
 > 7 = Medium\
 > 8 = Steel\
 > 9 = Special_1\
 > 10 = Special_2

</details></td></tr></table>


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### QoL Changes
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► Image
</samp></td><td width="120"><samp>String</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The Image= keyword now works in a map file, instead of just globally in RULES.INI.
</details></td></tr></table>


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### Prerequisite System
<br>

**New Prerequisite-types**\
*This constitutes a breaking change, therefore this system may be subject to change in the future in case of work to make it compatible with unmodified RA.*

*As far as possible, the list of broken compatibility will be listed at the end of the section.*

The prerequisite system has been extended to aid with the overall softcoding of the interconnected web of building behaviors and checks. The center of this change lies in the implementation of Prerequisite Types.

This is analogus to the Prerequisite Groups system implemented in Tiberian Sun and beyond. Unlike Tiberian Sun, a building does not (yet) belong to more than one Type.

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► PrerequisiteType
</samp></td><td width="120"><samp>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

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
</details></td></tr></table>

<table><tr><td width="50"><a href="#"><img title="Modified Reference" src="./img/30x15/mod.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► Prerequisite
</samp></td><td width="120"><samp>String Array</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```Modified TechnoTypeClass->Prerequisite```

Extended behavior: The list of valid prerequisite strings now include any of the PrerequisiteTypes. This inclusion works like prerequisite groups in Tiberian Sun onwards; any building type with the appropriate PrerequisiteType may fulfill the prerequisite.

Like the original, the game checks for at least one item fulfilling each of the listed prerequisites. 

Example: If a unit has Prerequisite=POWER,BARRACKS,FIX,STEK. The prerequisite requirements are:
 - At least one building with PrerequisiteType=POWER (by default this is POWR or APWR)
 - At least one building with PrerequisiteType=BARRACKS (by default this is BARR or TENT)
 - At least one [FIX] (Service Depot)
 - At least one [STEK] (Soviet Tech Center)

</details></td></tr></table>

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

<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### General Settings
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► IsNominal
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```Exposed TechnoTypeClass->IsNominal```

Determines whether this object uses its true name. Overrides the name behaviour from `IsCivilian`.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► IsTheater
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```Exposed TechnoTypeClass->IsTheater```

Determines if the artwork for this object is theater specific.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► HasTurret
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```Exposed TechnoTypeClass->IsTurretEquipped```

Determines if this object has a turret. For buildings, if set to true, the object will use 64 frames for each of its rotation stages, and another 64 frames for each of its damaged rotation stages. For units, if set to true, the object will use 32 frames for its turret rotation stages.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► Facings
</samp></td><td width="120"><samp>8, 16, or 32</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed TechnoTypeClass->Rotation```

Determines if the number of directions applicable for this object's rotation. Only certain values have an impact. Has no impact for buildings (fixed to 64) and infantry. For a unit, special logic may occur if set other than the default.
</details></td></tr></table>


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### Firing Offsets
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► VerticalOffset
</samp></td><td width="120"><samp>Integer</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed TechnoTypeClass->VerticalOffset```

Determines the upward offset of the firing animation, in leptons, relative to the unit's center.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► PrimaryOffset
</samp></td><td width="120"><samp>Integer</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed TechnoTypeClass->PrimaryOffset```

Determines the forward offset of the firing animation, in leptons, relative to the unit's line of fire.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► PrimaryLateral
</samp></td><td width="120"><samp>Integer</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed TechnoTypeClass->PrimaryLateral```

Determines the offset of the firing animation perpendicular to the unit's line of fire. Units with `Burst=2` will shoot their second bullet at the opposite offset.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► SecondaryOffset
</samp></td><td width="120"><samp>Integer</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed TechnoTypeClass->SecondaryOffset```

Determines the forward offset of the firing animation relative to the unit's line of fire. This is used for the secondary weapon.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► SecondaryLateral
</samp></td><td width="120"><samp>Integer</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed TechnoTypeClass->SecondaryLateral```

Determines the offset of the firing animation perpendicular to the unit's line of fire. Units with `Burst=2` will shoot their second bullet at the opposite offset. This is used for the secondary weapon.
</details></td></tr></table>


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### Death Weapons
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► DeathWeapon
</samp></td><td width="120"><samp>String</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the damage and warhead that is released on this technotype's death. Setting this entry overrides the original behavior of using the technotype's Primary weapon and the technotype's MaxStrength.

Note that the explosion type and spread of the damage is still determined by the damage value (the stellar examples being Mammoth Tank explosion and the Monster Tank explosion), though this is now tied to the weapon's damage.
</details></td></tr></table>


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### Manual Targeting
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► ManualAcquire
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If set, the unit will ignore its environment, and must target using the player's actions. AI players will target as normal.

</details></td></tr></table>


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### Cloaking
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► CloakSound
</samp></td><td width="120"><samp>String</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If used, overrides the stealth transition sound. This string must be an existing <a href="./defines.md#soundeffects">SoundEffect</a> or defined in `[SoundEffects]`. This can be used to emulate the C&C Stealth Tank. Defaults to the submarine submerge sound for VesselTypes, and the Phase Transport's stealth sound for all others.

</details></td></tr></table>


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### Mirage
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► IsStaticDisguise
</samp></td><td width="120"><samp>String</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Usable on InfantryTypes and UnitTypes.

If used on UnitTypes, when the unit is stationary, turns into a tree (`[T01]`). Enemies will not automatically acquire the unit, but may retaliate if attacked, akin to reacting to a Spy with a weapon.

If used on InfantryTypes, when the infantry is stationary, shimmers against the ground. Likewise, enemies will not automatically acquire the infantry, but may retaliate.

The stealth effect is momentarily broken when the unit takes damage, or whenever the unit moves. Enemies chasing after the unit will continue to chase after it regardless of the disguise.

</details></td></tr></table>


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
### AI Superweapons
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► ToProtectWithSpecials
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If used, allows the AI to use its superweapon to protect it. Currently only the Iron Curtain may do that. The AI should meet the [IQ] Superweapons requirements, and will respect the superweapon charge/ready status.

The AI will invoke the use of the superweapon when the unit is damaged by any warhead, even from allies.

</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;TechnoType&gt;]  ► ToTeleportWithSpecials
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If used, allows the AI to use its superweapon to teleport it. Currently only the Chronosphere may do that. The AI should meet the [IQ] Superweapons requirements, and will respect the superweapon charge/ready status.

The AI will invoke the use of the superweapon when the unit wants to attack a new location.

If set on the ChronoTank (`CTNK`), it will teleport the Chrono Tank without consuming the superweapon. 

Obviously, the AI will ignore any attempts to teleport a building, an infantry or an aircraft to a different location.

</details></td></tr></table>


<a href="#technotypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>TechnoTypes</kbd></kbd><br>
