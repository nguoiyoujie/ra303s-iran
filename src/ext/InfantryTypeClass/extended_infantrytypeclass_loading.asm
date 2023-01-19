
;Read INI settings
@HOOK 0x004C7445 _TFixedIHeapClass__fn_init_New_InfantryTypes_Heap_Size
@HOOK 0x004D0D53 _TFixedIHeapClass__InfantryTypeClass__Save_New_Size
@HOOK 0x004D0E36 _TFixedIHeapClass__InfantryTypeClass__Load_New_Size
@HOOK 0x004D0E51 _TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory
@HOOK 0x004EB2D0 _InfantryTypeClass__Read_INI_Extended

%define        Old_InfantryTypeClass_Size        0x1A2
%define        New_InfantryTypeClass_Size        0x240

_TFixedIHeapClass__InfantryTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx, New_InfantryTypeClass_Size, Old_InfantryTypeClass_Size
.Ret:
    lea  edx, [ebp-0x14]
    mov  eax, ecx
    jmp  0x004D0E56

_TFixedIHeapClass__fn_init_New_InfantryTypes_Heap_Size:
    mov  edx, New_InfantryTypeClass_Size
    jmp  0x004C744A

_TFixedIHeapClass__InfantryTypeClass__Load_New_Size:
    mov  ebx, New_InfantryTypeClass_Size
    jmp  0x004D0E3B

_TFixedIHeapClass__InfantryTypeClass__Save_New_Size:
    mov  ebx, New_InfantryTypeClass_Size
    jmp  0x004D0D58

_TFixedIHeapClass__InfantryTypeClass__Constructor_New_Size:
    mov  edx, New_InfantryTypeClass_Size
    jmp  0x004C968A


_InfantryTypeClass__Read_INI_Extended:
    push esi
    push edi
    mov esi, edi
    mov edi, [esp+0xC] ;RulesINI

    InfantryTypeClass.IsFemale.Read(esi,edi)
    InfantryTypeClass.IsCrawling.Read(esi,edi)
    InfantryTypeClass.IsCivilian.Read(esi,edi)
    InfantryTypeClass.Pip.Read(esi,edi)
    InfantryTypeClass.FireFrame.Read(esi,edi)
    InfantryTypeClass.ProneFireFrame.Read(esi,edi)

    pop  edi
    pop  esi


.Ret:
    lea  esp, [ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x004EB2D6
