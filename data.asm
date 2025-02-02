;----------------------------------------------------------------
; store.asm
;
; Stored Data Definitions
;   Variable storage for variables that span more than one assembly page can be stored here for easy reference.
;
;----------------------------------------------------------------
%include "const.inc"
%include "macros/setsym.inc"
%include "macros/datatypes.inc"

;;; INI entry buffer
gbuf   INI_Loop_Entry_Buffer                                  ,256

;;; INI read buffer
gbuf   INI_Read_String_Buffer                                 ,INI_STRING_BUFFER_LENGTH
gint   INI_Read_Value_Buffer                                  ,0

;;; Temporary location for CCFILE storage 
; Note: sizes not actually verified. Check against Remaster
gbuf   CCFileClass_OOSFix                                     ,256
gbuf   CCINIClass_OOSFix                                      ,256
; src/features/load_ai_ini.asm
gbuf   CCFileClass_AI                                         ,256
gbuf   CCINIClass_AI                                          ,256
; src/features/loading.asm
gbuf   CCFileClass_RedAlert                                   ,128
gbuf   CCINIClass_RedAlert                                    ,64
gint   TutorialINIPointer                                     ,0
gbuf   CCFileClass_TutorialText                               ,128
gbuf   CCINIClass_TutorialText                                ,128
; src/features/spawn.asm
gbuf   CCFileClass_Spawn                                      ,128
gbuf   CCINIClass_Spawn                                       ,64
gbuf   CCFileClass_Map                                        ,128
gbuf   CCINIClass_Map                                         ,64

; new SoundEffects
gbuf   SoundEffectsList                                       ,2304 ; 9 bytes per entry * 256; the new list supports up to 256 new entries 
gint   SoundEffects.Count                                     ,0

; Next mission buffer
gbuf   NextCampaignMissionBuf                                 ,128
gbuf   MapSelectionAnimationBuf                               ,128
gbuf   MapSelectABuf                                          ,128
gbuf   MapSelectBBuf                                          ,128
gbuf   MapSelectCBuf                                          ,128

;;; Temporary location for new global storages
; intended for values that are loaded from INI
; [General]
gint   Rules.General.AtomRadius                               ,0
gbool  Rules.General.ParabombsInMultiplayer                   ,0
gbool  Rules.General.EvacInMP                                 ,1
gbool  Rules.General.RemapJammedBuildings                     ,0
gbool  Rules.General.FixFormationSpeed                        ,0
gbool  Rules.General.FixWideAreaDamage                        ,0
gbool  Rules.General.ScalePowerBar                            ,0
gbool  Rules.General.NoTeslaZapEffectDelay                    ,0
gbool  Rules.General.NoScreenShake                            ,0
gbool  Rules.General.BuildOffAlly                             ,0
gint   Rules.General.DeathReport1                             ,0
gshort Rules.General.DeathReport1_Data                        ,0,16
gint   Rules.General.DeathReport2                             ,0
gshort Rules.General.DeathReport2_Data                        ,0,16
gint   Rules.General.DeathReport3                             ,0
gshort Rules.General.DeathReport3_Data                        ,0,16
gint   Rules.General.DeathReport4                             ,0
gshort Rules.General.DeathReport4_Data                        ,0,16
gint   Rules.General.DeathReport5                             ,0
gshort Rules.General.DeathReport5_Data                        ,0,16
gint   Rules.General.DeathReport                              ,0
gshort Rules.General.DeathReport_Data                         ,0,16
gint   Rules.General.TanyaDeathReport                         ,0
gshort Rules.General.TanyaDeathReport_Data                    ,0,16
gint   Rules.General.DogDeathReport                           ,0
gshort Rules.General.DogDeathReport_Data                      ,0,16

; [AI]
gint   Rules.AI.EasyAIGoldValue                               ,-1
gint   Rules.AI.EasyAIGemValue                                ,-1
gint   Rules.AI.NormalAIGoldValue                             ,-1
gint   Rules.AI.NormalAIGemValue                              ,-1
gint   Rules.AI.HardAIGoldValue                               ,-1
gint   Rules.AI.HardAIGemValue                                ,-1

