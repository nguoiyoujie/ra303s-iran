<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>HouseTypes</kbd></kbd><br>
<h2 align="center">HouseTypes</h2>

HouseTypes represent a player slot. There are originally a total of 20 Houses / HouseTypes, with 8 reserved for skirmish and multiplayer

-------

 - [Documentation Guide](#documentation-guide)
 - [General Settings](#general-settings) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#housetypes"><kbd>Top</kbd></a><br>
-------
### New Type Extensions
<br>

These settings enable you to define new types, expanding modding capabilities.

The game allows for a maximum of 255 types of each kind, inclusive of the ones included in the original game. Be careful not to over-extend it!

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [HouseTypes]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new BuildingType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[HouseTypes]
0=Multi9
1=Multi10
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [StringTableOffsets] ► House
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The `Name` entries can be used to set the names of objects, but is limited to 30 across all instances before the game crashes. Instead, it is recommended to utilize `CONQUER.ENG` and its language counterparts to supply these names.

This specifies the string entry location within `CONQUER.ENG` of new technotype entries. The index used is denoted by [Type] + [index in the new types section] + 1.

For example, if `[StringTableOffsets] ► House` is set to 400 and `[HouseTypes] ► 2` is set to Multi11, then the string table entry for `[Multi11]` is 400 + 2 + 1 = **403**

Ensure that `CONQUER.ENG` has sufficient entries, as attempting to read a missing entry will crash the game when hovering over the affected unit.

Do not create entries that exceed 1000 as the game will route to `DEBUG.ENG` instead, which for now is beyond the scope of the project.

If not defined, or set to -1, all additional house types will default their names to the 'Civilian' text entry.
</details></td></tr></table>


<a href="#housetypes"><kbd>Top</kbd></a><br>
-------
### General Settings
<br>

<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;HouseType&gt;]  ► Color
<code>{Rules/Map}</code> ► [&lt;HouseType&gt;]  ► SecondaryColor
</samp></td><td width="120"><samp><a href="./defines.md#housecolortypes">HouseColorType</a><br><a href="./defines.md#housecolortypes">HouseColorType</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```Exposed HouseClass->RemapColor```

Determines the color of units and structures representing the house. `Color` is used for units, and `SecondaryColor` is used for buildings, the Ore Truck, and the MCV.

If `SecondaryColor` is not specified, `Color` is used for both colorizations. If both are not specified, defaults to the default colors used by `Country`.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="Exposed Reference" src="./img/30x15/ref.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;HouseType&gt;]  ► Country
</samp></td><td width="120"><samp><a href="./defines.md#housetypes">HouseType</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```Exposed HouseClass->ActLike```

Overrides the housetype this house represents, in the same way countries are written for skirmish. This allows multiple slots to act like the USSR country.

In Singleplayer, when playing as a country greated than the norm of 9 ('Special'), certain functions (such as the radar logo) will default to Allied versions.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;HouseType&gt;]  ► AllyTheNeutralHouse
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```New Logic```

By default, all houses will ally the 'Neutral' house, regardless of `Allies` settings.

Added a new AllyTheNeutralHouse= (yes/no) keyword under the house specific section of a map INI. This allows you to disable the hard-coded logic for a house to ally the neutral house.

An example:

```ini
[USSR]
AllyTheNeutralHouse=no  ; Don't ally the Neutral house
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;HouseType&gt;]  ► BuildingsGetInstantlyCaptured
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```New Logic```

By default, engineers perform partial damage to buildings until a capture threshold is reached. While this can be changed in Rules, this option allows customization per house instead of globally.

```ini
[BadGuy]
BuildingsGetInstantlyCaptured=yes
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;HouseType&gt;]  ► NoBuildingCrew
</samp></td><td width="120"><samp>Boolean</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
 
```New Logic```

By default, all houses will ally the 'Neutral' house, regardless of `Allies` settings.

When set to true, no infantry will spawn from destroyed buildings owned by this house.

```ini
[BadGuy]
NoBuildingCrew=yes
```
</details></td></tr></table>


<a href="#housetypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>HouseTypes</kbd></kbd><br>

