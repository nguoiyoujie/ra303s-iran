;----------------------------------------------------------------
; src/features/ai_building.asm
;
; If House AI has both BaseBuilding and AutoBuilding enabled, BaseBuilding takes precedence over AutoBase calculations
; 
; Extends House AI with the following features
; - Building production obey Can_Build() checks
; - BuildingTypes use AIBuildType and AIBuildLimit to organize its build priority
; - AI will consider training new infantry listed in Teams
;
; Also increases room in AI base by forcing the AI to check a 3x3 clearing for a 1x1 building.
;
; This function is enabled by adding [AI] UseNewBuildingAI=yes (for House build choices) 
;                                 or [AI] ForceSingleTileClearing=yes (for 3x3 tile checking for 1x1 building)
; The BaseBuilding taking priority over AutoBase is enabled by default and not adjustable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

cextern FixedIHeapClass__Allocate
cextern HouseClass__Find_Building
cextern HouseClass__As_Pointer
cextern HouseClass__Can_Build
cextern BuildingTypeClass__As_Reference
cextern TechnoTypeClass__Legal_Placement
cextern RandomClass_Random
cextern Globals___NonCriticalRandomNumber
cextern Globals___Map
cextern Map__RadiusOffset
cextern Map__RadiusCount
cextern MapClass__In_Radar
cextern HouseClass__Which_Zone
cextern Globals___Houses
cextern Globals___HouseTypes
cextern DisplayClass__Passes_Proximity_Check


cextern Rules.AI.PowerExcess
cextern Rules.AI.PowerEmergencyMinimum
cextern Rules.AI.UseNewBuildingAI
cextern Rules.AI.ForceSingleTileClearing
cextern Rules.AI.BuildingReserve


%define UrgencyType.NONE                       0
%define UrgencyType.LOW                        1
%define UrgencyType.NORMAL                     2
%define UrgencyType.HIGH                       3
%define UrgencyType.CRITICAL                   4

[section .data] 
Temp.AIBuilding.Array            times 256 db 0 ; we will not have more than 256 BuildingTypes
Temp.AIBuilding.Count            db 0
Temp.AIBuilding.AirThreat        dd 0
Temp.FindCell.BuildingIsSingleCell db 0


@HACK 0x004D9D3D,0x004D9D43,_HouseClass__Check_Lower_Power__Override
    cmp  dword[Rules.AI.PowerExcess],-1
    jle  .OrginalCode
.Override:
    add  edx,dword[Rules.AI.PowerExcess]
    jmp  0x004D9D43
.OrginalCode:
    add  edx,0x12C ; 300
    jmp  0x004D9D43
@ENDHACK


@HACK 0x004D9D90,0x004D9D95,_HouseClass__Check_Raise_Power__Override
    cmp  dword[Rules.AI.PowerEmergencyMinimum],-1
    jle  .OrginalCode
.Override:
    sub  eax,dword[Rules.AI.PowerEmergencyMinimum]
    jmp  0x004D9D95
.OrginalCode:
    sub  eax,0x190 ; 400
    jmp  0x004D9D95
@ENDHACK


@HACK 0x004DA18B,0x004DA1B3,_HouseClass__AI_Lower_Power__Use_Any_Power_Positive_Building
    push edi
    xor  edi,edi
.Repeat:    
    mov  eax,edi
    call BuildingTypeClass__As_Reference
    test eax,eax
    jz   .Done ; we reached the end of the list
    mov  dl,byte[eax+BuildingTypeClass.Offset.FactoryType] ; never consider any Factory for selling power plants
    test dl,dl
    jnz  .Next
    mov  edx,dword[eax+BuildingTypeClass.Offset.Power] ; check BuildType
    cmp  edx,0
    jle  .Next
    mov  eax,ecx
    mov  edx,edi
    mov  ebx,-1
    call HouseClass__Find_Building
    test eax,eax
    jnz  0x004DA1B3
