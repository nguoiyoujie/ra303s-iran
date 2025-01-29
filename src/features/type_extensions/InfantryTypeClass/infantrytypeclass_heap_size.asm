;----------------------------------------------------------------
; src/features/type_extensions/InfantryTypeClass/infantrytypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

;Read INI settings
@SET 0x004C7445, {mov edx,InfantryTypeClass.NEW_SIZE} ; _TFixedIHeapClass__fn_init_InfantryTypes_Heap
@SET 0x004C9355, {mov edx,InfantryTypeClass.NEW_SIZE} ; _TFixedIHeapClass__InfantryTypeClass__Constructor_New_Size
@SET 0x004D0D53, {mov ebx,InfantryTypeClass.NEW_SIZE} ; _TFixedIHeapClass__InfantryTypeClass__Save_New_Size
@SET 0x004D0E36, {mov ebx,InfantryTypeClass.NEW_SIZE} ; _TFixedIHeapClass__InfantryTypeClass__Load_New_Size
@LJMP 0x004D0E51, _TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory


_TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,InfantryTypeClass.NEW_SIZE,InfantryTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0E56