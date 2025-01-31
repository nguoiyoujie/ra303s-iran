# Red Alert 3.03 "s" series

-------

 - [About the Project](#about-the-project)
 - [I Just Want To Play](#i-just-want-to-play)
 - [Building the Project](#building-the-project)
 - [Features Documentation](#features-documentation) 
 - [Changelog](#changelog) 
 - [Credits](#credits) 

-------

### About the Project

This is an extension of the "p" series by Iran, whose project this is forked
from. This extension contains several features made to extend the functions 
available to a modder or mission writer.

Of note, addition of new technotypes are possible with decent functionality, as 
well as customization of properties in rules.ini normally locked behind code.

[Link](./README_p.md) is the original Readme from the "p" series, for historicity.

-------

### I Just Want To Play

A built version, with supporting mixes and content, are hosted [here](https://github.com/nguoiyoujie/Red-Alert-Modified-Executable). 
The built mod is a test mod, hosted publicly if any one wants to look at the INI controls employed, use as a template to build their own mod, or just have a game.

There is also map editor support that caters specifically for the new logic introduced here. It is hosted [here](https://github.com/nguoiyoujie/Red-Alert-Mission-Editor).

Enjoy. :)

-------

### Building the Project

This patch uses tools released by FunkyFr3sh. The tools can be inspected in his respective repositories.

**Instructions for *nix**

1. Install [petool](https://github.com/FunkyFr3sh/petool) from github
2. Get NASM
3. Run make. This will generate `ra95-build.exe` 
4. Copy this file to a RA game directory of your choice.


**Instructions for Windows**

1. Clone or pull this repository
2. Download the minimal devkit [release](https://github.com/FunkyFr3sh/petool/releases/latest/download/w64devkit-mini-for-patching.zip).
3. Extract this devkit to `C:\\`. You should have a folder at the path `C:\\w64devkit\\bin`.*
4. Run `build.cmd` or `build_pause.cmd`
5. Copy the generated `ra95.exe` file to a RA game directory of your choice.

* You may customize where you extract the devkit. Modify `build.cmd` accordingly to point to your chosen tools location.


**Additional notes on devkit**

The devkit uses NASM 2.15.05, which has a bug where error messages do not print correct file and line numbers in #include files. You may want to replace them with NASM 2.16.01 or above to ease your debugging efforts.


**Additional Instructions for playing on windowed mode**

If you are using a resolution above 800x640, ensure that cnc-ddraw (ddraw.dll) is up to date. 
You may retrieve the latest [release](https://github.com/FunkyFr3sh/cnc-ddraw/releases/download/v7.1.0.0/cnc-ddraw.zip) from this [github](https://github.com/FunkyFr3sh/cnc-ddraw).

Alternatively, you may retrieve the files from my mod hosted [here](https://github.com/nguoiyoujie/Red-Alert-Modified-Executable) and begin your efforts from there.

-------

### Features Documentation

You may find the features documentation [here](./docs/features.md).

-------

### Changelog

You may find the changelog [here](./docs/changelog.md).

-------

### Credits

**Helpers of the current patch**

 - *tomsons26*: Sharing the 3.03 symbols list to greatly accelerate my attempts 
   to trace and map game functions in disassembly.
 - *Nyerguds*: Sharing of general knowledge, trivia and handling of some data 
   formats.
 - *iran*: Contributing some of the later discoveries, fixes to the game
   record/playback function.
 - *Testol*: Lots of testing and reporting game bugs.
 - *JackoDerp*: For introducing me to the patch and its features (especially new 
   map trigger actions) many years ago with his own campaign mission set with the 
   3.03r.

**Authors of the original patch**

*In alphabetical order*

 - hifi (3.03p)
 - iran (3.03p-iran)
 - sonarpulse

**Helpers of the original patch**

 - *CCHyper*: Sharing his vast analysed Red Alert engine database with me and
   code contributions.  Also extended the excutable with a game icon.
 - *FunkyFr3sh*: Lots of testing, suggestions, game knowledge, language packs,
   expansion maps converted to .MPR and much more. You're awesome, dude!
 - *Nyerguds*: Contributions to the patch and sharing C&C95 engine knowledge.
 - *AlexB*: Various ideas and addresses used for Arda's fixes taken from his
   Arda project. In Additional lots of information taken from the Arda manual.
 - *Allen262*: C&C95 desert and winter theater conversions, testing, map fixes,
   DOS graphics conversions, beta unit recreations, generic cameos for units
   which don't have cameos.
 - *Merri*: Started work on the desert theater conversion which Allen262
   based his finished conversion on, also made the game strings editor used
   by Iran and FunkyFr3sh for language packs and strings fixes
 - *ehy*: Suggestions and bug reporting.
 - *Lovehandles*: Testing high resolution patches for in-game LAN dialogs.
   Which took about 4 hours or so. ;-) And more helpful testing.
 - *r34ch*: Reporting map bugs and game bugs.
 - *Plotkite_Wolf*: RedAlertLauncher background image.
 - *djohe*: Making useful test maps and reporting game bugs, testing too.

