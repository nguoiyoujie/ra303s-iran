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

; original size 0x3a, new size 0x74?
;void MapClass::Alloc_Cells(void)
@CLEAR 0x0058651A 0x74 0x0058651B
@CLEAR 0x00586529 0x74 0x0058652A

;void MapClass::Init_Cells(void)
;@CLEAR 0x004FE40A 0x74 0x004FE40B


;void DisplayClass::Shroud_Cell(CELL cell, HouseClass * house)
;@CLEAR 0x004B50C8 0x74 0x004B50C9

;@HOOK 0x004B507C _DisplayClass__Shroud_Cell_Unhardcode_Size

;_DisplayClass__Shroud_Cell_Unhardcode_Size:
;    imul eax,0x74
;    jmp  mov edx,dword[ebx + 0x1c]
;    add  eax,edx
;    jmp  0x004b508c





