<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>AnimTypes</kbd></kbd><br>
<h2 align="center">AnimTypes</h2>

AnimTypes represent animations (sequences of images) that can be played in the game.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#animtypes"><kbd>Top</kbd></a><br>
-------
### New Entries
<br>

These settings enable you to define new animation entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [AnimTypes]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new animations. These animations can then be used with Image=

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[AnimTypes]
0=BLUEFLAME
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [DirectionalAnimTypes]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new directional animations. These animations can then be used with Image=

For the moment the image is split into 8 directions in order N,NW,W,SW,S,SE,E,NE, each with 18 frames, the same way SAMFIRE is handled. Think of each new entry as a clone of SAMFIRE, that you can assign your own shp file to. *Note that this is not the same as MINIGUN which uses 6 frames per direction*

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[DirectionalAnimTypes]
0=CHEMSPRAY
```
</details></td></tr></table>

<a href="#animtypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>AnimTypes</kbd></kbd><br>

