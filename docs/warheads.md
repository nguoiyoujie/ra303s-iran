[Return to Features](./features.md)

## Warheads

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 
 - [New Armor-types](#new-armor-types) 
 - [Atomic Weapons](#atomic-weapons) 

-------
### Documentation Guide
[Top](#warheads)

A guide on how to interpret the information is available [here](./dockeys.md).


-------
### New Entries
[Top](#warheads)

These settings enable you to define new warhead entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules}</code> ► [Warheads]
</td><td width="50">List</td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

This section carries a zero-based list of IDs to be recognized as new Warheads.

You may then create a INI section to edit their behaviour, as you would do for any existing Warheads.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[Warheads]
0=SA_BIG_SPREAD
1=HE_BIG_SPREAD
```
</details></td></tr></table>


-------
### New Armor-types
[Top](#warheads)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/eaa140/531?text=mod"></a></td><td>
<code>{Rules/Map}</code> ► [&lt;Warhead&gt;]  ► Verses
</td><td width="50">Percentage Array</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Modified WarheadTypeClass->Modifier[ARMOR_COUNT]```

The number of supported types have been increased to 9, matching the first nine armortypes used in Red Alert 2. See [TechnoTypes ► New Armor-types](./technotypes.md#new-armor-types).

The first nine values will be read, to determine the warhead's effectiveness against the armortypes in order:

 > 0 = None\
 > 1 = Wood\
 > 2 = Light\
 > 3 = Heavy\
 > 4 = Concrete\
 > 5 = Flak\
 > 6 = Plate\
 > 7 = Medium\
 > 8 = Steel

Defaults to 100% for all armor types.
</details></td></tr></table>


-------
### Atomic Weapons
[Top](#warheads)

<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [General]  ► UseAtomWhiteScreenEffectInMP
</td><td width="50">Boolean</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series)```

Normally, detonating a nuke flashes a white screen in single-player maps. This is suppressed in multiplayer. Toggling this option re-enables it.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [General]  ► UseSinglePlayerAtomDamage
</td><td width="50">Boolean</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series)```

Atom damage is generally reduced in multiplayer battles. Toggle this on to use singleplayer values.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="https://placehold.it/30x15/6cb189/135?text=new"></a></td><td>
<code>{Rules/Map}</code> ► [General]  ► AtomRadius
</td><td width="50">Integer</a></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The radial range of nuclear warheards in the scenario, not including the center cell. Effectively the blast covers a square area of `AtomRadius * 2 + 1`. 

Note that due to a bug in the original game, damage decreases in strength closer to the center; the lack of smudges will become apparent above range 40.
</details></td></tr></table>


-------
[Return to Features](./features.md)

