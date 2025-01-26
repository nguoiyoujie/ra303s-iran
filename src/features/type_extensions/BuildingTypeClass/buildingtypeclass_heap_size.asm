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
@SETD 0x004C73EE BuildingTypeClass.NEW_SIZE ; _TFixedIHeapClass__fn_init_BuildingTypes_Heap
@SETD 0x004D0954 BuildingTypeClass.NEW_SIZE ; _TFixedIHeapClass__BuildingTypeClass__Save_New_Size
@SETD 0x004D0A37 BuildingTypeClass.NEW_SIZE ; _TFixedIHeapClass__BuildingTypeClass__Load_New_Size
@HOOK 0x004D0A51 _TFixedIHeapClass__BuildingTypeClass__Load_Clear_Memory


_TFixedIHeapClass__BuildingTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,BuildingTypeClass.NEW_SIZE,BuildingTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0A56
