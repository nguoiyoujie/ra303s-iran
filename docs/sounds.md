<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Sounds</kbd></kbd><br>
<h2 align="center">Sounds</h2>

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#sounds"><kbd>Top</kbd></a><br>
-------
### New Entries
<br>

These settings enable you to define new sound entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [SoundEffects]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new Sound Effects.

Sounds that are not part of the base game, should be listed here.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[SoundEffects]
0=BAZOOK1
1=GUN13
```
</details></td></tr></table>


<a href="#sounds"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Sounds</kbd></kbd><br>

