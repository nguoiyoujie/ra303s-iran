;----------------------------------------------------------------
; src/features/new_prerequisite_system.asm
;
; Implements PrerequisiteTypes, which allows for some basic grouping of several building types to fulfill prerequisites.
; Extensive changes, affecting counting, map events, AI and superweapons
; 
; Consider separating these functions to smaller functional groups
; 
; This function is enabled by default and is not controllable.
; Compatibility warnings:
;   Adv. Power Plant no longer fulfill prerequisites that require Power Plant.
;   Soviet/Allied Tech Center will also no longer fulfill prerequisites that require the other.
;----------------------------------------------------------------

; AI will use the same memory as human players, since we maintain one BScan in the future
@SET 0x004D4096,{mov eax,[esi+HouseClass.Offset.BPreGroupScan]} ; 0x13B (HouseClass.Offset.ActiveBScan) // HouseClass::Can_Build
@SJMP 0x004D409C,0x004D40A7 ;_HouseClass__Can_Build ; skip AI using OldBScan
; with the new system, do not combine the STRUCTF_ADVANCED_POWER with STRUCTF_POWER, or STRUCTF_SOVIET_TECH with STRUCTF_ADVANCED_TECH
@SJMP 0x004D40AD,0x004D40CE ;_HouseClass__Can_Build ; skip hardcoded flag combinations

@SET 0x00456A86,{add ebx,HouseClass.Offset.BPreGroupScan} ; 0x137 (HouseClass.Offset.BScan) // BuildingClass::Unlimbo
;@SET 0x00456AE2,{add edx,HouseClass.Offset.BPreGroupScan} ; 0x13B (HouseClass.Offset.ActiveBScan) // BuildingClass::Unlimbo // skipped

@SJMP  0x004DD5BF,0x004DD631 ; 0x004DD5D1 to skip just the ID < 32 check // skip original HouseClass.Offset.BScan
;@LJMP 0x004DD5BF,_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType1
;@SET 0x004DD61D,TechnoTypeClass.Offset.PrereqType-3 ; skipped
@SET 0x004DD6A6,{add esi,HouseClass.Offset.BPreGroupScan} ; 0x13B (HouseClass.Offset.ActiveBScan) // HouseClass::Recalc_Attributes // skipped
@SJMP  0x004DD6E8,0x004DD73C
;@LJMP 0x004DD728,_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType4 // skipped
;@SET 0x004DD5F9,{add esi,HouseClass.Offset.BPreGroupScan} ; 0x137 (HouseClass.Offset.BScan) // HouseClass::Recalc_Attributes
;@SET 0x004DD708,{lea eax,[ecx+HouseClass.Offset.BPreGroupScan]} ; 0x13F (HouseClass.Offset.OldBScan) // HouseClass::Recalc_Attributes // skipped

@SET 0x004D46DF,{cmp dword[edi+HouseClass.Offset.BPreGroupScan],0} ; 0x13B (HouseClass.Offset.ActiveBScan) // HouseClass::AI (Sell control)
@SET 0x004B4BD9,{cmp dword[edx+HouseClass.Offset.BPreGroupScan],0} ; 0x137 (HouseClass.Offset.BScan) // DisplayClass::Sell_Mode_Control
@SET 0x004B4C81,{cmp dword[edx+HouseClass.Offset.BPreGroupScan],0} ; 0x137 (HouseClass.Offset.BScan) // DisplayClass::Repair_Mode_Control


@HACK 0x004D40DF,0x004D40E4,_HouseClass__Can_Build_ReimplementExtendedPrerequisiteCheck
    ; edx is the technotype pointer 
    ; esi is the houseclass pointer 
    xor  eax,eax
    TechnoTypeClass.ExtPrerequisiteOffset.Get(edx,ax)
    cmp  ax,0
    jz   .Fulfilled
    lea  eax,[edx+eax] ; eax is now pointer to start of the prerequisite fields
    mov  ebx,dword[esi+HouseClass.Offset.ID] ; HouseClass->ID     
    ; AND over 256-bit BScan
    lea  ecx,[Houses.BScan]
    shl  ebx,5
    lea  ecx,[ecx+ebx] ; ecx is now pointer to start of the house's new BScan fields
    mov  edx,8
