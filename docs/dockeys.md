<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Documentation Guide</kbd></kbd><br>
<h2 align="center">Documentation Guide</h2>

This page provides additional context on the information displayed on other pages, in particular on INI configuration.

-------

 - [Feature Availability](#feature-availability)
 - [Modification References](#modification-references) 

-------
### Feature Availability
<br>

Most extended features can applied by setting the value on the Rules ini or the map specific ini (e.g. SCG01EA.ini). Reloading the map refreshes such values. These features are indicated with `{Rules/Map}`.

However, some features are only effective on game engine initialization, and can only be used on rules.ini. For example, some settings modify the memory heap size allocated by the game to store certain elements, which cannot be resized without resetting the game. These features are indicated with `{Rules}`.

`{Rules}` include both rules.ini and the expansion equivalent aftrmath.ini. `{Rules/Map}` includes any multiplayer spawn.ini that may be used by your choice of multiplayer client.

<samp>

|Type         |Includes  
:-------------|:-------------------------------------
|`{Rules}`    |rules.ini<br>aftrmath.ini
|`{Rules/Map}`|rules.ini<br>aftrmath.ini<br>loaded map ini<br>spawn.ini (multiplayer only)
</samp>

<a href="#documentation-guide"><kbd>Top</kbd></a><br>
-------
### Modification References
<br>

Much of the inner workings of the Red Alert game engine was unraveled by the release of the source code in the Remastered release. While not exact, the source code provides an easy reference point for the usage of internal variables, allowing easier debugging and research. The chief aim of the project is to allow prospective modders and mappers greater flexibility in their project by exposing some of the hidden or hardcoded logic into modifiable entries in the existant INI read system.

The following desciptions can be used as a reference point to its relationship with Remastered source code.

<samp>

|Icon                         |Type               |Explanation  
:-----------------------------|:------------------|:-----------------------------------
|[![](./img/30x15/ref.png)](#)|Exposed Reference  | The variable, usually defined in an internal class, is now exposed via this INI key.
|[![](./img/30x15/mod.png)](#)|Modified Reference | Modifications have been applied to the meaning or use of this variable.
|[![](./img/30x15/new.png)](#)|New Logic          | The Remastered source code does not have a reference point for this key. This may happen if original implementation is baked into game logic without the use of stored variables.
</samp>

<i>Warning: Remastered source code is not exact with legacy Red Alert. Keep this in mind if you wish to dabble into forking and modifying this project!</i>

<a href="#documentation-guide"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Documentation Guide</kbd></kbd><br>
