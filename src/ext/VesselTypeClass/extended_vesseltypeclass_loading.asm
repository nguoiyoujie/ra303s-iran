;Read INI settings
@HOOK 0x004C750C _TFixedIHeapClass__fn_init_New_VesselTypes_Heap_Size
@HOOK 0x004D1533 _TFixedIHeapClass__VesselTypeClass__Save_New_Size
@HOOK 0x004D1616 _TFixedIHeapClass__VesselTypeClass__Load_New_Size
@HOOK 0x004D1631 _TFixedIHeapClass__VesselTypeClass__Load_Clear_Memory

%define        Old_VesselTypeClass_Size        0x19E
%define        New_VesselTypeClass_Size        0x240

;There is no Read_INI in VesselTypesClass; it moves straight to TechnoTypeClass. Therefore, we must hijack the location that calls it.
@HOOK 0x005374A2 _RulesClass_Objects_Replace_VesselTypes_Read_INI

;%define        TechnoTypeClass_Read_INI             0x00569914 ;defined in AircraftTypes

_TFixedIHeapClass__VesselTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx, New_VesselTypeClass_Size, Old_VesselTypeClass_Size
.Ret:
    lea  edx, [ebp-0x14]
    mov  eax, ecx
    jmp  0x004D1636

_TFixedIHeapClass__fn_init_New_VesselTypes_Heap_Size:
    mov  edx, New_VesselTypeClass_Size
    jmp  0x004C7511

_TFixedIHeapClass__VesselTypeClass__Load_New_Size:
    mov  ebx, New_VesselTypeClass_Size
    jmp  0x004D161B

_TFixedIHeapClass__VesselTypeClass__Save_New_Size:
    mov  ebx, New_VesselTypeClass_Size
    jmp  0x004D1538

_RulesClass_Objects_Replace_VesselTypes_Read_INI:
    mov  DWORD eax,[ecx+eax]
    mov  edx,ebx
    mov  DWORD edi,[eax+0x21]
    add  ecx,4
    inc  esi
    call VesselTypes_Read_INI
    jmp  0x005374B1

VesselTypes_Read_INI:
    push  ebp
    mov   ebp,esp
    Save_Registers

    sub   esp,0x8
    mov   esi,eax
    mov   edi,edx
    call  TechnoTypeClass_Read_INI
    test  eax,eax ;check if TechnoTypeClass_Read_INI is successful, if not, skip all other reads
    jz    .Ret
    
.BeginRead:
    push esi
    push edi

	TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,VesselTypeClass.Offset.ExtendedPrerequisite)
	TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)

    VesselTypeClass.IsPieceOfEight.Read(esi,edi)             
    ;VesselTypeClass.Type.Read(esi,edi)                       
    VesselTypeClass.TurretOffset.Read(esi,edi)               
    ;VesselTypeClass.DefaultMission.Read(esi,edi)             
    ;VesselTypeClass.Explosion.Read(esi,edi)                  
    ;VesselTypeClass.MaxSize.Read(esi,edi)                    

    pop  edi
    pop  esi

.Ret:
    lea  esp, [ebp-0x18]
    Restore_Registers
    pop   ebp
    retn
