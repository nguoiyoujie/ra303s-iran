@HOOK 0x004B3F80 _Formation_Speed_Glitched_Loop
@HOOK 0x004B45FD _DisplayClass__Mouse_Left_Release_Function_End

%define FormSpeed        0x0065E0D0
%define FormMaxSpeed    0x0065E0D1

firstformationunit: db 1

_Formation_Speed_Glitched_Loop:
    cmp  byte [Globals___Session_Type], GameType.GAME_SKIRMISH
    jz   .Apply_Fix
    cmp  byte [Globals___Session_Type], GameType.GAME_NORMAL
    jz   .Apply_Fix
    cmp  byte [FixFormationSpeed], 1
    jz   .Apply_Fix

    jmp  .Dont_Fix

.Apply_Fix:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Ch]
    cmp  byte [firstformationunit], 1
    jnz  .Not_First_Unit_FormMaxSpeed
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Ch]
    mov  byte [FormMaxSpeed], al

.Not_First_Unit_FormMaxSpeed:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Ch]

    cmp  byte [FormMaxSpeed], al
    jle  .Dont_Set_As_MaxFormSpeed
    mov  byte [FormMaxSpeed], al

.Dont_Set_As_MaxFormSpeed:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    add  ebx, 4
    call [esi+34h]
    mov  byte al, [eax+15Dh]
    inc  edx
    cmp  byte [firstformationunit], 1
    jnz  .Not_First_Unit_FormSpeed
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Dh]
    mov  byte [FormSpeed], al
.Not_First_Unit_FormSpeed:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  byte al, [eax+15Dh]
    cmp  byte [FormSpeed], al
    jle  .Dont_Set_As_FormSpeed
    mov  byte [FormSpeed], al

.Dont_Set_As_FormSpeed:
    mov  byte [firstformationunit], 0
    jmp  0x004B3FAA


.Dont_Fix:
    mov  esi, [ecx+11h]
    mov  eax, ecx
    call [esi+34h]
    mov  al, [eax+15Ch]
    mov  esi, [ecx+11h]
    mov  [FormMaxSpeed], al
    mov  eax, ecx
    add  ebx, 4
    call [esi+34h]
    mov  al, [eax+15Dh]
    inc  edx
    mov  [FormSpeed], al
    jmp  0x004B3FAA

_DisplayClass__Mouse_Left_Release_Function_End:
    mov  byte [firstformationunit], 1
    lea  esp, [ebp-8]
    pop  edi
    pop  esi
    jmp  0x004B4602
