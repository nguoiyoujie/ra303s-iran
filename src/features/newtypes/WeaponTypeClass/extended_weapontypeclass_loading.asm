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

;Read INI settings
@HACK 0x0059004D,0x00590052,_WeaponTypeClass__Read_INI_Extended
;========= start loading from INI ==============
    push esi
    WeaponTypeClass.ChargeSound.Read(esi,edi,_GetVocTypeFromString)
    WeaponTypeClass.IsLaser.Read(esi,edi)
    WeaponTypeClass.LaserColor.Read(esi,edi)
    WeaponTypeClass.DeployToFire.Read(esi,edi)
    WeaponTypeClass.AIOnly.Read(esi,edi)
    pop  esi
.Ret:
    lea  esp,[ebp-0x10]
    pop  edi
    pop  esi
    jmp  0x00590052
@ENDHACK

