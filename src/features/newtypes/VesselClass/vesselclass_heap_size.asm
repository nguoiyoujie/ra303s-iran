;----------------------------------------------------------------
; src/features/type_extensions/VesselClass/vesselclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

cextern Globals___SaveGameVersion

cextern VesselClass.ORIGINAL_SIZE
cextern VesselClass.NEW_SIZE


@SET 0x004C7356,{mov edx,VesselClass.NEW_SIZE} ; _TFixedHeapClass_fn_init_VesselClass
@SET 0x004C8E05,{mov edx,VesselClass.NEW_SIZE} ; _TFixedHeapClass__VesselClass__Constructor_VesselClass
@SET 0x004D02D3,{mov ebx,VesselClass.NEW_SIZE} ; _TFixedHeapClass__VesselClass__Save_VesselClass
@SET 0x004626B8,{mov eax,VesselClass.NEW_SIZE} ; CarryoverClass__Create
@SET 0x005848D1,{mov eax,VesselClass.NEW_SIZE} ; VesselTypeClass__Create_And_Place
@SET 0x00584877,{mov eax,VesselClass.NEW_SIZE} ; VesselTypeClass__Create_One_Of
@SET 0x0058CAF5,{mov eax,VesselClass.NEW_SIZE} ; VesselClass__Read_INI


@HACK 0x004D03B5,0x004D03BA,_TFixedHeapClass__VesselClass__Load_VesselClass
    cmp  dword[Globals___SaveGameVersion],New_Savegame_Version
    jnz  .Old_Savegame
    mov  ebx,VesselClass.NEW_SIZE
    jmp  0x004D03BA
.Old_Savegame:
    mov  ebx,VesselClass.ORIGINAL_SIZE
    jmp  0x004D03BA
@ENDHACK


@HACK 0x004D03D4,0x004D03D9,_TFixedHeapClass__VesselClass__Load_Clear_Memory_For_Old_Savegames
    Clear_Extended_Class_Memory_For_Old_Saves esi,VesselClass.NEW_SIZE,VesselClass.ORIGINAL_SIZE

.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D03D9
@ENDHACK

