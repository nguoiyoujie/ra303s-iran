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

;Read INI settings
@HOOK 0x004C750C _TFixedIHeapClass__fn_init_VesselTypes_Heap
@HOOK 0x004D1533 _TFixedIHeapClass__VesselTypeClass__Save_New_Size
@HOOK 0x004D1616 _TFixedIHeapClass__VesselTypeClass__Load_New_Size
@HOOK 0x004D1631 _TFixedIHeapClass__VesselTypeClass__Load_Clear_Memory


_TFixedIHeapClass__fn_init_VesselTypes_Heap:
    mov  edx,VesselTypeClass.NEW_SIZE
    jmp  0x004C7511


_TFixedIHeapClass__VesselTypeClass__Save_New_Size:
    mov  ebx,VesselTypeClass.NEW_SIZE
    jmp  0x004D1538
    
    
_TFixedIHeapClass__VesselTypeClass__Load_New_Size:
    mov  ebx,VesselTypeClass.NEW_SIZE
    jmp  0x004D161B


_TFixedIHeapClass__VesselTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,VesselTypeClass.NEW_SIZE,VesselTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D1636

