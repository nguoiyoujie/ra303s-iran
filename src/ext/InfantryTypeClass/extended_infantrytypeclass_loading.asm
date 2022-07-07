
;Read INI settings
@HOOK 0x004EB2D0 _InfantryTypeClass__Read_INI_Extended

%define        Offset_IsFemale                0x192
%define        Offset_IsCrawling              0x192
%define        Offset_IsCivilian              0x192
%define        Offset_PipType                 0x197
%define        Offset_FireFrame               0x19C
%define        Offset_ProneFireFrame          0x19D

str_IsFemale       db"IsFemale",0
str_IsCrawling     db"IsCrawling",0
str_IsCivilian     db"IsCivilian",0
str_PipType        db"PipType",0
str_FireFrame      db"FireFrame",0
str_ProneFireFrame db"ProneFireFrame",0

_InfantryTypeClass__Read_INI_Extended:
    push esi
    push edi
    mov esi, edi
    mov edi, RulesINI

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsFemale], 1
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsFemale, ecx
    Set_Bit_Byte [esi+Offset_IsFemale], 1, al

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsCrawling], 2
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsCrawling, ecx
    Set_Bit_Byte [esi+Offset_IsCrawling], 2, al

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsCivilian], 5
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsCivilian, ecx
    Set_Bit_Byte [esi+Offset_IsCivilian], 5, al

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  BYTE cl, [esi+Offset_PipType]
    call_INIClass__Get_Int edi, edx, str_PipType, ecx
    mov  BYTE  [esi+Offset_PipType], al

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  BYTE cl, [esi+Offset_FireFrame]
    call_INIClass__Get_Int edi, edx, str_FireFrame, ecx
    mov  BYTE  [esi+Offset_FireFrame], al

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  BYTE cl, [esi+Offset_ProneFireFrame]
    call_INIClass__Get_Int edi, edx, str_ProneFireFrame, ecx
    mov  BYTE  [esi+Offset_ProneFireFrame], al

    pop  edi
    pop  esi


.Ret:
    lea  esp, [ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x004EB2D6
