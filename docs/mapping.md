<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Mapping</kbd></kbd><br>
<h2 align="center">Mapping</h2>

This section covers changes relevant to mapping.

-------

 - [Supported Theaters](#supported-theaters)
 - [Custom Tutorial Text](#custom-tutorial-text)
 - [Campaign Customization](#campaign-customization)




-------
### Supported Theaters
<br>

New theaters are supported.

<table><tr><td width="1012"><samp>
Theater List
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```
```Modified```

The list of supported theaters are here. 

A modder may have to source some of the mix files from the community.

<samp>

|Theater Name         |Mix File              |TMP file Extension
|:--------------------|:---------------------|:--------------------
|TEMPERATE            |`TEMPERAT.MIX`        |.TEM
|SNOW                 |`SNOW.MIX`            |.SNO
|INTERIOR             |`INTERIOR.MIX`        |.INT
|DESERT               |`DESERT.MIX`          |.DES
|WINTER               |`WINTER.MIX`          |.WIN
|JUNGLE               |`JUNGLE.MIX`          |.JUN
|CAVE                 |`CAVE.MIX`            |.CAV
|BARREN               |`BARREN.MIX`          |.BAR
|CUSTOM1              |`CUSTOM1.MIX`         |.CM1
|CUSTOM2              |`CUSTOM2.MIX`         |.CM2
|CUSTOM3              |`CUSTOM3.MIX`         |.CM3
|CUSTOM4              |`CUSTOM4.MIX`         |.CM4
</samp>
</details></td></tr></table>


<a href="#mapping"><kbd>Top</kbd></a><br>
-------
### Custom Tutorial Text
<br>

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Map}</code> ► [BASIC] ► UseCustomTutorialText<br>
<code>{Map}</code> ► [TUTORIAL] 
</samp></td><td width="120"><samp>Boolean<br>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from hifi's p-series```

Added a new map keyword `UseCustomTutorialText=` (Yes/No) under the [BASIC] section. This keyword can be used to load custom mission text strings for your map. 

If enabled the map file will be used as TUTORIAL.INI file, meaning text strings are read from the [TUTORIAL] section of the map in the same format as in TUTORIAL.INI. 

If the keyword is missing, defaults to false, and TUTORIAL.INI tutorial text strings are loaded.
</details></td></tr></table>


<a href="#mapping"><kbd>Top</kbd></a><br>
-------
### Campaign Customization
<br>

Added support for mini campaigns embedded within a map file. This feature can be used in conjunction with the custom missions dialog feature.

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Map}</code> ► [BASIC] ► NextMissionInCampaign
</samp></td><td width="120"><samp>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series```

Defines the next mission filename, inclusive of file extension (example 'scg02ea.ini').
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Map}</code> ► [BASIC] ► ScenarioNumber
</samp></td><td width="120"><samp>Integer</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series```

Determines base score multiplier at the end of the mission. Also determines default map selection screen post-mission if not overridden.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Map}</code> ► [BASIC] ► MapSelectionAnimation
</samp></td><td width="120"><samp>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series```

Defines the map selection screen, inclusive of file extension (example 'MSAB.WSA'). To use the customized map selection, ensure that `OneTimeOnly` and `EndOfGame` are false, as those settings redirect away from map selection.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Map}</code> ► [BASIC] ► MapSelectA<br>
<code>{Map}</code> ► [BASIC] ► MapSelectB<br>
<code>{Map}</code> ► [BASIC] ► MapSelectC
</samp></td><td width="120"><samp>String<br>String<br>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series```

If the mission is chosen from choices on the map, defines the next mission filename, inclusive of file extension (example 'scg02ea.ini').
</details></td></tr></table>



<a href="#mapping"><kbd>Top</kbd></a><br>
------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Mapping</kbd></kbd><br>
