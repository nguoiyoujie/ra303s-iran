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
@SET 0x004C73ED,{mov edx,BuildingTypeClass.NEW_SIZE} ; _TFixedIHeapClass__fn_init_BuildingTypes_Heap
@SET 0x004D0953,{mov ebx,BuildingTypeClass.NEW_SIZE} ; _TFixedIHeapClass__BuildingTypeClass__Save_New_Size
@SET 0x004D0A36,{mov ebx,BuildingTypeClass.NEW_SIZE} ; _TFixedIHeapClass__BuildingTypeClass__Load_New_Size

@HACK 0x004D0A51,0x004D0A56,_TFixedIHeapClass__BuildingTypeClass__Load_Clear_Memory
    Clear_Extended_Class_Memory_For_Old_Saves ecx,BuildingTypeClass.NEW_SIZE,BuildingTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0A56
@ENDHACK

