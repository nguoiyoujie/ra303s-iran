;----------------------------------------------------------------
; defines/storeddata.asm
;
; Stored Data Definitions
;   Variable storage for variables that span more than one assembly page
;
;----------------------------------------------------------------

[section .data] 
;;; Temporary location for CCFILE storage 
; Note: sizes not actually verified. Check against Remaster
; src/fixes/rules_oos.asm
CCFileClass_OOSFix                TIMES 256 db 0
CCINIClass_OOSFix                 TIMES 256 db 0
; src/features/load_ai_ini.asm
CCFileClass_AI                    TIMES 256 db 0
CCINIClass_AI                     TIMES 256 db 0
; src/features/loading.asm
CCFileClass_RedAlert              TIMES 128 db 0
CCINIClass_RedAlert               TIMES 64 db 0
TutorialINIPointer                dd 0
CCFileClass_TutorialText          TIMES 128 db 0
CCINIClass_TutorialText           TIMES 128 db 0
; src/features/spawn.asm
CCFileClass_Spawn                 TIMES 128 db 0
CCINIClass_Spawn                  TIMES 64 db 0
CCFileClass_Map                   TIMES 128 db 0
CCINIClass_Map                    TIMES 64 db 0

; new SoundEffects
SoundEffectsList                  TIMES 2304 dd 0 ; 9 bytes per entry * 256; the new list supports up to 256 new entries 
SoundEffects.Count                dd 0

; Next mission buffer
NextCampaignMissionBuf TIMES 128 db 0
MapSelectionAnimationBuf TIMES 128 db 0
MapSelectABuf TIMES 128 db 0
MapSelectBBuf TIMES 128 db 0
MapSelectCBuf TIMES 128 db 0

;;; Temporary location for new global storages
; intended for values that are loaded from INI
; [General]
Rules.General.AtomRadius dd 0
Rules.General.ParabombsInMultiplayer db 0
Rules.General.EvacInMP db 1
Rules.General.RemapJammedBuildings db 0
Rules.General.FixFormationSpeed db 0
Rules.General.FixWideAreaDamage db 0
Rules.General.ScalePowerBar db 0
Rules.General.NoTeslaZapEffectDelay db 0
Rules.General.NoScreenShake db 0
Rules.General.BuildOffAlly db 0
Rules.General.DeathReport1 dd 0
Rules.General.DeathReport1_Data times 16 dw 0
Rules.General.DeathReport2 dd 0
Rules.General.DeathReport2_Data times 16 dw 0
Rules.General.DeathReport3 dd 0
Rules.General.DeathReport3_Data times 16 dw 0
Rules.General.DeathReport4 dd 0
Rules.General.DeathReport4_Data times 16 dw 0
Rules.General.DeathReport5 dd 0
Rules.General.DeathReport5_Data times 16 dw 0
Rules.General.DeathReport dd 0
Rules.General.DeathReport_Data times 16 dw 0
Rules.General.TanyaDeathReport dd 0
Rules.General.TanyaDeathReport_Data times 16 dw 0
Rules.General.DogDeathReport dd 0
Rules.General.DogDeathReport_Data times 16 dw 0

; [AI]
Rules.AI.EasyAIGoldValue dd -1
Rules.AI.EasyAIGemValue dd -1
Rules.AI.NormalAIGoldValue dd -1
Rules.AI.NormalAIGemValue dd -1
Rules.AI.HardAIGoldValue dd -1
Rules.AI.HardAIGemValue dd -1

Rules.AI.BuildRadarWithoutAirThreatCheck db 0
Rules.AI.ComputerParanoidForceDisabledSkirmish db 1
Rules.AI.FixAISendingTanksTopLeft db 0
Rules.AI.FixAIParanoid db 0
Rules.AI.FixAIAlly db 0
Rules.AI.SingleplayerAIObeyPrerequisites db 0
Rules.AI.UseNewBuildingAI db 0
Rules.AI.ForceSingleTileClearing db 0
Rules.AI.GuardAreaLoadTransportsInSingleplayer db 0
Rules.AI.RepairConstructedBuildingsInSingleplayer db 0
Rules.AI.PowerExcess dd -1
Rules.AI.PowerEmergencyMinimum dd -1

; [StringTableOffset]
Rules.StringTableOffsets.InfantryTypes  dd -1
Rules.StringTableOffsets.UnitTypes      dd -1
Rules.StringTableOffsets.AircraftTypes  dd -1
Rules.StringTableOffsets.VesselTypes    dd -1
Rules.StringTableOffsets.BuildingTypes  dd -1

; [Aftermath]
Rules.Aftermath.AftermathFastBuildSpeed    db 0

