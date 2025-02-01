;----------------------------------------------------------------
; src/fixes/building_crew_impassable_terrain_fix.asm
;
; Skips spawning infantry if the spawn location cannot be traversed by infantry
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

extern CellClass__Cell_Coord
extern CellClass__Adjacent_Cell
extern CellClass__Is_Bridge_Here
extern Coord___Coord_Cell
extern OverlayTypeClass__As_Reference
extern SmudgeTypeClass__As_Reference
extern Globals___Map_Array
extern Globals___Session_Type


[section .data] 
Unk1_Cell__    dw 0


[section .text] 
; args: <CellClass pointer>
; returns: Whether it's valid for a building crew to spawn on this cell.
; eax == 1 for true, eax == 0 for false
_Valid_Building_Crew_Cell_Spawn:
    ; eax = CellClass
    mov  ecx,eax
    test byte[ecx+2],0x40
    jnz  .False
.loc_49F238:
    mov  eax,[ecx+0x10]
    sar  eax,0x18
    cmp  eax,0xFFFFFFFF
    jz   .loc_49F268
    cmp  eax,0x14
    jz   .False
    call OverlayTypeClass__As_Reference
    test byte[eax+0x142],2
    jnz  .False
.loc_49F268:
    mov  eax,[ecx+0x12]
    sar  eax,0x18
    cmp  eax,0xFFFFFFFF
    jz   .loc_49F28A
    call SmudgeTypeClass__As_Reference
    test byte[eax+0x141],2
    jnz  .False
.loc_49F28A:
    cmp  byte[ebp-0xC],0xFF
    jnz  .loc_49F2C1
    mov  eax,ecx
    call CellClass__Is_Bridge_Here
    test eax,eax
    jnz  .False ; occupied by bridge
.loc_49F2A4:
    mov  al,[ecx+0x39]
    movsx ecx,al
    lea  eax,[ecx*8]
    sub  eax,ecx
    mov  eax,dword[eax*2+0x655DFA]
    retn
.loc_49F2C1:
    xor  bh,bh
    xor  eax,eax
    ; TO-DO: check if [ebp-0x10 / Unk1_Cell__] stuff can be removed, since the value can only be 0.
    mov  byte[Unk1_Cell__],bh ; uh... you just xored this, wouldn't this be always 0?
    mov  byte[Unk1_Cell__+1],al
    mov  al,[ecx+0x39]
    movsx ecx,al
    lea  eax,[ecx*8]
    sub  eax,ecx
    mov  ecx,0x00655DF0 ; offset LandTypesData
    add  eax,eax
    add  ecx,eax
    mov  eax,[Unk1_Cell__+1]
    sar  eax,0x18
    mov  edx,[Unk1_Cell__]
    mov  ax,[ecx+eax*2]
    cmp  ax,dx
    setz al
    and  eax,0xFF
    jnz  .False
.True:
    mov  eax,1
    retn
.False:
    xor  eax,eax
    retn


; Apply the fix if game is 
; SP game, Skirmish game, or in Multiplay only if the fix is toggled on
@HACK 0x0045C2F3,0x0045C2F9,_BuildingClass_Mission_Exit_Coord
    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .Apply_Fix
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jz   .Apply_Fix
    cmp  byte[buildingcrewstuckfix],1
    jnz  .Ret
.Apply_Fix:
    Save_Registers
    call Coord___Coord_Cell
    cwde
    imul edx,eax,0x3A
    mov  dword eax,[Globals___Map_Array]
    add  eax,edx
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
    Restore_Registers
.Ret:
    mov  [ebp-0x50],eax
    mov  eax,[ebp-0x5C]
    jmp  0x0045C2F9
@ENDHACK
