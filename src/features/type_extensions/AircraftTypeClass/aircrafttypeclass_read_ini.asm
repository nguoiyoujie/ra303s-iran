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

;There is no Read_INI in AircraftTypesClass; it moves straight to TechnoTypeClass. Therefore, we must hijack the location that calls it.
@HOOK 0x005374C5 _RulesClass_Objects_Replace_AircraftTypes_Read_INI

%define        TechnoTypeClass_Read_INI             0x00569914 ;consider moving this to functions.asm

_RulesClass_Objects_Replace_AircraftTypes_Read_INI:
    mov  dword eax,[esi+eax]
    mov  edx,ebx
    mov  dword edi,[eax+0x21]
    add  esi,4
    inc  ecx
    call AircraftTypes_Read_INI
    jmp 0x005374D4

AircraftTypes_Read_INI:
    push  ebp
    mov   ebp,esp
    Save_Registers

    sub   esp,0x8
    mov   esi,eax
    mov   edi,edx
    call  TechnoTypeClass_Read_INI
    test  eax,eax ;check if TechnoTypeClass_Read_INI is successful,if not,skip all other reads
    jz    .Ret
    
.BeginRead:
    push esi
    push edi
    ;mov esi,edi
    ;mov edi,RulesINI

	TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,AircraftTypeClass.Offset.ExtendedPrerequisite)
	TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)

    ;AircraftTypeClass.IsFixedWing.Read(esi,edi)
    AircraftTypeClass.IsLandable.Read(esi,edi)
    AircraftTypeClass.IsRotorEquipped.Read(esi,edi)
    AircraftTypeClass.IsRotorCustom.Read(esi,edi)
    ;AircraftTypeClass.PreferredBuilding.Read(esi,edi)
    AircraftTypeClass.LandingSpeed.Read(esi,edi)
    AircraftTypeClass.Response_Select.Read(esi,edi,_GetAircraftResponseSelectFromString)
    AircraftTypeClass.Response_Move.Read(esi,edi,_GetAircraftResponseMoveFromString)
    AircraftTypeClass.Response_Attack.Read(esi,edi,_GetAircraftResponseAttackFromString)

    lea  edx,[esi+5]
    Get_Bit byte [esi+AircraftTypeClass.Offset.IsFixedWing],AircraftTypeClass.Bit.IsFixedWing
    xor  ecx,ecx
    mov  cl,al
    call_INIClass__Get_Bool edi,edx,str.AircraftTypeClass.IsFixedWing,ecx
    test al,al
    jnz  .SetPreferredBuilding_Airstrip
.SetPreferredBuilding_Helipad:
    mov  byte  [esi+AircraftTypeClass.Offset.PreferredBuilding],BuildingType.HPAD
    jmp .After_SetPreferredBuilding
.SetPreferredBuilding_Airstrip:
    mov  byte  [esi+AircraftTypeClass.Offset.PreferredBuilding],BuildingType.AFLD
.After_SetPreferredBuilding:
    Set_Bit_Byte [esi+AircraftTypeClass.Offset.IsFixedWing],AircraftTypeClass.Bit.IsFixedWing,al

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
