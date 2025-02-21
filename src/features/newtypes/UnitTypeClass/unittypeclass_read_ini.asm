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

cextern Houses.USignificantScan

;Read INI settings
@HACK 0x00578DCE,0x00578DD3,_UnitTypeClass__Read_INI_Extended
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
    UnitTypeClass.IsWaterBound.Read(esi,edi)
    UnitTypeClass.Anim_HasAPCDoor.Read(esi,edi)
    UnitTypeClass.UsePrimaryColor.Read(esi,edi)
    UnitTypeClass.IsStaticDisguise.Read(esi,edi)
    UnitTypeClass.IsChronoTank.Read(esi,edi)
    UnitTypeClass.IsOpenTopped.Read(esi,edi)
    ;UnitTypeClass.IsNoFireWhileMoving.Read(esi,edi) ; already read by INI

    UnitTypeClass.TurretOffset.Read(esi,edi)
    ;UnitTypeClass.DefaultMission.Read(esi,edi)
    UnitTypeClass.Explosion.Read(esi,edi,_GetAnimTypeFromString)
    ;UnitTypeClass.MaxSize.Read(esi,edi)

    UnitTypeClass.TurretAdjustX.Read(esi,edi)
    UnitTypeClass.TurretAdjustY.Read(esi,edi)
    UnitTypeClass.TurretFrameStart.Read(esi,edi)
    UnitTypeClass.TurretFrameCount.Read(esi,edi)

    UnitTypeClass.DeploysInto.Read(esi,edi,_GetBuildingTypeIDFromString)

    UnitTypeClass.AmmoReloadRate.Read(esi,edi)
    UnitTypeClass.AmmoReloadAmount.Read(esi,edi)
    UnitTypeClass.Response_Select.Read(esi,edi,_GetUnitResponseSelectFromString)
    UnitTypeClass.Response_Move.Read(esi,edi,_GetUnitResponseMoveFromString)
    UnitTypeClass.Response_Attack.Read(esi,edi,_GetUnitResponseAttackFromString)
    UnitTypeClass.Response_Harvest.Read(esi,edi,_GetUnitResponseHarvestFromString)
    UnitTypeClass.Response_Enter.Read(esi,edi,_GetUnitResponseEnterFromString)
    UnitTypeClass.Response_Deploy.Read(esi,edi,_GetUnitResponseDeployFromString)
    UnitTypeClass.AmmoImageCount.Read(esi,edi)  
    UnitTypeClass.AmmoTurretCount.Read(esi,edi)  

    UnitTypeClass.AIBuildLimit.Read(esi,edi)
    UnitTypeClass.AIBuildWeight.Read(esi,edi)
    UnitTypeClass.AIDeployBuildLimit.Read(esi,edi)

    ; set global significant flag-field. This will be used for Building Destroyed checks (to exclude Insignificant=yes buildings)
    push edx
    push ecx
    push ebx
    xor  edx,edx
    ObjectTypeClass.IsInsignificant.Get(esi,dl)
    mov  ebx,[esi+AbstractTypeClass.Offset.Index]
    mov  ecx,ebx
    shr  ebx,3
    and  ecx,7
    test dl,dl
    je   .SetSignificantScan
.ClearSignificantScan:
    mov  al,1
    shl  eax,cl
    add  al,1
    neg  al
    and  byte[Houses.USignificantScan+ebx],al
    jmp  .ExitSignificantScan
.SetSignificantScan:
    mov  al,1
    shl  eax,cl
    or   byte[Houses.USignificantScan+ebx],al
.ExitSignificantScan:
    pop  ebx
    pop  ecx
    pop  edx

    ; update Speed and MZone based on IsWaterBound
    push edx
    UnitTypeClass.IsWaterBound.Get(esi,dl)
    cmp  dl,1
    jne  .Continue ; Reading "Tracked" earlier had already set the Speed to the appropriate land-based speed type
    TechnoTypeClass.Speed.Set(esi,4) ; SPEED_FLOAT
    TechnoTypeClass.MZone.Set(esi,3) ; MZONE_WATER
.Continue:
    pop  edx

    pop  esi
.Ret:
    lea  esp,[ebp-0x10]
    pop  edi
    pop  esi
    jmp  0x00578DD3
@ENDHACK




_GetUnitResponseSelectFromString:
    GetVocArrayFromString esi+UnitTypeClass.Offset.Response_Select_Data,16
    retn

_GetUnitResponseMoveFromString:
    GetVocArrayFromString esi+UnitTypeClass.Offset.Response_Move_Data,16
    retn

_GetUnitResponseAttackFromString:
    GetVocArrayFromString esi+UnitTypeClass.Offset.Response_Attack_Data,16
    retn

_GetUnitResponseHarvestFromString:
    GetVocArrayFromString esi+UnitTypeClass.Offset.Response_Harvest_Data,16
    retn

_GetUnitResponseEnterFromString:
    GetVocArrayFromString esi+UnitTypeClass.Offset.Response_Enter_Data,16
    retn

_GetUnitResponseDeployFromString:
    GetVocArrayFromString esi+UnitTypeClass.Offset.Response_Deploy_Data,16
    retn
