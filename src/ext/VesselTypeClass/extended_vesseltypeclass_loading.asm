;Read INI settings
;There is no Read_INI in VesselTypesClass; it moves straight to TechnoTypeClass. Therefore, we must hijack the location that calls it.
@HOOK 0x005374A2 _RulesClass_Objects_Replace_VesselTypes_Read_INI

;%define        TechnoTypeClass_Read_INI             0x00569914 ;defined in AircraftTypes

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
    ;mov esi, edi
    ;mov edi, RulesINI

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