gbool  Rules.AI.BuildRadarWithoutAirThreatCheck               ,0
gbool  Rules.AI.ComputerParanoidForceDisabledSkirmish         ,1
gbool  Rules.AI.FixAISendingTanksTopLeft                      ,0
gbool  Rules.AI.FixAIParanoid                                 ,0
gbool  Rules.AI.FixAIAlly                                     ,0
gbool  Rules.AI.SingleplayerAIObeyPrerequisites               ,0
gbool  Rules.AI.UseNewBuildingAI                              ,0
gbool  Rules.AI.ForceSingleTileClearing                       ,0
gbool  Rules.AI.GuardAreaLoadTransportsInSingleplayer         ,0
gbool  Rules.AI.RepairConstructedBuildingsInSingleplayer      ,0
gint   Rules.AI.PowerExcess                                   ,-1
gint   Rules.AI.PowerEmergencyMinimum                         ,-1

; [StringTableOffset]
gint   Rules.StringTableOffsets.InfantryTypes                 ,-1
gint   Rules.StringTableOffsets.UnitTypes                     ,-1
gint   Rules.StringTableOffsets.AircraftTypes                 ,-1
gint   Rules.StringTableOffsets.VesselTypes                   ,-1
gint   Rules.StringTableOffsets.BuildingTypes                 ,-1

; [Aftermath]
gbool  Rules.Aftermath.AftermathFastBuildSpeed                ,0

; RedAlert.ini [Options]
gbool  RedAlert.Options.AftermathEnabled                      ,1
gbool  RedAlert.Options.AlternativeRifleSound                 ,0
gbool  RedAlert.Options.ColorRemapSidebarIcons                ,0
gbool  RedAlert.Options.CounterstrikeEnabled                  ,1
gbool  RedAlert.Options.DebugLogging                          ,1
gbool  RedAlert.Options.DisplayAftermathMultiplayerMaps       ,1
gbool  RedAlert.Options.DisplayCounterstrikeMultiplayerMaps   ,1
gbool  RedAlert.Options.DisplayOriginalMultiplayerMaps        ,1
gbool  RedAlert.Options.EnableWOL                             ,0
gbool  RedAlert.Options.FastAMBuildSpeed                      ,0
gbool  RedAlert.Options.ForceAMUnitsInMissions                ,0
gbool  RedAlert.Options.ForceSingleCPU                        ,0
gint   RedAlert.Options.GameLanguage                          ,1
gbool  RedAlert.Options.GenerateMemoryDump                    ,0
gbool  RedAlert.Options.MouseWheelScrolling                   ,0
gbool  RedAlert.Options.NoCDMode                              ,1
gbool  RedAlert.Options.RandomStartingSong                    ,0
gbool  RedAlert.Options.SkipScoreScreen                       ,0
gbool  RedAlert.Options.UseGrenadeThrowingSound               ,0
gbool  RedAlert.Options.UseBetaCruiser                        ,0
gbool  RedAlert.Options.UseBetaDestroyer                      ,0
gbool  RedAlert.Options.UseBetaGunboat                        ,0
gbool  RedAlert.Options.UseBetaSubmarine                      ,0
gbool  RedAlert.Options.UseBetaTeslaTank                      ,0
gbool  RedAlert.Options.UseDOSInterfaceMod                    ,0
gbool  RedAlert.Options.UseSmallInfantry                      ,0
gint   RedAlert.Options.VideoInterlaceMode                    ,2
gshort RedAlert.WinHotKeys.KeyMapSnapshot                     ,0
gshort RedAlert.WinHotKeys.KeySidebarToggle                   ,0

; Spawn.ini
gbool  Spawn.Settings.Aftermath                               ,0
gbool  Spawn.Settings.AllyReveal                              ,0
gbool  Spawn.Settings.DeadPlayersRadar                        ,0
gbool  Spawn.Settings.FixMagicBuild                           ,0
gbool  Spawn.Settings.FixRangeExploit                         ,0
gbool  Spawn.Settings.ForcedAlliances                         ,0
gbool  Spawn.Settings.MCVUndeploy                             ,0
gbool  Spawn.Settings.ShortGame                               ,0
gbool  Spawn.Settings.SouthAdvantageFix                       ,0
gbool  Spawn.Settings.TechCenterBugFix                        ,0

