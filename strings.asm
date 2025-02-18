;----------------------------------------------------------------
; strings.asm
;
; Generic Definitions
;   Generic definitions are loaded after version, before all else
;   Used to contain common items, such a comma-delimiter string
;
;----------------------------------------------------------------
%include "macros/setsym.inc"
%include "macros/datatypes.inc"


setcglob 0x005EC01F,str_EmptyString                            ; ""
setcglob 0x005E82C5,str_Comma                                  ; ","
gstring str_Zero                                               , "0"
        
setcglob 0x00605CD0,str_Internet                               ; "Internet"

setcglob 0x005EFFB2,str_Name                                   ; "Name"
setcglob 0x005F028D,str_Side                                   ; "Side"
setcglob 0x005EDE7A,str_Color                                  ; "Color"

setcglob 0x005F000E,str_NewINIFormat                           ; "NewINIFormat"
setcglob 0x005EFFB7,str_Intro                                  ; "Intro"
setcglob 0x005EFFBD,str_Brief                                  ; "Brief"
setcglob 0x005EFFC3,str_Win                                    ; "Win"
setcglob 0x005EFFC7,str_Lose                                   ; "Lose"
setcglob 0x005EFFCC,str_Action                                 ; "Action"
setcglob 0x005EFFD3,str_ToCarryOver                            ; "ToCarryOver"
setcglob 0x005EFFDF,str_IsToInherit                            ; "IsToInherit"
setcglob 0x005EFFE9,str_TimerInherit                           ; "TimerInherit"
setcglob 0x005EFFF6,str_EndOfGame                              ; "EndOfGame"
setcglob 0x005F0000,str_CivEvac                                ; "CivEvac"
setcglob 0x005F0008,str_Theme                                  ; "Theme"
setcglob 0x005F001B,str_CarryOverMoney                         ; "CarryOverMoney"
setcglob 0x005F002A,str_CarryOverCap                           ; "CarryOverCap"

setcglob 0x005F0037,str_NoSpyPlane                             ; "NoSpyPlane"
setcglob 0x005F0042,str_SkipScore                              ; "SkipScore"
setcglob 0x005F004C,str_OneTimeOnly                            ; "OneTimeOnly"
setcglob 0x005F0058,str_SkipMapSelect                          ; "SkipMapSelect"
setcglob 0x005F0066,str_TruckCrate                             ; "TruckCrate"
setcglob 0x005F0071,str_FillSilos                              ; "FillSilos"
setcglob 0x005F007B,str_Percent                                ; "Percent"
setcglob 0x005F009F,str_Official                               ; "Official"

setcglob 0x005F0083,str_Player                                 ; "Player"
setcglob 0x005F0A84,str_RedAlert                               ; "Red Alert"

setcglob 0x005EFFA5,str_Basic                                  ; "Basic"
setcglob 0x005EF3EE,str_General                                ; "General"
setcglob 0x005EFC29,str_AI                                     ; "AI"
setcglob 0x005EF3F6,str_Aftermath                              ; "Aftermath"
gstring str_SetProcessAffinityMask                             , "SetProcessAffinityMask"

setcglob 0x005EFE41,str_Weapons                                ; "Super"^"Weapons"

gstring str_Skirmish                                           , "Skirmish"

; Hardcoded naval turrets
gstring str_TURR                                               , "TURR"
gstring str_SSAM                                               , "SSAM"
gstring str_MGUN                                               , "MGUN"

; Multi-use Strings
; If a string is used in more than one location, put them here, and reference them in comment in their respective use locations
gstring str_ParabombsInMultiplayer                             ,"ParabombsInMultiplayer"                 ; Rules.ini > [General] and Spawn.ini > [Settings]
gstring str_AftermathFastBuildSpeed                            ,"AftermathFastBuildSpeed"                ; Rules.ini > [Aftermath] and Spawn.ini > [Settings]
gstring str_FixFormationSpeed                                  ,"FixFormationSpeed"                      ; Rules.ini > [General] and Spawn.ini > [Settings]
gstring str_FixAIAlly                                          ,"FixAIAlly"                              ; Rules.ini > [General] and Spawn.ini > [Settings]

; TechnoType Names
setcglob 0x005EFA03,str_Aircraft                               ; "Aircraft"
setcglob 0x005EFA11,str_Building                               ; "Building"
setcglob 0x005EFA29,str_Infantry                               ; "Infantry"
setcglob 0x005EFA68,str_Unit                                   ; "Unit"
setcglob 0x005EFA6D,str_Vessel                                 ; "Vessel"

