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
@HOOK 0x004C7445 _TFixedIHeapClass__fn_init_InfantryTypes_Heap
@HOOK 0x004C935A _TFixedIHeapClass__InfantryTypeClass__Constructor_New_Size
@HOOK 0x004D0D53 _TFixedIHeapClass__InfantryTypeClass__Save_New_Size
@HOOK 0x004D0E36 _TFixedIHeapClass__InfantryTypeClass__Load_New_Size
@HOOK 0x004D0E51 _TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory


_TFixedIHeapClass__fn_init_InfantryTypes_Heap:
    mov  edx,InfantryTypeClass.NEW_SIZE
    jmp  0x004C744A


_TFixedIHeapClass__InfantryTypeClass__Constructor_New_Size:
    mov  edx,InfantryTypeClass.NEW_SIZE
    jmp  0x004C935F


_TFixedIHeapClass__InfantryTypeClass__Save_New_Size:
    mov  ebx,InfantryTypeClass.NEW_SIZE
    jmp  0x004D0D58


_TFixedIHeapClass__InfantryTypeClass__Load_New_Size:
    mov  ebx,InfantryTypeClass.NEW_SIZE
    jmp  0x004D0E3B


_TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,InfantryTypeClass.NEW_SIZE,InfantryTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0E56