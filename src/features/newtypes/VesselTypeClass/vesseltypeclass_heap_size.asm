;----------------------------------------------------------------
; src/features/type_extensions/VesselTypeClass/vesseltypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

cextern VesselTypeClass.ORIGINAL_SIZE
cextern VesselTypeClass.NEW_SIZE

;Read INI settings
@SET 0x004C750C,{mov edx,VesselTypeClass.NEW_SIZE} ; _TFixedIHeapClass__fn_init_VesselTypes_Heap
@SET 0x004D1533,{mov ebx,VesselTypeClass.NEW_SIZE} ; _TFixedIHeapClass__VesselTypeClass__Save_New_Size
@SET 0x004D1616,{mov ebx,VesselTypeClass.NEW_SIZE} ; _TFixedIHeapClass__VesselTypeClass__Load_New_Size


@HACK 0x004D1631,0x004D1636,_TFixedIHeapClass__VesselTypeClass__Load_Clear_Memory
    Clear_Extended_Class_Memory_For_Old_Saves ecx,VesselTypeClass.NEW_SIZE,VesselTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D1636
@ENDHACK

