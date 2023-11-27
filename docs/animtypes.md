[Return to Features](./features.md)

## AnimTypes

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 

-------
### Documentation Guide
[Top](#animtypes)

A guide on how to interpret the information is available [here](./dockeys.md).


-------
### New Entries
[Top](#animtypes)

These settings enable you to define new animation entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [AnimTypes]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new animations. These animations can then be used with Image=

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[AnimTypes]
0=BLUEFLAME
```
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [DirectionalAnimTypes]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new directional animations. These animations can then be used with Image=

For the moment the image is split into 8 directions in order N,NW,W,SW,S,SE,E,NE, each with 18 frames, the same way SAMFIRE is handled. Think of each new entry as a clone of SAMFIRE, that you can assign your own shp file to. *Note that this is not the same as MINIGUN which uses 6 frames per direction*

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[DirectionalAnimTypes]
0=CHEMSPRAY
```
</details></td></tr></table>


-------

[Return to Features](./features.md)