.RepeatIter:
    mov  ebx,dword[eax]
    and  ebx,dword[ecx]
    cmp  ebx,dword[eax]
    jne  .NotFulfilled
    dec  edx
    add  eax,4
    add  ecx,4
    cmp  edx,0
    jg   .RepeatIter
.Fulfilled:
    mov  eax,1 ; prerequisite is met
    jmp  0x004D40E4
.NotFulfilled:
    xor  eax,eax ; prerequisite is not met
    jmp  0x004D40E4
@ENDHACK


@HACK 0x00456AA5,0x00456AAB,_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType1
    mov  ecx,[eax+TechnoTypeClass.Offset.PrereqType-3]
    jmp  0x00456AAB
@ENDHACK


@HACK 0x00456AC1,0x00456ACA,_BuildingClass__Unlimbo_Skip_ActiveBScan
    lea  eax,[esi+0x93]
    jmp  0x00456B1D
@ENDHACK


; Does_Enemy_Building_Exist is not used by the game,but we could use it~
@HACK 0x004D7E30,0x004D7E35,_BuildingClass__Does_Enemy_Building_Exist_UsePrereqType
    movzx edx,dl
    BuildingTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.PrereqType.Get(ecx,al)
    jmp  0x004D7E35
@ENDHACK


@HACK 0x004D9D06,0x004D9D0D,_BuildingClass__Check_Raise_Money_UseNewRefineryPrereqType
    test dword[edx+HouseClass.Offset.BPreGroupScan],0x10 ; 1 << 4 (PrereqType.REFINERY)
    jmp  0x004D9D0D
@ENDHACK


@HACK 0x004D9BA8,0x004D9BAF,_BuildingClass__Check_Build_Power_UseNewRefineryPrereqType
    test dword[ebx+HouseClass.Offset.BPreGroupScan],0x10 ; 1 << 4 (PrereqType.REFINERY)
    jmp  0x004D9BAF
@ENDHACK


@HACK 0x004D9BE9,0x004D9BF3,_BuildingClass__Check_Build_Power_UseNewAdvDefensePrereqType
    test dword[ebx+HouseClass.Offset.BPreGroupScan],0x1800 ; 1 << 11 (ADV.DEFENSE),1 << 12 (AA.DEFENSE)
    jmp  0x004D9BF3
@ENDHACK


@HACK 0x004D9CA4,0x004D9CAE,_BuildingClass__Check_Fire_Sale_UseNewFactoriesPrereqType
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x1C0C2 ; 1 << 1,1 << 6,1 << 7,1 << 14,1 << 15,1 << 16
    jmp  0x004D9CAE
@ENDHACK


@HACK 0x004D483D,0x004D4844,_HouseClass__AI_SpeakSilosNeeded_Check
    test byte[eax+HouseClass.Offset.BPreGroupScan],0x12 ; CONYARD | REFINERY
    jmp  0x004D4844
@ENDHACK


@HACK 0x004D4903,0x004D490A,_HouseClass__AI_SpeakLowPower_Check
    test byte[eax+HouseClass.Offset.BPreGroupScan],0x2 ; CONYARD
    jmp  0x004D490A
@ENDHACK


@HACK 0x004D4EAA,0x004D4EB1,_HouseClass__AI_RadarMap_Check1
    push eax
    push ecx
    lea  ecx,[Houses.Radar]
    mov  al,byte[eax+1]
    and  eax,0xFF
    mov  cl,byte[ecx+eax]
    test cl,0x1  
    pop  ecx
    pop  eax
    jmp  0x004D4EB1
@ENDHACK


@HACK 0x004D4E49,0x004D4E50,_HouseClass__AI_RadarMap_Check2
    push eax
    push ecx
    lea  ecx,[Houses.Radar]
    mov  al,byte[eax+1]
    and  eax,0xFF
    mov  cl,byte[ecx+eax]
    test cl,0x1  
    pop  ecx
    pop  eax
    jmp  0x004D4E50
@ENDHACK


