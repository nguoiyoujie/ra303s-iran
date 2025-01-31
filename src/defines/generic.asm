;----------------------------------------------------------------
; src/defines/generic.asm
;
; Generic Definitions
;   Generic definitions are loaded after version, before all else
;   Used to contain common items, such a comma-delimiter string
;
;----------------------------------------------------------------

; Strings
; Many strings already exist in the executable
; Try to reuse them to conserve space

; use a common format: 
;    str_<generic_name>
;    If it's a file reference, str_<ext_name>_<file_name>
;    If it's a extension reference, str_ext_<ext_name>
; Try to use Title case for string names.

[section .rdata]
; Generic Text
%assign str_EmptyString                           0x005EC01F ; ""
%assign str_Comma                                 0x005E82C5 ; ","
str_Zero                                          db"0",0


%assign str_AftermathIni                          0x005EBB45 ; "AFTRMATH.INI"

%assign str_Name                                  0x005EFFB2 ; "Name"
%assign str_Side                                  0x005F028D ; "Side"
%assign str_Color                                 0x005EDE7A ; "Color"

%assign str_NewINIFormat                          0x005F000E ; "NewINIFormat"
%assign str_Intro                                 0x005EFFB7 ; "Intro"
%assign str_Brief                                 0x005EFFBD ; "Brief"
%assign str_Win                                   0x005EFFC3 ; "Win"
%assign str_Lose                                  0x005EFFC7 ; "Lose"
%assign str_Action                                0x005EFFCC ; "Action"
%assign str_ToCarryOver                           0x005EFFD3 ; "ToCarryOver"
%assign str_IsToInherit                           0x005EFFDF ; "IsToInherit"
%assign str_TimerInherit                          0x005EFFE9 ; "TimerInherit"
%assign str_EndOfGame                             0x005EFFF6 ; "EndOfGame"
%assign str_CivEvac                               0x005F0000 ; "CivEvac"
%assign str_Theme                                 0x005F0008 ; "Theme"
%assign str_CarryOverMoney                        0x005F001B ; "CarryOverMoney"
%assign str_CarryOverCap                          0x005F002A ; "CarryOverCap"

%assign str_NoSpyPlane                            0x005F0037 ; "NoSpyPlane"
%assign str_SkipScore                             0x005F0042 ; "SkipScore"
%assign str_OneTimeOnly                           0x005F004C ; "OneTimeOnly"
%assign str_SkipMapSelect                         0x005F0058 ; "SkipMapSelect"
%assign str_TruckCrate                            0x005F0066 ; "TruckCrate"
%assign str_FillSilos                             0x005F0071 ; "FillSilos"
%assign str_Percent                               0x005F007B ; "Percent"
;%assign str_Official                              0x005F009F ; "Official"

%assign str_Player                                0x005F0083 ; "Player"
%assign str_RedAlert                              0x005F0A84 ; "Red Alert"

%assign str_Basic                                 0x005EFFA5 ; "Basic"
%assign str_General                               0x005EF3EE ; "General"
%assign str_AI                                    0x005EFC29 ; "AI"
%assign str_Aftermath                             0x005EF3F6 ; "Aftermath"
str_SetProcessAffinityMask                        db"SetProcessAffinityMask",0

%assign str_Weapons                               0x005EFE41 ; "Super"^"Weapons"

str_Skirmish                                      db"Skirmish",0
str_Multi1                                        db"Multi1",0
str_Multi2                                        db"Multi2",0
str_Multi3                                        db"Multi3",0
str_Multi4                                        db"Multi4",0
str_Multi5                                        db"Multi5",0
str_Multi6                                        db"Multi6",0
str_Multi7                                        db"Multi7",0
str_Multi8                                        db"Multi8",0

;Additional houses
str_Multi9                                        db"Multi9",0
str_Multi10                                       db"Multi10",0
str_Multi11                                       db"Multi11",0
str_Multi12                                       db"Multi12",0
str_Multi13                                       db"Multi13",0
str_Multi14                                       db"Multi14",0
str_Multi15                                       db"Multi15",0
str_Multi16                                       db"Multi16",0
str_Multi17                                       db"Multi17",0
str_Multi18                                       db"Multi18",0
str_Multi19                                       db"Multi19",0
str_Multi20                                       db"Multi20",0
str_MP9                                           db"MP9",0
str_MP10                                          db"M10",0
str_MP11                                          db"M11",0
str_MP12                                          db"M12",0
str_MP13                                          db"M13",0
str_MP14                                          db"M14",0
str_MP15                                          db"M15",0
str_MP16                                          db"M16",0
str_MP17                                          db"M17",0
str_MP18                                          db"M18",0
str_MP19                                          db"M19",0
str_MP20                                          db"M20",0

