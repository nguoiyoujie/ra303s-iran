
extern Globals___Session_Type


%define New_Savegame_Version    0x1007000
%define Old_Savegame_Version    0x100618B
%define SaveGameVersion         0x0065D7C0 ; global variable

@SET 0x00537B32,{mov eax,New_Savegame_Version} ; _Save_Game_Save_Game_Version

;ARGS: <offset/pointer to value to SAVE>, <size in byte>
%macro Save_Global_Value 2
    mov  ebx,%2
    mov  esi,[ecx+8]
    mov  edx,%1
    mov  eax,ecx
    call dword[esi+0x10]
%endmacro

;ARGS: <offset/pointer to value to LOAD>, <size in byte>
%macro Load_Global_Value 2
    mov  ebx,%2
    mov  esi,[ecx+8]
    mov  edx,%1
    mov  eax,ecx
    call dword[esi+8]
%endmacro


; Loading and saving data in Save- and Load_Misc_Values_Extended_Savegames
; need to be in the same order or else the game will crash or stuff with corrupt
@HACK 0x0053903A,0x00539042,_Save_Misc_Values_Extended_Savegames
    call dword[esi+0x10]

    Save_Global_Value Globals___Session_Type,1
    Save_Global_Value Rules.General.BuildOffAlly,1
    Save_Global_Value Rules.Aftermath.AftermathFastBuildSpeed,1
    Save_Global_Value Spawn.Settings.DeadPlayersRadar,1
    Save_Global_Value Spawn.Settings.Aftermath,1
    Save_Global_Value Spawn.Settings.ShortGame,1
    Save_Global_Value Rules.General.NoTeslaZapEffectDelay,1
    Save_Global_Value Rules.General.NoScreenShake,1
    Save_Global_Value Spawn.Settings.TechCenterBugFix,1
    Save_Global_Value Spawn.Settings.ForcedAlliances,1
    Save_Global_Value Spawn.Settings.AllyReveal,1
    Save_Global_Value Spawn.Settings.MCVUndeploy,1
    Save_Global_Value buildingcrewstuckfix,1
    Save_Global_Value Spawn.Settings.FixMagicBuild,1
    Save_Global_Value Spawn.Settings.FixRangeExploit,1
    Save_Global_Value Rules.AI.ComputerParanoidForceDisabledSkirmish,1
    Save_Global_Value Rules.AI.BuildRadarWithoutAirThreatCheck,1
    Save_Global_Value Rules.AI.FixAIParanoid,1
    Save_Global_Value Rules.AI.FixAIAlly,1
    Save_Global_Value Rules.General.FixFormationSpeed,1
    Save_Global_Value Rules.General.ParabombsInMultiplayer,1
    Save_Global_Value Rules.General.EvacInMP,1
    Save_Global_Value Rules.AI.FixAISendingTanksTopLeft,1
    Save_Global_Value InCoopMode,4
    Save_Global_Value Toggle_Fix_NavalRepairExploit,1

.Ret:
    mov  eax,[0x00667808]; ds:Objects_Selected?
    jmp  0x00539042
@ENDHACK


@HACK 0x00539106,0x0053910E,_Load_Misc_Values_Extended_Savegames
    call dword[esi+8]

    cmp  dword[SaveGameVersion],New_Savegame_Version
    jnz  .Ret ; SaveGameVersion != New_Savegame_Version so return

    Load_Global_Value Globals___Session_Type,1
    Load_Global_Value Rules.General.BuildOffAlly,1
    Load_Global_Value Rules.Aftermath.AftermathFastBuildSpeed,1
    Load_Global_Value Spawn.Settings.DeadPlayersRadar,1
    Load_Global_Value Spawn.Settings.Aftermath,1
    Load_Global_Value Spawn.Settings.ShortGame,1
    Load_Global_Value Rules.General.NoTeslaZapEffectDelay,1
    Load_Global_Value Rules.General.NoScreenShake,1
    Load_Global_Value Spawn.Settings.TechCenterBugFix,1
    Load_Global_Value Spawn.Settings.ForcedAlliances,1
    Load_Global_Value Spawn.Settings.AllyReveal,1
    Load_Global_Value Spawn.Settings.MCVUndeploy,1
    Load_Global_Value buildingcrewstuckfix,1
    Load_Global_Value Spawn.Settings.FixMagicBuild,1
    Load_Global_Value Spawn.Settings.FixRangeExploit,1
    Load_Global_Value Rules.AI.ComputerParanoidForceDisabledSkirmish,1
    Load_Global_Value Rules.AI.BuildRadarWithoutAirThreatCheck,1
    Load_Global_Value Rules.AI.FixAIParanoid,1
    Load_Global_Value Rules.AI.FixAIAlly,1
    Load_Global_Value Rules.General.FixFormationSpeed,1
    Load_Global_Value Rules.General.ParabombsInMultiplayer,1
    Load_Global_Value Rules.General.EvacInMP,1
    Load_Global_Value Rules.AI.FixAISendingTanksTopLeft,1
    Load_Global_Value InCoopMode,4
    Load_Global_Value Toggle_Fix_NavalRepairExploit,1

