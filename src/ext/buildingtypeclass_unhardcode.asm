@HOOK 0x004537CC _BuildingTypeClass__From_Name_Unhardcode_BuildingTypes_Count
@HOOK 0x004F40A5 _Init_Game_Set_BuildingTypes_Heap_Count
@HOOK 0x0045359B _BuildingTypeClass__Init_Heap_UnhardCode_BuildingTypes
@HOOK 0x004596BB _BuildingClass__Update_Buildables_UnhardCode_BuildingTypes
@HOOK 0x00453711 _BuildingTypeClass__One_Time_UnhardCode_BuildingTypes

str_BuildingTypes db"BuildingTypes",0 ;2x2
str_Building1x1Types db"Building1x1Types",0
str_Building1x1TurretTypes db"Building1x1TurretTypes",0
str_Building1x1HighTypes db"Building1x1HighTypes",0
str_Building1x1HighTurretTypes db"Building1x1HighTurretTypes",0
str_Building2x2TurretTypes db"Building2x2TurretTypes",0
str_Building3x2Types db"Building3x2Types",0
str_BuildingBARRTypes db"BuildingBARRTypes",0 ;2x2
str_BuildingWEAPTypes db"BuildingWEAPTypes",0 ;3x2
str_BuildingFACTTypes db"BuildingFACTTypes",0 ;3x3
str_BuildingFACT3x2Types db"BuildingFACT3x2Types",0 ;3x2

