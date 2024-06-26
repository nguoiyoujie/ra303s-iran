;----------------------------------------------------------------
; src/features/type_extensions/UnitTypeClass/unittypeclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

;Read INI settings
@HOOK 0x00578DCE _UnitTypeClass__Read_INI_Extended

_UnitTypeClass__Read_INI_Extended:

;========= start loading from INI ==============
    push esi

    TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,UnitTypeClass.Offset.ExtendedPrerequisite)
    TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)

    UnitTypeClass.IsCrateGoodie.Read(esi,edi)
    UnitTypeClass.Crusher.Read(esi,edi)
    UnitTypeClass.IsToHarvest.Read(esi,edi)
    UnitTypeClass.IsRotatingTurret.Read(esi,edi)
    UnitTypeClass.IsFireAnim.Read(esi,edi)
    UnitTypeClass.IsLockTurret.Read(esi,edi)
    UnitTypeClass.IsGigundo.Read(esi,edi)
    UnitTypeClass.IsAnimating.Read(esi,edi)
    UnitTypeClass.IsJammer.Read(esi,edi)
    UnitTypeClass.IsGapper.Read(esi,edi)
    UnitTypeClass.IsNoSmoke.Read(esi,edi)
    ;UnitTypeClass.IsNoFireWhileMoving.Read(esi,edi) ; already read by INI

    ;UnitTypeClass.Type.Read(esi,edi)
    ;UnitTypeClass.TurretOffset.Read(esi,edi)
    ;UnitTypeClass.DefaultMission.Read(esi,edi)
    ;UnitTypeClass.Explosion.Read(esi,edi)
    ;UnitTypeClass.MaxSize.Read(esi,edi)

    UnitTypeClass.TurretAdjustX.Read(esi,edi)
    UnitTypeClass.TurretAdjustY.Read(esi,edi)
    UnitTypeClass.TurretFrameStart.Read(esi,edi)
    UnitTypeClass.TurretFrameCount.Read(esi,edi)

    UnitTypeClass.DeploysInto.Read(esi,edi,_GetBuildingTypeIDFromString)

    UnitTypeClass.AmmoReloadRate.Read(esi,edi)
    UnitTypeClass.AmmoReloadAmount.Read(esi,edi)

    pop  esi
.Ret:
    lea  esp,[ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x00578DD4


_GetBuildingTypeIDFromString:
    ;select BuildingType by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
    BuildingTypeClass.FromID(eax,ebx)
    mov  ebx,dword [ebx+1]; index
	;ObjectTypeClass.ID ebx,ebx
    mov  eax,ebx
.Retn:
    pop ebx
    retn
