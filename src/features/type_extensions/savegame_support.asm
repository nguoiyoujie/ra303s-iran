@HOOK 0x00537B32 _Save_Game_Save_Game_Version
@HOOK 0x00537FED _Load_Game_Patch_Version_Check
@HOOK 0x005396AF _Get_Savefile_Info_Is_Old_Savegame
@HOOK 0x0053903A _Save_Misc_Values_Extended_Savegames
@HOOK 0x00539106 _Load_Misc_Values_Extended_Savegames

%define New_Savegame_Version    0x1007000
%define Old_Savegame_Version    0x100618B
%define SaveGameVersion            0x0065D7C0 ; global variable

;ARGS: <offset/pointer to value to SAVE>, <size in byte>
%macro Save_Global_Value 2
    mov  ebx,%2
    mov  esi,[ecx+8]
    mov  edx,%1
    mov  eax,ecx
    call dword [esi+10h]
%endmacro

;ARGS: <offset/pointer to value to LOAD>, <size in byte>
%macro Load_Global_Value 2
    mov  ebx,%2
    mov  esi,[ecx+8]
    mov  edx,%1
    mov  eax,ecx
    call dword [esi+8]
%endmacro

; For early map load, to prevent savegame values from working on
; next map load
Clear_Extended_Savegame_Values:
    mov  byte [BuildOffAlly],0
    mov  byte [AftermathFastBuildSpeed],0
    mov  byte [Toggle_Feature_DeadPlayersRadar],0
    mov  byte [spawner_aftermath],0
    mov  byte [ShortGame],0
    mov  byte [NoTeslaZapEffectDelay],0
    mov  byte [NoScreenShake],0
    mov  byte [TechCenterBugFix],0
    mov  byte [Toggle_Feature_ForcedAlliances],0
    mov  byte [AllyReveal],0
    mov  byte [MCVUndeploy],0
    mov  byte [buildingcrewstuckfix],0
    mov  byte [magicbuildfix],0
    mov  byte [infantryrangeexploitfix],0
    mov  byte [Toggle_Feature_ComputerParanoidForceDisabledSkirmish],1
    mov  byte [Toggle_Fix_BuildRadarWithoutAirThreatCheck],-1
    mov  byte [Toggle_Fix_AIParanoid],0
    mov  byte [Toggle_Fix_AIAlly],0
    mov  byte [FixFormationSpeed],0
    mov  byte [ParabombsInMultiplayer],0
    mov  byte [Toggle_Feature_EvacInMP],1
    mov  byte [Toggle_Fix_AISendingTanksToTopLeft],0
    mov  dword [InCoopMode],0
    mov  dword [Toggle_Fix_NavalRepairExploit],0
    retn

; Loading and saving data in Save- and Load_Misc_Values_Extended_Savegames
; need to be in the same order or else the game will crash or stuff with corrupt
_Save_Misc_Values_Extended_Savegames:
    call dword [esi+10h]

    Save_Global_Value Globals___Session_Type,1
    Save_Global_Value BuildOffAlly,1
    Save_Global_Value AftermathFastBuildSpeed,1
    Save_Global_Value Toggle_Feature_DeadPlayersRadar,1
    Save_Global_Value spawner_aftermath,1
    Save_Global_Value ShortGame,1
    Save_Global_Value NoTeslaZapEffectDelay,1
    Save_Global_Value NoScreenShake,1
    Save_Global_Value TechCenterBugFix,1
    Save_Global_Value Toggle_Feature_ForcedAlliances,1
    Save_Global_Value AllyReveal,1
    Save_Global_Value MCVUndeploy,1
    Save_Global_Value buildingcrewstuckfix,1
    Save_Global_Value magicbuildfix,1
    Save_Global_Value infantryrangeexploitfix,1
    Save_Global_Value Toggle_Feature_ComputerParanoidForceDisabledSkirmish,1
    Save_Global_Value Toggle_Fix_BuildRadarWithoutAirThreatCheck,1
    Save_Global_Value Toggle_Fix_AIParanoid,1
    Save_Global_Value Toggle_Fix_AIAlly,1
    Save_Global_Value FixFormationSpeed,1
    Save_Global_Value ParabombsInMultiplayer,1
    Save_Global_Value Toggle_Feature_EvacInMP,1
    Save_Global_Value Toggle_Fix_AISendingTanksToTopLeft,1
    Save_Global_Value InCoopMode,4
    Save_Global_Value Toggle_Fix_NavalRepairExploit,1