; MIX file references
gstring str_mix_Campaign                                       , "campaign.MIX"
gstring str_mix_Aftermath                                      , "aftermath.MIX"
gstring str_mix_Counterstrike                                  , "counterstrike.MIX"
gstring str_mix_SmallInfantry                                  , "smallinfantry.MIX"
gstring str_mix_OOSFix                                         , "oos-fix.MIX"
gstring str_mix_MoviesTLF                                      , "movies-tlf.MIX"
gstring str_mix_GermanLanguagePack                             , "germanlanguagepack.MIX"
gstring str_mix_GermanCensoredLanguagePack                     , "germancensoredlanguagepack.MIX"
gstring str_mix_GermanUncensoredLanguagePack                   , "germanuncensoredlanguagepack.MIX"
gstring str_mix_FrenchLanguagePack                             , "frenchlanguagepack.MIX"
gstring str_mix_SpanishLanguagePack                            , "spanishlanguagepack.MIX"
gstring str_mix_RussianLanguagePack                            , "russianlanguagepack.MIX"
gstring str_mix_Expand3                                        , "expand3.MIX"
gstring str_mix_Expand4                                        , "expand4.MIX"
gstring str_mix_Expand5                                        , "expand5.MIX"
gstring str_mix_Expand6                                        , "expand6.MIX"
gstring str_mix_Expand7                                        , "expand7.MIX"
gstring str_mix_Expand8                                        , "expand8.MIX"
gstring str_mix_Expand9                                        , "expand9.MIX"
gstring str_mix_Movies_1                                       , "movies-1.MIX"
gstring str_mix_Movies_2                                       , "movies-2.MIX"
gstring str_mix_Movies_3                                       , "movies-3.MIX"
gstring str_mix_Movies_4                                       , "movies-4.MIX"
gstring str_mix_Movies_5                                       , "movies-5.MIX"
gstring str_mix_Movies_6                                       , "movies-6.MIX"
gstring str_mix_Movies_7                                       , "movies-7.MIX"
gstring str_mix_Movies_8                                       , "movies-8.MIX"
gstring str_mix_Movies_9                                       , "movies-9.MIX"
gstring str_mix_Movies_10                                      , "movies-10.MIX"
gstring str_mix_Spawn1                                         , "spawn1.MIX"
gstring str_mix_BetaTeslaTank                                  , "betateslatank.MIX"
gstring str_mix_BetaDestroyer                                  , "betadestroyer.MIX"
gstring str_mix_BetaGunboat                                    , "betagunboat.MIX"
gstring str_mix_BetaSubmarine                                  , "betasubmarine.MIX"
gstring str_mix_BetaCruiser                                    , "betacruiser.MIX"
gstring str_mix_DOSInterfaceMod                                , "dosinterfacemod.MIX"

; INI file references
setcglob 0x005EDE12,str_ini_RedAlert                           ; "REDALERT.INI"
setcglob 0x005EBB3B,str_ini_Rules                              ; "RULES.INI"
gstring str_ini_AI                                             , "AI.INI"
gstring str_ini_OOSFix                                         , "OOS-FIX.INI"
gstring str_ini_Spawn                                          , "SPAWN.INI"

setcglob 0x005EBB45,str_AftermathIni                           ; "AFTRMATH.INI"
setcglob 0x005EDE12,str_RedAlertIni                            ; "REDALERT.INI" ; repeated
gstring str_BlankPkt                                           ,"BLANK.PKT"
setcglob 0x005F06FD,str_MissionPkt                             ; "MISSIONS.PKT"
setcglob 0x005F0748,str_CStrikePkt                             ; "CSTRIKE.PKT"
setcglob 0x005F0770,str_AftmathPkt                             ; "AFTMATH.PKT"


; DLL file references
setcglob 0x005E6947,str_dll_Kernel32                           ; "KERNEL32.DLL"

; DMP file references
gstring str_dmp_Stats                                          , "stats.dmp"

; XDP file references
gstring str_xdp_Spawn                                          , "SPAWN.XDP"
gstring str_xdp_Spawnam                                        , "SPAWNAM.XDP"

; file extension references
setcglob 0x005F0798,str_ext_mpr                                ; ".MPR"
gstring str_ext_mmm                                            , ".MMM"

