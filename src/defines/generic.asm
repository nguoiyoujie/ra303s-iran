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

; Generic Text
%define str_EmptyString                           0x005EC01F ; ""
%define str_Comma                                 0x005E82C5 ; ","

%define str_Name                                  0x005EFFB2 ; "Name"
%define str_Side                                  0x005F028D ; "Side"
%define str_Color                                 0x005EDE7A ; "Color"

%define str_NewINIFormat                          0x005F000E ; "NewINIFormat"
%define str_Intro                                 0x005EFFB7 ; "Intro"
%define str_Brief                                 0x005EFFBD ; "Brief"
%define str_Win                                   0x005EFFC3 ; "Win"
%define str_Lose                                  0x005EFFC7 ; "Lose"
%define str_Action                                0x005EFFCC ; "Action"
%define str_ToCarryOver                           0x005EFFD3 ; "ToCarryOver"
%define str_IsToInherit                           0x005EFFDF ; "IsToInherit"
%define str_TimerInherit                          0x005EFFE9 ; "TimerInherit"
%define str_EndOfGame                             0x005EFFF6 ; "EndOfGame"
%define str_CivEvac                               0x005F0000 ; "CivEvac"
%define str_Theme                                 0x005F0008 ; "Theme"
%define str_CarryOverMoney                        0x005F001B ; "CarryOverMoney"
%define str_CarryOverCap                          0x005F002A ; "CarryOverCap"

%define str_NoSpyPlane                            0x005F0037 ; "NoSpyPlane"
%define str_SkipScore                             0x005F0042 ; "SkipScore"
%define str_OneTimeOnly                           0x005F004C ; "OneTimeOnly"
%define str_SkipMapSelect                         0x005F0058 ; "SkipMapSelect"
%define str_TruckCrate                            0x005F0066 ; "TruckCrate"
%define str_FillSilos                             0x005F0071 ; "FillSilos"
%define str_Percent                               0x005F007B ; "Percent"
;%define str_Official                              0x005F009F ; "Official"

%define str_Player                                0x005F0083 ; "Player"

%define str_Basic                                 0x005EFFA5 ; "Basic"
%define str_General                               0x005EF3EE ; "General"
%define str_AI                                    0x005EFC29 ; "AI"
%define str_Aftermath                             0x005EF3F6 ; "Aftermath"
str_SetProcessAffinityMask                        db"SetProcessAffinityMask",0

%define str_Weapons                               0x005EFE41 ; "Super"^"Weapons"

str_Skirmish                                      db"Skirmish",0
str_Multi1                                        db"Multi1",0
str_Multi2                                        db"Multi2",0
str_Multi3                                        db"Multi3",0
str_Multi4                                        db"Multi4",0
str_Multi5                                        db"Multi5",0
str_Multi6                                        db"Multi6",0
str_Multi7                                        db"Multi7",0
str_Multi8                                        db"Multi8",0

; Hardcoded naval turrets
str_TURR                                          db"TURR",0
str_SSAM                                          db"SSAM",0
str_MGUN                                          db"MGUN",0

; Multi-use Strings
; If a string is used in more than one location, put them here, and reference them in comment in their respective use locations
%define str_ParabombsInMultiplayer                0x006EEF8E ; "ParabombsInMultiplayer"                 ; Rules.ini > [General] and Spawn.ini > [Settings]
%define str_AftermathFastBuildSpeed               0x006F3A40 ; "AftermathFastBuildSpeed"                ; Rules.ini > [Aftermath] and Spawn.ini > [Settings]
%define str_FixFormationSpeed                     0x006EEEC3 ; "FixFormationSpeed"                      ; Rules.ini > [General] and Spawn.ini > [Settings]
%define str_FixAIAlly                             0x006EEEB9 ; "FixAIAlly"                              ; Rules.ini > [General] and Spawn.ini > [Settings]

