;----------------------------------------------------------------
; src/features/type_extensions/UnitTypeClass/unittypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

; Extended memory size of the class, with save and load support
@HOOK 0x004C74D2 _TFixedIHeapClass__fn_init_UnitTypes_Heap
@HOOK 0x004C9685 _TFixedIHeapClass__UnitTypeClass__Constructor_New_Size
@HOOK 0x004D1333 _TFixedIHeapClass__UnitTypeClass__Save_New_Size
@HOOK 0x004D1416 _TFixedIHeapClass__UnitTypeClass__Load_New_Size
@HOOK 0x004D1431 _TFixedIHeapClass__UnitTypeClass__Load_Clear_Memory


_TFixedIHeapClass__fn_init_UnitTypes_Heap:
    mov  edx,UnitTypeClass.NEW_SIZE
    jmp  0x004C74D7


_TFixedIHeapClass__UnitTypeClass__Constructor_New_Size:
    mov  edx,UnitTypeClass.NEW_SIZE
    jmp  0x004C968A


_TFixedIHeapClass__UnitTypeClass__Save_New_Size:
    mov  ebx,UnitTypeClass.NEW_SIZE
    jmp  0x004D1338


_TFixedIHeapClass__UnitTypeClass__Load_New_Size:
    mov  ebx,UnitTypeClass.NEW_SIZE
    jmp  0x004D141B


_TFixedIHeapClass__UnitTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,UnitTypeClass.NEW_SIZE,UnitTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D1436