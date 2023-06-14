;Read INI settings
@HOOK 0x0059004D _WeaponTypeClass__Read_INI_Extended

_WeaponTypeClass__Read_INI_Extended:

;========= start loading from INI ==============
    push esi

    WeaponTypeClass.ChargeSound.Read(esi,edi,_GetVocTypeFromString)

    pop  esi
.Ret:
    lea  esp, [ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    pop  ebx
    pop  ebp
    jmp  0x00590055


_GetVocTypeFromString:
   ;create voc type with string from eax
    call 0x00425CA0    ; Voc_From_Name
    retn