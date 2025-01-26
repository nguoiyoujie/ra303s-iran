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
@SETD 0x004C7446 InfantryTypeClass.NEW_SIZE ; _TFixedIHeapClass__fn_init_InfantryTypes_Heap
@SETD 0x004C935B InfantryTypeClass.NEW_SIZE ; _TFixedIHeapClass__InfantryTypeClass__Constructor_New_Size
@SETD 0x004D0D54 InfantryTypeClass.NEW_SIZE ; _TFixedIHeapClass__InfantryTypeClass__Save_New_Size
@SETD 0x004D0E37 InfantryTypeClass.NEW_SIZE ; _TFixedIHeapClass__InfantryTypeClass__Load_New_Size
@HOOK 0x004D0E51 _TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory


_TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,InfantryTypeClass.NEW_SIZE,InfantryTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0E56