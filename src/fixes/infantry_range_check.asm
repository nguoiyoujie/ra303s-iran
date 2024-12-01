;----------------------------------------------------------------
; src/fixes/infantry_range_check.asm
;
; Fixes exploit where infantry may launch projectiles at a target beyond their range.
; 
; This function is enabled by including the following key in Rules.ini. 
;   Rules.ini > [General] > FixRangeExploit=true/false
; or
;   Spawn.ini > [Settings] > FixRangeExploit=true/false
;
; No compatibility issues is expected.
;----------------------------------------------------------------

@HOOK 0x004EEE3B _InfantryClass__Fire_At_Range_Check
@HOOK 0x004F10FE _InfantryClass__Firing_AI_No_Animation_If_Cant_Fire

_InfantryClass__Fire_At_Range_Check:
    cmp  byte [Globals___Session_Type], GameType.GAME_SKIRMISH
    jz   .Apply_Fix
    cmp  byte [Globals___Session_Type], GameType.GAME_NORMAL
    jz   .Apply_Fix

    cmp  byte [infantryrangeexploitfix], 1
    jz   .Apply_Fix

    jmp  .Ret

.Apply_Fix:
    push eax
    push ebx
    push edx

    call InfantryClass__Can_Fire
    cmp  dword eax, 0
    jne  .Cant_Fire ; If NOT 0 goto .Cant_Fire, function returns 0 on if can fire..

    pop  edx
    pop  ebx
    pop  eax

.Ret:
    call 0x005652F8 ; TechnoClass::Fire_At(long,int)
    jmp  0x004EEE40

.Cant_Fire:
    add  esp, 12
    mov  ebx, 0
    jmp  0x004EEEA2

_InfantryClass__Firing_AI_No_Animation_If_Cant_Fire:
    cmp  byte [Globals___Session_Type], GameType.GAME_SKIRMISH
    jz   .Apply_Fix
    cmp  byte [Globals___Session_Type], GameType.GAME_NORMAL
    jz   .Apply_Fix
    cmp  byte [infantryrangeexploitfix], 1
    jz   .Apply_Fix

    jmp  .Original_Code

.Apply_Fix:
    cmp  dword eax, 0
    je   .Ret

.Original_Code:
    lea  edx, [esi+141h]
    jmp  0x004F1104

.Ret:
    jmp  0x004F1216
