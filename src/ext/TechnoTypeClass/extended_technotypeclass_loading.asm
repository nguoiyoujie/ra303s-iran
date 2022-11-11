; Expose other technotype fields that already exist
;Read INI settings
@HOOK 0x00569E1F _TechnoTypeClass__Read_INI_Extended

_TechnoTypeClass__Read_INI_Extended:
;========= start loading from INI ==============
    push esi
    push edi
    mov edi, RulesINI

    ;TechnoTypeClass.IsScanner.Read(esi,edi) ;already existing
    TechnoTypeClass.IsNominal.Read(esi,edi)
    TechnoTypeClass.IsTheater.Read(esi,edi)
    TechnoTypeClass.HasTurret.Read(esi,edi)
    TechnoTypeClass.Facings.Read(esi,edi)
    TechnoTypeClass.VerticalOffset.Read(esi,edi)
    TechnoTypeClass.PrimaryOffset.Read(esi,edi)
    TechnoTypeClass.PrimaryLateral.Read(esi,edi)
    TechnoTypeClass.SecondaryOffset.Read(esi,edi)
    TechnoTypeClass.SecondaryLateral.Read(esi,edi)

    pop  edi
    pop  esi
 
.Ret:
    mov  eax, 1 ;return 1
    lea  esp, [ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x00569E2A

