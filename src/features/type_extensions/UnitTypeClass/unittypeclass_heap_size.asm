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
@SETD 0x004C74D3 UnitTypeClass.NEW_SIZE ; _TFixedIHeapClass__fn_init_UnitTypes_Heap
@SETD 0x004C9686 UnitTypeClass.NEW_SIZE ; _TFixedIHeapClass__UnitTypeClass__Constructor_New_Size
@SETD 0x004D1334 UnitTypeClass.NEW_SIZE ; _TFixedIHeapClass__UnitTypeClass__Save_New_Size
@SETD 0x004D1417 UnitTypeClass.NEW_SIZE ; _TFixedIHeapClass__UnitTypeClass__Load_New_Size
@HOOK 0x004D1431 _TFixedIHeapClass__UnitTypeClass__Load_Clear_Memory


_TFixedIHeapClass__UnitTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,UnitTypeClass.NEW_SIZE,UnitTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D1436