; command line arguments
; Syntax: ra95.exe -ONETIME <difficulty> <map>
; e.g. ra95.exe -ONETIME -EASY SCG01EA.ini
gstring str_arg_Spawn                                          , "-SPAWN"
gstring str_arg_Attract                                        , "-ATTRACT"
gstring str_arg_LAN                                            , "-LAN"
gstring str_arg_Internet                                       , "-INTERNET"
gstring str_arg_Skirmish                                       , "-SKIRMISH"
gstring str_arg_NewMissions                                    , "-NEWMISSIONS"
gstring str_arg_AntMissions                                    , "-ANTMISSIONS"
gstring str_arg_MissionPrefix                                  , "-M:"
gstring str_arg_Record                                         , "-RECORD"
gstring str_arg_Playback                                       , "-PLAYBACK"
gstring str_arg_SkipTitle                                      , "-NOTITLE" 
gstring str_arg_Onetime                                        , "-ONETIME" 
gstring str_arg_Easy                                           , "-EASY"           ; Difficult option
gstring str_arg_EasyF                                          , "-EASY.FINE"      ; Difficult option
gstring str_arg_Norm                                           , "-NORMAL"         ; Difficult option
gstring str_arg_HardF                                          , "-HARD.FINE"      ; Difficult option
gstring str_arg_Hard                                           , "-HARD"           ; Difficult option


; RedAlert.ini -----------------------------------------------------------------------------------------------
; RedAlert.ini Sections
setcglob 0x005EDE1F,str_Options                                ; "Options"
setcglob 0x005EE3E4,str_WinHotkeys                             ; "WinHotkeys"
setcglob 0x005EB3AB,str_Width                                  ; "Width"
setcglob 0x005EB3B1,str_Height                                 ; "Height"
gstring str_Colour                                             , "Colour" ; Used in lieu with [<House>] > Color
gstring str_Country                                            , "Country"
gstring str_BuildingsGetInstantlyCaptured                      , "BuildingsGetInstantlyCaptured"
gstring str_NoBuildingCrew                                     , "NoBuildingCrew"
gstring str_AllyTheNeutralHouse                                , "AllyTheNeutralHouse"
gstring str_SecondaryColorScheme                               , "SecondaryColorScheme"

; RedAlert.ini > [Options]
gstring str_VideoInterlaceMode                                 , "VideoInterlaceMode"
gstring str_SkipScoreScreen                                    , "SkipScoreScreen"
gstring str_RandomStartingSong                                 , "RandomStartingSong"
gstring str_FixAIParanoid                                      , "FixAIParanoid"
gstring str_GameLanguage                                       , "GameLanguage"
gstring str_DebugLogging                                       , "DebugLogging"
gstring str_AftermathEnabled                                   , "AftermathEnabled"
gstring str_CounterstrikeEnabled                               , "CounterstrikeEnabled"
gstring str_UseSmallInfantry                                   , "UseSmallInfantry"
gstring str_NoCD                                               , "NoCD"
gstring str_DisplayOriginalMultiplayerMaps                     , "DisplayOriginalMultiplayerMaps"
gstring str_DisplayAftermathMultiplayerMaps                    , "DisplayAftermathMultiplayerMaps"
gstring str_DisplayCounterstrikeMultiplayerMaps                , "DisplayCounterstrikeMultiplayerMaps"
gstring str_MouseWheelScrolling                                , "MouseWheelScrolling"
gstring str_ViewTargetingLines                                 , "ViewTargetingLines"
; str_FixFormationSpeed (multi-use)
; str_ParabombsInMultiplayer (multi-use)
gstring str_ForceSingleCPU                                     , "ForceSingleCPU"
gstring str_AlternativeRifleSound                              , "AlternativeRifleSound"
gstring str_UseGrenadeThrowingSound                            , "UseGrenadeThrowingSound"
gstring str_UseBetaTeslaTank                                   , "UseBetaTeslaTank"
gstring str_UseBetaDestroyer                                   , "UseBetaDestroyer"
gstring str_UseBetaCruiser                                     , "UseBetaCruiser"
gstring str_UseBetaSubmarine                                   , "UseBetaSubmarine"
gstring str_UseBetaGunboat                                     , "UseBetaGunboat"
gstring str_GenerateMemoryDump                                 , "GenerateMemoryDump"
gstring str_ForceAMUnitsInMissions                             , "ForceAMUnitsInMissions"
gstring str_FastAMBuildSpeed                                   , "FastAMBuildSpeed"
gstring str_ColorRemapSidebarIcons                             , "ColorRemapSidebarIcons"
gstring str_UseDOSInterfaceMod                                 , "UseDOSInterfaceMod"
gstring str_EnableWOL                                          , "EnableWOL"
gstring str_PlayEnglishIntro                                   , "PlayEnglishIntro"


; RedAlert.ini > [WinHotkeys]
gstring str_KeySidebarToggle                                   , "KeySidebarToggle"
gstring str_KeyMapSnapshot                                     , "KeyMapSnapshot"
gstring str_KeyDeploy                                          , "KeyDeploy"