; Hardcoded naval turrets
str_TURR                                          db"TURR",0
str_SSAM                                          db"SSAM",0
str_MGUN                                          db"MGUN",0

; Multi-use Strings
; If a string is used in more than one location, put them here, and reference them in comment in their respective use locations
str_ParabombsInMultiplayer                        db"ParabombsInMultiplayer",0                 ; Rules.ini > [General] and Spawn.ini > [Settings]
str_AftermathFastBuildSpeed                       db"AftermathFastBuildSpeed",0                ; Rules.ini > [Aftermath] and Spawn.ini > [Settings]
str_FixFormationSpeed                             db"FixFormationSpeed",0                      ; Rules.ini > [General] and Spawn.ini > [Settings]
str_FixAIAlly                                     db"FixAIAlly",0                              ; Rules.ini > [General] and Spawn.ini > [Settings]

; TechnoType Names
%assign str_Aircraft                              0x005EFA03 ; "Aircraft"
%assign str_Building                              0x005EFA11 ; "Building"
%assign str_Infantry                              0x005EFA29 ; "Infantry"
%assign str_Unit                                  0x005EFA68 ; "Unit"
%assign str_Vessel                                0x005EFA6D ; "Vessel"




; MIX file references
str_mix_Campaign                                  db"campaign.MIX",0
str_mix_Aftermath                                 db"aftermath.MIX",0
str_mix_Counterstrike                             db"counterstrike.MIX",0
str_mix_SmallInfantry                             db"smallinfantry.MIX",0
str_mix_OOSFix                                    db"oos-fix.MIX",0
str_mix_MoviesTLF                                 db"movies-tlf.MIX",0
str_mix_GermanLanguagePack                        db"germanlanguagepack.MIX",0
str_mix_GermanCensoredLanguagePack                db"germancensoredlanguagepack.MIX",0
str_mix_GermanUncensoredLanguagePack              db"germanuncensoredlanguagepack.MIX",0
str_mix_FrenchLanguagePack                        db"frenchlanguagepack.MIX",0
str_mix_SpanishLanguagePack                       db"spanishlanguagepack.MIX",0
str_mix_RussianLanguagePack                       db"russianlanguagepack.MIX",0
str_mix_Expand3                                   db"expand3.MIX",0
str_mix_Expand4                                   db"expand4.MIX",0
str_mix_Expand5                                   db"expand5.MIX",0
str_mix_Expand6                                   db"expand6.MIX",0
str_mix_Expand7                                   db"expand7.MIX",0
str_mix_Expand8                                   db"expand8.MIX",0
str_mix_Expand9                                   db"expand9.MIX",0
str_mix_Movies_1                                  db"movies-1.MIX",0
str_mix_Movies_2                                  db"movies-2.MIX",0
str_mix_Movies_3                                  db"movies-3.MIX",0
str_mix_Movies_4                                  db"movies-4.MIX",0
str_mix_Movies_5                                  db"movies-5.MIX",0
str_mix_Movies_6                                  db"movies-6.MIX",0
str_mix_Movies_7                                  db"movies-7.MIX",0
str_mix_Movies_8                                  db"movies-8.MIX",0
str_mix_Movies_9                                  db"movies-9.MIX",0
str_mix_Movies_10                                 db"movies-10.MIX",0
str_mix_Spawn1                                    db"spawn1.MIX",0
str_mix_BetaTeslaTank                             db"betateslatank.MIX",0
str_mix_BetaDestroyer                             db"betadestroyer.MIX",0
str_mix_BetaGunboat                               db"betagunboat.MIX",0
str_mix_BetaSubmarine                             db"betasubmarine.MIX",0
str_mix_BetaCruiser                               db"betacruiser.MIX",0
str_mix_DOSInterfaceMod                           db"dosinterfacemod.MIX",0


