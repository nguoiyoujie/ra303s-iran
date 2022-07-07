; Expose other technotype fields that already exist
;Read INI settings
@HOOK 0x00569E1F _TechnoTypeClass__Read_INI_Extended

%define        Offset_IsScanner               0x139    
%define        Offset_IsTheater               0x139    
%define        Offset_IsTurretEquipped        0x139    
%define        Offset_RotationFrames          0x16A    ; Rotation. Special effect for vehicles when set to 8
%define        Offset_VerticalOffset          0x17A    
%define        Offset_PrimaryOffset           0x17E    
%define        Offset_PrimaryLateral          0x182    
%define        Offset_SecondaryOffset         0x186    
%define        Offset_SecondaryLateral        0x18A    

str_IsScanner db"IsScanner",0
str_IsTheater db"IsTheater",0
str_IsTurretEquipped db"HasTurret",0
str_RotationFrames   db"RotationFrames",0
str_VerticalOffset   db"VerticalOffset",0
str_PrimaryOffset    db"PrimaryOffset",0
str_PrimaryLateral   db"PrimaryLateral",0
str_SecondaryOffset  db"SecondaryOffset",0
str_SecondaryLateral db"SecondaryLateral",0

_TechnoTypeClass__Read_INI_Extended:
;========= start loading from INI ==============
    push esi
    push edi
    mov edi, RulesINI

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsScanner], 4
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsScanner, ecx
    Set_Bit_Byte [esi+Offset_IsScanner], 4, al

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsTheater], 6
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsTheater, ecx
    Set_Bit_Byte [esi+Offset_IsTheater], 6, al

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsTurretEquipped], 7
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsTurretEquipped, ecx
    Set_Bit_Byte [esi+Offset_IsTurretEquipped], 7, al

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  BYTE cl, [esi+Offset_RotationFrames]
    call_INIClass__Get_Int edi, edx, str_RotationFrames, ecx
    mov  BYTE  [esi+Offset_RotationFrames], al

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_VerticalOffset]
    call_INIClass__Get_Int edi, edx, str_VerticalOffset, ecx
    mov  [esi+Offset_VerticalOffset], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_PrimaryOffset]
    call_INIClass__Get_Int edi, edx, str_PrimaryOffset, ecx
    mov  [esi+Offset_PrimaryOffset], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_PrimaryLateral]
    call_INIClass__Get_Int edi, edx, str_PrimaryLateral, ecx
    mov  [esi+Offset_PrimaryLateral], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_SecondaryOffset]
    call_INIClass__Get_Int edi, edx, str_SecondaryOffset, ecx
    mov  [esi+Offset_SecondaryOffset], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_SecondaryLateral]
    call_INIClass__Get_Int edi, edx, str_SecondaryLateral, ecx
    mov  [esi+Offset_SecondaryLateral], eax

    pop  edi
    pop  esi
 
.Ret:
    mov  eax, 1 ;return 1
    lea  esp, [ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x00569E2A

