;----------------------------------------------------------------
; src/features/type_extensions/HouseClass/houseclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

@HOOK 0x004C7175 _TFixedHeapClass_fn_init_HouseClass
@HOOK 0x004C8365 _TFixedHeapClass__HouseClass__Constructor_HouseClass
@HOOK 0x004CED13 _TFixedHeapClass__HouseClass__Save_HouseClass
@HOOK 0x004CEDF5 _TFixedHeapClass__HouseClass__Load_HouseClass
@HOOK 0x004CEE10 _TFixedHeapClass__HouseClass__Load_Clear_Memory_For_Old_Savegames
@HOOK 0x004DDD1D _HouseClass__Read_INI_HouseClass_Size


_TFixedHeapClass_fn_init_HouseClass:
    mov  edx,HouseClass.NEW_SIZE
    jmp  0x004C717A


_TFixedHeapClass__HouseClass__Constructor_HouseClass:
    mov  edx,HouseClass.NEW_SIZE
    jmp  0x004C836A


_TFixedHeapClass__HouseClass__Save_HouseClass:
    mov  ebx,HouseClass.NEW_SIZE
    jmp  0x004CED18


_TFixedHeapClass__HouseClass__Load_HouseClass:
    cmp  dword [SaveGameVersion],New_Savegame_Version
    jnz  .Old_Savegame
    mov  ebx,HouseClass.NEW_SIZE
    jmp  0x004CEDFA
.Old_Savegame:
    mov  ebx,HouseClass.ORIGINAL_SIZE
    jmp  0x004CEDFA


_TFixedHeapClass__HouseClass__Load_Clear_Memory_For_Old_Savegames:
    Clear_Extended_Class_Memory_For_Old_Saves esi,HouseClass.NEW_SIZE,HouseClass.ORIGINAL_SIZE
    mov  byte [esi+HouseClass.Offset.SecondaryColorScheme],0xFF
.Ret:
    mov  ebx,0x005F6538
    jmp  0x004CEE15


_HouseClass__Read_INI_HouseClass_Size:
    mov  edx,HouseClass.NEW_SIZE
    jmp  0x004DDD22



