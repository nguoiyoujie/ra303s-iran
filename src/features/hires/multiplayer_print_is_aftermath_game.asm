;----------------------------------------------------------------
; src/features/hires/multiplayer_print_is_aftermath_game.asm
;
; Show whether an MP game is an aftermath game
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
cextern Fancy_Text_Print

%define Is_Aftermath_Installed    0x004AC024
%define bAftermathMultiplayer     0x00680538


[section .data] 
Temp.IsAftermathGame: db 0


@HACK 0x00513D46,0x00513D4B,_Skirmish_Dialog_Aftermath_Text
    call Is_Aftermath_Installed
    cmp  eax,1
    jnz  .Ret
    push 0x216
    push 0
    push esi
    mov  edx,361 ; Decimal
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,362 ; Decimal
    add  ebx,[Hires.DeltaLeft]
    push ebx
    push 0x74
    call Fancy_Text_Print
    add  esp,0x18
.Ret:
    call Fancy_Text_Print
    jmp  0x00513D4B
@ENDHACK


@HACK 0x0050C2B0,0x0050C2B8,_LAN_New_Dialog_Aftermath_Text
    call Fancy_Text_Print
    add  esp,0x18
    call Is_Aftermath_Installed
    cmp  eax,1
    jnz  .Ret
    cmp  dword[bAftermathMultiplayer],1
    jnz  .Ret
    mov  byte[Temp.IsAftermathGame],1
    push 0x216
    push 0
    mov  eax,[ebp-0x70]
    push eax
    mov  edx,195 ; Decimal
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,200 ; Decimal
    add  ebx,[Hires.DeltaLeft]
    push ebx
    push 0x74
    call Fancy_Text_Print
    add  esp,0x18
.Ret:
    jmp  0x0050C2B8
@ENDHACK


@HACK 0x0050C748,0x0050C74E,_LAN_New_Dialog_Aftermath_Text2
    call Is_Aftermath_Installed
    cmp  eax,1
    jnz  .Ret
    cmp  dword[bAftermathMultiplayer],1
    jz   .Ret
    cmp  byte[Temp.IsAftermathGame],1
    jnz  .Ret
    push 0x216
    push 0
    mov  eax,[ebp-0x70]
    push eax
    mov  edx,195 ; Decimal
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,225 ; Decimal
    add  ebx,[Hires.DeltaLeft]
    push ebx
    push 0x79
    call Fancy_Text_Print
    add  esp,0x18
.Ret:
    mov  edx,[0x00680875]
    jmp  0x0050C74E
@ENDHACK


@HACK 0x0050DB55,0x0050DB5B,_LAN_New_Dialog_Aftermath_Text3
    mov  eax,[ebp-0x08C]
    mov  byte[Temp.IsAftermathGame],1
    jmp  0x0050DB5B
@ENDHACK