@HACK 0x004D4DDF,0x004D4DE4,_HouseClass__AI_RadarJammed_Check
    ; eax is the id // need to enforce 0xFF
    push ebx
    push ecx
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.IsRadar.Get(ebx,cl)
    test cl,cl
    pop  ecx
    pop  ebx
    jz   0x004D4D77
    jmp  0x004D4DE4
@ENDHACK


@HACK 0x0057E333,0x0057E33A,_UnitClass_Mission_Harvest_RefineryCheck
    test byte[eax+HouseClass.Offset.BPreGroupScan],0x10 ; REFINERY
    jmp  0x0057E33A
@ENDHACK


@HACK 0x0057E783,0x0057E78A,_UnitClass_Mission_Harvest_RepairCheck
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x200 ; REPAIR
    jmp  0x0057E78A
@ENDHACK


@SJMP 0x0057FBFF,0x0057FC56 ;_UnitClass_Mission_Guard_RemoveChecksForRefinery_And_ShortOnTiberium


@HACK 0x0058033B,0x00580342,_UnitClass_Mission_Repair_RefineryCheck2
    test byte[eax+HouseClass.Offset.BPreGroupScan],0x10 ; REFINERY
    jmp  0x00580342
@ENDHACK


@HACK 0x0056B4B4,0x0056B4BE,_TEventClass__Operator_NoFactories_Check
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x1C0C2 ; 1 << 1,1 << 6,1 << 7,1 << 14,1 << 15,1 << 16
    jmp  0x0056B4BE
@ENDHACK


; The type location offset is 0x1A4, but the game code extracts from 0x1A1, then performs a bit shift by 18 places to emulate masking.
; Our new location is TechnoTypeClass.Offset.PrereqType, so we replace 0x1A1 with TechnoTypeClass.Offset.PrereqType-3.
@HACK 0x004DD6CA,0x004DD6D0,_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType3
    push esi
    push ecx
    push ebx
    push eax
    mov  ecx,[ecx+BuildingTypeClass.Offset.Type-3]
    shr  ecx,0x18
    ; ecx is now the building type ID
    ; eax+0x93 (TechnoClass->House) contains the id of the house it belongs to
    mov  esi,[eax+0x93]
    push ecx
    push esi
    ; we want to set Houses.BScan[<houseID> * 256<buildingtypeID>]
    ; Turn_On_Bit <byte> <Bit>
    ;   <byte> = <houseID> * 32<buildingtypeID> >> 3
    ;   <Bit>  = <buildingtypeID> & 0x7
    lea  ebx,[Houses.BScan]
    shl  esi,5
    add  ebx,esi
    mov  esi,ecx
    shr  esi,3
    add  ebx,esi
    and  ecx,7
    mov  al,1
    shl  al,cl
    or   byte[ebx],al
    pop  ebx ; House ID
    pop  ecx ; building type ID
    BuildingTypeClass.FromIndex(ecx,eax)
    mov  ecx,eax
    ; Set special types
    xor  eax,eax
    push ecx
    BuildingTypeClass.SpecialWeapons.Get(ecx,ax)
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    or   dword[ecx],eax   
    ; Set IsRadar
    pop  ecx ; building type ID
    BuildingTypeClass.IsRadar.Get(ecx,al)
    lea  ecx,[Houses.Radar]
    lea  ecx,[ecx+ebx]
    or   byte[ecx],al   
    pop  eax
    pop  ebx
    pop  ecx
    pop  esi
    mov  ecx,[ecx+TechnoTypeClass.Offset.PrereqType-3]
    jmp  0x004DD6D0
@ENDHACK

;_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType4:
;    push eax
;    push ecx
;    mov  ecx,[ecx+TechnoTypeClass.Offset.PrereqType-3]
;    mov  esi,0x1
;    shr  ecx,0x18
;    shl  esi,cl
;    mov  ecx,esi
;    or   dword[eax],ecx
;    pop  ecx
;    pop  eax
;; Set special types
;    push ebx
;    xor  ebx,ebx
;    lea  eax,[eax-0x13F]
;    mov  bl,byte[eax+1] ; ID
;    xor  eax,eax
;    push ecx
;    BuildingTypeClass.SpecialWeapons.Get(ecx,ax)
;    lea  ecx,[Houses.SpecialScan]
;    lea  ecx,[ecx+ebx*4]
;    or   dword[ecx],eax   
;; Set IsRadar
;    pop  ecx
;    BuildingTypeClass.IsRadar.Get(ecx,al)
;    lea  ecx,[Houses.Radar]
;    lea  ecx,[ecx+ebx]
;    or   byte[ecx],al   
;    pop  ebx
;    jmp  0x004DD73C


