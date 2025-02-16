;----------------------------------------------------------------
; src/features/type_extensions/AircraftTypeClass/aircrafttypeclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

cextern TechnoTypeClass__Read_INI
cextern Houses.ASignificantScan

;There is no Read_INI in AircraftTypesClass; it moves straight to TechnoTypeClass. Therefore, we must hijack the location that calls it.
@HACK 0x005374C5,0x005374D4,_RulesClass_Objects_Replace_AircraftTypes_Read_INI
    mov  dword eax,[esi+eax]
    mov  edx,ebx
    mov  dword edi,[eax+0x21]
    add  esi,4
    inc  ecx
    call AircraftTypes_Read_INI
    jmp 0x005374D4
@ENDHACK


[section .text]
AircraftTypes_Read_INI:
    push  ebp
    mov   ebp,esp
    Save_Registers

    sub   esp,0x8
    mov   esi,eax
    mov   edi,edx
    call  TechnoTypeClass__Read_INI
    test  eax,eax ;check if TechnoTypeClass__Read_INI is successful,if not,skip all other reads
    jz    .Ret
    
.BeginRead:
    push esi
    push edi
    ;mov esi,edi
    ;mov edi,RulesINI

	TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,AircraftTypeClass.Offset.ExtendedPrerequisite)
	TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)

    AircraftTypeClass.IsFixedWing.Read(esi,edi)
    AircraftTypeClass.IsLandable.Read(esi,edi)
    AircraftTypeClass.IsRotorEquipped.Read(esi,edi)
    AircraftTypeClass.IsRotorCustom.Read(esi,edi)
    AircraftTypeClass.IsGigundo.Read(esi,edi)
    AircraftTypeClass.SeekerGuard.Read(esi,edi)
    ;AircraftTypeClass.PreferredBuilding.Read(esi,edi)
    AircraftTypeClass.LandingSpeed.Read(esi,edi)
    AircraftTypeClass.Response_Select.Read(esi,edi,_GetAircraftResponseSelectFromString)
    AircraftTypeClass.Response_Move.Read(esi,edi,_GetAircraftResponseMoveFromString)
    AircraftTypeClass.Response_Attack.Read(esi,edi,_GetAircraftResponseAttackFromString)

;    lea  edx,[esi+5]
;    GetBit byte[esi+AircraftTypeClass.Offset.IsFixedWing],AircraftTypeClass.Bit.IsFixedWing
;    xor  ecx,ecx
;    mov  cl,al
;    call_INIClass__Get_Bool edi,edx,str.AircraftTypeClass.IsFixedWing,ecx
;    test al,al
;    jnz  .SetPreferredBuilding_Airstrip
;.SetPreferredBuilding_Helipad:
;    mov  byte  [esi+AircraftTypeClass.Offset.PreferredBuilding],BuildingType.HPAD
;    jmp .After_SetPreferredBuilding
;.SetPreferredBuilding_Airstrip:
;    mov  byte  [esi+AircraftTypeClass.Offset.PreferredBuilding],BuildingType.AFLD
;.After_SetPreferredBuilding:
;    SetBit[esi+AircraftTypeClass.Offset.IsFixedWing],AircraftTypeClass.Bit.IsFixedWing,al

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
    and  byte[Houses.ASignificantScan+ebx],al
    jmp  .ExitSignificantScan
.SetSignificantScan:
    mov  al,1
    shl  eax,cl
    or   byte[Houses.ASignificantScan+ebx],al
.ExitSignificantScan:
    pop  ebx
    pop  ecx
    pop  edx

    pop  edi
    pop  esi

.Ret:
    lea  esp,[ebp-0x18]
    Restore_Registers
    pop  ebp
    retn


_GetAircraftResponseSelectFromString:
    GetVocArrayFromString esi+AircraftTypeClass.Offset.Response_Select_Data,16
    retn

_GetAircraftResponseMoveFromString:
    GetVocArrayFromString esi+AircraftTypeClass.Offset.Response_Move_Data,16
    retn

_GetAircraftResponseAttackFromString:
    GetVocArrayFromString esi+AircraftTypeClass.Offset.Response_Attack_Data,16
    retn