.Ret:
    mov  eax,[0x00667808]; ds:Objects_Selected?
    jmp  0x00539042

_Load_Misc_Values_Extended_Savegames:
    call dword [esi+8]

    cmp  dword [SaveGameVersion],New_Savegame_Version
    jnz  .Ret ; SaveGameVersion != New_Savegame_Version so return

    Load_Global_Value Globals___Session_Type,1
    Load_Global_Value BuildOffAlly,1
    Load_Global_Value AftermathFastBuildSpeed,1
    Load_Global_Value Toggle_Feature_DeadPlayersRadar,1
    Load_Global_Value spawner_aftermath,1
    Load_Global_Value ShortGame,1
    Load_Global_Value NoTeslaZapEffectDelay,1
    Load_Global_Value NoScreenShake,1
    Load_Global_Value TechCenterBugFix,1
    Load_Global_Value Toggle_Feature_ForcedAlliances,1
    Load_Global_Value AllyReveal,1
    Load_Global_Value MCVUndeploy,1
    Load_Global_Value buildingcrewstuckfix,1
    Load_Global_Value magicbuildfix,1
    Load_Global_Value infantryrangeexploitfix,1
    Load_Global_Value Toggle_Feature_ComputerParanoidForceDisabledSkirmish,1
    Load_Global_Value Toggle_Fix_AIParanoid,1
    Load_Global_Value Toggle_Fix_AIAlly,1
    Load_Global_Value FixFormationSpeed,1
    Load_Global_Value ParabombsInMultiplayer,1
    Load_Global_Value Toggle_Feature_EvacInMP,1
    Load_Global_Value Toggle_Fix_AISendingTanksToTopLeft,1
    Load_Global_Value InCoopMode,4
    Load_Global_Value Toggle_Fix_NavalRepairExploit,1

.Ret:
    mov  ebx,4
    jmp  0x0053910E

; Save as new version
_Save_Game_Save_Game_Version:
    mov  eax,New_Savegame_Version
    jmp  0x00537B37

_Load_Game_Patch_Version_Check:
;    jmp        0x0053805E ; HACK: always pass check

    cmp  eax,New_Savegame_Version
    jz   0x0053805E

    cmp  eax,New_Savegame_Version
    jz   0x0053805E

.Normal_Code:
    cmp  eax,100618Ah
    jmp  0x00537FF2

_Get_Savefile_Info_Is_Old_Savegame:
;    jmp        0x005396E3 ; HACK: never an old savegame

    cmp  dword edi,New_Savegame_Version
    jz   0x005396E3

    cmp  dword edi,100618Ah
    jmp  0x005396B5

; args: <register or address of object>, <new size of object>, <old size of object>
%macro    Clear_Memory 3
    mov  eax,%1
    add  eax,%3
    mov  edx,0
    mov  ebx,%2-%3

    call 0x005C4E50 ; memset_
%endmacro

; args: <register or address of object>, <new size of object>, <old size of object>
%macro Clear_Extended_Class_Memory_For_Old_Saves 3
    cmp  dword [SaveGameVersion],New_Savegame_Version
    jz   .Ret ; SaveGameVersion == New_Savegame_Version so return
    Save_Registers

    Clear_Memory %1,%2,%3

    Restore_Registers
%endmacro