.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done:
    pop  edi
    jmp  0x004DA1C6
@ENDHACK


@HACK 0x004DA2EB,0x004DA2F1,_HouseClass__AI_Building_Break_If_BaseBuilding_Has_Building
; If there is Base and AutoBase, Base takes priority
    mov  byte[ecx+HouseClass.Offset.BuildStructure],al
    jmp  0x04DB7D9 ; skip AutoBuilding
@ENDHACK


@HACK 0x004DA348,0x004DA36A,_HouseClass__AI_Building_CheckIncome
    ; ecx = HouseClass
    ; set edi to 1 if there is income, 0 otherwise
    mov  esi,eax
    test byte[ecx+0x43],0x80
    jnz  0x004DA36A
    push esi
    push edx
    push eax
    xor  esi,esi
    xor  edi,edi
.CheckRefn.Repeat:
    mov  eax,esi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsRefinery.Get(edx,al)
    test al,al
    jz   .CheckRefn.Next
    cmp  dword[ecx+4*esi+HouseClass.Offset.NewBQuantity],0
    jle  .CheckRefn.Next
.CheckRefn.Found:
    xor  esi,esi
    jmp  .CheckHarv.Repeat
.CheckRefn.Next:
    inc  esi
    mov  eax,[BuildingTypeClass.Count]
    cmp  esi,eax
    jb   .CheckRefn.Repeat
    jmp  .Done
.CheckHarv.Repeat:
    mov  eax,esi
    UnitTypeClass.FromIndex(eax,edx)
    UnitTypeClass.IsToHarvest.Get(edx,al)
    test al,al
    jz   .CheckHarv.Next
    cmp  dword[ecx+4*esi+HouseClass.Offset.NewUQuantity],0
    jle  .CheckHarv.Next
.CheckHarv.Found:
    mov  edi,1
    jmp  .Done
.CheckHarv.Next:
    inc  esi
    mov  eax,[UnitTypeClass.Count]
    cmp  esi,eax
    jb   .CheckHarv.Repeat
.Done:
    pop  eax
    pop  edx
    pop  esi
    jmp  0x004DA36C
@ENDHACK


@HACK 0x004DA391,0x004DA396,_HouseClass__AI_Building_Choose
    ; ecx: House class
    cmp  byte[Rules.AI.UseNewBuildingAI],1
    je   .CheckRefinery
.OrginalCode:
	mov  eax,0x12 
    jmp  0x004DA396

.CheckRefinery:
    mov  ebx,dword[ecx+HouseClass.Offset.IsTiberiumShort]
    test eax,0x80 ; IsTiberiumShort
    jnz  .CheckReserve
    mov  eax,AIBuildType.REFINERY
    call GetBuildingCountMatchingAIBuildType ; eax is now refinery count
    cmp  eax,dword[0x0066673A] ; Rule.RefineryLimit
    jge  .CheckReserve
    push eax
    mov  ebx,dword[ecx+HouseClass.Offset.CurBuildings]
    xor  eax,eax
    mov  ax,word[0x0066673E] ; Rule.RefineryRatio (fixed)
    imul ebx
    sar  eax,8
    shl  edx,0x18
    or   edx,eax ; divide by 256, edx is now CurBuildings * Rule.RefineryRatio
    pop  eax
    cmp  eax,edx
    jg   .CheckReserve ; use jg because numbers may round to 0, making AI build nothin
    mov  eax,AIBuildType.REFINERY
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .CheckReserve
    test dword[ecx+HouseClass.Offset.BPreGroupScan],0x10 ; is there a refinery?
    jnz  .CheckRefinery_HaveRefinery
.CheckRefinery_NoRefinery:
    mov  ah,UrgencyType.HIGH
    jmp  .CheckRefinery_Alloc
.CheckRefinery_HaveRefinery:
    mov  ah,UrgencyType.NORMAL