; TechnoType Names
%define str_Aircraft                              0x005EFA03 ; "Aircraft"
%define str_Building                              0x005EFA11 ; "Building"
%define str_Infantry                              0x005EFA29 ; "Infantry"
%define str_Unit                                  0x005EFA68 ; "Unit"
%define str_Vessel                                0x005EFA6D ; "Vessel"




; MIX file references
%define str_mix_Campaign                          0x006F45AA ; "campaign.MIX"
%define str_mix_Aftermath                         0x006F45B7 ; "aftermath.MIX"
%define str_mix_Counterstrike                     0x006F45C5 ; "counterstrike.MIX"
%define str_mix_SmallInfantry                     0x006F45D7 ; "smallinfantry.MIX"
%define str_mix_OOSFix                            0x006F45E9 ; "oos-fix.MIX"
%define str_mix_MoviesTLF                         0x006F45F5 ; "movies-tlf.MIX"
%define str_mix_GermanLanguagePack                0x006F4604 ; "germanlanguagepack.MIX"
%define str_mix_GermanCensoredLanguagePack        0x006F461B ; "germancensoredlanguagepack.MIX"
%define str_mix_GermanUncensoredLanguagePack      0x006F463A ; "germanuncensoredlanguagepack.MIX"
%define str_mix_FrenchLanguagePack                0x006F465B ; "frenchlanguagepack.MIX"
%define str_mix_SpanishLanguagePack               0x006F4672 ; "spanishlanguagepack.MIX"
%define str_mix_RussianLanguagePack               0x006F468A ; "russianlanguagepack.MIX"
%define str_mix_Expand3                           0x006F46A2 ; "expand3.MIX"
%define str_mix_Expand4                           0x006F46AE ; "expand4.MIX"
%define str_mix_Expand5                           0x006F46BA ; "expand5.MIX"
%define str_mix_Expand6                           0x006F46C6 ; "expand6.MIX"
%define str_mix_Expand7                           0x006F46D2 ; "expand7.MIX"
%define str_mix_Expand8                           0x006F46DE ; "expand8.MIX"
%define str_mix_Expand9                           0x006F46EA ; "expand9.MIX"
%define str_mix_Movies_1                          0x006F46F6 ; "movies-1.MIX"
%define str_mix_Movies_2                          0x006F4703 ; "movies-2.MIX"
%define str_mix_Movies_3                          0x006F4710 ; "movies-3.MIX"
%define str_mix_Movies_4                          0x006F471D ; "movies-4.MIX"
%define str_mix_Movies_5                          0x006F472A ; "movies-5.MIX"
%define str_mix_Movies_6                          0x006F4737 ; "movies-6.MIX"
%define str_mix_Movies_7                          0x006F4744 ; "movies-7.MIX"
%define str_mix_Movies_8                          0x006F4751 ; "movies-8.MIX"
%define str_mix_Movies_9                          0x006F475E ; "movies-9.MIX"
%define str_mix_Movies_10                         0x006F476B ; "movies-10.MIX"
str_mix_Spawn1                                    db"spawn1.MIX",0
str_mix_BetaTeslaTank                             db"betateslatank.MIX",0
str_mix_BetaDestroyer                             db"betadestroyer.MIX",0
str_mix_BetaGunboat                               db"betagunboat.MIX",0
str_mix_BetaSubmarine                             db"betasubmarine.MIX",0
str_mix_BetaCruiser                               db"betacruiser.MIX",0
str_mix_DOSInterfaceMod                           db"dosinterfacemod.MIX",0


; INI file references
%define str_ini_RedAlert                          0x005EDE12 ; "REDALERT.INI"
%define str_ini_Rules                             0x005EBB3B ; "RULES.INI"
%define str_ini_AI                                0x006F3ACF ; "AI.INI"
%define str_ini_OOSFix                            0x006F4CD7 ; "OOS-FIX.INI"
str_ini_Spawn                                     db"SPAWN.INI",0


