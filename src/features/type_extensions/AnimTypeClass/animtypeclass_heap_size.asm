;----------------------------------------------------------------
; src/features/type_extensions/AnimTypeClass/animtypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

;Read INI settings
@SETD 0x004C74A3 AnimTypeClass.NEW_SIZE ; _TFixedIHeapClass__fn_init_AnimTypes_Heap
@SETD 0x004C9576 AnimTypeClass.NEW_SIZE ; _TFixedIHeapClass__AnimTypeClass__Constructor_New_Size
@SETD 0x004D1144 AnimTypeClass.NEW_SIZE ; _TFixedIHeapClass__AnimTypeClass__Save_New_Size
@SETD 0x004D1226 AnimTypeClass.NEW_SIZE ; _TFixedIHeapClass__AnimTypeClass__Load_New_Size
@HOOK 0x004D1240 _TFixedIHeapClass__AnimTypeClass__Load_Clear_Memory


_TFixedIHeapClass__AnimTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,AnimTypeClass.NEW_SIZE,AnimTypeClass.ORIGINAL_SIZE 
.Ret:
    mov  dword [esi+0x21],0x005F680C
    jmp  0x004D1247
 