.CheckRefinery_Alloc:
    call ChooseOneToBuildAlloc
    jmp  .Done ; this is a high priority item, don't bother checking the rest

.CheckReserve:
    ; Check reserve for anything that is not a refinery
    mov  eax,dword[ecx+HouseClass.Offset.Tiberium]
    add  eax,dword[ecx+HouseClass.Offset.Credits]
    cmp  eax,[Rules.AI.BuildingReserve]
    jl   .Done

.CheckEmergencyPower:
    mov  eax,dword[ecx+HouseClass.Offset.Drain]
    mov  edx,dword[ecx+HouseClass.Offset.Power]
    cmp  eax,edx
    jl   .CheckPower
    mov  eax,AIBuildType.POWER
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .CheckBarracks ; don't bother checking power if you can't build any
    mov  ah,UrgencyType.HIGH
    call ChooseOneToBuildAlloc
    jmp  .Done ; this is a high priority item, don't bother checking the rest

.CheckPower:
    mov  eax,dword[0x00666744] ; Rule.PowerSurplus
    add  eax,dword[ecx+HouseClass.Offset.Drain]
    mov  edx,dword[ecx+HouseClass.Offset.Power]
    cmp  eax,edx
    jl   .CheckBarracks
    mov  eax,AIBuildType.POWER
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .CheckBarracks
    test dword[ecx+HouseClass.Offset.BPreGroupScan],0x10 ; is there a refinery?
    jnz  .CheckPower_HaveRefinery
.CheckPower_NoRefinery:
    mov  ah,UrgencyType.LOW
    jmp  .CheckPower_Alloc
.CheckPower_HaveRefinery:
    mov  ah,UrgencyType.NORMAL
.CheckPower_Alloc:
    call ChooseOneToBuildAlloc

.CheckBarracks:
    mov  eax,AIBuildType.BARRACKS
    call GetBuildingCountMatchingAIBuildType ; eax is now barracks count
    cmp  eax,dword[0x00666736] ; Rule.BarracksLimit
    jge  .CheckWarFactory
    push eax
    mov  ebx,dword[ecx+HouseClass.Offset.CurBuildings]
    xor  eax,eax
    mov  ax,word[0x00666734] ; Rule.BarracksRatio (fixed)
    imul ebx
    sar  eax,8
    shl  edx,0x18
    or   edx,eax
    pop  eax
    cmp  eax,edx
    jg   .CheckWarFactory
    mov  eax,AIBuildType.BARRACKS
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .CheckWarFactory
    test dword[ecx+HouseClass.Offset.BPreGroupScan],0x40 ; is there a barracks?
    jnz  .CheckBarracks_HaveFactory
.CheckBarracks_NoFactory:
    mov  ah,UrgencyType.NORMAL
    jmp  .CheckBarracks_Alloc
.CheckBarracks_HaveFactory:
    mov  ah,UrgencyType.LOW
.CheckBarracks_Alloc:
    call ChooseOneToBuildAlloc

.CheckWarFactory:
    mov  eax,AIBuildType.WARFACTORY
    call GetBuildingCountMatchingAIBuildType ; eax is now war factory count
    cmp  eax,dword[0x00666730] ; Rule.WarLimit
    jge  .CheckDefense
    push eax
    mov  ebx,dword[ecx+HouseClass.Offset.CurBuildings]
    xor  eax,eax
    mov  ax,word[0x0066672E] ; Rule.WarRatio (fixed)
    imul ebx
    sar  eax,8
    shl  edx,0x18
    or   edx,eax
    pop  eax
    cmp  eax,edx
    jg   .CheckDefense
    mov  eax,AIBuildType.WARFACTORY
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .CheckDefense
    test dword[ecx+HouseClass.Offset.BPreGroupScan],0x80 ; is there a War Factory?
    jnz  .CheckWarFactory_HaveFactory
.CheckWarFactory_NoFactory:
    mov  ah,UrgencyType.NORMAL
    jmp  .CheckWarFactory_Alloc