; Spawn.ini -------------------------------------------------------------------------------------------------
; Spawn.ini Sections
gstring str_Tunnel                                             , "Tunnel"
setcglob 0x005F5BE0,str_Settings                               ; "Settings"
gstring str_SpawnLocations                                     , "SpawnLocations"
gstring str_HouseColors                                        , "HouseColors"
gstring str_HouseCountries                                     , "HouseCountries"
gstring str_HouseHandicaps                                     , "HouseHandicaps"
gstring str_IsSpectator                                        , "IsSpectator"

; Spawn.ini > [Tunnel]
gstring str_Ip                                                 , "Ip"
setcglob 0x005F02F2,str_Port                                   ; "Port"

; Spawn.ini > [Settings]
setcglob 0x005EF984,str_Bases                                  ; "Bases"
setcglob 0x005EB940,str_Credits                                ; "Credits"
gstring str_OreRegenerates                                     , "OreRegenerates"
setcglob 0x005EF993,str_Crates                                 ; "Crates"
gstring str_UnitCount                                          , "UnitCount"
gstring str_AIPlayers                                          , "AIPlayers"
gstring str_Seed                                               , "Seed"
gstring str_SlowUnitBuild                                      , "SlowUnitBuild"
setcglob 0x005EF99A,str_CaptureTheFlag                         ; "CaptureTheFlag"
gstring str_ShroudRegrows                                      , "ShroudRegrows"
setcglob 0x005EF909,str_TechLevel                              ; "TechLevel"
gstring str_AIDifficulty                                       , "AIDifficulty"
; Aftermath (generic)
; Name (generic)
; Side (generic)
; Color (generic)
gstring str_fmt_Other                                          , "Other%d"   ; formatting helper
setcglob 0x005EDE27,str_GameSpeed                              ; "GameSpeed"
gstring str_NetworkVersionProtocol                             , "NetworkVersionProtocol"
gstring str_MaxAhead                                           , "MaxAhead"
gstring str_FrameSendRate                                      , "FrameSendRate"
gstring str_GameID                                             , "GameID"

gstring str_Scenario                                           , "Scenario"
; str_AftermathFastBuildSpeed (multi-use)
; str_FixFormationSpeed (multi-use)
gstring str_FixRangeExploit                                    , "FixRangeExploit"
gstring str_FixMagicBuild                                      , "FixMagicBuild"
; str_ParabombsInMultiplayer (multi-use)
; str_FixAIAlly 
gstring str_FixWideAreaDamage                                  , "FixWideAreaDamage"
gstring str_ScalePowerBar                                      , "ScalePowerBar"
setcglob 0x005EF831,str_MCVUndeploy                            ; "MCVUndeploy"
setcglob 0x005EF81A,str_AllyReveal                             ; "AllyReveal"
gstring str_ForcedAlliances                                    , "ForcedAlliances"
gstring str_TechCenterBugFix                                   , "TechCenterBugFix"
gstring str_BuildOffAlly                                       , "BuildOffAlly"
gstring str_SouthAdvantageFix                                  , "SouthAdvantageFix"
gstring str_NoScreenShake                                      , "NoScreenShake"
gstring str_NoTeslaZapEffectDelay                              , "NoTeslaZapEffectDelay"
gstring str_ShortGame                                          , "ShortGame"
gstring str_DeadPlayersRadar                                   , "DeadPlayersRadar"
gstring str_LoadSaveGame                                       , "LoadSaveGame"
gstring str_SaveGameNumber                                     , "SaveGameNumber"
gstring str_IsSinglePlayer                                     , "IsSinglePlayer"
gstring str_HouseAllyOne                                       , "HouseAllyOne"
gstring str_HouseAllyTwo                                       , "HouseAllyTwo"
gstring str_HouseAllyThree                                     , "HouseAllyThree"
gstring str_HouseAllyFour                                      , "HouseAllyFour"
gstring str_HouseAllyFive                                      , "HouseAllyFive"
gstring str_HouseAllySix                                       , "HouseAllySix"
gstring str_HouseAllySeven                                     , "HouseAllySeven"
gstring str_Multi1_Alliances                                   , "Multi1_Alliances"
gstring str_Multi2_Alliances                                   , "Multi2_Alliances"
gstring str_Multi3_Alliances                                   , "Multi3_Alliances"
gstring str_Multi4_Alliances                                   , "Multi4_Alliances"
gstring str_Multi5_Alliances                                   , "Multi5_Alliances"
gstring str_Multi6_Alliances                                   , "Multi6_Alliances"
gstring str_Multi7_Alliances                                   , "Multi7_Alliances"
gstring str_Multi8_Alliances                                   , "Multi8_Alliances"

; Rules.ini -------------------------------------------------------------------------------------------------
; Rules.ini Sections
gstring str_StringTableOffsets                                 , "StringTableOffsets"   ; New section

