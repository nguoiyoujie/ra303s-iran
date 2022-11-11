@HOOK 0x004537CC _BuildingTypeClass__From_Name_Unhardcode_BuildingTypes_Count
@HOOK 0x004F40A5 _Init_Game_Set_BuildingTypes_Heap_Count
@HOOK 0x0045359B _BuildingTypeClass__Init_Heap_UnhardCode_BuildingTypes
@HOOK 0x004596BB _BuildingClass__Update_Buildables_UnhardCode_BuildingTypes
@HOOK 0x00453711 _BuildingTypeClass__One_Time_UnhardCode_BuildingTypes

str_BuildingTypes db"BuildingTypes",0 ;2x2

NewBuildingTypeHeapCount    dd    0
BuildingTypesExtCount       dd    0

%define        OriginalBuildingTypeHeapCount    0x57

%define        BSIZE_11    0
%define        BSIZE_21    1
%define        BSIZE_12    2
%define        BSIZE_22    3
%define        BSIZE_23    4
%define        BSIZE_32    5
%define        BSIZE_33    6
%define        BSIZE_42    7
%define        BSIZE_55    8

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
    add  ebx, dword [stringtableoffset_newvesseltypes]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

_BuildingTypeClass__Init_Heap_UnhardCode_BuildingTypes:

    Loop_Over_RULES_INI_Section_Entries str_BuildingTypes, Init_BuildingTypeClass

.Ret:
    lea  esp, [ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x004535A1

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
