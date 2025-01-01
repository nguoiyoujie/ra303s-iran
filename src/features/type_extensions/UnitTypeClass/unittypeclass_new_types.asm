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
@HOOK 0x00578ADB _UnitTypeClass__One_Time_UnhardCode_UnitTypes


_BuildingClass__Update_Buildables_UnhardCode_UnitTypes:
    mov  byte al,[UnitTypeClass.Count]
    cmp  bl,al
    jl   0x004596D4
    jmp  0x0045971A


_Init_Game_Set_UnitTypes_Heap_Count:
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Unit,[Rules.StringTableOffsets.UnitTypes]
    mov  [Rules.StringTableOffsets.UnitTypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_UnitTypes
    mov  edx,eax
    add  edx,UnitTypeClass.ORIGINAL_COUNT
    jmp  0x004F40FF


_UnitTypeClass__Init_Heap_UnhardCode_UnitTypes:
    Loop_Over_RULES_INI_Section_Entries str_UnitTypes,Init_UnitTypeClass
    ;mov  edx,[UnitTypeClass.Count]
    ;dec  edx
    ;mov  [0x006057E4],edx ; used by deconstructor
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
    add  edx,UnitTypeClass.ORIGINAL_COUNT ; UnitType

    ; mimic UnitType 2TNK, but using Civilian text name
    push MissionType.MISSION_HUNT ; MissionType order MISSION_HUNT
    push 0               ; bool toffset
    push 20h             ; bool rotation
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
    push 30h             ; int verticaloffset
    push 1               ; RemapType remap
    push 2               ; AnimType exp
    ; ecx: char const * ininame
    ; ebx: int name
    ; edx: UnitType type
    ; eax: UnitTypeTypeClass object

    ; apply offset names
    push eax
    cmp  dword [Rules.StringTableOffsets.UnitTypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword [Rules.StringTableOffsets.UnitTypes]
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

    UnitTypeClass.FromIndex(UnitType.STNK,edi)
    UnitTypeClass.Anim_HasAPCDoor.Set(edi,1)

    UnitTypeClass.FromIndex(UnitType.MCV,edi)
    UnitTypeClass.DeploysInto.Set(edi,BuildingType.FACT)

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


_UnitTypeClass__From_Name_Unhardcode_UnitTypes_Count:
    mov  byte al,[UnitTypeClass.Count]
    cmp  dl,al
    jl   0x00578980
    jmp  0x0057899E


_UnitTypeClass__One_Time_UnhardCode_UnitTypes:
    mov  byte al,[UnitTypeClass.Count]
    cmp  dl,al
    jl   0x005789BF
    jmp  0x00578AE4
