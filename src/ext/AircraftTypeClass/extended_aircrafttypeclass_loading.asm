; Note: IsFixedWing=yes is not fully functional, as there are several locations to decouple YAK/MIG checks and replace with IsFixedWing=yes
; // HouseClass::Is_No_YakMig
; // HouseClass::Is_Hack_Prevented
; // Reinf::_Need_To_Take

;Read INI settings
;There is no Read_INI in AircraftTypesClass; it moves straight to TechnoTypeClass. Therefore, we must hijack the location that calls it.
@HOOK 0x005374C5 _RulesClass_Objects_Replace_AircraftTypes_Read_INI

%define        TechnoTypeClass_Read_INI             0x00569914

AircraftFixedWingSelectableCount                    dd    0

_RulesClass_Objects_Replace_AircraftTypes_Read_INI:
    mov  DWORD eax,[esi+eax]
    mov  edx,ebx
    mov  DWORD edi,[eax+0x21]
    add  esi,4
    inc  ecx
    call AircraftTypes_Read_INI
    jmp 0x005374D4

    ;note: we are going to do the same override for vessels
    ;mov  DWORD eax, 0x0065DF44
    ;jmp 0x005374B6 ;vessels

AircraftTypes_Read_INI:
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

    ;AircraftTypeClass.IsFixedWing.Read(esi,edi)
    AircraftTypeClass.IsLandable.Read(esi,edi)
    AircraftTypeClass.IsRotorEquipped.Read(esi,edi)
    AircraftTypeClass.IsRotorCustom.Read(esi,edi)
    ;AircraftTypeClass.PreferredBuilding.Read(esi,edi)
    AircraftTypeClass.LandingSpeed.Read(esi,edi)

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+AircraftTypeClass.Offset.IsFixedWing], AircraftTypeClass.Bit.IsFixedWing
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str.AircraftTypeClass.IsFixedWing, ecx
    test al,al
    jnz  .SetPreferredBuilding_Airstrip
.SetPreferredBuilding_Helipad:
    mov  BYTE  [esi+AircraftTypeClass.Offset.PreferredBuilding], 0x0E ; helipad
    jmp .After_SetPreferredBuilding
.SetPreferredBuilding_Airstrip:
    mov  BYTE  [esi+AircraftTypeClass.Offset.PreferredBuilding], 0x10 ; airstrip
.After_SetPreferredBuilding:
    Set_Bit_Byte [esi+AircraftTypeClass.Offset.IsFixedWing], AircraftTypeClass.Bit.IsFixedWing, al


    pop  edi
    pop  esi

.Ret:
    lea  esp, [ebp-0x18]
    Restore_Registers
    pop  ebp
    retn