[Return to Features](./features.md)

## Sounds

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 

-------
### Documentation Guide
[Top](#sounds)

A guide on how to interpret the information is available [here](./dockeys.md).


-------
### New Entries
[Top](#sounds)

These settings enable you to define new sound entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [SoundEffects]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

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


-------
[Return to Features](./features.md)

