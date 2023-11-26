;----------------------------------------------------------------
; src/features/type_extensions/BuildingTypeClass/buildingtypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

;Read INI settings
@HOOK 0x004C73ED _TFixedIHeapClass__fn_init_BuildingTypes_Heap
@HOOK 0x004D0953 _TFixedIHeapClass__BuildingTypeClass__Save_New_Size
@HOOK 0x004D0A36 _TFixedIHeapClass__BuildingTypeClass__Load_New_Size
@HOOK 0x004D0A51 _TFixedIHeapClass__BuildingTypeClass__Load_Clear_Memory


_TFixedIHeapClass__fn_init_BuildingTypes_Heap:
    mov  edx,BuildingTypeClass.NEW_SIZE
    jmp  0x004C73F2


_TFixedIHeapClass__BuildingTypeClass__Save_New_Size:
    mov  ebx,BuildingTypeClass.NEW_SIZE
    jmp  0x004D0958
    
    
_TFixedIHeapClass__BuildingTypeClass__Load_New_Size:
    mov  ebx,BuildingTypeClass.NEW_SIZE
    jmp  0x004D0A3B


_TFixedIHeapClass__BuildingTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,BuildingTypeClass.NEW_SIZE,BuildingTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0A56