; Rules.ini > [General]
gstring str_EvacInMP                                           , "EvacInMP"
gstring str_RemapJammedBuildings                               , "RemapJammedBuildings"
gstring str_AtomRadius                                         , "AtomRadius"
; str_ParabombsInMultiplayer (multi-use)
gstring str_DeathReport1                                       , "DeathReport1"         
gstring str_DeathReport2                                       , "DeathReport2"         
gstring str_DeathReport3                                       , "DeathReport3"         
gstring str_DeathReport4                                       , "DeathReport4"         
gstring str_DeathReport5                                       , "DeathReport5"         
gstring str_DeathReport                                        , "DeathReport"         
gstring str_TanyaDeathReport                                   , "TanyaDeathReport"         
gstring str_DogDeathReport                                     , "DogDeathReport"         


; Rules.ini > [AI]
gstring str_EasyAIGoldValue                                    , "EasyAIGoldValue"
gstring str_EasyAIGemValue                                     , "EasyAIGemValue"
gstring str_NormalAIGoldValue                                  , "NormalAIGoldValue"
gstring str_NormalAIGemValue                                   , "NormalAIGemValue"
gstring str_HardAIGoldValue                                    , "HardAIGoldValue"
gstring str_HardAIGemValue                                     , "HardAIGemValue"
gstring str_BuildRadarWithoutAirThreatCheck                    , "BuildRadarWithoutAirThreatCheck" ; replaces RemoveAITechupCheck and ReenableAITechUpCheck

gstring str_FixAISendingTanksTopLeft                           , "FixAISendingTanksTopLeft"
gstring str_ComputerParanoidForceDisabledSkirmish              , "ComputerParanoidForceDisabledSkirmish"
gstring str_SingleplayerAIObeyPrerequisites                    , "SingleplayerAIObeyPrerequisites"
gstring str_UseNewBuildingAI                                   , "UseNewBuildingAI"
gstring str_ForceSingleTileClearing                            , "ForceSingleTileClearing"
gstring str_GuardAreaLoadTransportsInSingleplayer              , "GuardAreaLoadTransportsInSingleplayer"
gstring str_RepairConstructedBuildingsInSingleplayer           , "RepairConstructedBuildingsInSingleplayer"
gstring str_PowerExcess                                        , "PowerExcess"
gstring str_PowerEmergencyMinimum                              , "PowerEmergencyMinimum"
gstring str_UnitReserve                                        , "UnitReserve"
gstring str_BuildingReserve                                    , "BuildingReserve"
gstring str_AircraftReserve                                    , "AircraftReserve"
gstring str_VesselReserve                                      , "VesselReserve"

; Rules.ini new instance lists
gstring str_AircraftTypes                                      , "AircraftTypes"
gstring str_AnimTypes                                          , "AnimTypes"
gstring str_DirectionalAnimTypes                               , "DirectionalAnimTypes"
gstring str_BuildingTypes                                      , "BuildingTypes"
gstring str_BulletTypes                                        , "BulletTypes"
gstring str_InfantryTypes                                      , "InfantryTypes"
gstring str_SoundEffects                                       , "SoundEffects"
gstring str_UnitTypes                                          , "UnitTypes"
gstring str_VesselTypes                                        , "VesselTypes"
gstring str_Warheads                                           , "Warheads"

;gstring str_CustomMissions                                     , "Custom Missions"
;gstring str_ExpansionMissions                                  , "Expansions Missions"

; xxxx.map > [Basic]
gstring str_ChronoReinforceTanks                               , "ChronoReinforceTanks"
gstring str_UseAtomWhiteScreenEffectInMP                       , "UseAtomWhiteScreenEffectInMP"
gstring str_UseSinglePlayerAtomDamage                          , "UseSinglePlayerAtomDamage"
gstring str_UseCustomTutorialText                              , "UseCustomTutorialText"
gstring str_NextMissionInCampaign                              , "NextMissionInCampaign"
gstring str_ScenarioNumber                                     , "ScenarioNumber"
gstring str_MapSelectionAnimation                              , "MapSelectionAnimation"
gstring str_MapSelectA                                         , "MapSelectA"
gstring str_MapSelectB                                         , "MapSelectB"
gstring str_MapSelectC                                         , "MapSelectC"
gstring str_IsCoopMode                                         , "IsCoopMode"


gstring str_shp_NoIcon                                         , "NOICON.SHP"