.CheckWarFactory_HaveFactory:
    mov  ah,UrgencyType.LOW
.CheckWarFactory_Alloc:
    call ChooseOneToBuildAlloc

.CheckDefense:
    mov  eax,AIBuildType.DEFENSE
    call GetBuildingCountMatchingAIBuildType ; eax is now defense count
    cmp  eax,dword[0x0066672A] ; Rule.DefenseLimit
    jge  .CheckAADefense
    push eax
    mov  ebx,dword[ecx+HouseClass.Offset.CurBuildings]
    xor  eax,eax
    mov  ax,word[0x00666728] ; Rule.DefenseRatio (fixed)
    imul ebx
    sar  eax,8
    shl  edx,0x18
    or   edx,eax
    pop  eax
    cmp  eax,edx
    jg   .CheckAADefense
    mov  eax,AIBuildType.DEFENSE
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .CheckAADefense
    mov  ah,UrgencyType.NORMAL
    call ChooseOneToBuildAlloc

.CheckAADefense:
    ; check 'enemy' if it has airforce
    mov  eax,dword[ebp-0x1B]
    sar  eax,0x18
    call HouseClass__As_Pointer
    test eax,eax
    jz   .CheckAdvDefense
    mov  ebx,dword[eax+HouseClass.Offset.CurAircraft]
    mov  dword[Temp.AIBuilding.AirThreat],ebx
    mov  eax,AIBuildType.AA.DEFENSE
    call GetBuildingCountMatchingAIBuildType ; eax is now defense count
    cmp  eax,dword[0x00666724] ; Rule.DefenseLimit
    jge  .CheckAdvDefense
    push eax
    mov  ebx,dword[ecx+HouseClass.Offset.CurBuildings]
    xor  eax,eax
    mov  ax,word[0x00666722] ; Rule.DefenseRatio (fixed)
    imul ebx
    sar  eax,8
    shl  edx,0x18
    or   edx,eax
    pop  eax
    cmp  eax,edx
    jg   .CheckAdvDefense
    push eax
    mov  eax,AIBuildType.AA.DEFENSE
    call GetRandomBuildingWithinAILimit
    test eax,eax
    pop  ebx
    jz   .CheckAdvDefense
    push edx
    mov  edx,dword[Temp.AIBuilding.AirThreat]
    cmp  edx,ebx
    pop  edx
    jge  .CheckAADefense_HighAirThreat
.CheckAADefense_LowAirThreat:
    mov  ah,UrgencyType.NORMAL
    jmp  .CheckAADefense_Alloc
.CheckAADefense_HighAirThreat:
    mov  ah,UrgencyType.HIGH
.CheckAADefense_Alloc:
    call ChooseOneToBuildAlloc

.CheckAdvDefense:
    mov  eax,AIBuildType.ADV.DEFENSE
    call GetBuildingCountMatchingAIBuildType ; eax is now defense count
    cmp  eax,dword[0x0066671E] ; Rule.DefenseLimit
    jge  .CheckTech
    push eax
    mov  ebx,dword[ecx+HouseClass.Offset.CurBuildings]
    xor  eax,eax
    mov  ax,word[0x0066671C] ; Rule.DefenseRatio (fixed)
    imul ebx
    sar  eax,8
    shl  edx,0x18
    or   edx,eax
    pop  eax
    cmp  eax,edx
    jg   .CheckTech
    mov  eax,AIBuildType.ADV.DEFENSE
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .CheckTech
    mov  ah,UrgencyType.NORMAL
    call ChooseOneToBuildAlloc

.CheckTech:
    mov  eax,AIBuildType.TECH
    call GetRandomBuildingTech
    test eax,eax
    jz   .CheckHelipad
    mov  ah,UrgencyType.NORMAL
    call ChooseOneToBuildAlloc