; Color remaps
%assign RemapControlType.SIZE                                 282 ; only use within this file
gbuf   ColorRemaps.ExtendedColors                             ,RemapControlType.SIZE * 5 ; 3600

gint   ColorRemaps.White.Offset                               ,0
gint   ColorRemaps.Black.Offset                               ,RemapControlType.SIZE
gint   ColorRemaps.FlamingBlue.Offset                         ,RemapControlType.SIZE * 2
gint   ColorRemaps.TrueGrey.Offset                            ,RemapControlType.SIZE * 3
gint   ColorRemaps.DirtyGreen.Offset                          ,RemapControlType.SIZE * 4

; unsorted
gbool  Toggle_Fix_NavalRepairExploit                          ,0 ; 'hardcoded' and not settable?
gint   buildingcrewstuckfix                                   ,0 ; 'hardcoded' and not settable?
gbool  spawner_is_active                                      ,0 ; seems to be only read and not written to?
gint   SetProcessAffinityMask                                 ,0
gint   OreMineFoundation                                      ,0
gint   FRAG1AnimData                                          ,0

; features/loading/loading_map.asm
gbuf   sprintf_key_buffer                                     ,512
gbuf   strdup_text_buffer                                     ,512
gbuf   tutorial_text_buffer                                   ,512

; custom_missions.asm
gbuf   sprintf_buffer3                                        ,512
gint   MissionCounter                                         ,0

; Map [Basic]
gint   Map.Basic.ChronoReinforceTanks                         ,0
gint   Map.Basic.UseAtomWhiteScreenEffectInMP                 ,0
gint   Map.Basic.UseSinglePlayerAtomDamage                    ,0

;;; Temporary location until the House macros are completed
; store the new specialtype record per house (use 32-bit instead of 16-bit in case we use a different location within BuildingType to store the special type)
; 20 houses are supported, we introduce Multi9-20 to support up to 32 houses
gbuf   Houses.SpecialScan                                     ,128  
gbuf   Houses.Radar                                           ,32 
gbuf   Houses.Factory                                         ,32 
gbuf   Houses.BSignificantScan                                ,32      ; 256 entries, 32 bytes
gbuf   Houses.BScan                                           ,1024    ; 32 houses * (256 entries, 32 bytes)
;gbuf   Houses.BGroupScan                                      ,1024    ; 32 houses * (256 entries, 32 bytes)
gbuf   Houses.BQuantity                                       ,8192    ; 32 houses  * 256 entries
gbuf   Houses.UQuantity                                       ,8192    ; 32 houses  * 256 entries
gbuf   Houses.IQuantity                                       ,8192    ; 32 houses  * 256 entries
gbuf   Houses.AQuantity                                       ,8192    ; 32 houses  * 256 entries
gbuf   Houses.VQuantity                                       ,8192    ; 32 houses  * 256 entries
gbuf   Houses.HouseTriggers                                   ,768     ; 32 houses * 24 bytes
gbuf   HouseTypeClass.Multi9                                  ,316
gbuf   HouseTypeClass.Multi10                                 ,316
gbuf   HouseTypeClass.Multi11                                 ,316
gbuf   HouseTypeClass.Multi12                                 ,316
gbuf   HouseTypeClass.Multi13                                 ,316
gbuf   HouseTypeClass.Multi14                                 ,316
gbuf   HouseTypeClass.Multi15                                 ,316
gbuf   HouseTypeClass.Multi16                                 ,316
gbuf   HouseTypeClass.Multi17                                 ,316
gbuf   HouseTypeClass.Multi18                                 ,316
gbuf   HouseTypeClass.Multi19                                 ,316
gbuf   HouseTypeClass.Multi20                                 ,316

gbuf   HouseTypeClass.DestructorPtrs                          ,256 ; 32 total houses * 2 ptrs 
gint   HouseTypeClass_p1                                      ,0x00405610 ; (originally around 0x005FA8A8)
gint   HouseTypeClass_p2                                      ,0x0040561C
gint   HouseTypeClass_p3                                      ,0x0040566C
gint   HouseTypeClass_p4                                      ,0x004CD174 ; do not remove - the deconstructor may use these functions