; Defines -------------------------------------------------------------------------------------------------
; ---- AIBuildTypes ----
gstring str.AIBuildType.NONE                                   , "NONE"
gstring str.AIBuildType.POWER                                  , "POWER"
gstring str.AIBuildType.REFINERY                               , "REFINERY"
gstring str.AIBuildType.BARRACKS                               , "BARRACKS"
gstring str.AIBuildType.WARFACTORY                             , "WARFACTORY"
gstring str.AIBuildType.TECH                                   , "TECH"
gstring str.AIBuildType.DEFENSE                                , "DEFENSE"
gstring str.AIBuildType.ADV.DEFENSE                            , "ADV.DEFENSE"
gstring str.AIBuildType.AA.DEFENSE                             , "AA.DEFENSE"
gstring str.AIBuildType.AIRSTRIP                               , "AIRSTRIP"
gstring str.AIBuildType.HELIPAD                                , "HELIPAD"
gstring str.AIBuildType.GENERIC                                , "GENERIC"

gintarr strlist.AIBuildTypes                      			   , str.AIBuildType.NONE \
                                                               , str.AIBuildType.POWER \
                                                               , str.AIBuildType.REFINERY \
                                                               , str.AIBuildType.BARRACKS \
                                                               , str.AIBuildType.WARFACTORY \
                                                               , str.AIBuildType.TECH \
                                                               , str.AIBuildType.DEFENSE \
                                                               , str.AIBuildType.ADV.DEFENSE \
                                                               , str.AIBuildType.AA.DEFENSE \
                                                               , str.AIBuildType.AIRSTRIP \
                                                               , str.AIBuildType.HELIPAD \
                                                               , str.AIBuildType.GENERIC \
                                                               , 0

; ---- ArmorTypes ----
gstring str.ArmorType.None                                     , "none"
gstring str.ArmorType.Wood                                     , "wood"
gstring str.ArmorType.Light                                    , "light"
gstring str.ArmorType.Heavy                                    , "heavy"
gstring str.ArmorType.Concrete                                 , "concrete"
; new ArmorTypes names, inspired from RA2. Beware that they are added after the original and the order of armor types does not match that of RA2
gstring str.ArmorType.Flak                                     , "flak"
gstring str.ArmorType.Plate                                    , "plate"
gstring str.ArmorType.Medium                                   , "medium"
gstring str.ArmorType.Steel                                    , "steel"
; unimplemented ArmorTypes. On implementation of expansion to the warheadtype class memory size, additional armor types can be implemented to match RA2
gstring str.ArmorType.Special_1                                , "special_1"
gstring str.ArmorType.Special_2                                , "special_2"

gintarr strlist.ArmorTypes                                     , str.ArmorType.None \
                                                               , str.ArmorType.Wood \
                                                               , str.ArmorType.Light \
                                                               , str.ArmorType.Heavy \
                                                               , str.ArmorType.Concrete \
                                                               , str.ArmorType.Flak \
                                                               , str.ArmorType.Plate \
                                                               , str.ArmorType.Medium \
                                                               , str.ArmorType.Steel \
                                                               , str.ArmorType.Special_1 \
                                                               , str.ArmorType.Special_2 \
                                                               , 0

gstring str.ArmorOneDefault                                    , "100%%"
gstring str.ArmorDefault                                       , "100%%,100%%,100%%,100%%,100%%,100%%,100%%,100%%,100%%,100%%,100%%"

; ---- HouseTypes ----
gstring str_Multi1                                             , "Multi1"
gstring str_Multi2                                             , "Multi2"
gstring str_Multi3                                             , "Multi3"
gstring str_Multi4                                             , "Multi4"
gstring str_Multi5                                             , "Multi5"
gstring str_Multi6                                             , "Multi6"
gstring str_Multi7                                             , "Multi7"
gstring str_Multi8                                             , "Multi8"
;Additional houses
gstring str_Multi9                                             , "Multi9"
gstring str_Multi10                                            , "Multi10"
gstring str_Multi11                                            , "Multi11"
gstring str_Multi12                                            , "Multi12"
gstring str_Multi13                                            , "Multi13"
gstring str_Multi14                                            , "Multi14"
gstring str_Multi15                                            , "Multi15"
gstring str_Multi16                                            , "Multi16"
gstring str_Multi17                                            , "Multi17"
gstring str_Multi18                                            , "Multi18"
gstring str_Multi19                                            , "Multi19"
gstring str_Multi20                                            , "Multi20"
gstring str_MP9                                                , "MP9"
gstring str_MP10                                               , "M10"
gstring str_MP11                                               , "M11"
gstring str_MP12                                               , "M12"
gstring str_MP13                                               , "M13"
gstring str_MP14                                               , "M14"
gstring str_MP15                                               , "M15"
gstring str_MP16                                               , "M16"
gstring str_MP17                                               , "M17"
gstring str_MP18                                               , "M18"
gstring str_MP19                                               , "M19"
gstring str_MP20                                               , "M20"