;@HACK 0x00456B01,0x00456B07,_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType2 ; skipped
;    ; clashes with DeploysInto logic,as buildings will perform Unlimbo but be deleted thereafter
;    mov  ecx,dword[eax+TechnoTypeClass.Offset.PrereqType-3]
;    jmp  0x00456B07
;@ENDHACK



@HACK 0x0056B4E7,0x0056B4F9,_TEventClass__Operator_BuildingExists_Check
    ; don't use ActiveBScan anymore, since that is used by the new prerequisite system
    ; eax is houseclass, ecx right shifted 18-bits is structtype id
    mov  eax,dword[eax+HouseClass.Offset.ID] ; HouseClass->ID     
    shl  eax,5 ; ID * 32 bytes
    lea  eax,[Houses.BScan+eax] ; eax is now pointer to start of the house's new BScan fields
    shr  ecx,0x18
    mov  edx,ecx 
    shr  edx,3
    mov  eax,dword[eax+edx] ;e.g. ecx=100=8*12+4 -> check the 4th bit of [Houses.BScan+eax+12]
    and  ecx,0x7
    mov  edx,1
    shl  edx,cl
    and  eax,edx ; bit match
    test eax,eax
    jmp  0x0056B4F9
@ENDHACK


@HACK 0x0056B259,0x0056B25E,_TEventClass__Operator_FakesDestroyed_Check
    sub  esp,0xC
    mov  esi,eax
    mov  dword[0x0056B24C],.Check
    jmp  0x0056B25E
.Check:
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x00200000 ; 1 << 21
    jmp  0x0056B412
@ENDHACK


@HACK 0x0056B615,0x0056B622,_TEventClass__Operator_BuildingsDestroyed_Check
    ; scan each byte of Houses.BScan (house-specific) ANDed over Houses.BSignificantScan
    ; this filters out any Insignificant=yes entities
    mov  eax,dword[eax+HouseClass.Offset.ID] ; HouseClass->ID     
    shl  eax,5 ; ID * 32 bytes
    lea  esi,[Houses.BScan+eax] ; eax is now pointer to start of the house's new BScan fields
    lea  ecx,[Houses.BSignificantScan]
    xor  edi,edi ; start with offset 0
.Scan:
    mov  eax,[esi] 
    mov  edx,[ecx] 
    and  eax,edx
    test eax,eax
    jnz  0x0056B622 ; there are buildings; skip 
    add  eax,4
    add  ecx,4  
    inc  edi
    cmp  edi,8
    jl   .Scan
    jmp  0x0056B6B0 ; no buildings,set trigger
@ENDHACK


;@HACK 0x0056B64A,_TEventClass__Operator_AllDestroyed_Check
;    ; scan each byte of Houses.BScan (house-specific) ANDed over Houses.BSignificantScan
;    ; this filters out any Insignificant=yes entities
;    mov  eax,dword[eax+HouseClass.Offset.ID] ; HouseClass->ID     
;    shl  eax,5 ; ID * 32 bytes
;    lea  esi,[Houses.BScan+eax] ; eax is now pointer to start of the house's new BScan fields
;    lea  ecx,[Houses.BSignificantScan]
;    xor  edi,edi ; start with offset 0
;.Scan:
;    mov  eax,[esi] 
;    mov  edx,[ecx] 
;    and  eax,edx
;    test eax,eax
;    ;jnz  0x0056B6B0 ; ret 1
;    add  eax,4
;    add  ecx,4  
;    inc  edi
;    cmp  edi,8
;    jl   .Scan
;    ;jmp  0x0056B622 ; ret 0
;; to-do: implement similar checks to IScan,UScan,VScan (AScan is not included in checks)
;@ENDHACK

;_TEventClass__Operator_UnitsDestroyed_Check:
