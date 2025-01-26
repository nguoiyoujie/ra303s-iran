<a href="../README.md"><kbd>ra303s</kbd></a> :: <kbd><kbd>Changelog</kbd></kbd><br>
<h2 align="center">Changelog</h2>

Changelog entries built before 25 January 2025 are compiled from commit logs since the creation of the RA3.03p patching project by Iran, so they may appear less organized.

-------

 - [RA303s](#ra303s)
 - [RA303p-fork](#RA303p-fork)
 - [RA303p-GIT](#ra303p-GIT)
 - [RA303p-iB2](#ra303p-iB2)
 - [RA303p-iB1v1](#ra303p-iB1v1)
 - [RA303p-iran](#ra303p-iran)

-------
### RA303s
<br>

The project is renamed RA3.03s to show a greater distinction from RA3.03p<br>
In-game, the version "303s r" and the GIT verision and commit number can still be seen on the main menu dialog.

Primary: Lovalmidas<br>
Credits: See the <a href="../README.md/#credits">main page</a> for the full credit list 

-------
2025-01-23

- 2025-01-23: Pressing Home key will now center around any construction yard (`FactoryType`=BuildingTypes) or deployer unit (`DeploysInto`=), instead of just FACT or MCV
- 2025-01-22: Enchanced [`HouseClass`] Country. The INI key now accepts both numerals and house names. (e.g. GREECE)
- 2025-01-22: Enchanced [`HouseClass`] Color / SecondaryColorScheme. The INI key now accepts both numerals and color names (e.g. BLUE)
- 2025-01-22: Implement [`HouseTypeClass`] HeliUnit and MCVUnit, for house-specific spawn controls 
- 2025-01-22: Refactor and packing `HouseClass` variables
- 2025-01-21: Implement ScalePowerBar, allowing the power bar to be scaled with increasing power, preserving its effectiveness even at high power
- 2025-01-21: Fix WW bug where Capacity and Drain may be deducted from a house even if it had not been first granted to the house 
- 2025-01-21: Doucmentation revisions
- 2025-01-21: Implement [`UnitTypeClass`] UseSecondaryColor for customizable Primary/Secondary color selections
- 2025-01-21: Update AI_Aircraft(). AI will now build any combat aircraft that it is allowed to build, not just Migs/Yaks/Longbows/Hinds.
- 2025-01-21: Implement [`AI`] PowerEmergencyMinimum to control when AI will sell buildings to restore power 
- 2025-01-21: Implement [`AI`] PowerExcess to control when AI will sell power plants
- 2025-01-21: Implement [`UnitTypeClass`] IsHarvest for new harvester unit types
- 2025-01-21: Implement [`BuildingTypeClass`] IsRefinery, IsSilo, IsHelipad, IsAirfield, IsRepairPad for building role customizations
- 2025-01-21: Implement [`UnitTypeClass`] [`VesselTypeClass`] ResponseHarvest, ResponseEnter, ResponseDeploy for more custom voices

-------
2025-01-02

- 2025-01-02: Implement [`UnitTypeClass`] TurretOffset
- 2025-01-02: Fix new AutoBase AI Airfield spam
- 2025-01-02: Revise AI_Unit(), implement [`UnitTypeClass`] AIBuildWeight, AIBuildLimit for full customization of skirmish AI unit building
- 2025-01-02: Revise AI_Infantry(), implement [`InfantryTypeClass`] AIBuildWeight, AIBuildLimit for full customization of skirmish AI infantry building
- 2025-01-02: Continue replacement efforts for `HouseClass` xScan and xQuantity
- 2025-01-02: Show power pips on any ally or spied power-production building
- 2025-01-02: Implement RepairConstructedBuildingsInSingleplayer, allowing AI to repair buildings with RepairSell in singleplayer
- 2024-12-31: Implement GuardAreaLoadTransportsInSingleplayer, allowing AI to automatically load Guard/GuardArea infantry into transports in singleplayer
- 2024-12-31: AI will now automatically load infantry into any available land transport in skirmish/multiplayer, instead of just the APC and Phase Tranpsort
- 2024-12-31: Implement new AutoBase AI AI_Building(), and INI controls [`BuildingTypeClass`] AIBuildType, AIBuildLimit for full customization of skirmish AI base building
- 2024-12-31: (Experimental) Implement [`UnitTypeClass`] Waterbound, which allows the unit to drive in water
- 2024-12-31: Implement [`UnitTypeClass`] HasAPCDoor, AmmoImageCount, AmmoTurretCount for proper APC door stages, and ammo visuals (V2RL, SSM)
- 2024-12-28: Fix flawed Map Resize trigger action leading to errant map IsVisible array, causing helis to behave as though it is still in shroud and corpses to flicker.
- 2024-12-28: Increase INI line buffer from 128 to 1024 characters
- 2024-12-27: Fix Building ID > 127 data corruption issues again
- 2024-12-26: Replace .dat file with file closer to original RA95 3.03p
- 2024-12-26: Begin mapping efforts for `HouseTypeClass`
- 2024-12-26: Implement [`AircraftTypeClass`] ResponseSelect, ResponseMove, ResponseAttack for custom voices
- 2024-12-25: Trigger Event 'All Destroyed...' and 'Buildings Destroyed...' checks no longer check for BuildingTypes with Insignificant=yes 
- 2024-12-25: Begin replacement efforts for the mammoth `HouseClass` xScan and xQuantity arrays to cater to up to 256 of each techno type, so as to avoid buffer overflows
- 2024-12-25: Begin mapping efforts for `HouseClass`
- 2024-12-25: Fix SAM site check
- 2024-12-25: Infantry will no longer die multiple times when fired with weapons that trigger different death animations
- 2024-12-25: Implement [`UnitTypeClass`] [`VesselTypeClass`] ResponseSelect, ResponseMove, ResponseAttack for custom voices

-------
2024-12-21

- 2024-12-21: Update credits :)
- 2024-12-21: Implement [`InfantryTypeClass`] DeathReport, DeathReport1 to DeathReport5 and [`General`] DeathReport, TanyaDeathReport, DogDeathReport, DeathReport1 to DeathReport5 defaults for custom death voices
- 2024-12-21: Increase internal INI value read buffer from 256 to 1024 characters
- 2024-12-20: Dehardcode [`HouseTypes`] to add Multi9-Multi20, for a total of 32 `HouseTypes`
- 2024-12-20: Implement [`InfantryTypeClass`] ResponseSelect, ResponseMove, ResponseAttack, ResponseInvade for custom voices
- 2024-12-20: Implement fully customizable [`InfantryTypeClass`] DoControls for configuring stages
- 2024-12-03: Implement [`BuildingTypeClass`] SpreadExplosionDamage, SpreadExplosionWarhead for barrel explosion controls
- 2024-12-02: Implement new Trigger Action - Reinforce (spawn directly at waypoint)
- 2024-12-02: Support handling of multiple buildings in the same cell - redraw overlay, and avoid crash

-------
2024-11-28

- 2024-11-28: Implement [`General`] FixWideAreaDamage to fix the inverse damage application to the Nuke weapon
- 2024-11-28: Begin locking maximum TechnoType IDs to 255

-------
2024-11-18

- 2024-11-18: Organization and refactoring
- 2024-11-18: Country multiplier biases now also apply to singleplayer games
- 2024-11-18: Crusier and Missile Subs can now target ships
- 2024-11-18: Fix playback fix (Credit: Iran)
- 2024-11-18: Fix corrupted load game logic
- 2024-11-18: Allow multiplayer toggles NoScreenShake, NoTeslaZapEffectDelay, BuildOffAlly to affect singleplayer maps

-------
2024-06-22

- 2024-06-22: (Experiment) CellClass dehardcoding
- 2024-06-22: Implement [`ObjectTypeClass`] Insignificant and Selectable
- 2024-06-22: Fix garbage values from prerequisite system
- 2024-06-22: Implement new ballistic scatter 
- 2024-06-22: Revise singleplayer AI prerequisite checks 
- 2024-06-22: Fix radar crash 
- 2024-06-22: Begin support for more than 128 `BuildingTypeClass`, up to a maximum of 255
- 2024-06-22: Preparation: SpecialType.CHRONO2 changed from 8 to 0xFE for future accomodation of new SpecialTypes
- 2024-06-22: Update build script to handle build errors
- 2024-06-22: Fix crash if refresh cells exceeded an internal buffer
- 2024-06-22: Fix crash if map triggers have invalid teams

-------
2024-03-08

- 2024-03-08: Entering a transport can now trigger 'Entered by...' trigger events

-------
2023-11-29

- 2023-11-27 - 2023-11-29: Revise documentation 
- 2023-11-27: Implement [`VesselTypeClass`] TurretFireOffset, PrimaryOffset, VerticalOffset customizations for naval ships' firing offsets
- 2023-11-26: Implement use of `NOICON.SHP` for objects with missing cameo icons.
- 2023-11-19 - 2023-11-26: Continue refactoring and cleanup
- 2023-11-17: Fix 'silos needed' and 'low power' checks
- 2023-11-04: Implement [`BuildingTypeClass`] UndeploysInto for customizable undeploy-to-unit logic
- 2023-11-01 - 2023-11-04: Continue refactoring and cleanup
- 2023-10-29: Implement [`VesselTypeClass`] HasSecondTurret, TurretName, TurretOffset, TurretAdjustY customizations for naval ships' turrets
- 2023-10-29: Implement [`UnitTypeClass`] AmmoReloadRate, AmmoReloadAmount customizations for unit reload
- 2023-10-29: Implement [`BuildingTypeClass`] CustomFoundationList, a better alternative to dehardcoding OccupyList and OverlapList
- 2023-10-29: Fix `SoundEffects`... again
- 2023-10-29: Fix occupy cell list for C&C Hand of Nod... again

-------
2023-06 Refactors

- 2023-06-21: Revise build script
- 2023-06-21: Refactoring Part 3, adding headers and descriptors to source ASM files
- 2023-06-14: Refactoring Part 2
- 2023-06-04: Begin refactoring, moving variable stores, replacing addresses and values with labels, etc.

-------
2023-05-30

- 2023-05-30: AI Helicarriers can now auto-acquire targets
- 2023-05-30: (Experimental) remove StrayDistance check in first pathing to target
- 2023-05-30: AI can use Medics and Mechanics
- 2023-05-30: Implement extra theaters: BARREN and CAVE


<a href="#changelog"><kbd>Top</kbd></a><br>
-------
### RA303p-fork
<br>

Iran's project was forked in 2022 July by lovalmidas, who continued the project, armed with the Remastered source code.<br>
In-game, the version "303p r" and the GIT verision and commit number can still be seen on the main menu dialog.

Each build complete version is denoted by a 'Build' commit. Sections will be categorized by these commits

This represents a breakaway point from CnCNet's adaptation of Iran's patch. Desync avoidance from past versions are no longer guaranteed.

Primary: Lovalmidas

-------
2023-05-21

- 2023-05-20: Change [`General`] AtomRange to [`General`] AtomRadius
- 2023-05-20: New technotypes will default to 'Civilian' and 'Civilian Building' names
- 2023-05-19: Implement [`UnitTypeClass`] DeploysInto for customizable deploy-to-building logic
- 2023-05-18: Revise War Factory building defaults
- 2023-05-18: Implement new Trigger Action - Set Map Dimensions
- 2023-05-18: AutoBase AI will now check [`Base`] Owner to verify the correct house
- 2023-05-18: Revise GDI Weapons Factory tracks and facing implementation
- 2023-05-18: Building with weapons can adopt [`BuildingTypeClass`] IsJammable to suppress firing
- 2023-05-18: New heli transports face north when landing
- 2023-04-11: Implement prerequisite defaults
- 2023-04-11: Revert [2022-07-01: (Experimental) Implement modified projectile scatter behavior]
- 2023-04-07: Revise [`AnimTypes`] and [`DirectionalAnimTypes`]
- 2023-04-03: Fix `SoundEffects` Where and Priority
- 2023-04-02: Implement [`WeaponTypeClass`] WarFactoryExitFacing and WarFactoryExitTrack for the GDI Weapons Factory
- 2023-04-02: Fix occupy cell list for C&C Hand of Nod
- 2023-04-02: Implement [`WeaponTypeClass`] ChargeReport for Tesla Coil charge sfx
- 2023-04-02: Fix new Prerequisite system
- 2023-04-02: Fix Fake War Factory door
- 2023-04-01: Fix `SoundEffects` crash
- 2023-03-30: Revise AI_Infantry() bugs

-------
2023-01-19

- 2023-01-19: Implement ability to add new [`AnimTypes`] types, and [`DirectionalAnimTypes`] types for 8-directional animations
- 2023-01-19: Revised new Prerequisite system to be more compatible with original prerequisite system
- 2023-01-19: Implement War Factory door controls: [`BuildingTypeClass`] WarFactoryOverlayAnim, WarFactoryOverlayFrames, WarFactoryOverlayRate
- 2023-01-19: Fix occupy cell list for C&C Hand of Nod and Weapons Factory
- 2022-11-27: Fix ArmorTypes
- 2022-11-26: Implement [`BuildingTypeClass`] SpecialWeapons
- 2022-11-26: Implement new Prequisite (Prequisite + PrequisiteType) system to handle groups, [`BuildingTypeClass`] PrerequisiteType
- 2022-11-26: Fix `SoundEffects` incorrect struct padding bug leading to glitched music playback
- 2022-11-26: Fix `BuildingTypeClass` Power/Drain override bug
- 2022-11-26: Implement [`TechnoTypeClass`] DeathWeapon
- 2022-11-24: Implement [`UnitTypeClass`] IsNoSmoke, TurretAdjustX, TurretAdjustY, TurretFrameStart, TurretFrameCount
- 2022-11-24: Implement [`BuildingTypeClass`] IsJammable, IsRadar
- 2022-11-24: Merge `TechnoTypeClass` Risk and Reward into Points

-------
2022-11-12

- 2022-11-12: Delay black screen
- 2022-11-12: Implement command line arguments `-ONETIME`, `-EASY`, `FINE.EASY`, `NORMAL`, `FINE.HARD`, `HARD`, and direct load into specific mission
- 2022-11-12: Parabombs use IsDropping= instead of IsParachute=. Allow dropping of bombs without parachutes like the GDI A-10
- 2022-11-12: Paratroopers and Parabombs now use the paradrop weapon's range to start dropping their load. 
- 2022-11-12: Dehardcode Mig/Yak interaction with Airfields by checking for IsFixedWing= 
- 2022-11-12: AI_Infantry() now handles new infantry types in Team creation
- 2022-11-12: Remove hardcoded Allies / Soviet ownership to allow true ownership by any country
- 2022-11-12: Implement stringtable support for Names of new technotypes via [`StringTableOffsets`]
- 2022-11-12: Implement [`General`] AtomRange
- 2022-11-12: Begin mapping efforts for `AbstractTypeClass`, `AircraftTypeClass`, `BuildingTypeClass`, `InfantryTypeClass`, `ObjectTypeClass`, `TechnoTypeClass`, `UnitTypeClass`, `VesselTypeClass`, `WarheadTypeClass`, `WeaponTypeClass`

-------
2022-07-08

- 2022-07-08: Primary buildings with Construction Yard logic (`FactoryType`=BuildingTypes) will play its active animation
- 2022-07-08: Begin dehardcoding `AircraftTypeClass`, `BuildingTypeClass`, `InfantryTypeClass`, `TechnoTypeClass`, `UnitTypeClass` properties into ini keys
- 2022-07-04: Reenable helipad NCO fix
- 2022-07-04: Implement [AI] SingleplayerAIObeyPrerequisites
- 2022-07-01: Add docs from CnCNet forums
- 2022-07-01: (Experimental) Implement modified projectile scatter behavior
- 2022-07-01: Support two new colors - True Gray and Dirty Green
- 2022-07-01: Remove WW optimization of map unshrouding leading to shrouded areas in the inner reveal range
- 2022-07-01: Implement AI_Infantry() extensions
- 2022-07-01: Unhardcode BuildingTypes with templates such as [Building1x1Types], [Building1x1TurretTypes], [Building1x1HighTypes], etc.
- 2022-07-01: Autobase AI will respect Prerequisites for production
- 2022-07-01: Implement AI_Unit() extensions


<a href="#changelog"><kbd>Top</kbd></a><br>
-------
### RA303p-GIT
<br>

Version change on 2014-01-21, inherits RA303p-iB2.<br>
In-game, the version "303p r" and the GIT verision and commit number can be seen on the main menu dialog.

Primary: Iran

-------
2015-06

- 2015-06-26: Allow TeamTypes to use BuildingTypes

-------
2014-08

- 2014-08-13: Game freeze when randomizing a song from empty list fix

-------
2014-04

- 2014-04-19: Implement extra theater: JUNGLE
- 2014-04-19: Call Load_Settings() earlier
- 2014-04-05: Revise SecondaryColorScheme

-------
2014-01

- 2014-01-21: Likely the remainder of spawner implementation had been done between 2013-04 and 2014-01
- 2014-01-21: Major re-organization, including a different build setup


<a href="#changelog"><kbd>Top</kbd></a><br>
-------
### RA303p-iB2
<br>

Version change on 2013-04-02, inherits RA303p-iB1v1.<br>
In-game, the version "303p-i Beta2" can be seen on the main menu dialog.

Primary: Iran<br>
Credits: hifi, CCHyper, FunkyFr3sh, Nyerguds, AlexB

-------
2013-04

- 2013-04-19: Restore missing files
- 2013-04-19: Implement spawn.mix and spawn.xdp handling
- 2013-04-18: Implement AllyTheNeutralHouse
- 2013-04-18: Implement spawner handling
- 2013-04-18: Implement GNRL voice fix
- 2013-04-18: Fix Country > 9 sidebar crash
- 2013-04-18: Implement [HouseType] Colour and Country
- 2013-04-17: When max units is reached, scold the player instead of graying out the sidebar
- 2013-04-17: Include War Factory check for AI techup to Radar Dome
- 2013-04-17: Reset credits display when loading new game
- 2013-04-06: Remove several glitch fixes from multiplayer to avoid desyncs
- 2013-04-05: AI paranoid controls nw default to disabled in Skirmish, with ComputerParanoidForceDisabledSkirmish to reenable it
- 2013-04-05: Skirmish games now ends if all remaining houses are in the same alliance 
- 2013-04-03: Remove side information from skirmish savegames
- 2013-04-02: Implement ForceAMUnitsInMissions, UseBetaDestroyer, UseBetaCruiser, UseBetaSubmarine, UseBetaGunboat
- 2013-04-02: Version number "303p-i Beta2" is updated in the game


<a href="#changelog"><kbd>Top</kbd></a><br>
-------
### RA303p-iB1v1
<br>

Version change on 2013-02-13, inherits RA303p-iran. This marks the first time the version number is written into the game<br>
In-game, the version "303p-i Beta1v1" can be seen on the main menu dialog

Primary: Iran<br>
Credits: hifi, CCHyper, FunkyFr3sh, Nyerguds, AlexB

-------
2013-03

- 2013-03-31: Fix cursor bug
- 2013-03-31: Remove any lingering chrono vortex when loading new game
- 2013-03-30: Implement skirmish savegames
- 2013-03-30: Fix wrong error message in exception handling
- 2013-03-14: Game difficulty no longer manipulates game speed 
- 2013-03-14: Revise mouse-scrolling implementation
- 2013-03-08: Missing icons and graphics fix 
- 2013-03-08: Invisible explosion fix
- 2013-03-07: Implement harvest nearest ore
- 2013-03-07: Fix score screen text color glitch
- 2013-03-07: Fix magic build glitch
- 2013-03-07: Fix Engineer Q move freeze glitch
- 2013-03-07: Fix building crew in impassable terrain
- 2013-03-07: Fix score animation crash
- 2013-03-07: Begin AI_Vessels implementation
- 2013-03-03: Submarine no longer are forced to decloak in singleplayer missions
- 2013-03-03: Fix Infantry fire range bug
- 2013-03-03: Implement Vessel repairs fix (Credit: AlexB)
- 2013-03-02: Fix invalid weapon crash
- 2013-03-01: Implement predetermined alliances
- 2013-03-01: Implement selectable spawn locations
- 2013-03-01: Implement SecondaryColorScheme
- 2013-03-01: Civilian building graphics fix 

-------
2013-02

- 2013-02-19: Movie-X and Expand-X mix loading priority is reversed
- 2013-02-19: Fix extra theater implementation bugs
- 2013-02-19: Revise 640x480 implementation
- 2013-02-17: AI paranoid controls now apply to Skirmish
- 2013-02-17: Revise mouse-scrolling implementation
- 2013-02-17: Revise hires implementation
- 2013-02-13: Revise hires for net join dialog
- 2013-02-13: Revise extra theater implementation
- 2013-02-13: Version number "303p-i Beta1v1" is updated in the game

<a href="#changelog"><kbd>Top</kbd></a><br>
-------
### RA303p-iran
<br>

Iran initiated this project on 2012-11-10, forking from hifi's Red Alert 1's patch.

Primary: Iran<br>
Credits: hifi, CCHyper, FunkyFr3sh, Nyerguds, AlexB

-------
2013-02 

- 2013-02-10: Implement random starting song
- 2013-02-10: Revise hires for LAN dialog
- 2013-02-10: Implement extra theater: DESERT
- 2013-02-10: Add memory dump generation option for exception handling
- 2013-02-08: Revise hires for remote file transfer dialogs
- 2013-02-08: Disable background in the credits slideshow
- 2013-02-07: Implement localization of several text by moving them into stringtable
- 2013-02-07: Revise exception handling
- 2013-02-07: Disable ToInherit= in non-singleplayer missions
- 2013-02-05: Use single CPU exe, revise movie/audio implementation
- 2013-02-03: Implement crashdump generation for game crashes
- 2013-02-02: Implement custom tutorial files for mission maps
- 2013-02-02: Rename Counterstrike missions to Custom Missions, and Aftermath missions to Expansion Missions
- 2013-02-02: Remove side information from mission list (Credit: AlexB)

-------
2013-01

- 2013-01-31: Fix resign hotkey
- 2013-01-31: Unhardcode hotkeys and sidebar toggle
- 2013-01-27: Implement UseBetaTeslaTank
- 2013-01-27: Implement power indicator to scale with hires
- 2013-01-25: Revise power indicator hires implementation
- 2013-01-24: Removed black bars in 640x480 resolution
- 2013-01-24: Revert mouse check fix
- 2013-01-24: Implement AlternativeRifleSound, UseGrenadeThrowingSound
- 2013-01-24: Extends sidebar, power bar, and cameo icons for hires
- 2013-01-24: Implement EvacInMP
- 2013-01-24: Missing icon for TechLevel=-1 types fix
- 2013-01-24: AI attacking top-left cell fix
- 2013-01-01: Mouse-wheel scrolling is configurable via INI key MouseWheelScrolling
- 2013-01-01: Use game executable with extended sections (credit: CCHyper)

-------
2012-12

- 2012-12-31: Implemented PKT loading
- 2012-12-31: Implemented mouse-wheel scrolling function
- 2012-12-31: Revise No CD implementation
- 2012-12-24: Allow the game to load movie-X mixes
- 2012-12-24: Allow the game to load language-specific mixes, implement GameLanguage
- 2012-12-24: Hires revisions
- 2012-12-21: Fix savegame hires
- 2012-12-20: Implement new country remap colors
- 2012-12-18: Running the game no longer deletes conquer.eng stringtable file
- 2012-12-18: Implement AI paranoid and techup (Radar Dome) controls
- 2012-12-18: Fix formation speed glitch
- 2012-12-18: Fix green shadows on units
- 2012-12-15: Revise additional mix loading functions 
- 2012-12-15: Fix expanded country list (for Skirmish/Multiplayer) implementation
- 2012-12-13: Implement video stretching
- 2012-12-13: Revise multiplayer defaults
- 2012-12-13: Add indicator if you are hosting an Aftermath game
- 2012-12-13: Fix background-related graphical glitches
- 2012-12-10: Lobby lag fix
- 2012-12-10: Max units bug fix v2
- 2012-12-10: Reduce ingame message delay from 30 to 15 seconds
- 2012-12-10: Radar zooms out by default (credit: Nyerguds)
- 2012-12-08: Power meter in hires glitch fix
- 2012-12-08: Network menu crash fix
- 2012-12-08: Mission Accomplished / Failed / Draw scaled for hires 
- 2012-12-07: Screenshake scaled for hires 
- 2012-12-07: Save multiplayer settings
- 2012-12-07: Allow the game to load even more additional MIX files, including expand3 - expand9 mixes
- 2012-12-06: Fix Credits CnCDraw crash
- 2012-12-06: Implement AftermathFastBuildSpeed, VideoInterlaceMode, SkipScoreScreen

-------
2012-12

- 2012-11-25: Allow Skirmish and Multiplayer to select all 8 classic Houses (e.g. Greece)
- 2012-11-24: Implement loading of additional movies
- 2012-11-24: Extend ingame message delay from 9 to 30 seconds
- 2012-11-24: Implement loading of additional music
- 2012-11-22: Expanded cameo limit on sidebar
- 2012-11-21: Hires fixes for main menu after mission abort
- 2012-11-20: Apply OOS-Fix on modded maps
- 2012-11-18: Start to implement loading of additional music
- 2012-11-18: Alt-tab music change fix 
- 2012-11-18: Updated hires for network menu, ant mission button
- 2012-11-17: Implement loading of custom missions
- 2012-11-15: Updated hires and multiplayer defaults

-------
2012-11-10

- Initial fork from hifi's Red Alert 1's patch, with the following:<br>
-- hires code<br>
-- fence bugfix<br>
-- max units bugfix<br>
-- tag bugfix<br>
-- no CD fix<br>
-- savegame bugfix<br>
-- expansion detection fix<br>
-- multiplayer defaults<br>
-- exception handler code
- Allow the game to load additional MIX files


<a href="#changelog"><kbd>Top</kbd></a><br>
------
<a href="../README.md"><kbd>ra303s</kbd></a> :: <kbd><kbd>Changelog</kbd></kbd><br>