NewBuildingTypeHeapCount    dd    0
Building1x1TypesExtCount    dd    0
Building1x1TurretTypesExtCount    dd    0
Building1x1HighTypesExtCount    dd    0
Building1x1HighTurretTypesExtCount    dd    0
Building2x2TypesExtCount    dd    0
Building2x2TurretTypesExtCount    dd    0
Building3x2TypesExtCount    dd    0
BuildingBARRTypesExtCount    dd    0
BuildingWEAPTypesExtCount    dd    0
BuildingFACTTypesExtCount    dd    0
BuildingFACT3x2TypesExtCount    dd    0
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
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_Building1x1TypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0
    push 0x005FEAEC ; offset short const List1[]
    push 0
    push BSIZE_11 ;1x1 building size
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
    push 0 ;Pillbox, Primary weapon lateral offset along turret centerline
    push 40h ;Pillbox, Primary weapon offset along turret centerline
    push 10h ;Pillbox, Vertical offset
    push 2  ; REMAP_ALTERNATE
    push 0 
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_Building1x1TurretTypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, [Building1x1TypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0
    push 0x005FEAEC ; offset short const List1[]
    push 0
    push BSIZE_11 ;1x1 building size
    push 0
    push 0
    push 1
    push 1
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
    push 0 ;Pillbox, Primary weapon lateral offset along turret centerline
    push 40h ;Pillbox, Primary weapon offset along turret centerline
    push 10h ;Pillbox, Vertical offset
    push 2  ; REMAP_ALTERNATE
    push 0 
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    add  ebx, [Building1x1TypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_Building1x1HighTypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, [Building1x1TypesExtCount]
    add  edx, [Building1x1TurretTypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0x005FEB96  ; offset short const OList12[]
    push 0x005FEAE8 ; offset short const List12[]
    push 0
    push BSIZE_12 ;1x2 building size
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
    push 0 ;AAGun, Primary weapon lateral offset along turret centerline
    push 0 ;AAGun, Primary weapon offset along turret centerline
    push 0 ;AAGun, Vertical offset
    push 2  ; REMAP_ALTERNATE
    push 0 
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    add  ebx, [Building1x1TypesExtCount]
    add  ebx, [Building1x1TurretTypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_Building1x1HighTurretTypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, [Building1x1TypesExtCount]
    add  edx, [Building1x1TurretTypesExtCount]
    add  edx, [Building1x1HighTypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0x005FEB96  ; offset short const OList12[]
    push 0x005FEAE8 ; offset short const List12[]
    push 0
    push BSIZE_12 ;1x2 building size
    push 0
    push 0
    push 1
    push 1
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
    push 0 ;AAGun, Primary weapon lateral offset along turret centerline
    push 0 ;AAGun, Primary weapon offset along turret centerline
    push 0 ;AAGun, Vertical offset
    push 2  ; REMAP_ALTERNATE
    push 0 
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    add  ebx, [Building1x1TypesExtCount]
    add  ebx, [Building1x1TurretTypesExtCount]
    add  ebx, [Building1x1HighTypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_Building2x2TurretTypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, [Building1x1TypesExtCount]
    add  edx, [Building1x1TurretTypesExtCount]
    add  edx, [Building1x1HighTypesExtCount]
    add  edx, [Building1x1HighTurretTypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0
    push 0x005FEAF6 ; offset short const List22[]
    push 0
    push BSIZE_22 ;2x2 building size
    push 0
    push 0
    push 1
    push 1
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
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    add  ebx, [Building1x1TypesExtCount]
    add  ebx, [Building1x1TurretTypesExtCount]
    add  ebx, [Building1x1HighTypesExtCount]
    add  ebx, [Building1x1HighTurretTypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_Building3x2TypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, [Building1x1TypesExtCount]
    add  edx, [Building1x1TurretTypesExtCount]
    add  edx, [Building1x1HighTypesExtCount]
    add  edx, [Building1x1HighTurretTypesExtCount]
    add  edx, [Building2x2TurretTypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0
    push 0x005FEB16 ; offset short const List32[]
    push 0
    push BSIZE_32 ;3x2 building size
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
    push 0    ;    originally: push    edx
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    add  ebx, [Building1x1TypesExtCount]
    add  ebx, [Building1x1TurretTypesExtCount]
    add  ebx, [Building1x1HighTypesExtCount]
    add  ebx, [Building1x1HighTurretTypesExtCount]
    add  ebx, [Building2x2TurretTypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_BuildingBARRTypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, [Building1x1TypesExtCount]
    add  edx, [Building1x1TurretTypesExtCount]
    add  edx, [Building1x1HighTypesExtCount]
    add  edx, [Building1x1HighTurretTypesExtCount]
    add  edx, [Building2x2TurretTypesExtCount]
    add  edx, [Building3x2TypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0
    push 0x005FEAF6 ; offset short const List22[]
    push 0x005FEA5C ; ExitPyle
    push BSIZE_22 ;2x2 building size
    push 0
    push 14 ; RTTI_INFANTRYTYPE
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
    push 0x01F50100    ; XYP_COORD(24,47) [TENT] in lepton is 256,501 (Pixel_To_Lepton)
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    add  ebx, [Building1x1TypesExtCount]
    add  ebx, [Building1x1TurretTypesExtCount]
    add  ebx, [Building1x1HighTypesExtCount]
    add  ebx, [Building1x1HighTurretTypesExtCount]
    add  ebx, [Building2x2TurretTypesExtCount]
    add  ebx, [Building3x2TypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_BuildingWEAPTypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, [Building1x1TypesExtCount]
    add  edx, [Building1x1TurretTypesExtCount]
    add  edx, [Building1x1HighTypesExtCount]
    add  edx, [Building1x1HighTurretTypesExtCount]
    add  edx, [Building2x2TurretTypesExtCount]
    add  edx, [Building3x2TypesExtCount]
    add  edx, [BuildingBARRTypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0x005FEB90 ; OListWeap[]
    push 0x005FEB30 ; offset short const ListWeap[]
    push 0x005FEA82 ; ExitWeap
    push BSIZE_32 ;3x2 building size
    push 0
    push 29 ; RTTI_UNITTYPE
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
    push 0x01800100    
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    add  ebx, [Building1x1TypesExtCount]
    add  ebx, [Building1x1TurretTypesExtCount]
    add  ebx, [Building1x1HighTypesExtCount]
    add  ebx, [Building1x1HighTurretTypesExtCount]
    add  ebx, [Building2x2TurretTypesExtCount]
    add  ebx, [Building3x2TypesExtCount]
    add  ebx, [BuildingBARRTypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_BuildingFACTTypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, [Building1x1TypesExtCount]
    add  edx, [Building1x1TurretTypesExtCount]
    add  edx, [Building1x1HighTypesExtCount]
    add  edx, [Building1x1HighTurretTypesExtCount]
    add  edx, [Building2x2TurretTypesExtCount]
    add  edx, [Building3x2TypesExtCount]
    add  edx, [BuildingBARRTypesExtCount]
    add  edx, [BuildingWEAPTypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0
    push 0x005FEB72 ; offset short const ListFactory[]
    push 0
    push BSIZE_33 ;3x3 building size
    push 0
    push 6 ; RTTI_BUILDINGTYPE
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
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    add  ebx, [Building1x1TypesExtCount]
    add  ebx, [Building1x1TurretTypesExtCount]
    add  ebx, [Building1x1HighTypesExtCount]
    add  ebx, [Building1x1HighTurretTypesExtCount]
    add  ebx, [Building2x2TurretTypesExtCount]
    add  ebx, [Building3x2TypesExtCount]
    add  ebx, [BuildingBARRTypesExtCount]
    add  ebx, [BuildingWEAPTypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

Init_BuildingFACT3x2TypeClass:

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
    mov  edx, [Building2x2TypesExtCount]
    add  edx, [Building1x1TypesExtCount]
    add  edx, [Building1x1TurretTypesExtCount]
    add  edx, [Building1x1HighTypesExtCount]
    add  edx, [Building1x1HighTurretTypesExtCount]
    add  edx, [Building2x2TurretTypesExtCount]
    add  edx, [Building3x2TypesExtCount]
    add  edx, [BuildingBARRTypesExtCount]
    add  edx, [BuildingWEAPTypesExtCount]
    add  edx, [BuildingFACTTypesExtCount]
    add  edx, ebx
    add  edx, OriginalBuildingTypeHeapCount ; BuildingType

    push 0
    push 0x005FEB16 ; offset short const List32[]
    push 0
    push BSIZE_32 ;3x3 building size
    push 0
    push 6 ; RTTI_BUILDINGTYPE
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
    add  ebx, 700 ; refer to new REDALERT.mix/local.mix/Conquer.eng
    add  ebx, [Building2x2TypesExtCount]
    add  ebx, [Building1x1TypesExtCount]
    add  ebx, [Building1x1TurretTypesExtCount]
    add  ebx, [Building1x1HighTypesExtCount]
    add  ebx, [Building1x1HighTurretTypesExtCount]
    add  ebx, [Building2x2TurretTypesExtCount]
    add  ebx, [Building3x2TypesExtCount]
    add  ebx, [BuildingBARRTypesExtCount]
    add  ebx, [BuildingWEAPTypesExtCount]
    add  ebx, [BuildingFACTTypesExtCount]
    mov  DWORD [0x005FE83C], 6
    push 0FFFFFFFFh
    call 0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
.Ret:
    retn

_BuildingTypeClass__Init_Heap_UnhardCode_BuildingTypes:

    Loop_Over_RULES_INI_Section_Entries str_BuildingTypes, Init_BuildingTypeClass
    Loop_Over_RULES_INI_Section_Entries str_Building1x1Types, Init_Building1x1TypeClass
    Loop_Over_RULES_INI_Section_Entries str_Building1x1TurretTypes, Init_Building1x1TurretTypeClass
    Loop_Over_RULES_INI_Section_Entries str_Building1x1HighTypes, Init_Building1x1HighTypeClass
    Loop_Over_RULES_INI_Section_Entries str_Building1x1HighTurretTypes, Init_Building1x1HighTurretTypeClass
    Loop_Over_RULES_INI_Section_Entries str_Building2x2TurretTypes, Init_Building2x2TurretTypeClass
    Loop_Over_RULES_INI_Section_Entries str_Building3x2Types, Init_Building3x2TypeClass
    Loop_Over_RULES_INI_Section_Entries str_BuildingBARRTypes, Init_BuildingBARRTypeClass
    Loop_Over_RULES_INI_Section_Entries str_BuildingWEAPTypes, Init_BuildingWEAPTypeClass
    Loop_Over_RULES_INI_Section_Entries str_BuildingFACTTypes, Init_BuildingFACTTypeClass
    Loop_Over_RULES_INI_Section_Entries str_BuildingFACT3x2Types, Init_BuildingFACT3x2TypeClass

.Ret:
    lea  esp, [ebp-14h]
    pop  edi
    pop  esi
    pop  edx
    jmp  0x004535A1

_Init_Game_Set_BuildingTypes_Heap_Count:
    Get_RULES_INI_Section_Entry_Count str_BuildingTypes
    mov  BYTE [Building2x2TypesExtCount], al
    mov  edx, eax
    Get_RULES_INI_Section_Entry_Count str_Building1x1Types
    mov  BYTE [Building1x1TypesExtCount], al
    add  edx, eax
    Get_RULES_INI_Section_Entry_Count str_Building1x1TurretTypes
    mov  BYTE [Building1x1TurretTypesExtCount], al
    add  edx, eax
    Get_RULES_INI_Section_Entry_Count str_Building1x1HighTypes
    mov  BYTE [Building1x1HighTypesExtCount], al
    add  edx, eax
    Get_RULES_INI_Section_Entry_Count str_Building1x1HighTurretTypes
    mov  BYTE [Building1x1HighTurretTypesExtCount], al
    add  edx, eax
    Get_RULES_INI_Section_Entry_Count str_Building2x2TurretTypes
    mov  BYTE [Building2x2TurretTypesExtCount], al
    add  edx, eax
    Get_RULES_INI_Section_Entry_Count str_Building3x2Types
    mov  BYTE [Building3x2TypesExtCount], al
    add  edx, eax
    Get_RULES_INI_Section_Entry_Count str_BuildingBARRTypes
    mov  BYTE [BuildingBARRTypesExtCount], al
    add  edx, eax
    Get_RULES_INI_Section_Entry_Count str_BuildingWEAPTypes
    mov  BYTE [BuildingWEAPTypesExtCount], al
    add  edx, eax
    Get_RULES_INI_Section_Entry_Count str_BuildingFACTTypes
    mov  BYTE [BuildingFACTTypesExtCount], al
    add  edx, eax
    Get_RULES_INI_Section_Entry_Count str_BuildingFACT3x2Types
    mov  BYTE [BuildingFACT3x2TypesExtCount], al
    add  edx, eax

    add  edx, OriginalBuildingTypeHeapCount
    mov  BYTE [NewBuildingTypeHeapCount], dl
    jmp  0x004F40AA

_BuildingTypeClass__From_Name_Unhardcode_BuildingTypes_Count:
    mov  al, [NewBuildingTypeHeapCount]

    cmp  dl, al
    jl   0x004537D8
    jmp  0x004537D1
