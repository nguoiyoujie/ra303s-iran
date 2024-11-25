;----------------------------------------------------------------
; src/fixes/building_crew_impassable_terrain_fix.asm
;
; Skips spawning infantry if the spawn location cannot be traversed by infantry
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HOOK 0x0045C2F3 _BuildingClass_Mission_Exit_Coord
Unk1_Cell__    dw 0

; args: <CellClass pointer>
; returns: Whether it's valid for a building crew to spawn on this cell.
; eax == 1 for true, eax == 0 for false
_Valid_Building_Crew_Cell_Spawn:
    mov  ecx,eax
    test byte [ecx+2],40h
    jz   .loc_49F238
    xor  eax,eax
    retn

.loc_49F238:
    mov  eax,[ecx+10h]
    sar  eax,18h
    cmp  eax,0FFFFFFFFh
    jz   .loc_49F268
    cmp  eax,14h
    jz   .loc_49F25F
    call OverlayTypeClass__As_Reference
    test byte [eax+142h],2
    jz   .loc_49F268

.loc_49F25F:
    xor  eax,eax
    retn

.loc_49F268:
    mov  eax,[ecx+12h]
    sar  eax,18h
    cmp  eax,0FFFFFFFFh
    jz   .loc_49F28A
    call SmudgeTypeClass__As_Reference
    test byte [eax+141h],2
    jz   .loc_49F28A
    xor  eax,eax
    retn

.loc_49F28A:
    cmp  byte [ebp-0Ch],0FFh
    jnz  .loc_49F2C1
    mov  eax,ecx
    call CellClass__Is_Bridge_Here
    test eax,eax
    jz   .loc_49F2A4
    xor  eax,eax
    retn

.loc_49F2A4:
    mov  al,[ecx+39h]
    movsx ecx,al
    lea  eax,[ecx*8]
    sub  eax,ecx
    mov  eax,dword [eax*2+0x655DFA]
    retn

.loc_49F2C1:
    xor  bh,bh
    xor  eax,eax
    mov  byte [Unk1_Cell__],bh
    mov  byte [Unk1_Cell__ + 1],al
    mov  al,[ecx+39h]
    movsx ecx,al
    lea  eax,[ecx*8]
    sub  eax,ecx
    mov  ecx,0x00655DF0 ; offset LandTypesData
    add  eax,eax
    add  ecx,eax
    mov  eax,[Unk1_Cell__+1]
    sar  eax,18h
    mov  edx,[Unk1_Cell__]
    mov  ax,[ecx+eax*2]
    cmp  ax,dx
    setz al
    and  eax,0FFh
    jz   .Out
    xor  eax,eax
    retn

.Out:
    mov  eax,1

.loc_49F30B:
    retn

_BuildingClass_Mission_Exit_Coord:
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .Apply_Fix
    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    jz   .Apply_Fix
    cmp  byte [buildingcrewstuckfix],1
    jz   .Apply_Fix

.Ret:
    mov  [ebp-0x50],eax
    mov  eax,[ebp-0x5C]
    jmp  0x0045C2F9

.Apply_Fix:
    Save_Registers

    call Coord___Coord_Cell
    cwde
    imul edx,eax,3Ah
    mov  dword eax,[Globals___Map_Array]
    add  eax,edx

;    int        3
    mov  edx,1
    mov  ebx,eax
    push ebx
    call _Valid_Building_Crew_Cell_Spawn
    pop  ebx
    cmp  dword eax,1
    mov  eax,ebx
    jz   .Valid_Crew_Spawn_Cell

    mov  edx,4
    call CellClass__Adjacent_Cell

.Valid_Crew_Spawn_Cell:
    call CellClass__Cell_Coord

    mov  [ebp-50h],eax
    Restore_Registers
    mov  eax,[ebp-5Ch]
    jmp  0x0045C2F9
