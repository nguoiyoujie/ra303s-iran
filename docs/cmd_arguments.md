[Return to Features](./features.md)

## Executable Argument Features ##

The patched Red Alert executable supports an extension of command-line arguments, allowing external programs to control the game's initial state.

-------

### Arguments ###


**`-NOTITLE`**

Skips the title screen on initialization of the game.



**`-ANTMISSIONS`**

Automatically opens the Ant Mission dialog upon entering the main menu screen. If combined with one mission difficulty key, the difficulty of the mission will also be automatically selected.



**`-M:<mission_file>`**

Automatically attempts to start a mission denoted by the name after the prefix "-M:". The name must be inclusive of extensions.



**`-ONETIME`**

Automatically closes the game after returning to the menu screen from an active game. Usually used with the -M:<mission> argument to emulate spawn behaviour. If used without the -M:<mission> argument, closes the game after leaving the first loaded game.



**`-EASY`**
**`-EASY.FINE`**
**`-NORMAL`**
**`-HARD.FINE`**
**`-HARD`**

Presets the difficulty of the first mission that is loaded. Usually used with the -M:<mission> and -ONETIME arguments to emulate spawn behaviour. This preset is cleared after loading a map.



**`-LAN`**
**`-INTERNET`**
**`-SKIRMISH`**

Automatically opens the relevant dialog upon entering the main menu screen.



**`-NEWMISSIONS`**

Enables the new missions button, though that does nothing since another part of the code already enables it.



**`-ATTRACT`**
**`-RECORD`**
**`-PLAYBACK`**

*Function to be determined*

