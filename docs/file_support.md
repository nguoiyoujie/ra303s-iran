<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>File Support</kbd></kbd><br>
<h2 align="center">File Support</h2>

This section covers information on the support for loading additional files.

-------

 - [Supported Mix Files](#supported-mix-files)
 - [The Lost Files](#the-lost-files)
 - [Sneak Preview Movies](#sneak-preview-movies)

-------
### Supported Mix Files
<br>

Additional mix files will be loaded into the game.

<table><tr><td width="1012"><samp>
Mix Load Order
</samp></td></tr><tr><td><details><summary><b>View</b></summary>
  
```Inherited from iran's r-series```

The game will load the following MIX files in approximate order (***to be verified***). 

Originally supported MIX files are included in the table (sourced by Westwood). MIX files may be embedded in other MIX files.

A modder may have to source some of the mix files from the community.

<samp>

|File                                            |Source
|:-----------------------------------------------|:----------------------------
|`main.MIX`                                      |Westwood
|`redalert.MIX`                                  |Westwood
|`campaign.MIX`                                  |optional expansion container
|`aftermath.MIX`                                 |optional expansion container
|`counterstrike.MIX`                             |optional expansion container
|`movies-tlf.MIX`                                |[The Lost Files](#the-lost-files) movies compiled by Nyerguds
|`movies-10.MIX`                                 |optional movie container
|`movies-9.MIX`                                  |optional movie container
|`movies-8.MIX`                                  |optional movie container
|`movies-7.MIX`                                  |optional movie container
|`movies-6.MIX`                                  |optional movie container
|`movies-5.MIX`                                  |optional movie container
|`movies-4.MIX`                                  |optional movie container
|`movies-3.MIX`                                  |optional movie container
|`movies-2.MIX`                                  |optional movie container
|`movies-1.MIX`                                  |optional movie container
|`oos-fix.MIX`                                   |[OOS Fix](./fixes.ini#desync-fixes) by FunkyFr3sh
|Any file matching `sc*.MIX`                     |Westwood (Expansion pack container)
|Any file matching `ss*.MIX`                     |Westwood (Expansion pack container)
|`expand9.MIX`                                   |optional expansion container
|`expand8.MIX`                                   |optional expansion container
|`expand7.MIX`                                   |optional expansion container
|`expand6.MIX`                                   |optional expansion container
|`expand5.MIX`                                   |optional expansion container
|`expand4.MIX`                                   |optional expansion container
|`expand3.MIX`                                   |optional expansion container
|`expand2.MIX`                                   |Westwood (Expansion pack container)
|`expand.MIX`                                    |Westwood (Expansion pack container)
|`smallinfantry.MIX`                             |[Visual Overrides](./redalert_ini.md#visual-overrides)
|`germanlanguagepack.MIX`                        |[Language pack](./redalert_ini.md#language-support)
|`germancensoredlanguagepack.MIX`                |[Language pack](./redalert_ini.md#language-support)
|`germanuncensoredlanguagepack.MIX`              |[Language pack](./redalert_ini.md#language-support)
|`spanishlanguagepack.MIX`                       |[Language pack](./redalert_ini.md#language-support)
|`frenchlanguagepack.MIX`                        |[Language pack](./redalert_ini.md#language-support)
|`italianlanguagepack.MIX`                       |[Language pack](./redalert_ini.md#language-support)
|`betateslatank.MIX`                             |[Visual Overrides](./redalert_ini.md#visual-overrides) by Nyerguds
|`betadestroyer.MIX`                             |[Visual Overrides](./redalert_ini.md#visual-overrides) by Allen262
|`betasubmarine.MIX`                             |[Visual Overrides](./redalert_ini.md#visual-overrides) by Allen262
|`betacruiser.MIX`                               |[Visual Overrides](./redalert_ini.md#visual-overrides) by Allen262
|`betagunboat.MIX`                               |[Visual Overrides](./redalert_ini.md#visual-overrides) by Allen262
|`hires1.MIX`                                    |Westwood (Expansion pack file)
|`lores1.MIX`                                    |Westwood (Expansion pack file)
|`general.MIX`                                   |Westwood
|`local.MIX`                                     |Westwood
|`hires.MIX`                                     |Westwood
|`lores.MIX`                                     |Westwood
|`nchires.MIX`                                   |Westwood
|`conquer.MIX`                                   |Westwood
|`russian.MIX`                                   |Westwood
|`allies.MIX`                                    |Westwood
|`snow.MIX`                                      |Westwood (Theater asset container)
|`interior.MIX`                                  |Westwood (Theater asset container)
|`temperat.MIX`                                  |Westwood (Theater asset container)
|`desert.MIX`                                    |Terrain Expansion pack by Merri, Allen262 & Tschokky
|`winter.MIX`                                    |Terrain Expansion pack by Allen262
|`jungle.MIX`                                    |Terrain Expansion pack by Tschokky
|`cave.MIX`                                      |Terrain Expansion pack by Tschokky
|`barren.MIX`                                    |Terrain Expansion pack by Tschokky
|`custom1.MIX`                                   |Optional terrain expansion
|`custom2.MIX`                                   |Optional terrain expansion
|`custom3.MIX`                                   |Optional terrain expansion
|`custom4.MIX`                                   |Optional terrain expansion
|`movies1.MIX`                                   |Westwood
|`movies2.MIX`                                   |Westwood
|`scores.MIX`                                    |Westwood
|`sounds.MIX`                                    |Westwood
|`speech.MIX`                                    |Westwood
</samp>
</details></td></tr></table>


<a href="#file-support"><kbd>Top</kbd></a><br>
-------
### The Lost Files
<br>

```Inherited from iran's r-series```

The game now supports loading The Lost Files movies compiled by Nyerguds. This takes effect if the `movies-tlf.MIX` file is present in the game directory.


<a href="#file-support"><kbd>Top</kbd></a><br>
-------
### Sneak Preview Movies
<br>

```Inherited from iran's r-series```

The game will now load and play `sizzle3.vqa`, `sizzle4.vqa` and `introx.vqa` in the sneak preview menu if they are found in any mix file.


<a href="#file-support"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>File Support</kbd></kbd><br>
