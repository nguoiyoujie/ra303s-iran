; Note: IsFixedWing=yes is not fully functional, as there are several locations to decouple YAK/MIG checks and replace with IsFixedWing=yes
; // HouseClass::Is_No_YakMig
; // HouseClass::Is_Hack_Prevented
; // Reinf::_Need_To_Take

;Read INI settings
;There is no Read_INI in AircraftTypesClass; it moves straight to TechnoTypeClass. Therefore, we must hijack the location that calls it.
@HOOK 0x005374C5 _RulesClass_Objects_Replace_AircraftTypes_Read_INI

%define        TechnoTypeClass_Read_INI             0x00569914

%define        Offset_IsFixedWing             0x192
%define        Offset_IsLandable              0x192
%define        Offset_IsRotorEquipped         0x192
%define        Offset_IsRotorCustom           0x192
%define        Offset_PreferredStructure      0x198 ;BYTE ;hardcode to 0E (Helipad) or 10 (Airstrip) depending on IsFixedWing for now
%define        Offset_LandingSpeed            0x199 ;INT

str_IsFixedWing        db"IsFixedWing",0
str_IsLandable         db"IsLandable",0
str_IsRotorEquipped    db"IsRotorEquipped",0
str_IsRotorCustom      db"IsRotorCustom",0
str_LandingSpeed       db"LandingSpeed",0

_RulesClass_Objects_Replace_AircraftTypes_Read_INI:
    mov  DWORD eax,[esi+eax]
    mov  edx,ebx
    mov  DWORD edi,[eax+0x21]
    add  esi,4
    inc  ecx
    call AircraftTypes_Read_INI
    jmp 0x005374D4

    ;vessels
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

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsFixedWing], 1
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsFixedWing, ecx
    test al,al
    jnz  .SetPreferredStructure_Airstrip
.SetPreferredStructure_Helipad:
    mov  BYTE  [esi+Offset_PreferredStructure], 0x0E
    jmp .After_SetPreferredStructure
.SetPreferredStructure_Airstrip:
    mov  BYTE  [esi+Offset_PreferredStructure], 0x10
.After_SetPreferredStructure:
    Set_Bit_Byte [esi+Offset_IsFixedWing], 1, al

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsLandable], 2
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsLandable, ecx
    Set_Bit_Byte [esi+Offset_IsLandable], 2, al

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsRotorEquipped], 3
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsRotorEquipped, ecx
    Set_Bit_Byte [esi+Offset_IsRotorEquipped], 3, al

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsRotorCustom], 4
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsRotorCustom, ecx
    Set_Bit_Byte [esi+Offset_IsRotorCustom], 4, al

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  cx, [esi+Offset_LandingSpeed]
    call_INIClass__Get_Int edi, edx, str_LandingSpeed, ecx
    mov  [esi+Offset_LandingSpeed], ax

    pop  edi
    pop  esi

.Ret:
    lea  esp, [ebp-0x18]
    Restore_Registers
    pop   ebp
    retn
