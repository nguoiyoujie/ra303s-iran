<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Command-Line Arguments</kbd></kbd><br>
<h2 align="center">Command-Line Arguments</h2>

The patched Red Alert executable supports an extension of command-line arguments, allowing external programs to control the game's initial state.

-------
### Arguments

|Argument                  |Explanation                         
:---------------------------------------------------------------|:----------------
|`-NOTITLE`                                                     |Skips the title screen on initialization of the game.
|`-ANTMISSIONS`                                                 |Automatically opens the Ant Mission dialog upon entering the main menu screen. If combined with one mission difficulty key, the difficulty of the mission will also be automatically selected.
|`-M:<mission_file>`                                            |Automatically attempts to start a mission denoted by the name after the prefix "-M:". The name must be inclusive of extensions.
|`-ONETIME`                                                     |Automatically closes the game after returning to the menu screen from an active game. Usually used with the -M:<mission> argument to emulate spawn behaviour. If used without the -M:<mission> argument, closes the game after leaving the first loaded game.
|`-EASY`<br>`-EASY.FINE`<br>`-NORMAL`<br>`-HARD.FINE`<br>`-HARD`|Presets the difficulty of the first mission that is loaded. Usually used with the -M:<mission> and -ONETIME arguments to emulate spawn behaviour. This preset is cleared after loading a map.
|`-LAN`<br>`-INTERNET`<br>`-SKIRMISH`                           |Automatically opens the relevant dialog upon entering the main menu screen.
|`-NEWMISSIONS`                                                 |Enables the new missions button, though that does nothing since another part of the code already enables it.
|`-ATTRACT`<br>`-RECORD`<br>`-PLAYBACK`                         |*Function to be determined*


<a href="#command-line-arguments"><kbd>Top</kbd></a><br>
-------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <a href="./features.md"><kbd>Features</kbd></a> :: <kbd><kbd>Command-Line Arguments</kbd></kbd><br>
