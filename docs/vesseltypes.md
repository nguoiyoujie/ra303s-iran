<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>VesselTypes</kbd></kbd><br>
<h2 align="center">VesselTypes</h2>

VesselTypes represent units that are exclusive to the water. While analogous to UnitTypes, they do not share most of their code, so are to be treated differently.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Type Extensions](#new-type-extensions) 
 - [TechnoTypes](#technotypes) 
 - [General Settings](#general-settings) 
 - [Turret Logic](#turret-logic) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#vesseltypes"><kbd>Top</kbd></a><br>
-------
### New Type Extensions
<br>

These settings enable you to define new types, expanding modding capabilities.

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [VesselTypes]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new VesselType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[VesselTypes]
0=BSHIP
1=CARR
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [StringTableOffsets] ► Vessel
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► Vessel` is set to 400 and `[VesselTypes] ► 2` is set to BSHIP, then the string table entry for `[BSHIP]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional unit types will default their names to the 'Civilian' text entry.
</details></td></tr></table>


<a href="#vesseltypes"><kbd>Top</kbd></a><br>
-------
### TechnoTypes
<br>

TechnoType settings are also available to VesselTypes. See [TechnoTypes](./technotypes.md) for more details.


<a href="#vesseltypes"><kbd>Top</kbd></a><br>
-------
### General Settings
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;VesselType&gt;]  ► IsPieceOfEight
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->IsPieceOfEight```

*Functionality to be determined*
</details></td></tr></table>


<a href="#vesseltypes"><kbd>Top</kbd></a><br>
-------
### Turret Logic
<br>

There are customized drawing of turrets, the most known of which is the Cruiser's double turrets. To enable the following options, make sure `HasTurret` (common to all TechnoTypes) is set.

For the moment, firing coordinates still come from the center of the unit. This may change to follow the turret in the future.

Use 
- TurretOffset
- TurretAdjustY

to control the position of the turret, and 

- TurretFireOffset
- PrimaryOffset
- VerticalOffset

to control the position of the bullet. 


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;VesselType&gt;]  ► HasSecondTurret
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines whether a second turret should be drawn. The second turret will always be drawn at the opposite offset of the first turret.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;VesselType&gt;]  ► TurretName
</samp></td><td width="120"><samp>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the turret to be drawn. Defaults to MGUN for the Gunboat, SSAM for the Destroyer and TURR for the Cruiser. The SHP file representing the turret should support 32 directional frames.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;VesselType&gt;]  ► TurretOffset
</samp></td><td width="120"><samp>Signed Byte</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Exposed UnitTypeClass->TurretOffset```

Determines the offset of the turret, in pixels, towards the front of the unit. Negative values will move the turret backwards, like the Destroyer's turret
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;VesselType&gt;]  ► TurretAdjustY
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the vertical offset, in pixels, of the turret.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;VesselType&gt;]  ► TurretFireOffset
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

Determines the offset of the firing animation, in leptons, towards the front of the vessel.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/mod.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;VesselType&gt;]  ► PrimaryOffset
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Modified TechnoTypeClass->VerticalOffset```

Determines the forward offset of the firing animation, in leptons, relative to the vessels's line of fire after applying TurretFireOffset.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/mod.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;VesselType&gt;]  ► VerticalOffset
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Modified TechnoTypeClass->PrimaryOffset```

Determines the upward offset of the firing animation, in leptons, relative to the vessels's position after applying TurretFireOffset.
</details></td></tr></table>


<a href="#vesseltypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>VesselTypes</kbd></kbd><br>