.CheckHelipad:
    mov  eax,AIBuildType.HELIPAD
    call GetBuildingCountMatchingAIBuildType ; eax is now helipad count
    cmp  eax,dword[0x00666718] ; Rule.HelipadLimit
    jge  .CheckAirfield
    push eax
    mov  ebx,dword[ecx+HouseClass.Offset.CurBuildings]
    xor  eax,eax
    mov  ax,word[0x00666716] ; Rule.HelipadRatio (fixed)
    imul ebx
    sar  eax,8
    shl  edx,0x18
    or   edx,eax
    pop  eax
    cmp  eax,edx
    jg   .CheckAirfield
    mov  eax,AIBuildType.HELIPAD
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .CheckAirfield
    mov  ah,UrgencyType.NORMAL
    call ChooseOneToBuildAlloc

.CheckAirfield:
    mov  eax,AIBuildType.AIRSTRIP
    call GetBuildingCountMatchingAIBuildType ; eax is now airstrip count
    cmp  eax,dword[0x00666714] ; Rule.AirstripLimit
    jge  .CheckGeneric
    push eax
    mov  ebx,dword[ecx+HouseClass.Offset.CurBuildings]
    xor  eax,eax
    mov  ax,word[0x00666712] ; Rule.AirstripRatio (fixed)
    imul ebx
    sar  eax,8
    shl  edx,0x18
    or   edx,eax
    pop  eax
    cmp  eax,edx
    jg   .CheckGeneric
    mov  eax,AIBuildType.AIRSTRIP
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .CheckGeneric
    mov  ah,UrgencyType.NORMAL
    call ChooseOneToBuildAlloc

.CheckGeneric:
    mov  eax,AIBuildType.GENERIC
    call GetRandomBuildingWithinAILimit
    test eax,eax
    jz   .Done
    mov  ah,UrgencyType.NORMAL
    call ChooseOneToBuildAlloc

.Done:
    jmp  0x004DB78F ; pass back to main code to handle BuildChoice heap
@ENDHACK


[section .text]
GetRandomBuildingWithinAILimit:
    ; eax: AIBuildType
    ; ecx: House class
    ; esi: available money
    ; cycle through all buildings
    ; result is stored as eax: Count and edx: array
    push edi
    push esi
    xor  edi,edi
    mov  byte[Temp.AIBuilding.Count],0
    mov  ebx,eax
.Repeat:
    mov  eax,edi
    call BuildingTypeClass__As_Reference
    test eax,eax
    jz   .Done ; we reached the end of the list
    mov  dl,byte[eax+BuildingTypeClass.Offset.AIBuildType] ; check BuildType
    cmp  dl,bl
    jne  .Next
    mov  edx,dword[eax+TechnoTypeClass.Offset.Cost] ; check Cost
    cmp  edx,esi
    jg   .Next
    push ebx
    push ecx
    push eax
    mov  bl,byte[ecx+HouseClass.Offset.ActLike]
    movzx ebx,bl
    mov  edx,eax
    mov  eax,ecx
    call HouseClass__Can_Build
    pop  edx
    pop  ecx
    pop  ebx
    test eax,eax
    jz   .Next
    mov  eax,edx
    mov  edx,dword[eax+BuildingTypeClass.Offset.AIBuildLimit] ; check BuildLimit > 0 (if so, compare against BQuantity)
    cmp  edx,0
    je   .AddBuilding ; if BuildLimit = 0, there is no limit
    mov  eax,dword[ecx+HouseClass.Offset.NewBQuantity+edi*4]
    cmp  edx,eax
    jle   .Next
.AddBuilding:
    mov  dl,byte[Temp.AIBuilding.Count]
    movzx edx,dl
    lea  eax,[Temp.AIBuilding.Array+edx]
    inc  dl
    mov  byte[Temp.AIBuilding.Count],dl
    mov  edx,edi
    mov  byte[eax],dl
.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done:
    xor  eax,eax
    mov  al,byte[Temp.AIBuilding.Count]
    lea  edx,[Temp.AIBuilding.Array]
    pop  esi
    pop  edi
    retn