; INI file references
%assign str_ini_RedAlert                          0x005EDE12 ; "REDALERT.INI"
%assign str_ini_Rules                             0x005EBB3B ; "RULES.INI"
str_ini_AI                                        db"AI.INI",0
str_ini_OOSFix                                    db"OOS-FIX.INI",0
str_ini_Spawn                                     db"SPAWN.INI",0


; DLL file references
%assign str_dll_Kernel32                          0x005E6947 ; "KERNEL32.DLL"


; DMP file references
str_dmp_Stats                                     db"stats.dmp",0


; XDP file references
str_xdp_Spawn                                     db"SPAWN.XDP",0
str_xdp_Spawnam                                   db"SPAWNAM.XDP",0


; file extension references
%assign str_ext_mpr                               0x005F0798 ; ".MPR"
str_ext_mmm                                       db".MMM",0

; command line arguments
; Syntax: ra95.exe -ONETIME <difficulty> <map>
; e.g. ra95.exe -ONETIME -EASY SCG01EA.ini
str_arg_Spawn                                     db"-SPAWN",0
str_arg_Attract                                   db"-ATTRACT",0
str_arg_LAN                                       db"-LAN",0
str_arg_Internet                                  db"-INTERNET",0
str_arg_Skirmish                                  db"-SKIRMISH",0
str_arg_NewMissions                               db"-NEWMISSIONS",0
str_arg_AntMissions                               db"-ANTMISSIONS",0
str_arg_MissionPrefix                             db"-M:",0
str_arg_Record                                    db"-RECORD",0
str_arg_Playback                                  db"-PLAYBACK",0
str_arg_Skiptitle                                 db"-NOTITLE",0 
str_arg_Onetime                                   db"-ONETIME",0 
str_arg_Easy                                      db"-EASY",0           ; Difficult option
str_arg_EasyF                                     db"-EASY.FINE",0      ; Difficult option
str_arg_Norm                                      db"-NORMAL",0         ; Difficult option
str_arg_HardF                                     db"-HARD.FINE",0      ; Difficult option
str_arg_Hard                                      db"-HARD",0           ; Difficult option



; RedAlert.ini -----------------------------------------------------------------------------------------------
; RedAlert.ini Sections
%assign str_Options                               0x005EDE1F ; "Options"
%assign str_WinHotkeys                            0x005EE3E4 ; "WinHotkeys"

%assign str_Width                                 0x005EB3AB ; "Width"
%assign str_Height                                0x005EB3B1 ; "Height"

str_Colour                                        db"Colour",0 ; Used in lieu with [<House>] > Color
str_Country                                       db"Country",0
str_BuildingsGetInstantlyCaptured                 db"BuildingsGetInstantlyCaptured",0
str_NoBuildingCrew                                db"NoBuildingCrew",0
str_AllyTheNeutralHouse                           db"AllyTheNeutralHouse",0
str_SecondaryColorScheme                          db"SecondaryColorScheme",0

; RedAlert.ini > [Options]
str_VideoInterlaceMode                            db"VideoInterlaceMode",0
str_SkipScoreScreen                               db"SkipScoreScreen",0
str_RandomStartingSong                            db"RandomStartingSong",0
str_FixAIParanoid                                 db"FixAIParanoid",0
str_GameLanguage                                  db"GameLanguage",0
str_DebugLogging                                  db"DebugLogging",0
str_AftermathEnabled                              db"AftermathEnabled",0
str_CounterstrikeEnabled                          db"CounterstrikeEnabled",0
str_UseSmallInfantry                              db"UseSmallInfantry",0
str_NoCD                                          db"NoCD",0
str_DisplayOriginalMultiplayerMaps                db"DisplayOriginalMultiplayerMaps",0
str_DisplayAftermathMultiplayerMaps               db"DisplayAftermathMultiplayerMaps",0
str_DisplayCounterstrikeMultiplayerMaps           db"DisplayCounterstrikeMultiplayerMaps",0
str_MouseWheelScrolling                           db"MouseWheelScrolling",0
; str_FixFormationSpeed (multi-use)
; str_ParabombsInMultiplayer (multi-use)
str_ForceSingleCPU                                db"ForceSingleCPU",0
str_AlternativeRifleSound                         db"AlternativeRifleSound",0
str_UseGrenadeThrowingSound                       db"UseGrenadeThrowingSound",0
str_UseBetaTeslaTank                              db"UseBetaTeslaTank",0
str_UseBetaDestroyer                              db"UseBetaDestroyer",0
str_UseBetaCruiser                                db"UseBetaCruiser",0
str_UseBetaSubmarine                              db"UseBetaSubmarine",0
str_UseBetaGunboat                                db"UseBetaGunboat",0
str_GenerateMemoryDump                            db"GenerateMemoryDump",0
str_ForceAMUnitsInMissions                        db"ForceAMUnitsInMissions",0
str_FastAMBuildSpeed                              db"FastAMBuildSpeed",0
str_ColorRemapSidebarIcons                        db"ColorRemapSidebarIcons",0
str_UseDOSInterfaceMod                            db"UseDOSInterfaceMod",0
str_EnableWOL                                     db"EnableWOL",0

