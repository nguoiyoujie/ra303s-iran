; Note: IsFixedWing=yes is not fully functional, as there are several locations to decouple YAK/MIG checks and replace with IsFixedWing=yes
; // HouseClass::Is_No_YakMig
; // HouseClass::Is_Hack_Prevented
; // Reinf::_Need_To_Take

;Read INI settings
;There is no Read_INI in AircraftTypesClass; it moves straight to TechnoTypeClass. Therefore, we must hijack the location that calls it.
@HOOK 0x005374C5 _RulesClass_Objects_Replace_AircraftTypes_Read_INI
@HOOK 0x004DE09E _HouseClass_Is_No_YakMig_UseFixedWing
@HOOK 0x004DE15C _HouseClass_Is_Hack_Prevented_UseFixedWing

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


_HouseClass_Is_No_YakMig_UseFixedWing:
    xor  edi, edi ;begin from ID 0
    xor  ebx, ebx 
	xor  ecx, ecx
    mov  dword [AircraftFixedWingSelectableCount], 0 ;initial count 0

.Check:
    cmp  edi, [NewAircraftTypeHeapCount]
    jge  .Done
.Loop:
    push eax
    push edi
    AircraftTypeClass.FromIndex(edi, ebx)
    AircraftTypeClass.IsFixedWing.Get(ebx, cl) ; check if aircraft is fixed wing
    pop  edi
    pop  eax
    test cl, cl
    jz   .NoAddCount
    push eax
    ObjectTypeClass.IsSelectable.Get(ebx, cl) ; exclude unselectable aircrafts such as the spy plane and badger bomber, as those do not return to the airfield
    pop  eax
    test cl, cl
    jz   .NoAddCount
.AddCount:
    ; AQuantity[<aircraftTypeID>] = eax + 0x4ee + 4 * <aircraftTypeID>
    mov  edx, edi
    shl  edx, 2
    add  edx, 0x4ee
    add  edx, eax
    mov  ebx, dword [AircraftFixedWingSelectableCount]
    add  ebx, dword [edx]
    mov  dword [AircraftFixedWingSelectableCount], ebx
.NoAddCount:
    inc  edi
	jmp  .Check
.Done:
    mov  ecx, dword [AircraftFixedWingSelectableCount]
    mov  ebx, eax
    jmp  0x004DE0AC



_HouseClass_Is_Hack_Prevented_UseFixedWing:
    push eax
    push ecx
    push edx
    push esi
    push ebx
    AircraftTypeClass.FromIndex(ebx, ecx)
	pop  ebx
    AircraftTypeClass.IsFixedWing.Get(ecx, dl) ; check if aircraft is fixed wing
    test dl, dl
    jz   .NoHack
    ObjectTypeClass.IsSelectable.Get(ecx, dl) ; exclude unselectable aircrafts such as the spy plane and badger bomber, as those do not return to the airfield
    test dl, dl
    jnz  .ApplyHack
.NoHack:
    pop  esi
    pop  edx
    pop  ecx
    pop  eax
    jmp  0x004DE16F
.ApplyHack:
    pop  esi
    pop  edx
    pop  ecx
    pop  eax
    call 0x004DE094 ;HouseClass::Is_No_YakMig
    jmp  0x004DE16B