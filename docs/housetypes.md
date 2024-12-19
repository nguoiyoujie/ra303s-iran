<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>HouseTypes</kbd></kbd><br>
<h2 align="center">HouseTypes</h2>

HouseTypes represent a player slot. There are originally a total of 20 Houses / HouseTypes, with 8 reserved for skirmish and multiplayer

-------

 - [Documentation Guide](#documentation-guide)
 - [Expanded House Roster](#expanded-house-roster) 
 - [General Settings](#general-settings) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#housetypes"><kbd>Top</kbd></a><br>
-------
### Expanded House Roster

The game now supports 12 additional houses, up to a total of 32.
The full list of houses are available <a href="./defines.md#housetypes">here</a>.


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