; RedAlert.ini > [WinHotkeys]
str_KeySidebarToggle                              db"KeySidebarToggle",0
str_KeyMapSnapshot                                db"KeyMapSnapshot",0







; Spawn.ini -------------------------------------------------------------------------------------------------
; Spawn.ini Sections
str_Tunnel                                        db"Tunnel",0
%assign str_Settings                              0x005F5BE0 ; "Settings"
str_SpawnLocations                                db"SpawnLocations",0
str_HouseColors                                   db"HouseColors",0
str_HouseCountries                                db"HouseCountries",0
str_HouseHandicaps                                db"HouseHandicaps",0
str_IsSpectator                                   db"IsSpectator",0

; Spawn.ini > [Tunnel]
str_Ip                                            db"Ip",0
%assign str_Port                                  0x005F02F2 ; "Port"

; Spawn.ini > [Settings]
%assign str_Bases                                 0x005EF984 ; "Bases"
%assign str_Credits                               0x005EB940 ; "Credits"
str_OreRegenerates                                db"OreRegenerates",0
%assign str_Crates                                0x005EF993 ; "Crates"
str_UnitCount                                     db"UnitCount",0
str_AIPlayers                                     db"AIPlayers",0
str_Seed                                          db"Seed",0
str_SlowUnitBuild                                 db"SlowUnitBuild",0
%assign str_CaptureTheFlag                        0x005EF99A ; "CaptureTheFlag"
str_ShroudRegrows                                 db"ShroudRegrows",0
%assign str_TechLevel                             0x005EF909 ; "TechLevel"
str_AIDifficulty                                  db"AIDifficulty",0
; Aftermath (generic)
; Name (generic)
; Side (generic)
; Color (generic)
str_fmt_Other                                     db"Other%d",0   ; formatting helper
%assign str_GameSpeed                             0x005EDE27 ; "GameSpeed"
str_NetworkVersionProtocol                        db"NetworkVersionProtocol",0
str_MaxAhead                                      db"MaxAhead",0
str_FrameSendRate                                 db"FrameSendRate",0
str_GameID                                        db"GameID",0

str_Scenario                                      db"Scenario",0
; str_AftermathFastBuildSpeed (multi-use)
; str_FixFormationSpeed (multi-use)
str_FixRangeExploit                               db"FixRangeExploit",0
str_FixMagicBuild                                 db"FixMagicBuild",0
; str_ParabombsInMultiplayer (multi-use)
; str_FixAIAlly 
str_FixWideAreaDamage                             db"FixWideAreaDamage",0
str_ScalePowerBar                                 db"ScalePowerBar",0
%assign str_MCVUndeploy                           0x005EF831 ; "MCVUndeploy"
%assign str_AllyReveal                            0x005EF81A ; "AllyReveal"
str_ForcedAlliances                               db"ForcedAlliances",0
str_TechCenterBugFix                              db"TechCenterBugFix",0
str_BuildOffAlly                                  db"BuildOffAlly",0
str_SouthAdvantageFix                             db"SouthAdvantageFix",0
str_NoScreenShake                                 db"NoScreenShake",0
str_NoTeslaZapEffectDelay                         db"NoTeslaZapEffectDelay",0
str_ShortGame                                     db"ShortGame",0
str_DeadPlayersRadar                              db"DeadPlayersRadar",0
str_LoadSaveGame                                  db"LoadSaveGame",0
str_SaveGameNumber                                db"SaveGameNumber",0
str_IsSinglePlayer                                db"IsSinglePlayer",0

