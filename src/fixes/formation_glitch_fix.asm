;----------------------------------------------------------------
; src/fixes/formation_glitch_fix.asm
;
; Fixes Formations so that they use the lowest speed instead of the first unit's speed
;
; This function is enabled by using the key:
;   Rules.ini > [General] > FixFormationSpeed=yes
;
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@HOOK 0x004B3F80 _Formation_Speed_Glitched_Loop
@HOOK 0x004B45FD _DisplayClass__Mouse_Left_Release_Function_End

Temp.FormationFirstUnit: db 1 ; whether the current unit is the formation's first unit

_Formation_Speed_Glitched_Loop:
    cmp  byte [Globals___Session_Type], GameType.GAME_SKIRMISH
    jz   .Apply_Fix
    cmp  byte [Globals___Session_Type], GameType.GAME_NORMAL
    jz   .Apply_Fix
    cmp  byte [Rules.General.FixFormationSpeed], 1
    jz   .Apply_Fix

    jmp  .Dont_Fix

.Apply_Fix:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Ch]
    cmp  byte [Temp.FormationFirstUnit], 1
    jnz  .Not_First_Unit_FormMaxSpeed
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Ch]
    mov  byte [Globals___FormMaxSpeed], al

.Not_First_Unit_FormMaxSpeed:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Ch]

    cmp  byte [Globals___FormMaxSpeed], al
    jle  .Dont_Set_As_MaxFormSpeed
    mov  byte [Globals___FormMaxSpeed], al

.Dont_Set_As_MaxFormSpeed:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    add  ebx, 4
    call [esi+34h]
    mov  byte al, [eax+15Dh]
    inc  edx
    cmp  byte [Temp.FormationFirstUnit], 1
    jnz  .Not_First_Unit_FormSpeed
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Dh]
    mov  byte [Globals___FormSpeed], al
.Not_First_Unit_FormSpeed:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Dh]
    cmp  byte [Globals___FormSpeed], al
    jle  .Dont_Set_As_FormSpeed
    mov  byte [Globals___FormSpeed], al

.Dont_Set_As_FormSpeed:
    mov  byte [Temp.FormationFirstUnit], 0
    jmp  0x004B3FAA


.Dont_Fix:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  al, [eax+15Ch]
    mov  esi, [ecx+11h]
    mov  [Globals___FormMaxSpeed], al
    mov  eax, ecx
    add  ebx, 4
    call [esi+34h]
    mov  al, [eax+15Dh]
    inc  edx
    mov  [Globals___FormSpeed], al
    jmp  0x004B3FAA

_DisplayClass__Mouse_Left_Release_Function_End:
    mov  byte [Temp.FormationFirstUnit], 1
    lea  esp, [ebp-8]
    pop  edi
    pop  esi
    jmp  0x004B4602
