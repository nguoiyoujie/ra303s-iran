;----------------------------------------------------------------
; src/features/type_extensions/VesselTypeClass/vesseltypeclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

;There is no Read_INI in VesselTypesClass; it moves straight to TechnoTypeClass. Therefore, we must hijack the location that calls it.

cextern MFCD__Retrieve
cextern TechnoTypeClass__Read_INI
cextern Houses.VSignificantScan


[section .data] 
Buffer_VesselType           times 512 db 0 


@HACK 0x005374A2,0x005374B1,_RulesClass_Objects_Replace_VesselTypes_Read_INI
    mov  dword eax,[ecx+eax]
    mov  edx,ebx
    mov  dword edi,[eax+0x21]
    add  ecx,4
    inc  esi
    call VesselTypes_Read_INI
    jmp  0x005374B1
@ENDHACK


[section .text] 
VesselTypes_Read_INI:
    push  ebp
    mov   ebp,esp
    Save_Registers

    sub   esp,0x8
    mov   esi,eax
    mov   edi,edx
    call  TechnoTypeClass__Read_INI
    test  eax,eax ;check if TechnoTypeClass__Read_INI is successful, if not,skip all other reads
    jz    .Ret
    
.BeginRead:
    push esi
    push edi

	TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,VesselTypeClass.Offset.ExtendedPrerequisite)
	TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)

    VesselTypeClass.IsPieceOfEight.Read(esi,edi)             
    VesselTypeClass.HasSecondTurret.Read(esi,edi)
    VesselTypeClass.IsOpenTopped.Read(esi,edi)
    VesselTypeClass.ManualAcquire.Read(esi,edi)
    VesselTypeClass.ToProtectWithSpecials.Read(esi,edi)
    VesselTypeClass.ToTeleportWithSpecials.Read(esi,edi)
    VesselTypeClass.IsImmuneToTimeWarp.Read(esi,edi)
    ;VesselTypeClass.Type.Read(esi,edi)                       
    VesselTypeClass.TurretOffset.Read(esi,edi)               
    VesselTypeClass.TurretFireOffset.Read(esi,edi)               
    ;VesselTypeClass.DefaultMission.Read(esi,edi)             
    ;VesselTypeClass.Explosion.Read(esi,edi)                  
    ;VesselTypeClass.MaxSize.Read(esi,edi)                    
    VesselTypeClass.TurretName.Read(esi,edi,_LoadTurretShapeFromString)

    VesselTypeClass.TurretName.Get(esi,eax)
    call _LoadTurretShapeFromString
    
    VesselTypeClass.TurretAdjustY.Read(esi,edi)    

    VesselTypeClass.AmmoReloadRate.Read(esi,edi)
    VesselTypeClass.AmmoReloadAmount.Read(esi,edi)
    VesselTypeClass.Response_Select.Read(esi,edi,_GetVesselResponseSelectFromString)
    VesselTypeClass.Response_Move.Read(esi,edi,_GetVesselResponseMoveFromString)
    VesselTypeClass.Response_Attack.Read(esi,edi,_GetVesselResponseAttackFromString)         
    VesselTypeClass.Response_Harvest.Read(esi,edi,_GetVesselResponseHarvestFromString)
    VesselTypeClass.Response_Enter.Read(esi,edi,_GetVesselResponseEnterFromString)
    VesselTypeClass.Response_Deploy.Read(esi,edi,_GetVesselResponseDeployFromString)
    VesselTypeClass.CloakSound.Read(esi,edi,_GetVocTypeFromString)

    ; set global significant flag-field. This will be used for Building Destroyed checks (to exclude Insignificant=yes buildings)
    push edx
    push ecx
    push ebx
    xor  edx,edx
    ObjectTypeClass.IsInsignificant.Get(esi,dl)
    mov  ebx,[esi+AbstractTypeClass.Offset.Index]
    mov  ecx,ebx
    shr  ebx,3
    and  ecx,7
    test dl,dl
    je   .SetSignificantScan
.ClearSignificantScan:
    mov  al,1
    shl  eax,cl
    add  al,1
    neg  al
    and  byte[Houses.VSignificantScan+ebx],al
    jmp  .ExitSignificantScan
.SetSignificantScan:
    mov  al,1
    shl  eax,cl
    or   byte[Houses.VSignificantScan+ebx],al
.ExitSignificantScan:
    pop  ebx
    pop  ecx
    pop  edx
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
    test eax,eax
    jz   .Retn
    push 0x005E8EDE ; ".SHP"
    mov  ecx,eax
    lea  eax,[Buffer_VesselType]
    xor  ebx,ebx
    xor  edx,edx
    call 0x005B8BEE    ; _makepath
    lea  eax,[Buffer_VesselType]
    call MFCD__Retrieve
    ; move the result to TurretShape
    mov  edx,esi
    add  edx,VesselTypeClass.Offset.TurretShape
    mov  dword[edx],eax

.Retn:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    retn


_GetVesselResponseSelectFromString:
    GetVocArrayFromString esi+VesselTypeClass.Offset.Response_Select_Data,16
    retn

_GetVesselResponseMoveFromString:
    GetVocArrayFromString esi+VesselTypeClass.Offset.Response_Move_Data,16
    retn

_GetVesselResponseAttackFromString:
    GetVocArrayFromString esi+VesselTypeClass.Offset.Response_Attack_Data,16
    retn

_GetVesselResponseHarvestFromString:
    GetVocArrayFromString esi+VesselTypeClass.Offset.Response_Harvest_Data,16
    retn

_GetVesselResponseEnterFromString:
    GetVocArrayFromString esi+VesselTypeClass.Offset.Response_Enter_Data,16
    retn

_GetVesselResponseDeployFromString:
    GetVocArrayFromString esi+VesselTypeClass.Offset.Response_Deploy_Data,16
    retn