GetRandomBuildingTech:
    ; same as GetRandomBuildingWithinAILimit
    ; but if AIBuildLimit is not specified, assume limit to 1 instead of unlimited
    push edi
    push esi
    xor  edi,edi
    mov  byte[Temp.AIBuilding.Count],0
    mov  ebx,eax
.Repeat:
    mov  eax,edi
    call BuildingTypeClass__As_Reference
    test eax,eax
    jz   .Done ; we reached the end of the list
    mov  dl,byte[eax+BuildingTypeClass.Offset.AIBuildType] ; check BuildType
    cmp  dl,bl
    jne  .Next
    mov  edx,dword[eax+TechnoTypeClass.Offset.Cost] ; check Cost
    cmp  edx,esi
    jg   .Next
    push ebx
    push ecx
    push eax
    mov  bl,byte[ecx+HouseClass.Offset.ActLike]
    movzx ebx,bl
    mov  edx,eax
    mov  eax,ecx
    call HouseClass__Can_Build
    pop  edx
    pop  ecx
    pop  ebx
    test eax,eax
    jz   .Next
    mov  eax,edx
    mov  edx,dword[eax+BuildingTypeClass.Offset.AIBuildLimit] ; check BuildLimit > 0 (if so, compare against BQuantity)
    cmp  edx,0
    jne  .Compare ; if BuildLimit = 0, set to 1
    mov  edx,1
.Compare:
    mov  eax,dword[ecx+HouseClass.Offset.NewBQuantity+edi*4]
    cmp  edx,eax
    jle   .Next
.AddBuilding:
    mov  dl,byte[Temp.AIBuilding.Count]
    movzx edx,dl
    lea  eax,[Temp.AIBuilding.Array+edx]
    inc  dl
    mov  byte[Temp.AIBuilding.Count],dl
    mov  edx,edi
    mov  byte[eax],dl
.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done:
    xor  eax,eax
    mov  al,byte[Temp.AIBuilding.Count]
    lea  edx,[Temp.AIBuilding.Array]
    pop  esi
    pop  edi
    retn


GetBuildingCountMatchingAIBuildType:
    ; eax: AIBuildType
    ; ecx: House class
    ; cycle through all buildings
    ; result is stored as eax: Count
    push edi
    push esi
    xor  edi,edi
    xor  edx,edx
    mov  ebx,eax
.Repeat:
    mov  eax,edi
    call BuildingTypeClass__As_Reference
    test eax,eax
    jz   .Done ; we reached the end of the list
    mov  al,byte[eax+BuildingTypeClass.Offset.AIBuildType] ; check AIBuildType
    cmp  al,bl
    jne  .Next
.AddCount:
    mov  eax,dword[ecx+HouseClass.Offset.NewBQuantity+edi*4]
    add  edx,eax
.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done:
    mov  eax,edx
    pop  esi
    pop  edi
    retn


GetBuildingCountMatchingPrereqType:
    ; eax: PrereqType
    ; ecx: House class
    ; cycle through all buildings
    ; result is stored as eax: Count
    push edi
    push esi
    xor  edi,edi
    xor  edx,edx
    mov  ebx,eax
.Repeat:
    mov  eax,edi
    call BuildingTypeClass__As_Reference
    test eax,eax
    jz   .Done ; we reached the end of the list
    mov  al,byte[eax+TechnoTypeClass.Offset.PrereqType] ; check PrereqType
    cmp  al,bl
    jne  .Next
.AddCount:
    mov  eax,dword[ecx+HouseClass.Offset.NewBQuantity+edi*4]
    add  edx,eax
.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done:
    mov  eax,edx
    pop  esi
    pop  edi
    retn


