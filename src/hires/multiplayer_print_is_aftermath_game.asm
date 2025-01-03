;----------------------------------------------------------------
; src/hires/multiplayer_print_is_aftermath_game.asm
;
; Show whether an MP game is an aftermath game
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HOOK 0x0050C2B0 _LAN_New_Dialog_Aftermath_Text
@HOOK 0x0050C748 _LAN_New_Dialog_Aftermath_Text2
@HOOK 0x0050DB55 _LAN_New_Dialog_Aftermath_Text3
@HOOK 0x00513D46 _Skirmish_Dialog_Aftermath_Text

%define    Is_Aftermath_Installed    0x004AC024
%define    Fancy_Text_Print        0x004AE7FC
%define bAftermathMultiplayer    0x00680538

;str_Aftermathgame db"Aftermath game",0

startedasam: db 0

_Skirmish_Dialog_Aftermath_Text:
    call Is_Aftermath_Installed
    cmp  eax, 1
    jnz  .Ret

    push 216h
    push 0
    push esi
    mov  edx, 361 ; Decimal
    add  edx, [diff_top]
    push edx
    mov  ebx, 362 ; Decimal
    add  ebx, [diff_left]
    push ebx
    push 74h
    call Fancy_Text_Print
    add  esp, 18h

.Ret:
    call Fancy_Text_Print
    jmp  0x00513D4B

_LAN_New_Dialog_Aftermath_Text:
    call Fancy_Text_Print
    add  esp, 18h

    call Is_Aftermath_Installed
    cmp  eax, 1
    jnz  .Ret

    cmp  dword [bAftermathMultiplayer], 1
    jnz  .Ret

    mov  byte [startedasam], 1
    push 216h
    push 0
    mov  eax, [ebp-70h]
    push eax
    mov  edx, 195 ; Decimal
    add  edx, [diff_top]
    push edx
    mov  ebx, 200 ; Decimal
    add  ebx, [diff_left]
    push ebx
    push 74h
    call Fancy_Text_Print
    add  esp, 18h

.Ret:
    jmp  0x0050C2B8

_LAN_New_Dialog_Aftermath_Text2:
    call Is_Aftermath_Installed
    cmp  eax, 1
    jnz  .Ret

    cmp  dword [bAftermathMultiplayer], 1
    jz   .Ret
    cmp  byte [startedasam], 1
    jnz  .Ret

    push 216h
    push 0
    mov  eax, [ebp-70h]
    push eax
    mov  edx, 195 ; Decimal
    add  edx, [diff_top]
    push edx
    mov  ebx, 225 ; Decimal
    add  ebx, [diff_left]
    push ebx
    push 79h
    call Fancy_Text_Print
    add  esp, 18h

.Ret:
    mov  edx, [0x00680875]
    jmp  0x0050C74E

_LAN_New_Dialog_Aftermath_Text3:
    mov  eax, [ebp-08Ch]
    mov  byte [startedasam], 1
    jmp  0x0050DB5B
