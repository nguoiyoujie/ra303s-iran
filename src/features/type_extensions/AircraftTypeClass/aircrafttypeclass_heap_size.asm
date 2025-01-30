;----------------------------------------------------------------
; src/features/type_extensions/AircraftTypeClass/aircrafttypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

;Read INI settings
@SET 0x004C7427,{mov edx,AircraftTypeClass.NEW_SIZE} ; _TFixedIHeapClass__fn_init_AircraftTypes_Heap
@SET 0x004D0B53,{mov ebx,AircraftTypeClass.NEW_SIZE} ; _TFixedIHeapClass__AircraftTypeClass__Save_New_Size
@SET 0x004D0C36,{mov ebx,AircraftTypeClass.NEW_SIZE} ; _TFixedIHeapClass__AircraftTypeClass__Load_New_Size


@HACK 0x004D0C51,0x004D0C56,_TFixedIHeapClass__AircraftTypeClass__Load_Clear_Memory
    Clear_Extended_Class_Memory_For_Old_Saves ecx,AircraftTypeClass.NEW_SIZE,AircraftTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0C56
@ENDHACK