ChooseOneToBuildAlloc:
    ; al: Count
    ; ah: UrgencyType
    ; edx: Array of BuildingTypes
    ; don't disturb ecx (House class)
    push esi
    push ecx
    test al,al ; don't bother if count is 0
    jz   .Done
    test ah,ah ; don't bother if Urgency is None
    jz   .Done
    ; pick the BuildingType first before allocation
    xor  ecx,ecx
    mov  cl,ah ; cl is now UrgencyType
    mov  esi,edx
    mov  bl,al ; al is at least 1
    dec  bl
    movzx ebx,bl
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  ch,byte[esi+eax] ; ch is now our BuildingType
    ; cx is now UrgencyType/BuildingType, the struct for BuildChoiceClass
    lea  eax,[0x006821BC]
    call FixedIHeapClass__Allocate
    test eax,eax
    jz   .Done ; failed to allocate, just forget about it
    mov  word[eax],cx
.Done:
    pop  ecx
    pop  esi
    retn


@HACK 0x004DE86C,0x004DE872,_HouseClass__Find_Cell_In_Zone_Detect_SingleCell
    call [ebx+0x84]
    mov  byte[Temp.FindCell.BuildingIsSingleCell],0
    cmp  byte[Rules.AI.ForceSingleTileClearing],1
    je   .Begin
    jmp  0x004DE872
.Begin:
    mov  edx,dword[eax] ; check the 1st word to see if it is 0 and 2nd word to see if it is REFRESH_EOL (0x7FFF). This would indicate it is a single tile
    cmp  edx,0x7FFF0000
    jne  .CheckTesla
    mov  byte[Temp.FindCell.BuildingIsSingleCell],1
    jmp  0x004DE872   
.CheckTesla:
    mov  edx,dword[eax] ; check the 1st word to see if it is 0 and 2nd word to see if it is REFRESH_EOL (0x7FFF). This would indicate it is a single tile
    cmp  edx,0x7FFF0080
    jne  .Done
    mov  byte[Temp.FindCell.BuildingIsSingleCell],1
    jmp  0x004DE872  
.Done:
    jmp  0x004DE872   
@ENDHACK


@HACK 0x004DA1E0,0x004DA223,_HouseClass__AI_Raise_Power_Choose
    ; ecx: 0, used as our index
    ; ebp-0x10: Current urgency
.Repeat:
    BuildingTypeClass.FromIndex(ecx,edx)
    BuildingTypeClass.AILowPowerSellPriority.Get(edx,al)
    test al,al ; Priority of 0 = don't consider at all
    je   .Next
    cmp  byte al,[ebp-0x10]  ; Compare with existing Priority
    jg   .Next
    mov  eax,esi
    mov  edx,ecx
    mov  ebx,-1    
    call HouseClass__Find_Building
    test eax,eax
    jz   .Next
    mov  ecx,[eax+0x11]
    mov  edx,1
    call [ecx+0xEC]
    mov  eax,1
    jmp  .Ret
.Next:
    inc  cl
    cmp  cl,[BuildingTypeClass.Count]
    jb   .Repeat
.Ret:
    jmp  0x004DA223
@ENDHACK


@HACK 0x004DA23C,0x004DA27F,_HouseClass__AI_Raise_Money_Choose
    ; ecx: 0, used as our index
    ; ebp-0x10: Current urgency
.Repeat:
    BuildingTypeClass.FromIndex(ecx,edx)
    BuildingTypeClass.AILowMoneySellPriority.Get(edx,al)
    test al,al ; Priority of 0 = don't consider at all
    je   .Next
    cmp  byte al,[ebp-0x10]  ; Compare with existing Priority
    jg   .Next
    mov  eax,esi
    mov  edx,ecx
    mov  ebx,-1    
    call HouseClass__Find_Building
    test eax,eax
    jz   .Next
    mov  ecx,[eax+0x11]
    mov  edx,1
    call [ecx+0xEC]
    mov  eax,1
    jmp  .Ret
.Next:
    inc  cl
    cmp  cl,[BuildingTypeClass.Count]
    jb   .Repeat
