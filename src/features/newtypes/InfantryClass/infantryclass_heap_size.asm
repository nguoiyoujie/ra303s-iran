;----------------------------------------------------------------
; src/features/type_extensions/InfantryClass/infantryclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

cextern Globals___SaveGameVersion

cextern InfantryClass.ORIGINAL_SIZE
cextern InfantryClass.NEW_SIZE


@SET 0x004C71B4,{mov edx,InfantryClass.NEW_SIZE} ; _TFixedHeapClass_fn_init_InfantryClass
@SET 0x004C8475,{mov edx,InfantryClass.NEW_SIZE} ; _TFixedHeapClass__InfantryClass__Constructor_InfantryClass
@SET 0x004CEF33,{mov ebx,InfantryClass.NEW_SIZE} ; _TFixedHeapClass__InfantryClass__Save_InfantryClass

@SET 0x0041F13E,{mov eax,InfantryClass.NEW_SIZE} ; AircraftClass__Take_Damage
@SET 0x00458397,{mov eax,InfantryClass.NEW_SIZE} ; BuildingClass__Drop_Debris
@SET 0x0045C267,{mov eax,InfantryClass.NEW_SIZE} ; BuildingClass__Mission_Deconstruction
@SET 0x0046265C,{mov eax,InfantryClass.NEW_SIZE} ; CarryoverClass__Create
@SET 0x004EAF27,{mov eax,InfantryClass.NEW_SIZE} ; InfantryTypeClass__Create_One_Of
@SET 0x004EAF80,{mov eax,InfantryClass.NEW_SIZE} ; InfantryTypeClass__Create_And_Place
@SET 0x004F097D,{mov eax,InfantryClass.NEW_SIZE} ; InfantryClass__Read_INI
@SET 0x0053EA66,{mov eax,InfantryClass.NEW_SIZE} ; Create_Units
@SET 0x0053EB06,{mov eax,InfantryClass.NEW_SIZE} ; Create_Units
@SET 0x0057ADB7,{mov eax,InfantryClass.NEW_SIZE} ; UnitClass__Take_Damage
@SET 0x0057AE23,{mov eax,InfantryClass.NEW_SIZE} ; UnitClass__Take_Damage
@SET 0x0057DEF1,{mov eax,InfantryClass.NEW_SIZE} ; UnitClass__Mission_Unload


@HACK 0x004CF00F,0x004CF014,_TFixedHeapClass__InfantryClass__Load_InfantryClass
    cmp  dword[Globals___SaveGameVersion],New_Savegame_Version
    jnz  .Old_Savegame
    mov  ebx,InfantryClass.NEW_SIZE
    jmp  0x004CF014
.Old_Savegame:
    mov  ebx,InfantryClass.ORIGINAL_SIZE
    jmp  0x004CF014
@ENDHACK


@HACK 0x004CF037,0x004CF03C,_TFixedHeapClass__InfantryClass__Load_Clear_Memory_For_Old_Savegames
    Clear_Extended_Class_Memory_For_Old_Saves esi,InfantryClass.NEW_SIZE,InfantryClass.ORIGINAL_SIZE

.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004CF03C
@ENDHACK