; Rules.ini -------------------------------------------------------------------------------------------------

; Rules.ini Sections
str_StringTableOffsets                            db"StringTableOffsets",0   ; New section

; Rules.ini > [General]
str_EvacInMP                                      db"EvacInMP",0
str_RemapJammedBuildings                          db"RemapJammedBuildings",0
str_AtomRadius                                    db"AtomRadius",0
; str_ParabombsInMultiplayer (multi-use)
str_DeathReport1                                  db"DeathReport1",0         
str_DeathReport2                                  db"DeathReport2",0         
str_DeathReport3                                  db"DeathReport3",0         
str_DeathReport4                                  db"DeathReport4",0         
str_DeathReport5                                  db"DeathReport5",0         
str_DeathReport                                   db"DeathReport",0         
str_TanyaDeathReport                              db"TanyaDeathReport",0         
str_DogDeathReport                                db"DogDeathReport",0         


; Rules.ini > [AI]
str_EasyAIGoldValue                               db"EasyAIGoldValue",0
str_EasyAIGemValue                                db"EasyAIGemValue",0
str_NormalAIGoldValue                             db"NormalAIGoldValue",0
str_NormalAIGemValue                              db"NormalAIGemValue",0
str_HardAIGoldValue                               db"HardAIGoldValue",0
str_HardAIGemValue                                db"HardAIGemValue",0
str_BuildRadarWithoutAirThreatCheck               db"BuildRadarWithoutAirThreatCheck",0 ; replaces RemoveAITechupCheck and ReenableAITechUpCheck

str_FixAISendingTanksTopLeft                      db"FixAISendingTanksTopLeft",0
str_ComputerParanoidForceDisabledSkirmish         db"ComputerParanoidForceDisabledSkirmish",0
str_SingleplayerAIObeyPrerequisites               db"SingleplayerAIObeyPrerequisites",0
str_UseNewBuildingAI                              db"UseNewBuildingAI",0
str_ForceSingleTileClearing                       db"ForceSingleTileClearing",0
str_GuardAreaLoadTransportsInSingleplayer         db"GuardAreaLoadTransportsInSingleplayer",0
str_RepairConstructedBuildingsInSingleplayer      db"RepairConstructedBuildingsInSingleplayer",0
str_PowerExcess                                   db"PowerExcess",0
str_PowerEmergencyMinimum                         db"PowerEmergencyMinimum",0

; Rules.ini new instance lists
str_AircraftTypes                                 db"AircraftTypes",0
str_AnimTypes                                     db"AnimTypes",0
str_DirectionalAnimTypes                          db"DirectionalAnimTypes",0
str_BuildingTypes                                 db"BuildingTypes",0
str_BulletTypes                                   db"BulletTypes",0
str_InfantryTypes                                 db"InfantryTypes",0
str_SoundEffects                                  db"SoundEffects",0
str_UnitTypes                                     db"UnitTypes",0
str_VesselTypes                                   db"VesselTypes",0
str_Warheads                                      db"Warheads",0

;str_CustomMissions                                db"Custom Missions",0
;str_ExpansionMissions                             db"Expansions Missions",0

; xxxx.map > [Basic]
str_ChronoReinforceTanks                          db"ChronoReinforceTanks",0
str_UseAtomWhiteScreenEffectInMP                  db"UseAtomWhiteScreenEffectInMP",0
str_UseSinglePlayerAtomDamage                     db"UseSinglePlayerAtomDamage",0
str_UseCustomTutorialText                         db"UseCustomTutorialText",0
str_NextMissionInCampaign                         db"NextMissionInCampaign",0
str_ScenarioNumber                                db"ScenarioNumber",0
str_MapSelectionAnimation                         db"MapSelectionAnimation",0
str_MapSelectA                                    db"MapSelectA",0
str_MapSelectB                                    db"MapSelectB",0
str_MapSelectC                                    db"MapSelectC",0
str_IsCoopMode                                    db"IsCoopMode",0

[section .text]
