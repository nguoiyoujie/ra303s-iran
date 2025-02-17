;----------------------------------------------------------------
; src/features/type_extensions/WarheadTypeClass/warheadtypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

cextern WarheadTypeClass.ORIGINAL_SIZE
cextern WarheadTypeClass.NEW_SIZE

@SET 0x0058FC45,{mov edx,WarheadTypeClass.NEW_SIZE} ; _TFixedIHeapClass__WarheadTypeClass__Constructor
@SET 0x004D20D3,{mov ebx,WarheadTypeClass.NEW_SIZE} ; _TFixedIHeapClass__WarheadTypeClass__Save_New_Size
@SET 0x004D21AE,{mov ebx,WarheadTypeClass.NEW_SIZE} ; _TFixedIHeapClass__WarheadTypeClass__Load_New_Size
@SET 0x00536198,{mov eax,WarheadTypeClass.NEW_SIZE} ; RulesClass_Heap_Maximums
@SET 0x0058F99F,{mov edx,WarheadTypeClass.NEW_SIZE} ; 

@HACK 0x004D21D2,0x004D21D7,_TFixedIHeapClass__WarheadTypeClass__Load_Clear_Memory
    Clear_Extended_Class_Memory_For_Old_Saves ecx,WarheadTypeClass.NEW_SIZE,WarheadTypeClass.ORIGINAL_SIZE
.Ret:
    mov  ebx,0x005F8768
    jmp  0x004D21D7
@ENDHACK


