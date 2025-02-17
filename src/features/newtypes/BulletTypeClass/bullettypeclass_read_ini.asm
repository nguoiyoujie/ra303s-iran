;----------------------------------------------------------------
; src/features/type_extensions/BulletTypeClass/bullettypeclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

;Read INI settings
@HACK 0x0042717D,0x00427182,_BulletTypeClass__Read_INI_Extended
    push esi
    mov  esi,[ebp-0x14]
    BulletTypeClass.TrailAnim.Read(esi,edi,_GetAnimTypeFromString)
    pop  esi
.Ret:
    lea  esp,[ebp-0x10]
    pop  edi
    pop  esi
    jmp  0x00427182
@ENDHACK

