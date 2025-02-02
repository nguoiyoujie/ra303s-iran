;----------------------------------------------------------------
; src/fixes/cell_occupier_multi_buildings.asm
;
; Attempt to allow Cell to support multiple buildings by rescanning the cell occupier when a building is removed.
; If another building exists on the same cell, force a placement of the building and its bib.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

cextern Coord___Coord_Cell
cextern BuildingTypeClass__Bib_And_Offset
cextern MapClass__Place_Down
cextern SmudgeClass__new
cextern SmudgeClass__SmudgeClass
cextern Globals___Houses
cextern Globals___HouseTypes
cextern Globals___Map


[section .data] 
_occupier_building dd 0
_bib_cell dd 0
_bib_type dd 0


@HACK 0x0049F3B6,0x0049F3BF,_CellClass__Occupy_Down_Check_BuildingAlreadyInList
    cmp  eax,ecx ; check is object is already in list
    jz   0x0049F3E6 ; skip the append to list if so
    lea  edx,[eax+0x1D]
    mov  eax,[edx]
    cmp  eax,ecx ; check is next object is already in list
    jz   0x0049F3E6 ; skip the append to list if so
    test eax,eax
    jnz  0x0049F3B6
    jmp  0x0049F3BF
@ENDHACK


@HACK 0x0049F4BF,0x0049F4C5,_CellClass__Occupy_Up_Recheck_Remaining_Occupants_For_Buildings
    ; ecx is the CellClass
    push ebx
    xor  ebx,ebx
    mov  edx,dword[ecx+0x19] ; CellClass->Cell_Occupier()
    test edx,edx ; check NULL
    jz   .Original_Code
.Check:
    mov  al,byte[edx]
    cmp  al,RTTIType.Building
    je   .StillHasBuilding
.Next:
    mov  ebx,edx
    mov  edx,[edx+0x1D]
    test edx,edx
    jz   .Original_Code
    jmp  .Check
.StillHasBuilding:
    mov  [_occupier_building],edx
    ; remove this building from Cell_Occupier, it will be added again in RePlaceDown
    test ebx,ebx
    jz   .Clear_Cell_Occupier
    mov  dword[ebx+0x1D],0
    jmp   .Original_Code
.Clear_Cell_Occupier:
    mov  dword[ecx+0x19],0
    ;or   byte[ecx+0x35],0x80 ; set Flag.Occupy.Building
    ;jmp  0x0049F4DB
.Original_Code:
    and  byte[ecx+0x35],0x7F ; clear Flag.Occupy.Building
    pop  ebx
    jmp  0x0049F4DB
@ENDHACK


@HACK 0x00455C43,0x00455C48,_BuildingClass__Mark_MarkUp_RePlaceDown_Buildings
    jnz  0x004FEB02
    mov  ebx,[_occupier_building]
.Check:
    test ebx,ebx
    jz   .Ret
    mov  eax,[ebx+1]
    cmp  eax,-1
    je   .Ret
    push ebx
.Bib:
    mov  edx,[ebx+0xCD] ; BuildingType ID
    mov  eax,[ebx+5]
    call Coord___Coord_Cell
    mov  [_bib_cell],eax
    BuildingTypeClass.FromIndex(edx,eax)
    mov  ebx,_bib_cell
    mov  edx,_bib_type
    call BuildingTypeClass__Bib_And_Offset
    ; eax = 1 success
    test eax,eax
    jz  .Placement
    ; [edx] = bibtype
    ; [ebx] = cell
    mov  eax,0x2B ; SmudgeClass size
    call SmudgeClass__new
    mov  edi,eax
    test eax,eax
    jz  .Placement
    pop  esi
    push esi    
    mov  edx,[esi+0xCD] ; BuildingType ID
    push edi  
    BuildingTypeClass.FromIndex(edx,edi)
    BuildingTypeClass.IsBase.Get(edi,cl) 
    pop  edi
    test cl,1
    jz   .Bib_HouseNone
    mov  eax,[Globals___Houses]
    mov  edx,[esi+0x93] ; BuildingClass->House
    imul edx,[eax+4]
    mov  eax,[eax+0x10]
    add  eax,edx
    lea  edx,[eax+5]
    mov  eax,[Globals___HouseTypes]
    mov  edx,[edx] ; HouseClass->House
    imul edx,[eax+4]
    mov  eax,[eax+0x10]
    add  eax,edx
    mov  al,byte[eax+0x25]
    jmp  .Generate_Bib
.Bib_HouseNone:
    mov  al,-1
.Generate_Bib:
    movsx ecx,al
    mov  eax,[_bib_cell]
    push eax
    and  eax,0x7F
    mov  bl,0x80
    mov  byte[_bib_cell+1],al
    pop  eax
    shl  eax,0x12
    mov  byte[_bib_cell],bl
    mov  byte[_bib_cell+2],bl
    shr  eax,0x19
    mov  byte[_bib_cell+3],al
    mov  edx,[_bib_type]
    movzx edx,dl
    mov  ebx,[_bib_cell]
    mov  eax,edi
    call SmudgeClass__SmudgeClass
.Placement:
    pop  ebx
    push ebx
    mov  eax,[ebx+5] ; cell
    call Coord___Coord_Cell
    mov  edx,eax
    mov  eax,Globals___Map
    call MapClass__Place_Down ; place again
    pop  ebx
    mov  ebx,[ebx+0x1D]
    jmp  .Check
.Ret:    
    mov  dword[_occupier_building],0
    mov  eax,1
    jmp  0x00455C48 ; 0x004FE681
@ENDHACK

