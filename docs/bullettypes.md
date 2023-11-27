[Return to Features](./features.md)

## BulletTypes

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 

-------
### Documentation Guide
[Top](#bullettypes)

A guide on how to interpret the information is available [here](./dockeys.md).


-------
### New Entries
[Top](#bullettypes)

These settings enable you to define new animation entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [BulletTypes]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new BulletTypes.

You may then create a INI section to edit their behaviour, as you would do for any existing BulletType.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[BulletTypes]
0=HeatSeekerAA
```
</details></td></tr></table>


-------
[Return to Features](./features.md)
