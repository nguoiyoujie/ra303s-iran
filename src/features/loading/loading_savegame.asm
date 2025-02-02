;----------------------------------------------------------------
; src/features/loading/loading_savegame.asm
;
; Load setting keys from savegames. 
;
;----------------------------------------------------------------

cextern Conquer___Call_Back
cextern Vortex___ChronalVortex
cextern ChronalVortexClass__Stop
cextern Globals___NewUnitsEnabled
cextern Globals___Session_Type


@HACK 0x00538F07,0x00538F0C,_Load_Game_Late_Hook  ; For savegame loading stuff
    Save_Registers

    ; Enable AM units for skirmish savegames
    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
    jne  .No_Enable_New_Units
    call 0x004AC024 ; Is_Aftermath_Installed(void)
    cmp  dword eax,1
    jne  .No_Enable_New_Units

    mov  dword[Globals___NewUnitsEnabled],1

.No_Enable_New_Units:
    ; Enable AM units in single player if option is turned on
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jne  .Dont_Force_AM_Units_In_Missions
    cmp  byte[RedAlert.Options.ForceAMUnitsInMissions],1
    jne  .Dont_Force_AM_Units_In_Missions
    call 0x004AC024 ; Is_Aftermath_Installed(void)
    cmp  dword eax,1
    jne  .Dont_Force_AM_Units_In_Missions

    mov  dword[Globals___NewUnitsEnabled],1

.Dont_Force_AM_Units_In_Missions:
    Restore_Registers
    call INIClass__~INIClass
    jmp  0x00538F0C
@ENDHACK


@HACK 0x00537E08,0x00537E0D,_Load_Game_Before_Hook ; For savegame loading stuff
    Save_Registers

    ;Remove any active Chrono Vortex
    mov  eax,Vortex___ChronalVortex
    call ChronalVortexClass__Stop

    ; Ore Mine foundation fix code
    mov  eax,dword[OreMineFoundation]
    mov  dword[eax],0x1000080 ; Set to normal, bugged Ore Mine foundation

    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
    jne  .No_Skirmish_Mine_Fix

    mov  dword[eax],0x800080 ; Set to fixed Ore Mine foundation

.No_Skirmish_Mine_Fix:
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jne  .No_Skirmish_Mine_Fix2
    mov  dword[eax],0x800080 ; Set to fixed Ore Mine foundation

.No_Skirmish_Mine_Fix2:
    cmp  byte[spawner_is_active],0
    jz   .No_Skirmish_Mine_Fix3
    mov  dword[eax],0x800080 ; Set to fixed Ore Mine foundation

.No_Skirmish_Mine_Fix3:
    ; FRAG1 explosion anim fix code
    mov  eax,dword[FRAG1AnimData]
    mov  byte[eax],0xC3 ; Set to normal, bugged FRAG1 anim data
    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
    je   .Fix_FRAG1
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    je   .Fix_FRAG1
    cmp  byte[spawner_is_active],1
    je   .Fix_FRAG1
    jmp  .Dont_Fix_FRAG1

.Fix_FRAG1:
    mov  byte[eax],0xC1 ; Set to fixed FRAG1 anim data

.Dont_Fix_FRAG1:
    Restore_Registers
    call Conquer___Call_Back
    jmp  0x00537E0D
@ENDHACK