; ---- PlayerColorTypes ----
gstring str.PlayerColorType.YELLOW                             , "YELLOW"
gstring str.PlayerColorType.LTBLUE                             , "LTBLUE"
gstring str.PlayerColorType.RED                                , "RED"
gstring str.PlayerColorType.GREEN                              , "GREEN"
gstring str.PlayerColorType.ORANGE                             , "ORANGE"
gstring str.PlayerColorType.GREY                               , "GREY"
gstring str.PlayerColorType.BLUE                               , "BLUE"
gstring str.PlayerColorType.BROWN                              , "BROWN"
gstring str.PlayerColorType.WHITE                              , "WHITE"
gstring str.PlayerColorType.BLACK                              , "BLACK"
gstring str.PlayerColorType.FLAMING_BLUE                       , "FLAMING_BLUE"
gstring str.PlayerColorType.TRUE_GREY                          , "TRUE_GREY"
gstring str.PlayerColorType.DIRTY_GREEN                        , "DIRTY_GREEN"

gintarr strlist.PlayerColorTypes		                       , str.PlayerColorType.YELLOW \
										                       , str.PlayerColorType.LTBLUE \
										                       , str.PlayerColorType.RED \
										                       , str.PlayerColorType.GREEN \
										                       , str.PlayerColorType.ORANGE \
										                       , str.PlayerColorType.GREY \
										                       , str.PlayerColorType.BLUE \
										                       , str.PlayerColorType.BROWN \
										                       , str.PlayerColorType.WHITE \
										                       , str.PlayerColorType.BLACK \
										                       , str.PlayerColorType.FLAMING_BLUE \
										                       , str.PlayerColorType.TRUE_GREY \
										                       , str.PlayerColorType.DIRTY_GREEN \
										                       , 0

; ---- PrereqTypes ----
gstring str.PrereqType.NONE                                    , "NONE"
gstring str.PrereqType.CONYARD                                 , "CONYARD"
gstring str.PrereqType.POWER                                   , "POWER"
gstring str.PrereqType.ADV.POWER                               , "ADV.POWER"
gstring str.PrereqType.REFINERY                                , "REFINERY"
gstring str.PrereqType.ORESILO                                 , "ORESILO"
gstring str.PrereqType.BARRACKS                                , "BARRACKS"
gstring str.PrereqType.WARFACTORY                              , "WARFACTORY"
gstring str.PrereqType.RADAR                                   , "RADAR"
gstring str.PrereqType.REPAIR                                  , "REPAIR"
gstring str.PrereqType.DEFENSE                                 , "DEFENSE"
gstring str.PrereqType.ADV.DEFENSE                             , "ADV.DEFENSE"
gstring str.PrereqType.AA.DEFENSE                              , "AA.DEFENSE"
gstring str.PrereqType.TECH                                    , "TECH"
gstring str.PrereqType.AIRSTRIP                                , "AIRSTRIP"
gstring str.PrereqType.HELIPAD                                 , "HELIPAD"
gstring str.PrereqType.SHIPYARD                                , "SHIPYARD"
gstring str.PrereqType.LAB                                     , "LAB"
gstring str.PrereqType.ADV.LAB                                 , "ADV.LAB"
gstring str.PrereqType.ADV.WEAPON1                             , "ADV.WEAPON1"
gstring str.PrereqType.ADV.WEAPON2                             , "ADV.WEAPON2"
gstring str.PrereqType.FAKES                                   , "FAKES"
gstring str.PrereqType.USER.22                                 , "USER.22"
gstring str.PrereqType.USER.23                                 , "USER.23"
gstring str.PrereqType.USER.24                                 , "USER.24"
gstring str.PrereqType.USER.25                                 , "USER.25"
gstring str.PrereqType.USER.26                                 , "USER.26"
gstring str.PrereqType.USER.27                                 , "USER.27"
gstring str.PrereqType.USER.28                                 , "USER.28"
gstring str.PrereqType.USER.29                                 , "USER.29"
gstring str.PrereqType.MISC                                    , "MISC"
gstring str.PrereqType.CIVBUILDING                             , "CIVBUILDING"

