[Return to Features](./features.md)

## AnimTypes

-------

 - [Feature Availability](#feature-availability)
 - [Modification References](#modification-references) 
 - [New Entries](#new-entries) 

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

These settings enable you to define new animation entries, expanding modding capabilities.

<details>
  <summary><b><code>{Rules} ► [AnimTypes]</code></b></summary>

```New logic```

This section carries a zero-based list of IDs to be recognized as new animations. These animations can then be used with Image=

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[AnimTypes]
0=BLUEFLAME
```

</details>

<details>
  <summary><b><code>{Rules} ► [DirectionalAnimTypes]</code></b></summary>

```New logic```

This section carries a zero-based list of IDs to be recognized as new directional animations. These animations can then be used with Image=

For the moment the image is split into 8 directions in order N,NW,W,SW,S,SE,E,NE, each with 18 frames, the same way SAMFIRE is handled. Think of each new entry as a clone of SAMFIRE, that you can assign your own shp file to. *Note that this is not the same as MINIGUN which uses 6 frames per direction*

Care must be taken that the list keys follow the zero-based index exactly. Duplicate keys (e.g. two '0='), or missing keys, may crash the game at boot. The requirement for strict ordering may change in the future.

Example as follows:

```ini
[DirectionalAnimTypes]
0=CHEMSPRAY
```

</details>


