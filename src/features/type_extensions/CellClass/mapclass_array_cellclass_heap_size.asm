;----------------------------------------------------------------
; src/features/type_extensions/CellClass/mapclass_array_cellclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

; original size 0x3A, new size 0x74?
;void MapClass::Alloc_Cells(void)
@SET 0x00586518,{imul ebx,eax,0x74}
@SET 0x00586527,{add edx,0x74}

;void MapClass::Init_Cells(void)
;@SET 0x004FE40A,{db 0x74}


;void DisplayClass::Shroud_Cell(CELL cell, HouseClass * house)
;@SET 0x004B50C8,{db 0x74}

;@LJMP 0x004B507C,_DisplayClass__Shroud_Cell_Unhardcode_Size

;_DisplayClass__Shroud_Cell_Unhardcode_Size:
;    imul eax,0x74
;    jmp  mov edx,dword[ebx+0x1C]
;    add  eax,edx
;    jmp  0x004B508C





