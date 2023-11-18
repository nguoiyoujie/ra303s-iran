;Read INI settings
@HOOK 0x004C750C _TFixedIHeapClass__fn_init_VesselTypes_Heap
@HOOK 0x004D1533 _TFixedIHeapClass__VesselTypeClass__Save_New_Size
@HOOK 0x004D1616 _TFixedIHeapClass__VesselTypeClass__Load_New_Size
@HOOK 0x004D1631 _TFixedIHeapClass__VesselTypeClass__Load_Clear_Memory

Buffer_VesselType           times 512 db 0 

;There is no Read_INI in VesselTypesClass; it moves straight to TechnoTypeClass. Therefore, we must hijack the location that calls it.
@HOOK 0x005374A2 _RulesClass_Objects_Replace_VesselTypes_Read_INI

;%define        TechnoTypeClass_Read_INI             0x00569914 ;defined in AircraftTypes

_TFixedIHeapClass__VesselTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,VesselTypeClass.NEW_SIZE,VesselTypeClass.ORIGINAL_SIZE
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D1636

_TFixedIHeapClass__fn_init_VesselTypes_Heap:
    mov  edx,VesselTypeClass.NEW_SIZE
    jmp  0x004C7511

_TFixedIHeapClass__VesselTypeClass__Load_New_Size:
    mov  ebx,VesselTypeClass.NEW_SIZE
    jmp  0x004D161B

_TFixedIHeapClass__VesselTypeClass__Save_New_Size:
    mov  ebx,VesselTypeClass.NEW_SIZE
    jmp  0x004D1538

_RulesClass_Objects_Replace_VesselTypes_Read_INI:
    mov  dword eax,[ecx+eax]
    mov  edx,ebx
    mov  dword edi,[eax+0x21]
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
    test  eax,eax ;check if TechnoTypeClass_Read_INI is successful, if not,skip all other reads
    jz    .Ret
    
.BeginRead:
    push esi
    push edi

	TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,VesselTypeClass.Offset.ExtendedPrerequisite)
	TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)

    VesselTypeClass.IsPieceOfEight.Read(esi,edi)             
    VesselTypeClass.HasSecondTurret.Read(esi,edi)             
    ;VesselTypeClass.Type.Read(esi,edi)                       
    VesselTypeClass.TurretOffset.Read(esi,edi)               
    ;VesselTypeClass.DefaultMission.Read(esi,edi)             
    ;VesselTypeClass.Explosion.Read(esi,edi)                  
    ;VesselTypeClass.MaxSize.Read(esi,edi)                    
    VesselTypeClass.TurretName.Read(esi,edi,_LoadTurretShapeFromString)
    VesselTypeClass.TurretName.Get(esi,eax)
    call _LoadTurretShapeFromString
    
    VesselTypeClass.TurretAdjustY.Read(esi,edi)             

    pop  edi
    pop  esi

.Ret:
    lea  esp,[ebp-0x18]
    Restore_Registers
    pop   ebp
    retn


_LoadTurretShapeFromString:
   ;create shape with string from eax
    push eax
    push ebx
    push ecx
    push edx 
    push esi 
    push edi 
    cmp  eax,0
    je   .Retn
    push 0x005E8EDE ; ".SHP"
    mov  ecx,eax
    lea  eax,[Buffer_VesselType]
    xor  ebx,ebx
    xor  edx,edx
    call 0x005B8BEE    ; _makepath
    lea  eax,[Buffer_VesselType]
    call 0x005B9330    ; MFCD::Retrieve
    ; move the result to TurretShape
    mov  edx,esi
    add  edx,VesselTypeClass.Offset.TurretShape
    mov  dword [edx], eax

.Retn:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    retn
