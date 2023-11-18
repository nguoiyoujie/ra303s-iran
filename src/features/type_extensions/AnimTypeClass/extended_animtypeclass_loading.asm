;Read INI settings
@HOOK 0x004C74A2 _TFixedIHeapClass__fn_init_AnimTypes_Heap
@HOOK 0x004D1143 _TFixedIHeapClass__AnimTypeClass__Save_New_Size
@HOOK 0x004D1225 _TFixedIHeapClass__AnimTypeClass__Load_New_Size
@HOOK 0x004D1240 _TFixedIHeapClass__AnimTypeClass__Load_Clear_Memory
@HOOK 0x004C9575 _TFixedIHeapClass__AnimTypeClass__Constructor_New_Size

;@HOOK ?0x00453FFB _BuildingTypeClass__Read_INI_Extended

_TFixedIHeapClass__AnimTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,AnimTypeClass.NEW_SIZE,AnimTypeClass.ORIGINAL_SIZE 
.Ret:
    mov  dword [esi+0x21],0x005F680C
    jmp  0x004D1247

_TFixedIHeapClass__fn_init_AnimTypes_Heap:
    mov  edx,AnimTypeClass.NEW_SIZE
    jmp  0x004C74A7

_TFixedIHeapClass__AnimTypeClass__Constructor_New_Size:
    mov  edx,AnimTypeClass.NEW_SIZE
    jmp  0x004C957A

_TFixedIHeapClass__AnimTypeClass__Load_New_Size:
    mov  ebx,AnimTypeClass.NEW_SIZE
    jmp  0x004D122A

_TFixedIHeapClass__AnimTypeClass__Save_New_Size:
    mov  ebx,AnimTypeClass.NEW_SIZE
    jmp  0x004D1148

;_BuildingTypeClass__Read_INI_Extended:
;    push esi
;    push edi
;    push eax
;
;    TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,BuildingTypeClass.Offset.ExtendedPrerequisite)
;    TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)
;
;    BuildingTypeClass.IsSimpleDamage.Read(esi,edi)
;    BuildingTypeClass.IsRegulated.Read(esi,edi)
;    BuildingTypeClass.IsJammable.Read(esi,edi)
;    BuildingTypeClass.IsRadar.Read(esi,edi)
;    BuildingTypeClass.FactoryType.Read(esi,edi,_SelectFactoryType)
;    BuildingTypeClass.ExitCoordX.Read(esi,edi)
;    BuildingTypeClass.ExitCoordY.Read(esi,edi)
;    BuildingTypeClass.ExitList.Read(esi,edi,_SelectExitList)
;    BuildingTypeClass.BSize.Read(esi,edi)
;    BuildingTypeClass.Anim_Construct_Start.Read(esi,edi)
;    BuildingTypeClass.Anim_Construct_Count.Read(esi,edi)
;    BuildingTypeClass.Anim_Construct_Rate.Read(esi,edi)
;    BuildingTypeClass.Anim_Idle_Start.Read(esi,edi)
;    BuildingTypeClass.Anim_Idle_Count.Read(esi,edi)
;    BuildingTypeClass.Anim_Idle_Rate.Read(esi,edi)
;    BuildingTypeClass.Anim_Active_Start.Read(esi,edi)
;    BuildingTypeClass.Anim_Active_Count.Read(esi,edi)
;    BuildingTypeClass.Anim_Active_Rate.Read(esi,edi)
;    BuildingTypeClass.Anim_Full_Start.Read(esi,edi)
;    BuildingTypeClass.Anim_Full_Count.Read(esi,edi)
;    BuildingTypeClass.Anim_Full_Rate.Read(esi,edi)
;    BuildingTypeClass.Anim_Aux1_Start.Read(esi,edi)
;    BuildingTypeClass.Anim_Aux1_Count.Read(esi,edi)
;    BuildingTypeClass.Anim_Aux1_Rate.Read(esi,edi)
;    BuildingTypeClass.Anim_Aux2_Start.Read(esi,edi)
;    BuildingTypeClass.Anim_Aux2_Count.Read(esi,edi)
;    BuildingTypeClass.Anim_Aux2_Rate.Read(esi,edi)
;    BuildingTypeClass.OccupyList.Read(esi,edi,_SelectOccupyList)
;    BuildingTypeClass.OverlapList.Read(esi,edi,_SelectOccupyList)
;    BuildingTypeClass.SpecialWeapons.Read(esi,edi,_GetSpecialsFromString)
;    BuildingTypeClass.WarFactoryOverlayAnim.Read(esi,edi,_GetOverlayFromString)
;    BuildingTypeClass.WarFactoryOverlayFrames.Read(esi,edi)
;    BuildingTypeClass.WarFactoryOverlayRate.Read(esi,edi)
;    BuildingTypeClass.WarFactoryExitFacing.Read(esi,edi)
;    BuildingTypeClass.WarFactoryExitTrack.Read(esi,edi)
;    BuildingTypeClass.CustomFoundationList.Read(esi,edi,_CustomOccupyListFromString)
;    BuildingTypeClass.UndeploysInto.Read(esi,edi,_GetUnitTypeIDFromString)
;
;    pop  eax
;    pop  edi
;    pop  esi
;
;.Ret:
;    lea  esp,[ebp-10h]
;    pop  edi
;    pop  esi
;    pop  ecx
;    jmp  0x00454001
;