;----------------------------------------------------------------
; src/features/radar_spectator.asm
;
; Provides spectators with radar
; 
; This function is enabled by with the following key:
;   spawn.ini > [Settings] > DeadPlayersRadar=true
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

cextern Audio___Sound_Effect
cextern Globals___Map
cextern Globals___PlayerPtr

cextern Spawn.Settings.DeadPlayersRadar


@HACK 0x004D4EEF,0x004D4EF8,_HouseClass__AI_Radar1
    push eax
    cmp  byte[Spawn.Settings.DeadPlayersRadar],0
    jz   .Normal_Code
    mov  eax,[ebp-0x58]
    test byte[eax+0x43],1
    jz   .Normal_Code
    mov  edx,1 ; this jumps over some checks, check the original instructions
    pop  eax
    jmp  0x004D4EF8
.Normal_Code:
    pop  eax
    test eax,eax
    jz   0x004D4F02
    mov  edx,4
    jmp  0x004D4EF8
@ENDHACK


@HACK 0x004D4ED3,0x004D4ED8,_HouseClass__AI_Radar2
    push eax
    cmp  byte[Spawn.Settings.DeadPlayersRadar],0
    jz   .Normal_Code
    mov  eax,[ebp-0x58]
    test byte[eax+0x43],1
    jz   .Normal_Code
    pop  eax
    jmp  0x004D4ED8
.Normal_Code:
    pop  eax
    and  eax,0xFF
    jnz  0x004D4EDE
    mov  eax,[ebp-0x58]
    jmp  0x004D4ED8
@ENDHACK


@HACK 0x004D4EFD,0x004D4F02,_HouseClass__AI_Radar3
    cmp  byte[Spawn.Settings.DeadPlayersRadar],0
    jz   .Normal_Code
    mov  eax,[ebp-0x58]
    test byte[eax+0x43],1
    jz   .Normal_Code
    mov  eax,Globals___Map
    cmp  byte[eax+0xCB0],0
    ; need to restore eax
    jnz  .Ret
    mov  eax,Globals___Map
    mov  edx,1
    call 0x0052D790
    mov  eax,Globals___Map
    mov  edx,3
    call 0x0052D790
    jmp  .Ret
.Normal_Code:
    mov  eax,Globals___Map
    call 0x0052D790
.Ret:
    jmp  0x004D4F02
@ENDHACK


@HACK 0x0052DBBD,0x0052DBC2,_RadarClass__Draw_It_1
    test ch,0x40
    jz   0x0052DC0A
    mov  eax,[Globals___PlayerPtr]
    test byte[eax+0x43],1
    mov  eax,[ebp-0x020]
    jnz  0x0052DC0A
.Ret:
    jmp  0x0052DBC2
@ENDHACK


@HACK 0x0052D832,0x0052D837,_RadarClass__Activate_Play_Radar_Sound1
    cmp  byte[Spawn.Settings.DeadPlayersRadar],0
    jz   .Normal_Code
    mov  eax,[Globals___PlayerPtr]
    test byte[eax+0x43],1
    jz   .Normal_Code
.No_Sound:
    add  esp,4
    jmp  0x0052D837
.Normal_Code:
    mov  eax,0x4A
    call Audio___Sound_Effect
    jmp  0x0052D837
@ENDHACK


@HACK 0x0052D8D8,0x0052D8DD,_RadarClass__Activate_Play_Radar_Sound2
    cmp  byte[Spawn.Settings.DeadPlayersRadar],0
    jz   .Normal_Code
    mov  eax,[Globals___PlayerPtr]
    test byte[eax+0x43],1
    jz   .Normal_Code
.No_Sound:
    add  esp,4
    jmp  0x0052D8DD
.Normal_Code:
    mov  eax,0x49
    call Audio___Sound_Effect
    jmp  0x0052D8DD
@ENDHACK
