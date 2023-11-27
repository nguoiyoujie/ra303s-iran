[Return to Features](./features.md)

## WeaponTypes

WeaponTypes represent the logical aspects of a damage-dealing object. It includes visual and audio references to provide immersive feedback to the player.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 
 - [Tesla Charge Settings](#tesla-charge-settings) 

-------
### Documentation Guide
[Top](#weapontypes)

A guide on how to interpret the information is available [here](./dockeys.md).


-------
### New Entries
[Top](#weapontypes)

These settings enable you to define new weapon entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [Weapons]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new Weapon.

You may then create a INI section to edit their behaviour, as you would do for any existing Weapons.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[Weapons]
0=HandCannon
1=Mortar
```
</details></td></tr></table>


-------
### Tesla Charge Settings
[Top](#weapontypes)


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;WeaponType&gt;] ► ChargeSound
</td><td width="50">String</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If used on a weapon with `Charges`=true, overrides the charging sound. This string must be an existing <a href="./defines.md#soundeffects">SoundEffect</a> or defined in `[SoundEffects]`. This can be used to emulate the C&C Nod Obelisk. Defaults to the charging sound of the Tesla Coil.
</details></td></tr></table>


-------
[Return to Features](./features.md)