; DLL file references
%define str_dll_Kernel32                          0x005E6947 ; "KERNEL32.DLL"


; DMP file references
str_dmp_Stats                                     db"stats.dmp",0


; XDP file references
str_xdp_Spawn                                     db"SPAWN.XDP",0
str_xdp_Spawnam                                   db"SPAWNAM.XDP",0


; file extension references
%define str_ext_mpr                               0x005F0798 ; ".MPR"
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
%define str_Options                               0x005EDE1F ; "Options"
%define str_WinHotkeys                            0x005EE3E4 ; "WinHotkeys"


str_Colour                                        db"Colour",0 ; Used in lieu with [<House>] > Color
str_Country                                       db"Country",0
str_BuildingsGetInstantlyCaptured                 db"BuildingsGetInstantlyCaptured",0
str_NoBuildingCrew                                db"NoBuildingCrew",0
str_AllyTheNeutralHouse                           db"AllyTheNeutralHouse",0
str_SecondaryColorScheme                          db"SecondaryColorScheme",0

; RedAlert.ini > [Options]
%define str_VideoInterlaceMode                    0x006EEE5E ; "VideoInterlaceMode"
%define str_SkipScoreScreen                       0x006EEE71 ; "SkipScoreScreen"
%define str_RandomStartingSong                    0x006EEE81 ; "RandomStartingSong"
;%define str_RemoveAITechupCheck                   0x006EEE97 ; "RemoveAITechupCheck"
%define str_FixAIParanoid                         0x006EEEAB ; "FixAIParanoid"
; str_FixAIAlly 
%define str_GameLanguage                          0x006EEED5 ; "GameLanguage"
%define str_DebugLogging                          0x006EEEE2 ; "DebugLogging"
%define str_AftermathEnabled                      0x006EEEEF ; "AftermathEnabled"
%define str_CounterstrikeEnabled                  0x006EEF00 ; "CounterstrikeEnabled"
%define str_UseSmallInfantry                      0x006EEF15 ; "UseSmallInfantry"
%define str_NoCD                                  0x006EEF26 ; "NoCD"
%define str_DisplayOriginalMultiplayerMaps        0x006EEF2B ; "DisplayOriginalMultiplayerMaps"
%define str_DisplayAftermathMultiplayerMaps       0x006EEF4A ; "DisplayAftermathMultiplayerMaps"
%define str_DisplayCounterstrikeMultiplayerMaps   0x006EEF6A ; "DisplayCounterstrikeMultiplayerMaps"
%define str_MouseWheelScrolling                   0x006EEFA5 ; "MouseWheelScrolling"
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
%define str_Settings                              0x005F5BE0 ; "Settings"
str_SpawnLocations                                db"SpawnLocations",0
str_HouseColors                                   db"HouseColors",0
str_HouseCountries                                db"HouseCountries",0
str_HouseHandicaps                                db"HouseHandicaps",0
str_IsSpectator                                   db"IsSpectator",0

; Spawn.ini > [Tunnel]
str_Ip                                            db"Ip",0
%define str_Port                                  0x005F02F2 ; "Port"

; Spawn.ini > [Settings]
%define str_Bases                                 0x005EF984 ; "Bases"
%define str_Credits                               0x005EB940 ; "Credits"
%define str_OreRegenerates                        0x006F4082 ; "OreRegenerates"
%define str_Crates                                0x006F4075 ; "Crates"
%define str_UnitCount                             0x006F4091 ; "UnitCount"
%define str_AIPlayers                             0x006F40B2 ; "AIPlayers"
str_Seed                                          db"Seed",0
str_SlowUnitBuild                                 db"SlowUnitBuild",0
%define str_CaptureTheFlag                        0x006F4066 ; "CaptureTheFlag"
%define str_ShroudRegrows                         0x006F4058 ; "ShroudRegrows"
%define str_TechLevel                             0x006F409B ; "TechLevel"
%define str_AIDifficulty                          0x006F40A5 ; "AIDifficulty"
; Aftermath (generic)
; Name (generic)
; Side (generic)
; Color (generic)
str_fmt_Other                                     db"Other%d",0   ; formatting helper
%define str_GameSpeed                             0x005EDE27 ; "GameSpeed"
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
%define str_MCVUndeploy                           0x005EF831 ; "MCVUndeploy"
%define str_AllyReveal                            0x005EF81A ; "AllyReveal"
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




