
;Read INI settings
@HOOK 0x004EB2D0 _InfantryTypeClass__Read_INI_Extended

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
