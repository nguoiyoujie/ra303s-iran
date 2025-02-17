;----------------------------------------------------------------
; src/features/type_extensions/WeaponTypeClass/weapontypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

cextern WeaponTypeClass.ORIGINAL_SIZE
cextern WeaponTypeClass.NEW_SIZE

@SET 0x00590155,{mov edx,WeaponTypeClass.NEW_SIZE} ; _TFixedIHeapClass__WeaponTypeClass__Constructor
@SET 0x004D1EF3,{mov ebx,WeaponTypeClass.NEW_SIZE} ; _TFixedIHeapClass__WeaponTypeClass__Save_New_Size
@SET 0x004D1FD4,{mov ebx,WeaponTypeClass.NEW_SIZE} ; _TFixedIHeapClass__WeaponTypeClass__Load_New_Size
@SET 0x00536282,{mov edx,WeaponTypeClass.NEW_SIZE} ; RulesClass_Heap_Maximums

@HACK 0x004D1FE9,0x004D1FF0,_TFixedIHeapClass__WeaponTypeClass__Load_Clear_Memory
    Clear_Extended_Class_Memory_For_Old_Saves ecx,WeaponTypeClass.NEW_SIZE,WeaponTypeClass.ORIGINAL_SIZE
.Ret:
    mov  dword edx,[ebp-0x18]
    inc  edx
    mov  dword ebx,[ebp-0x2C]
    jmp  0x004D1FF0
@ENDHACK