.Ret:
    mov  ebx,4
    jmp  0x0053910E
@ENDHACK


@HACK 0x00537FED,0x00537FF2,_Load_Game_Patch_Version_Check
;    jmp        0x0053805E ; HACK: always pass check
    cmp  eax,New_Savegame_Version
    jz   0x0053805E
.Normal_Code:
    cmp  eax,0x100618A
    jmp  0x00537FF2
@ENDHACK


@HACK 0x005396AF,0x005396B5,_Get_Savefile_Info_Is_Old_Savegame
;    jmp        0x005396E3 ; HACK: never an old savegame
    cmp  dword edi,New_Savegame_Version
    jz   0x005396E3
    cmp  dword edi,0x100618A
    jmp  0x005396B5
@ENDHACK


; args: <register or address of object>, <new size of object>, <old size of object>
%macro    Clear_Memory 3
    mov  eax,%1
    add  eax,%3
    xor  edx,edx
    mov  ebx,%2-%3

    call 0x005C4E50 ; memset_
%endmacro

; args: <register or address of object>, <new size of object>, <old size of object>
%macro Clear_Extended_Class_Memory_For_Old_Saves 3
    cmp  dword[SaveGameVersion],New_Savegame_Version
    jz   .Ret ; SaveGameVersion == New_Savegame_Version so return
    Save_Registers

    Clear_Memory %1,%2,%3

    Restore_Registers
%endmacro


[section .text]
; For early map load, to prevent savegame values from working on
; next map load
Clear_Extended_Savegame_Values:
    mov  byte[Rules.General.BuildOffAlly],0
    mov  byte[Rules.Aftermath.AftermathFastBuildSpeed],0
    mov  byte[Spawn.Settings.DeadPlayersRadar],0
    mov  byte[Spawn.Settings.Aftermath],0
    mov  byte[Spawn.Settings.ShortGame],0
    mov  byte[Rules.General.NoTeslaZapEffectDelay],0
    mov  byte[Rules.General.NoScreenShake],0
    mov  byte[Spawn.Settings.TechCenterBugFix],0
    mov  byte[Spawn.Settings.ForcedAlliances],0
    mov  byte[Spawn.Settings.AllyReveal],0
    mov  byte[Spawn.Settings.MCVUndeploy],0
    mov  byte[buildingcrewstuckfix],0
    mov  byte[Spawn.Settings.FixMagicBuild],0
    mov  byte[Spawn.Settings.FixRangeExploit],0
    mov  byte[Rules.AI.ComputerParanoidForceDisabledSkirmish],1
    mov  byte[Rules.AI.BuildRadarWithoutAirThreatCheck],-1
    mov  byte[Rules.AI.FixAIParanoid],0
    mov  byte[Rules.AI.FixAIAlly],0
    mov  byte[Rules.General.FixFormationSpeed],0
    mov  byte[Rules.General.ParabombsInMultiplayer],0
    mov  byte[Rules.General.EvacInMP],1
    mov  byte[Rules.AI.FixAISendingTanksTopLeft],0
    mov  dword[InCoopMode],0
    mov  dword[Toggle_Fix_NavalRepairExploit],0
    retn
