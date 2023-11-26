;----------------------------------------------------------------
; src/features/type_extensions/UnitTypeClass/unittypeclass_new_types.asm
;
; Continuation of Iran's work in enabling the game to use new UnitTypeClass.
; 
; This function is enabled by including the section [UnitTypes] in Rules.ini. This section includes an indexed array of names of units to load.
;   [UnitTypes]
;   0=5TNK
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

@HOOK 0x00459715 _BuildingClass__Update_Buildables_UnhardCode_UnitTypes
@HOOK 0x004F40FA _Init_Game_Set_UnitTypes_Heap_Count
@HOOK 0x00578950 _UnitTypeClass__Init_Heap_UnhardCode_UnitTypes
@HOOK 0x00578974 _UnitTypeClass__From_Name_Unhardcode_UnitTypes_Count
@HOOK 0X00578ADB _UnitTypeClass__One_Time_UnhardCode_UnitTypes


_BuildingClass__Update_Buildables_UnhardCode_UnitTypes:
    mov  al,[NewUnitTypeHeapCount]
    cmp  bl,al
    jl   0x004596D4
    jmp  0x0045971A


_Init_Game_Set_UnitTypes_Heap_Count:
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Unit,[stringtableoffset_newunittypes]
    mov  [stringtableoffset_newunittypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_UnitTypes
    mov  byte [UnitTypesExtCount],al
    mov  edx,eax
    add  edx,UnitTypeClass.ORIGINAL_MAX
    mov  byte [NewUnitTypeHeapCount],dl
    jmp  0x004F40FF


_UnitTypeClass__Init_Heap_UnhardCode_UnitTypes:
    Loop_Over_RULES_INI_Section_Entries str_UnitTypes,Init_UnitTypeClass
    call Init_Heap_OverrideExistingUnitTypes
.Ret:
    lea  esp,[ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x00578956


Init_UnitTypeClass:
    mov  eax,UnitTypeClass.NEW_SIZE
    call UnitTypeClass_new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call __strdup
    mov  ecx,eax

    pop  eax
    mov  edx,ebx
    add  edx,UnitTypeClass.ORIGINAL_MAX ; UnitType

    push 0Eh
    push 0
    push 20h
    push 0
    push 0
    push 0
    push 1
    push 0
    push 0
    push 0
    push 1 ;is_turret_equipped,was 1
    push 0
    push 0
    push 0
    push 1
    push 0
    push 1
    push 0
    push 030h ;secondaryoffset,was 0C0h
    push 0
    push 030h ;primaryoffset,was 0C0h
    push 30h ;verticaloffset

    ; apply offset names
    push eax
    cmp  dword [stringtableoffset_newunittypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword [stringtableoffset_newunittypes]
    jmp  .Continue 
.Default_Name:
    mov  ebx,21 ; Civilian
.Continue:
    pop  eax
	
    push 1
    mov  dword [0x006057E4],3 ; Turret Dir adjust
    push 2
    call UnitTypeClass_UnitTypeClass
.Ret:
    retn


Init_Heap_OverrideExistingUnitTypes:
    ; explicit set default PrereqType values for compatibility

    UnitTypeClass.FromIndex(UnitType.MCV,edi)
    UnitTypeClass.DeploysInto.Set(edi,BuildingType.FACT)

    UnitTypeClass.FromIndex(UnitType.V2RL,edi)
    UnitTypeClass.AmmoReloadRate.Set(edi,30)

	retn


_UnitTypeClass__From_Name_Unhardcode_UnitTypes_Count:
    mov  byte al,[NewUnitTypeHeapCount]
    cmp  dl,al
    jl   0x00578980
    jmp  0x0057899E


_UnitTypeClass__One_Time_UnhardCode_UnitTypes:
    mov  al,[NewUnitTypeHeapCount]
    cmp  dl,al
    jl   0x005789BF
    jmp  0x00578AE4
