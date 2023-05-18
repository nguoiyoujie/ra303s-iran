@HOOK 0x004537CC _BuildingTypeClass__From_Name_Unhardcode_BuildingTypes_Count
@HOOK 0x004F40A5 _Init_Game_Set_BuildingTypes_Heap_Count
@HOOK 0x0045359B _BuildingTypeClass__Init_Heap_UnhardCode_BuildingTypes
@HOOK 0x004596BB _BuildingClass__Update_Buildables_UnhardCode_BuildingTypes
@HOOK 0x00453711 _BuildingTypeClass__One_Time_UnhardCode_BuildingTypes

str_BuildingTypes db"BuildingTypes",0 ;2x2

NewBuildingTypeHeapCount    dd    0
BuildingTypesExtCount       dd    0

%define        OriginalBuildingTypeHeapCount    0x57

_BuildingTypeClass__One_Time_UnhardCode_BuildingTypes:
    mov  al, [NewBuildingTypeHeapCount]

    cmp  bl, al
    jl   0x004535BD
    jmp  0x0045371A

_BuildingClass__Update_Buildables_UnhardCode_BuildingTypes:
    mov  al, [NewBuildingTypeHeapCount]
    cmp  bh, al
    jl   0x0045967A
    jmp  0x004596C0

Init_BuildingTypeClass:

    mov  eax, 207h
    call 0x00429F0C ;  BuildingTypeClass::operator new(uint)
    test eax, eax
    jz   .Ret

    push eax
    mov  eax, edx
    ; edx should have the name of the INI section already
    call 0x005C3900 ; strdup()
    mov  ecx, eax

    pop  eax
    mov  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0
    push 0x005FEAF6 ; offset short const List22[]
    push 0
    push BSIZE_22 ;2x2 building size
    push 0
    push 0
    push 1
    push 0
    push 0
    push 0
    push 1
    push 1
    push 0
    push 1
    push 0
    push 0
    push 1
    push 0
    push 0
    push 0
    push 0
    push 2
    push 0
    add  ebx, dword [stringtableoffset_newbuildingtypes]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

_BuildingTypeClass__Init_Heap_UnhardCode_BuildingTypes:

    Loop_Over_RULES_INI_Section_Entries str_BuildingTypes, Init_BuildingTypeClass
    call _BuildingTypeClass__Init_Heap_OverrideExistingBuildingTypes

.Ret:
    lea  esp, [ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x004535A1


_BuildingTypeClass__Init_Heap_OverrideExistingBuildingTypes:
    ; explicit set default PrereqType values for compatibility

    BuildingTypeClass.FromIndex(BuildingType.ATEK,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.IRON,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.WEAPON1)

    BuildingTypeClass.FromIndex(BuildingType.WEAP,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.WARFACTORY)
    BuildingTypeClass.WarFactoryOverlayAnim.Set(edi, -1)
    BuildingTypeClass.WarFactoryOverlayFrames.Set(edi, 4)
    BuildingTypeClass.WarFactoryOverlayRate.Set(edi, 8)

    BuildingTypeClass.FromIndex(BuildingType.PDOX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.WEAPON1)

    BuildingTypeClass.FromIndex(BuildingType.PBOX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.HBOX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.DOME,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.RADAR)

    BuildingTypeClass.FromIndex(BuildingType.GAP,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.GUN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.AGUN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.AA.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.FTUR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.FACT,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.CONYARD)

    BuildingTypeClass.FromIndex(BuildingType.PROC,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.REFINERY)

    BuildingTypeClass.FromIndex(BuildingType.SILO,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ORESILO)

    BuildingTypeClass.FromIndex(BuildingType.HPAD,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.HELIPAD)

    BuildingTypeClass.FromIndex(BuildingType.SAM,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.AA.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.AFLD,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.AIRSTRIP)

    BuildingTypeClass.FromIndex(BuildingType.POWR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.POWER)

    BuildingTypeClass.FromIndex(BuildingType.APWR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.POWER)

    BuildingTypeClass.FromIndex(BuildingType.STEK,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.TECH)

    BuildingTypeClass.FromIndex(BuildingType.HOSP,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.BARR,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.BARRACKS)

    BuildingTypeClass.FromIndex(BuildingType.TENT,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.BARRACKS)

    BuildingTypeClass.FromIndex(BuildingType.KENN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.BARRACKS)

    BuildingTypeClass.FromIndex(BuildingType.FIX,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.REPAIR)

    BuildingTypeClass.FromIndex(BuildingType.BIO,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.MISS,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.SYRD,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.SHIPYARD)

    BuildingTypeClass.FromIndex(BuildingType.SPEN,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.SHIPYARD)

    BuildingTypeClass.FromIndex(BuildingType.MSLO,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.WEAPON2)

    BuildingTypeClass.FromIndex(BuildingType.FCOM,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.NONE)

    BuildingTypeClass.FromIndex(BuildingType.TSLA,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.ADV.DEFENSE)

    BuildingTypeClass.FromIndex(BuildingType.WEAF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)
    BuildingTypeClass.WarFactoryOverlayAnim.Set(edi, -1)
    BuildingTypeClass.WarFactoryOverlayFrames.Set(edi, 4)
    BuildingTypeClass.WarFactoryOverlayRate.Set(edi, 8)
	
    BuildingTypeClass.FromIndex(BuildingType.FACF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)

    BuildingTypeClass.FromIndex(BuildingType.SYRF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)

    BuildingTypeClass.FromIndex(BuildingType.SPEF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)

    BuildingTypeClass.FromIndex(BuildingType.DOMF,edi)
    TechnoTypeClass.PrereqType.Set(edi,PrereqType.FAKES)

    retn

_Init_Game_Set_BuildingTypes_Heap_Count:
    call_INIClass__Get_Int 0x00666688, str_stringtableoffsets, str_stringtableoffset_newbuildingtypes, [stringtableoffset_newbuildingtypes]
    mov  [stringtableoffset_newbuildingtypes], eax
    Get_RULES_INI_Section_Entry_Count str_BuildingTypes
    mov  BYTE [BuildingTypesExtCount], al
    mov  edx, eax
    add  edx, OriginalBuildingTypeHeapCount
    mov  BYTE [NewBuildingTypeHeapCount], dl
    jmp  0x004F40AA

_BuildingTypeClass__From_Name_Unhardcode_BuildingTypes_Count:
    mov  BYTE al, [NewBuildingTypeHeapCount]

    cmp  dl, al
    jl   0x004537D8
    jmp  0x004537D1