; RedAlert.ini [Options]
RedAlert.Options.AftermathEnabled db 1
RedAlert.Options.AlternativeRifleSound db 0
RedAlert.Options.ColorRemapSidebarIcons db 0
RedAlert.Options.CounterstrikeEnabled db 1
RedAlert.Options.DebugLogging db 1
RedAlert.Options.DisplayAftermathMultiplayerMaps db 1
RedAlert.Options.DisplayCounterstrikeMultiplayerMaps db 1
RedAlert.Options.DisplayOriginalMultiplayerMaps db 1
RedAlert.Options.EnableWOL db 0
RedAlert.Options.FastAMBuildSpeed db 0
RedAlert.Options.ForceAMUnitsInMissions db 0
RedAlert.Options.ForceSingleCPU db 0
RedAlert.Options.GameLanguage dd 1
RedAlert.Options.GenerateMemoryDump    db 0
RedAlert.Options.MouseWheelScrolling db 0
RedAlert.Options.NoCDMode db 1
RedAlert.Options.RandomStartingSong db 0
RedAlert.Options.SkipScoreScreen db 0
RedAlert.Options.UseGrenadeThrowingSound db 0
RedAlert.Options.UseBetaCruiser db 0
RedAlert.Options.UseBetaDestroyer db 0
RedAlert.Options.UseBetaGunboat db 0
RedAlert.Options.UseBetaSubmarine db 0
RedAlert.Options.UseBetaTeslaTank db 0
RedAlert.Options.UseDOSInterfaceMod db 0
RedAlert.Options.UseSmallInfantry db 0
RedAlert.Options.VideoInterlaceMode dd 2
RedAlert.WinHotKeys.KeyMapSnapshot dw 0
RedAlert.WinHotKeys.KeySidebarToggle dw 0

; Spawn.ini
Spawn.Settings.Aftermath db 0
Spawn.Settings.AllyReveal db 0
Spawn.Settings.DeadPlayersRadar db 0
Spawn.Settings.FixMagicBuild db 0
Spawn.Settings.FixRangeExploit db 0
Spawn.Settings.ForcedAlliances db 0
Spawn.Settings.MCVUndeploy db 0
Spawn.Settings.ShortGame db 0
Spawn.Settings.SouthAdvantageFix db 0
Spawn.Settings.TechCenterBugFix db 0

; Color remaps
%assign RemapControlType.SIZE              282
ColorRemaps.ExtendedColors                 times RemapControlType.SIZE * 5 db 0 ; 3600

%define ColorRemaps.White.Offset           0
%define ColorRemaps.Black.Offset           RemapControlType.SIZE
%define ColorRemaps.FlamingBlue.Offset     RemapControlType.SIZE * 2
%define ColorRemaps.TrueGrey.Offset        RemapControlType.SIZE * 3
%define ColorRemaps.DirtyGreen.Offset      RemapControlType.SIZE * 4

; unsorted
Toggle_Fix_NavalRepairExploit db 0 ; 'hardcoded' and not settable?
buildingcrewstuckfix dd 0 ; 'hardcoded' and not settable?
spawner_is_active  db 0 ; seems to be only read and not written to?
SetProcessAffinityMask dd 0
OreMineFoundation dd 0
FRAG1AnimData dd 0

; features/loading/loading_map.asm
sprintf_key_buffer TIMES 512 db 0
strdup_text_buffer TIMES 512 db 0
tutorial_text_buffer  TIMES 512 db 0

; custom_missions.asm

sprintf_buffer3 TIMES 512 db 0
MissionCounter    dd    0

; Map [Basic]
Map.Basic.ChronoReinforceTanks dd 0
Map.Basic.UseAtomWhiteScreenEffectInMP dd 0
Map.Basic.UseSinglePlayerAtomDamage dd 0

;;; Temporary location until the House macros are completed
; store the new specialtype record per house (use 32-bit instead of 16-bit in case we use a different location within BuildingType to store the special type)
; 20 houses are supported, we introduce Multi9-20 to support up to 32 houses
Houses.SpecialScan                                times 32 dd 0 
Houses.Radar                                      times 32 db 0 
Houses.Factory                                    times 32 db 0 
Houses.BSignificantScan                           times 32 db 0      ; 256 entries, 32 bytes
Houses.BScan                                      times 1024 db 0    ; 32 houses * (256 entries, 32 bytes)
;Houses.BGroupScan                                 times 1024 db 0    ; 32 houses * (256 entries, 32 bytes)
Houses.BQuantity                                  times 8192 db 0    ; 32 houses  * 256 entries
Houses.UQuantity                                  times 8192 db 0    ; 32 houses  * 256 entries
Houses.IQuantity                                  times 8192 db 0    ; 32 houses  * 256 entries
Houses.AQuantity                                  times 8192 db 0    ; 32 houses  * 256 entries
Houses.VQuantity                                  times 8192 db 0    ; 32 houses  * 256 entries
Houses.HouseTriggers                              times 768 db 0 ; 32 houses * 24 bytes
HouseTypeClass.Multi9                             times 316 db 0
HouseTypeClass.Multi10                            times 316 db 0
HouseTypeClass.Multi11                            times 316 db 0
HouseTypeClass.Multi12                            times 316 db 0
HouseTypeClass.Multi13                            times 316 db 0
HouseTypeClass.Multi14                            times 316 db 0
HouseTypeClass.Multi15                            times 316 db 0
HouseTypeClass.Multi16                            times 316 db 0
HouseTypeClass.Multi17                            times 316 db 0
HouseTypeClass.Multi18                            times 316 db 0
HouseTypeClass.Multi19                            times 316 db 0
HouseTypeClass.Multi20                            times 316 db 0

HouseTypeClass.DestructorPtrs                     times 256 db 0 ; 32 total houses * 2 ptrs 
HouseTypeClass_p1                                 dd 0x00405610 ; (originally around 0x005FA8A8)
HouseTypeClass_p2                                 dd 0x0040561C
HouseTypeClass_p3                                 dd 0x0040566C
HouseTypeClass_p4                                 dd 0x004CD174 ; do not remove - the deconstructor may use these functions

[section .text] 
