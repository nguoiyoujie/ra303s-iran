<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Warheads</kbd></kbd><br>
<h2 align="center">Warheads</h2>

Warheads contain special information for WeaponTypes, such as effectiveness against armor, explosion types, infantry kill animations and damage spread.

-------

 - [Documentation Guide](#documentation-guide)
 - [New Entries](#new-entries) 
 - [New Armor-types](#new-armor-types) 
 - [Atomic Weapons](#atomic-weapons) 


-------
### Documentation Guide
<br>

A guide on how to interpret the information is available [here](./dockeys.md).


<a href="#warheads"><kbd>Top</kbd></a><br>
-------
### New Entries
<br>

These settings enable you to define new warhead entries, expanding modding capabilities.

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules}</code> ► [Warheads]
</samp></td><td width="120"><samp>List</samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

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


<a href="#warheads"><kbd>Top</kbd></a><br>
-------
### New Armor-types
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/mod.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [&lt;Warhead&gt;]  ► Verses
</samp></td><td width="120"><samp>Percentage Array</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>
  
```Modified WarheadTypeClass->Modifier[ARMOR_COUNT]```

The number of supported types have been increased to 9, matching the first nine armortypes used in Red Alert 2. See [TechnoTypes ► New Armor-types](./technotypes.md#new-armor-types).

The first nine values will be read, to determine the warhead's effectiveness against the armortypes in order:

```
0 = None
1 = Wood
2 = Light
3 = Heavy
4 = Concrete
5 = Flak
6 = Plate
7 = Medium
8 = Steel
```

If the end of the entry is reached before the last armortype, effectiveness against remaining armortypes default to 100%.

Defaults to 100% for all armor types.
</details></td></tr></table>


<a href="#warheads"><kbd>Top</kbd></a><br>
-------
### Atomic Weapons
<br>

<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [General]  ► UseAtomWhiteScreenEffectInMP
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series)```

Normally, detonating a nuke flashes a white screen in single-player maps. This is suppressed in multiplayer. Toggling this option re-enables it.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [General]  ► UseSinglePlayerAtomDamage
</samp></td><td width="120"><samp>Boolean</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

```Inherited from iran's r-series)```

Atom damage is generally reduced in multiplayer battles. Toggle this on to use singleplayer values.
</details></td></tr></table>


<table><tr><td width="50"><a href="#"><img src="./img/30x15/new.png"></a></td><td width="842"><samp>
<code>{Rules/Map}</code> ► [General]  ► AtomRadius
</samp></td><td width="120"><samp>Integer</a></samp></td></tr><tr><td colspan="3"><details><summary><b>View</b></summary>

The radial range of nuclear warheards in the scenario, not including the center cell. Effectively the blast covers a square area of `AtomRadius * 2 + 1`. 

Note that due to a bug in the original game, damage decreases in strength closer to the center; the lack of smudges will become apparent above range 40.
</details></td></tr></table>


<a href="#warheads"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Warheads</kbd></kbd><br>

