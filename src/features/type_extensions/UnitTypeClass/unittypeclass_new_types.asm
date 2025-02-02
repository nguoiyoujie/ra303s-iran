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

cextern UnitTypeClass_UnitTypeClass
cextern UnitTypeClass_new
cextern Globals___RuleINI

cextern str_StringTableOffsets
cextern str_Unit
cextern str_UnitTypes


@HACK 0x00459715,0x0045971A,_BuildingClass__Update_Buildables_UnhardCode_UnitTypes
    mov  byte al,[UnitTypeClass.Count]
    cmp  bl,al
    jl   0x004596D4
    jmp  0x0045971A
@ENDHACK


@HACK 0x004F40FA,0x004F40FF,_Init_Game_Set_UnitTypes_Heap_Count
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Unit,[Rules.StringTableOffsets.UnitTypes]
    mov  [Rules.StringTableOffsets.UnitTypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_UnitTypes
    mov  edx,eax
    add  edx,UnitTypeClass.ORIGINAL_COUNT
    jmp  0x004F40FF
@ENDHACK


@HACK 0x00578950,0x00578956,_UnitTypeClass__Init_Heap_UnhardCode_UnitTypes
    Loop_Over_RULES_INI_Section_Entries str_UnitTypes,Init_UnitTypeClass
    ;mov  edx,[UnitTypeClass.Count]
    ;dec  edx
    ;mov  [0x006057E4],edx ; used by deconstructor
    call Init_Heap_OverrideExistingUnitTypes
.Ret:
    lea  esp,[ebp-0x14]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x00578956
@ENDHACK


@HACK 0x00578974,0x0057897B,_UnitTypeClass__From_Name_Unhardcode_UnitTypes_Count
    mov  byte al,[UnitTypeClass.Count]
    cmp  dl,al
    jl   0x00578980
    jmp  0x0057899E
@ENDHACK


@HACK 0x00578ADB,0x00578AE4,_UnitTypeClass__One_Time_UnhardCode_UnitTypes
    mov  byte al,[UnitTypeClass.Count]
    cmp  dl,al
    jl   0x005789BF
    jmp  0x00578AE4
@ENDHACK


[section .text]
Init_UnitTypeClass:
    mov  eax,UnitTypeClass.NEW_SIZE
    call UnitTypeClass_new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call _strdup
    mov  ecx,eax

    pop  eax
    mov  edx,ebx
    add  edx,UnitTypeClass.ORIGINAL_COUNT ; UnitType

    ; mimic UnitType 2TNK, but using Civilian text name
    push MissionType.MISSION_HUNT ; MissionType order MISSION_HUNT
    push 0               ; bool toffset
    push 0x20             ; bool rotation
    push 0               ; bool is_gapper
    push 0               ; bool is_jammer
    push 0               ; bool is_animating
    push 1               ; bool is_gigundo
    push 0               ; bool is_lock_turret
    push 0               ; bool is_fire_anim
    push 0               ; bool is_radar_equipped
    push 1               ; bool is_turret_equipped
    push 0               ; bool is_insignificant
    push 0               ; bool is_stealthy
    push 0               ; bool is_harvest
    push 1               ; bool is_crusher
    push 0               ; bool is_nominal
    push 1               ; bool is_goodie
    push 0               ; int secondarylateral
    push 0xC0            ; int secondaryoffset
    push 0               ; int primarylateral
    push 0xC0            ; int primaryoffset
    push 0x30             ; int verticaloffset
    push 1               ; RemapType remap
    push 2               ; AnimType exp
    ; ecx: char const * ininame
    ; ebx: int name
    ; edx: UnitType type
    ; eax: UnitTypeTypeClass object

    ; apply offset names
    push eax
    cmp  dword[Rules.StringTableOffsets.UnitTypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword[Rules.StringTableOffsets.UnitTypes]
    jmp  .Continue 
.Default_Name:
    mov  ebx,21 ; Civilian
.Continue:
    pop  eax
    call UnitTypeClass_UnitTypeClass
.Ret:
    retn


Init_Heap_OverrideExistingUnitTypes:
    ; explicit set default PrereqType values for compatibility
    UnitTypeClass.FromIndex(UnitType.APC,edi)
    UnitTypeClass.Anim_HasAPCDoor.Set(edi,1)

    UnitTypeClass.FromIndex(UnitType.HARV,edi)
    UnitTypeClass.UsePrimaryColor.Set(edi,1)

    UnitTypeClass.FromIndex(UnitType.STNK,edi)
    UnitTypeClass.Anim_HasAPCDoor.Set(edi,1)

    UnitTypeClass.FromIndex(UnitType.MCV,edi)
    UnitTypeClass.DeploysInto.Set(edi,BuildingType.FACT)
    UnitTypeClass.UsePrimaryColor.Set(edi,1)

    UnitTypeClass.FromIndex(UnitType.V2RL,edi)
    UnitTypeClass.AmmoReloadRate.Set(edi,30)
    UnitTypeClass.AmmoImageCount.Set(edi,1)

    ; iterate over all unit types
    xor  edx,edx
.Repeat:
    UnitTypeClass.FromIndex(edx,edi)
    TechnoTypeClass.PrimaryWeapon.Get(edi,eax)
    test eax,eax
    jz   .NoWeapon
    UnitTypeClass.AIBuildWeight.Set(edi,20)
    jmp  .Next
.NoWeapon:
    UnitTypeClass.AIBuildWeight.Set(edi,1)
.Next:
    inc  edx
    cmp  edx,[UnitTypeClass.Count]
    jl   .Repeat
	retn



