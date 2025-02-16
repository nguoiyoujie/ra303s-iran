;----------------------------------------------------------------
; src/features/type_extensions/UnitClass/unitclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

cextern Globals___SaveGameVersion

cextern UnitClass.ORIGINAL_SIZE
cextern UnitClass.NEW_SIZE


@SET 0x004C7326,{mov edx,UnitClass.NEW_SIZE} ; _TFixedHeapClass_fn_init_UnitClass
@SET 0x004C8CF5,{mov edx,UnitClass.NEW_SIZE} ; _TFixedHeapClass__UnitClass__Constructor_UnitClass
@SET 0x004D0073,{mov ebx,UnitClass.NEW_SIZE} ; _TFixedHeapClass__UnitClass__Save_UnitClass
@SET 0x00459DA7,{mov eax,UnitClass.NEW_SIZE} ; BuildingClass__Grand_Opening
@SET 0x0045C568,{mov eax,UnitClass.NEW_SIZE} ; BuildingClass__Mission_Deconstruction
@SET 0x0046262E,{mov eax,UnitClass.NEW_SIZE} ; CarryoverClass__Create
@SET 0x0053E6E3,{mov eax,UnitClass.NEW_SIZE} ; Create_Units
@SET 0x0053E89B,{mov eax,UnitClass.NEW_SIZE} ; Create_Units
@SET 0x0053E939,{mov eax,UnitClass.NEW_SIZE} ; Create_Units
@SET 0x00578B5D,{mov eax,UnitClass.NEW_SIZE} ; UnitTypeClass__Create_And_Place
@SET 0x00578BD7,{mov eax,UnitClass.NEW_SIZE} ; UnitTypeClass__Create_One_Of
@SET 0x00581175,{mov eax,UnitClass.NEW_SIZE} ; UnitClass__Read_INI


@HACK 0x004D0155,0x004D015A,_TFixedHeapClass__UnitClass__Load_UnitClass
    cmp  dword[Globals___SaveGameVersion],New_Savegame_Version
    jnz  .Old_Savegame
    mov  ebx,UnitClass.NEW_SIZE
    jmp  0x004D015A
.Old_Savegame:
    mov  ebx,UnitClass.ORIGINAL_SIZE
    jmp  0x004D015A
@ENDHACK


@HACK 0x004D0170,0x004D0175,_TFixedHeapClass__UnitClass__Load_Clear_Memory_For_Old_Savegames
    Clear_Extended_Class_Memory_For_Old_Saves esi,UnitClass.NEW_SIZE,UnitClass.ORIGINAL_SIZE

.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0175
@ENDHACK

