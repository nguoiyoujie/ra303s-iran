; Extended memory size of the class, with save and load support
;@HOOK 0x0056E298 _UnitTypeClass_operator_new_Hard_Code_New_Size
@HOOK 0x004C9685 _TFixedIHeapClass__UnitTypeClass__Constructor_New_Size
@HOOK 0x004D1333 _TFixedIHeapClass__UnitTypeClass__Save_New_Size
@HOOK 0x004D1416 _TFixedIHeapClass__UnitTypeClass__Load_New_Size
@HOOK 0x004D1431 _TFixedIHeapClass__UnitTypeClass__Load_Clear_Memory
@HOOK 0x004C74D2 _TFixedIHeapClass__fn_init_New_UnitTypes_Heap_Size

;Read INI settings
@HOOK 0x00578DCE _UnitTypeClass__Read_INI_Extended

%define        Old_UnitTypeClass_Size        0x19E
%define        New_UnitTypeClass_Size        0x240

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


    pop  esi
.Ret:
    lea  esp, [ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x00578DD4

_TFixedIHeapClass__UnitTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx, New_UnitTypeClass_Size, Old_UnitTypeClass_Size
.Ret:
    lea  edx, [ebp-0x14]
    mov  eax, ecx
    jmp  0x004D1436

_TFixedIHeapClass__fn_init_New_UnitTypes_Heap_Size:
    mov  edx, New_UnitTypeClass_Size
    jmp  0x004C74D7

_TFixedIHeapClass__UnitTypeClass__Load_New_Size:
    mov  ebx, New_UnitTypeClass_Size
    jmp  0x004D141B

_TFixedIHeapClass__UnitTypeClass__Save_New_Size:
    mov  ebx, New_UnitTypeClass_Size
    jmp  0x004D1338

_TFixedIHeapClass__UnitTypeClass__Constructor_New_Size:
    mov  edx, New_UnitTypeClass_Size
    jmp  0x004C968A
