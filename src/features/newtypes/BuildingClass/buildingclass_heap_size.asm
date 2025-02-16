;----------------------------------------------------------------
; src/features/type_extensions/BuildingClass/buildingclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

cextern Globals___SaveGameVersion

cextern BuildingClass.ORIGINAL_SIZE
cextern BuildingClass.NEW_SIZE


@SET 0x004C70E8,{mov edx,BuildingClass.NEW_SIZE} ; _TFixedHeapClass_fn_init_BuildingClass
@SET 0x004C8035,{mov edx,BuildingClass.NEW_SIZE} ; _TFixedHeapClass__BuildingClass__Constructor_BuildingClass
@SET 0x004CE673,{mov ebx,BuildingClass.NEW_SIZE} ; _TFixedHeapClass__BuildingClass__Save_BuildingClass
@SET 0x0045EFC6,{mov eax,BuildingClass.NEW_SIZE} ; BuildingClass__Read_INI_BuildingClass_Size
@SET 0x00453810,{mov eax,BuildingClass.NEW_SIZE} ; BuildingTypeClass__Create_And_Place
@SET 0x00453897,{mov eax,BuildingClass.NEW_SIZE} ; BuildingTypeClass__Create_One_Of
@SET 0x0046268C,{mov eax,BuildingClass.NEW_SIZE} ; CarryoverClass__Create
@SET 0x0057BABD,{mov eax,BuildingClass.NEW_SIZE} ; UnitClass__Try_To_Deploy
@SET 0x0057DC03,{mov eax,BuildingClass.NEW_SIZE} ; UnitClass__Mission_Unload
@SET 0x0058EA9D,{mov eax,BuildingClass.NEW_SIZE} ; ChronalVortexClass__Zap_Target


@HACK 0x004CE74E,0x004CE753,_TFixedHeapClass__BuildingClass__Load_BuildingClass
    cmp  dword[Globals___SaveGameVersion],New_Savegame_Version
    jnz  .Old_Savegame
    mov  ebx,BuildingClass.NEW_SIZE
    jmp  0x004CE753
.Old_Savegame:
    mov  ebx,BuildingClass.ORIGINAL_SIZE
    jmp  0x004CE753
@ENDHACK


@HACK 0x004CE776,0x004CE77B,_TFixedHeapClass__BuildingClass__Load_Clear_Memory_For_Old_Savegames
    Clear_Extended_Class_Memory_For_Old_Saves esi,BuildingClass.NEW_SIZE,BuildingClass.ORIGINAL_SIZE

.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004CE77B
@ENDHACK

