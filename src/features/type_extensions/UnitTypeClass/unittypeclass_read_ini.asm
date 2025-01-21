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
    UnitTypeClass.IsWaterBound.Read(esi,edi)
    UnitTypeClass.Anim_HasAPCDoor.Read(esi,edi)
    UnitTypeClass.UsePrimaryColor.Read(esi,edi)
    ;UnitTypeClass.IsNoFireWhileMoving.Read(esi,edi) ; already read by INI

    ;UnitTypeClass.Type.Read(esi,edi)
    UnitTypeClass.TurretOffset.Read(esi,edi)
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
    ;in case the ID was invalid...
    test ebx,ebx
    jz   .Retn ; just return 0
    mov  ebx,dword [ebx+1]; index
	;ObjectTypeClass.ID ebx,ebx
    mov  eax,ebx
.Retn:
    pop ebx
    retn


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
