<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>WeaponTypes</kbd></kbd><br>
<h2 align="center">WeaponTypes</h2>

WeaponTypes represent the logical aspects of a damage-dealing object. It also includes visual and audio references to provide immersive feedback to the player.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 
 - [Negative Damage](#negative-damage) 
 - [Tesla Charge Settings](#tesla-charge-settings) 

<a href="#weapontypes"><kbd>Top</kbd></a><br>
-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


-------
### New Entries
<br>

These settings enable you to define new weapon entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [Weapons]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

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


<a href="#weapontypes"><kbd>Top</kbd></a><br>
-------
## Negative Damage
<br>

<table><tr><td width="50"><a href="#"><img title="Modified Reference" src="./img/30x15/mod.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;WeaponType&gt;] ► Damage
</samp></td><td width="120"><samp>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Modified WeaponTypeClass->Damage```

In the original game, there are hardcoded checks to restrict the use of negative damage to the Medic and the Mechanic. Moreover, the game restricts the area of effect of such weapons to 8 leptons. 

Now all weapons can deal negative damage, and the area of effect of the weapon follows the warhead spread factor. Setting `Spread=0` for the warhead restores the area effect of 8 leptons.

The mechanics of healing is not yet fully unraveled, so negative damage weapons may not work in all scenarios. For example, Units with negative damage weapons do not know to only target damaged units.
</details></td></tr></table>


<a href="#weapontypes"><kbd>Top</kbd></a><br>
-------
### Tesla Charge Settings
<br>


<table><tr><td width="50"><a href="#"><img title="New logic" src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;WeaponType&gt;] ► ChargeSound
</samp></td><td width="120"><samp>String</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

If used on a weapon with `Charges`=true, overrides the charging sound. This string must be an existing <a href="./defines.md#soundeffects">SoundEffect</a> or defined in `[SoundEffects]`. This can be used to emulate the C&C Nod Obelisk. Defaults to the charging sound of the Tesla Coil.
</details></td></tr></table>


<a href="#weapontypes"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>WeaponTypes</kbd></kbd><br>