.Ret:
    jmp  0x004DA27F
@ENDHACK


@HACK 0x004DE87B,0x004DE9A0,HouseClass__Find_Cell_In_Zone_Reimplementation ; optimization
    xor  esi,esi
    mov  [ebp-0x1C],ecx
.Repeat:
    mov  ebx,[Map__RadiusOffset+esi*4]
    add  ebx,[ebp-0x10]
    mov  eax,Globals___Map
    mov  edx,ebx
    call MapClass__In_Radar
    test eax,eax
    jz   .Next
    mov  eax,[ebp-0x38]
    mov  edx,ebx
    call HouseClass__Which_Zone
    cmp  al,0xFF
    jz   .Next
    mov  edx,ebx
    mov  eax,edi
    call TechnoTypeClass__Legal_Placement
    test eax,eax
    jz   .Next
    cmp  byte[Temp.FindCell.BuildingIsSingleCell],1
    jne  .CheckDone
.CheckN:    
    mov  edx,ebx
    sub  edx,0x80
    mov  eax,edi
    call TechnoTypeClass__Legal_Placement
    test eax,eax
    jz   .Next
.CheckNE:    
    mov  edx,ebx
    sub  edx,0x7F
    mov  eax,edi
    call TechnoTypeClass__Legal_Placement
    test eax,eax
    jz   .Next
.CheckE:    
    mov  edx,ebx
    inc  edx
    mov  eax,edi
    call TechnoTypeClass__Legal_Placement
    test eax,eax
    jz   .Next
.CheckSE:    
    mov  edx,ebx
    add  edx,0x81
    mov  eax,edi
    call TechnoTypeClass__Legal_Placement
    test eax,eax
    jz   .Next
.CheckS:    
    mov  edx,ebx
    add  edx,0x80
    mov  eax,edi
    call TechnoTypeClass__Legal_Placement
    test eax,eax
    jz   .Next
.CheckSW:    
    mov  edx,ebx
    add  edx,0x7F
    mov  eax,edi
    call TechnoTypeClass__Legal_Placement
    test eax,eax
    jz   .Next
.CheckW:    
    mov  edx,ebx
    dec  edx
    mov  eax,edi
    call TechnoTypeClass__Legal_Placement
    test eax,eax
    jz   .Next
.CheckNW:    
    mov  edx,ebx
    sub  edx,0x81
    mov  eax,edi
    call TechnoTypeClass__Legal_Placement
    test eax,eax
    jz   .Next
.CheckDone:
    mov  edx,[ebp-0x28]
    test edx,edx
    jz   .Next
    mov  eax,[ebp-0x1C]
    push ebx
    mov  ebx,[eax]
    mov  ecx,edx
    cmp  dword ebx,-1
    je   .Next
.ProximityCheck:
    mov  ebx,[ebp-0x1C]
    mov  eax,[Globals___Houses]
    mov  ebx,[ebx]
    imul ebx,[eax+4]
    mov  eax,[eax+0x10]
    add  ebx,eax
    mov  eax,[ebx+5]
    add  ebx,0x5
    cmp  dword eax,-1
    je   .Next
    mov  eax,[Globals___HouseTypes]
    mov  ebx,[ebx]
    imul ebx,[eax+4]
    mov  eax,[eax+0x10]
    add  ebx,eax
    mov  eax,Globals___Map
    mov  byte bl,[ebx+0x25]
    mov  edx,edi
    movzx ebx,bl
    call DisplayClass__Passes_Proximity_Check
    test eax,eax
    jnz  .Found
.Next:
    inc  esi
    cmp  esi,[Map__RadiusCount+0xA*4] ; RadiusCount[11]
    jl   .Repeat
.Done:
    xor  eax,eax
    jmp  0x004DE9A0
.Found:
    mov  eax,[Map__RadiusOffset+esi*4]
    add  eax,[ebp-0x10]
    jmp  0x004DE9A0
@ENDHACK
