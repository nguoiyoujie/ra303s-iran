;----------------------------------------------------------------
; src/features/type_extensions/VesselTypeClass/vesseltypeclass_new_types.asm
;
; Continuation of Iran's work in enabling the game to use new VesselTypeClass.
; 
; This function is enabled by including the section [VesselTypes] in Rules.ini. This section includes an indexed array of names of vessels to load.
;   [VesselTypes]
;   0=MAGICSUB
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

@HOOK 0x00459661 _BuildingClass__Update_Buildables_Unhardcode_VesselTypes
@HOOK 0x004F410B _Init_Game_Set_VesselTypes_Heap_Count
@HOOK 0x0058484B _VesselTypeClass__Init_Heap_Unhardcode_VesselTypes
@HOOK 0x00584A3A _VesselTypeClass__One_Time_Unhardcode_VesselTypes
@HOOK 0x00584B44 _VesselTypeClass__From_Name_Unhardcode_VesselTypes


_BuildingClass__Update_Buildables_Unhardcode_VesselTypes:
    mov  byte al,[NewVesselTypeHeapCount]
    cmp  dl,al
    jl   0x00459620
    jmp  0x00459666


_Init_Game_Set_VesselTypes_Heap_Count:
    ; update the stringtableoffset,if defined in Rules
    call_INIClass__Get_Int Globals___RuleINI,str_StringTableOffsets,str_Vessel,[stringtableoffset_newvesseltypes]
    mov  [stringtableoffset_newvesseltypes],eax

    ; update heap count
    Get_RULES_INI_Section_Entry_Count str_VesselTypes
    mov  byte [VesselTypesTypesExtCount],al
    mov  edx,eax
    add  edx,VesselTypeClass.ORIGINAL_MAX
    mov  byte [NewVesselTypeHeapCount],dl
    jmp  0x004F4110


_VesselTypeClass__Init_Heap_Unhardcode_VesselTypes:
    Loop_Over_RULES_INI_Section_Entries str_VesselTypes,Init_VesslTypeClass
    call Init_Heap_OverrideExistingVesselTypes
.Ret:
    lea  esp,[ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x00584851


Init_VesslTypeClass:
    mov  eax,VesselTypeClass.NEW_SIZE
    call VesselTypeClass_new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call __strdup
    mov  ecx,eax

    pop  eax
    mov  edx,ebx
    add  edx,VesselTypeClass.ORIGINAL_MAX ; VesselType

    push 0Eh
    push 8
    push 1
    push 1
    push 0
    push 0
    push 0
    push 0
    push 0
    push 0
    push 0

    ; apply offset names
    push eax
    cmp  dword [stringtableoffset_newvesseltypes],-1
    je   .Default_Name
.Offset_Name:
    add  ebx,dword [stringtableoffset_newvesseltypes]
    jmp  .Continue 
.Default_Name:
    mov  ebx,21 ; Civilian
.Continue:
    pop  eax

    mov  dword [0x00605A90],1 ; __Vessel_Idx
    call VesselTypeClass_VesselTypeClass
.Ret:
    retn


Init_Heap_OverrideExistingVesselTypes:
    push esi
    VesselTypeClass.FromIndex(VesselType.PT,edi)
    VesselTypeClass.TurretName.Set(edi,str_MGUN)
    VesselTypeClass.TurretOffset.Set(edi,14)
    VesselTypeClass.TurretAdjustY.Set(edi,1)

    VesselTypeClass.FromIndex(VesselType.DD,edi)
    VesselTypeClass.TurretName.Set(edi,str_SSAM)
    VesselTypeClass.TurretOffset.Set(edi,-8)
    VesselTypeClass.TurretAdjustY.Set(edi,-4)

    VesselTypeClass.FromIndex(VesselType.CA,edi)
    VesselTypeClass.TurretName.Set(edi,str_TURR)
    VesselTypeClass.HasSecondTurret.Set(edi,1)
    VesselTypeClass.TurretOffset.Set(edi,22)
    VesselTypeClass.TurretAdjustY.Set(edi,-4)
    pop esi
    retn


_VesselTypeClass__One_Time_Unhardcode_VesselTypes:
    mov  byte al,[NewVesselTypeHeapCount]
    cmp  dh,al
    jl   0x0058497D
    jmp  0x00584A43


_VesselTypeClass__From_Name_Unhardcode_VesselTypes:
    mov  byte al,[NewVesselTypeHeapCount]

    cmp  dl,al
    jl   0x00584B50
    jmp  0x00584B49
