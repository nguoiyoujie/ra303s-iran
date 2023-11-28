<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>BulletTypes</kbd></kbd><br>
<h2 align="center">BulletTypes</h2>

BulletTypes represent projectiles that are emitted from WeaponTypes. They apply their effect on reaching the target or expire by other means.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#bullettypes"><kbd>Top</kbd></a><br>
-------
### New Entries
<br>

These settings enable you to define new animation entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [BulletTypes]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new BulletTypes.

You may then create a INI section to edit their behaviour, as you would do for any existing BulletType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[BulletTypes]
0=HeatSeekerAA
```
</details></td></tr></table>


<a href="#bullettypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>BulletTypes</kbd></kbd><br>
