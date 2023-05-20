## Warheads

-------

 - [Feature Availability](#feature-availability)
 - [Modification References](#modification-references) 
 - [New Entries](#new-entries) 
 - [New Armor-types](#new-armor-types) 
 - [Atomic Weapons](#atomic-weapons) 

-------

### Feature Availability

Most extended features can applied by setting the value on the Rules ini or the map specific ini (e.g. SCG01EA.ini). Reloading the map refreshes such values. These features are indicated with `{Rules/Map}`.

However, some features are only effective on game engine initialization, and can only be used on rules.ini. For example, some settings modify the memory heap size allocated by the game to store certain elements, which cannot be resized without resetting the game. These features are indicated with `{Rules}`.

`{Rules}` include both rules.ini and aftrmath.ini. `{Rules/Map}` includes any multiplayer spawn.ini that may be used by your choice of multiplayer client.

-------

### Modification References

Much of the inner workings of the Red Alert game engine was unraveled by the release of the source code in the Remastered release. While not exact, the source code provides an easy reference point for the usage of internal variables, allowing easier debugging and research. The chief aim of the project is to allow prospective modders and mappers greater flexibility in their project by exposing some of the hidden or hardcoded logic into modifiable entries in the existant INI read system.

The following desciptions can be used as a reference point to its relationship with Remastered source code.

 - ```Exposed <Reference>```
   
   The variable, usually defined in an internal class, is now exposed via this INI key.

 - ```Modified <Reference>```
   
   Modifications have been applied to the meaning or use of this variable.

 - ```New logic```

   The Remastered source code does not have a reference point for this key. This may happen if original implementation is baked into game logic without the use of stored variables.

Warning: Remastered source code is not exact with legacy Red Alert. Keep this in mind if you wish to dabble into forking and modifying this project!

-------

### New Entries

These settings enable you to define new warhead entries, expanding modding capabilities.

<details>
  <summary><b><code>{Rules} ► [Warheads]</code></b></summary>

```New logic```

This section carries a zero-based list of IDs to be recognized as new Warheads.

You may then create a INI section to edit their behaviour, as you would do for any existing Warheads.

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

**[Warheads]**\
0=SA_BIG_SPREAD\
1=HE_BIG_SPREAD

</details>

-------

### New Armor-types

<details>
  <summary><b><code>{Rules/Map} ► [&lt;Warhead&gt;] ► Verses (comma-delimited list of percentage values)</code></b></summary>
  
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

</details>

-------

### Atomic Weapons

<details>
  <summary><b><code>{Rules/Map} ► [General] ► UseAtomWhiteScreenEffectInMP (boolean)</code></b></summary>

```New logic (inherited from 'p' patch)```

Normally, detonating a nuke flashes a white screen in single-player maps. This is suppressed in multiplayer. Toggling this option re-enables it.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [General] ► UseSinglePlayerAtomDamage (boolean)</code></b></summary>

```New logic (inherited from 'p' patch)```

Atom damage is generally reduced in multiplayer battles. Toggle this on to use singleplayer values.

</details>

<details>
  <summary><b><code>{Rules/Map} ► [General] ► AtomRadius (integer)</code></b></summary>

```New logic```

The radial range of nuclear warheards in the scenario, not including the center cell. Effectively the blast covers a square area of `AtomRadius * 2 + 1`. 

Note that due to a bug in the original game, damage decreases in strength closer to the center; the lack of smudges will become apparent above range 40.

</details>