;;; Temporary location for CCFILE storage 
; Note: sizes not actually verified. Check against Remaster
; src/fixes/rules_oos.asm
CCFileClass_OOSFix  TIMES 256 db 0
CCINIClass_OOSFix   TIMES 256 db 0
; src/features/load_ai_ini.asm
CCFileClass_AI  TIMES 256 db 0
CCINIClass_AI    TIMES 256 db 0
; src/features/loading.asm
CCFileClass_RedAlert    TIMES 128 db 0
CCINIClass_RedAlert TIMES 64 db 0

; src/features/spawn.asm
CCFileClass_Spawn  TIMES 128 db 0
CCINIClass_Spawn   TIMES 64 db 0

CCFileClass_Map  TIMES 128 db 0
CCINIClass_Map   TIMES 64 db 0


;;; New type heap locations
;AircraftType
NewAircraftTypeHeapCount            dd    0
AircraftTypesTypesExtCount          dd    0

;AnimType
AnimTypesTypesExtCount              db    0
NewAnimTypeHeapCount                dd    0

;BuildingType
NewBuildingTypeHeapCount            dd    0
BuildingTypesExtCount               dd    0

;BulletType
BulletTypesExtCount                 db    0

;InfantryType
InfantryTypesExtCount               dd    0
NewInfantryTypeHeapCount            dd    0

;UnitType
UnitTypesExtCount                   dd    0
NewUnitTypeHeapCount                dd    0

;VesselType
NewVesselTypeHeapCount              dd    0
VesselTypesTypesExtCount            dd    0

;SoundEffects
%define  OriginalSoundEffectsCount          165
SoundEffectsList                                  TIMES 2304 dd 0 ; 9 bytes per entry * 256; the new list supports up to 256 new entries 
SoundEffectsCount                                 dd 0


;;; Temporary location for new global storages
; intended for values that are loaded from INI
Integer_Feature_EasyAIGoldValue dd -1
Integer_Feature_EasyAIGemValue dd -1
Integer_Feature_NormalAIGoldValue dd -1
Integer_Feature_NormalAIGemValue dd -1
Integer_Feature_HardAIGoldValue dd -1
Integer_Feature_HardAIGemValue dd -1

Toggle_Feature_ComputerParanoidForceDisabledSkirmish db 1
Toggle_Fix_BuildRadarWithoutAirThreatCheck db -1
Toggle_Feature_EvacInMP db 1
Toggle_Feature_RemapJammedBuildings db 0

Toggle_Fix_NavalRepairExploit db 0
Toggle_Fix_AISendingTanksToTopLeft db 0
Toggle_Fix_AIParanoid db 0
Toggle_Fix_AIAlly db 0
Toggle_Fix_WideAreaDamage db 0

;;; Temporary location until the House macros are completed
; store the new specialtype record per house (use 32-bit instead of 16-bit in case we use a different location within BuildingType to store the special type)
; 20 houses are supported, but we leave space for 24
Houses.SpecialScan                                times 24 dd 0 
Houses.Radar                                      times 24 db 0 
Houses.Factory                                    times 24 db 0 
Houses.BScan                                      times 768 db 0    ; 24 * (256 entries, 32 bytes)
Houses.BGroupScan                                 times 768 db 0    ; 24 * (256 entries, 32 bytes)
;Houses.BQuantity                                  times 6144 db 0   ; 24 * 256 entries

