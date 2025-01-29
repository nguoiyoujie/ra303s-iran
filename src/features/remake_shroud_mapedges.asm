;----------------------------------------------------------------
; src/features/remake_shroud_mapedges.asm
;
; Old code sets the map edge perimeter as visible. This ensures the shroud does not enroach from the map bounds.
; This poses very visible issues if the map is resized mid-game (via new trigger actions). 
; Employ Remastered's new method of map-edge checking instead.
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as the map dimensions was not expected to be changed in the unmodified game.
;
;----------------------------------------------------------------

@LJMP 0x004B06C4, _DisplayClass_Cell_Shadow_SaveCell
@LJMP 0x004B06FC, _DisplayClass_Cell_Shadow_In_Radar_Check0
@LJMP 0x004B070C, _DisplayClass_Cell_Shadow_In_Radar_Check1
@LJMP 0x004B071A, _DisplayClass_Cell_Shadow_In_Radar_Check2
@LJMP 0x004B072B, _DisplayClass_Cell_Shadow_In_Radar_Check3
@LJMP 0x004B073B, _DisplayClass_Cell_Shadow_In_Radar_Check4
@LJMP 0x004B074C, _DisplayClass_Cell_Shadow_In_Radar_Check5
@LJMP 0x004B075C, _DisplayClass_Cell_Shadow_In_Radar_Check6
@LJMP 0x004B076A, _DisplayClass_Cell_Shadow_In_Radar_Check7

@LJMP 0x0053A75A, _ScenarioClass_Fill_In_Data_Skip_MapEdge_Setup

[section .data] 
temp_cell dd 0


[section .text] 
_DisplayClass_Cell_Shadow_SaveCell:
    mov  dword [temp_cell],eax
    lea  esi,[ebx + 0x1c]
    mov  ebx,eax
    jmp  0x004B06C9

_DisplayClass_Cell_Shadow_In_Radar_Check0:
    sub  eax, 0x1d3a
    push eax
    push edx
    mov  eax, Globals___Map
    mov  edx, dword [temp_cell]
    sub  edx, 129
    call MapClass__In_Radar
    test eax, eax
    pop  edx
    pop  eax
    jz   0x004B0709
    jmp  0x004B0701

_DisplayClass_Cell_Shadow_In_Radar_Check1:
    add  eax, 0x3a
    push eax
    push edx
    mov  eax, Globals___Map
    mov  edx, dword [temp_cell]
    sub  edx, 128
    call MapClass__In_Radar
    test eax, eax
    pop  edx
    pop  eax
    jz   0x004B0717
    test cl, 4
    jmp  0x004B0712

_DisplayClass_Cell_Shadow_In_Radar_Check2:
    add  eax, 0x3a
    push eax
    push edx
    mov  eax, Globals___Map
    mov  edx, dword [temp_cell]
    sub  edx, 127
    call MapClass__In_Radar
    test eax, eax
    pop  edx
    pop  eax
    jz   0x004B0725
    test ch, 4
    jmp  0x004B0720

_DisplayClass_Cell_Shadow_In_Radar_Check3:
    add  eax, 0x1c8c
    push eax
    push edx
    mov  eax, Globals___Map
    mov  edx, dword [temp_cell]
    sub  edx, 1
    call MapClass__In_Radar
    test eax, eax
    pop  edx
    pop  eax
    jz   0x004B0738
    test bl, 4
    jmp  0x004B0733

_DisplayClass_Cell_Shadow_In_Radar_Check4:
    add  eax, 0x74
    push eax
    push edx
    mov  eax, Globals___Map
    mov  edx, dword [temp_cell]
    add  edx, 1
    call MapClass__In_Radar
    test eax, eax
    pop  edx
    pop  eax
    jz   0x004B0746
    test bh, 4
    jmp  0x004B0741

_DisplayClass_Cell_Shadow_In_Radar_Check5:
    add  eax, 0x1c8c
    push eax
    push edx
    mov  eax, Globals___Map
    mov  edx, dword [temp_cell]
    add  edx, 127
    call MapClass__In_Radar
    test eax, eax
    pop  edx
    pop  eax
    jz   0x004B0759
    test cl, 4
    jmp  0x004B0754

_DisplayClass_Cell_Shadow_In_Radar_Check6:
    add  eax, 0x3a
    push eax
    push edx
    mov  eax, Globals___Map
    mov  edx, dword [temp_cell]
    add  edx, 128
    call MapClass__In_Radar
    test eax, eax
    pop  edx
    pop  eax
    jz   0x004B0767
    test ch, 4
    jmp  0x004B0762

_DisplayClass_Cell_Shadow_In_Radar_Check7:
    add  eax, 0x3a
    push eax
    push edx
    mov  eax, Globals___Map
    mov  edx, dword [temp_cell]
    add  edx, 129
    call MapClass__In_Radar
    test eax, eax
    pop  edx
    pop  eax
    jz   0x004B0775
    test bl, 4
    jmp  0x004B0770

_ScenarioClass_Fill_In_Data_Skip_MapEdge_Setup:
    jmp  0x0053A971