gintarr strlist.PrereqTypes                                    , str.PrereqType.NONE \
                                                               , str.PrereqType.CONYARD \
                                                               , str.PrereqType.POWER \
                                                               , str.PrereqType.ADV.POWER \
                                                               , str.PrereqType.REFINERY \
                                                               , str.PrereqType.ORESILO \
                                                               , str.PrereqType.BARRACKS \
                                                               , str.PrereqType.WARFACTORY \
                                                               , str.PrereqType.RADAR \
                                                               , str.PrereqType.REPAIR \
                                                               , str.PrereqType.DEFENSE \
                                                               , str.PrereqType.ADV.DEFENSE \
                                                               , str.PrereqType.AA.DEFENSE \
                                                               , str.PrereqType.TECH \
                                                               , str.PrereqType.AIRSTRIP \
                                                               , str.PrereqType.HELIPAD \
                                                               , str.PrereqType.SHIPYARD \
                                                               , str.PrereqType.LAB \
                                                               , str.PrereqType.ADV.LAB \
                                                               , str.PrereqType.ADV.WEAPON1 \
                                                               , str.PrereqType.ADV.WEAPON2 \
                                                               , str.PrereqType.FAKES \
                                                               , str.PrereqType.USER.22 \
                                                               , str.PrereqType.USER.23 \
                                                               , str.PrereqType.USER.24 \
                                                               , str.PrereqType.USER.25 \
                                                               , str.PrereqType.USER.26 \
                                                               , str.PrereqType.USER.27 \
                                                               , str.PrereqType.USER.28 \
                                                               , str.PrereqType.USER.29 \
                                                               , str.PrereqType.MISC \
                                                               , str.PrereqType.CIVBUILDING \
                                                               , 0

; ---- RTTITypes ----
gstring str.RTTIType.None                                      , "None"
gstring str.RTTIType.Aircraft                                  , "Aircraft"
gstring str.RTTIType.AircraftType                              , "AircraftType"
gstring str.RTTIType.Anim                                      , "Anim"
gstring str.RTTIType.AnimType                                  , "AnimType"
gstring str.RTTIType.Building                                  , "Building"
gstring str.RTTIType.BuildingType                              , "BuildingType"
gstring str.RTTIType.Bullet                                    , "Bullet"
gstring str.RTTIType.BulletType                                , "BulletType"
gstring str.RTTIType.Cell                                      , "Cell"
gstring str.RTTIType.Factory                                   , "Factory"
gstring str.RTTIType.House                                     , "House"
gstring str.RTTIType.HouseType                                 , "HouseType"
gstring str.RTTIType.Infantry                                  , "Infantry"
gstring str.RTTIType.InfantryType                              , "InfantryType"
gstring str.RTTIType.Overlay                                   , "Overlay"
gstring str.RTTIType.OverlayType                               , "OverlayType"
gstring str.RTTIType.Smudge                                    , "Smudge"
gstring str.RTTIType.SmudgeType                                , "SmudgeType"
gstring str.RTTIType.Special                                   , "Special"
gstring str.RTTIType.Team                                      , "Team"
gstring str.RTTIType.TeamType                                  , "TeamType"
gstring str.RTTIType.Template                                  , "Template"
gstring str.RTTIType.TemplateType                              , "TemplateType"
gstring str.RTTIType.Terrain                                   , "Terrain"
gstring str.RTTIType.TerrainType                               , "TerrainType"
gstring str.RTTIType.Trigger                                   , "Trigger"
gstring str.RTTIType.TriggerType                               , "TriggerType"
gstring str.RTTIType.Unit                                      , "Unit"
gstring str.RTTIType.UnitType                                  , "UnitType"
gstring str.RTTIType.Vessel                                    , "Vessel"
gstring str.RTTIType.VesselType                                , "VesselType"

; ---- SpecialTypes ----
gstring str.SpecialType.NONE                                   , "NONE"
gstring str.SpecialType.SONAR_PULSE                            , "SONARPULSE"
gstring str.SpecialType.NUCLEAR_BOMB                           , "NUCLEARBOMB" 
gstring str.SpecialType.CHRONOSPHERE                           , "CHRONOSPHERE"
gstring str.SpecialType.PARA_BOMB                              , "PARABOMB"
gstring str.SpecialType.PARA_INFANTRY                          , "PARAINFANTRY"
gstring str.SpecialType.SPY_MISSION                            , "SPYPLANE"
gstring str.SpecialType.IRON_CURTAIN                           , "IRONCURTAIN"
gstring str.SpecialType.GPS                                    , "GPS"

gintarr strlist.SpecialTypes                                   , str.SpecialType.NONE \
                                                               , str.SpecialType.SONAR_PULSE \
                                                               , str.SpecialType.NUCLEAR_BOMB \
                                                               , str.SpecialType.CHRONOSPHERE \
                                                               , str.SpecialType.PARA_BOMB \
                                                               , str.SpecialType.PARA_INFANTRY \
                                                               , str.SpecialType.SPY_MISSION \
                                                               , str.SpecialType.IRON_CURTAIN \
                                                               , str.SpecialType.GPS \
                                                               , 0


; -------------------------------------------------------------------------------------------------




