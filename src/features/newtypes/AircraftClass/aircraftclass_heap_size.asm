;----------------------------------------------------------------
; src/features/type_extensions/AircraftClass/aircraftclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

cextern Globals___SaveGameVersion

cextern AircraftClass.ORIGINAL_SIZE
cextern AircraftClass.NEW_SIZE


@SET 0x004C7095,{mov edx,AircraftClass.NEW_SIZE} ; _TFixedHeapClass_fn_init_AircraftClass
@SET 0x004C7E15,{mov edx,AircraftClass.NEW_SIZE} ; _TFixedHeapClass__AircraftClass__Constructor_AircraftClass
@SET 0x004CE173,{mov ebx,AircraftClass.NEW_SIZE} ; _TFixedHeapClass__AircraftClass__Save_AircraftClass
@SET 0x0041D77F,{mov eax,AircraftClass.NEW_SIZE} ; AircraftClass__Read_INI_AircraftClass_Size
@SET 0x0040402B,{mov eax,AircraftClass.NEW_SIZE} ; AircraftTypeClass__Create_One_Of
@SET 0x00459FF6,{mov eax,AircraftClass.NEW_SIZE} ; BuildingClass__Grand_Opening
@SET 0x0045A05D,{mov eax,AircraftClass.NEW_SIZE} ; BuildingClass__Grand_Opening


@HACK 0x004CE24F,0x004CE254,_TFixedHeapClass__AircraftClass__Load_AircraftClass
    cmp  dword[Globals___SaveGameVersion],New_Savegame_Version
    jnz  .Old_Savegame
    mov  ebx,AircraftClass.NEW_SIZE
    jmp  0x004CE254
.Old_Savegame:
    mov  ebx,AircraftClass.ORIGINAL_SIZE
    jmp  0x004CE254
@ENDHACK


@HACK 0x004CE277,0x004CE27C,_TFixedHeapClass__AircraftClass__Load_Clear_Memory_For_Old_Savegames
    Clear_Extended_Class_Memory_For_Old_Saves esi,AircraftClass.NEW_SIZE,AircraftClass.ORIGINAL_SIZE

.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004CE27C
@ENDHACK

