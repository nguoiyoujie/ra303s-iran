;----------------------------------------------------------------
; src/features/type_extensions/WeaponTypeClass/weapontypeclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------
cextern Audio___Voc_From_Name

;Read INI settings
@HACK 0x0059004D,0x00590052,_WeaponTypeClass__Read_INI_Extended
;========= start loading from INI ==============
    push esi
    WeaponTypeClass.ChargeSound.Read(esi,edi,_GetVocTypeFromString)
    WeaponTypeClass.DeployToFire.Read(esi,edi)
    pop  esi
.Ret:
    lea  esp,[ebp-0x10]
    pop  edi
    pop  esi
    jmp  0x00590052
@ENDHACK


[section .text]
_GetVocTypeFromString:
   ;create voc type with string from eax
    call Audio___Voc_From_Name    ; Voc_From_Name
    retn

