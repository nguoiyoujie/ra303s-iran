;----------------------------------------------------------------
; src/features/prerequisitesystem/building_group_unhardcodes.asm
;
; AI has hardcoded behaviour when it comes to performing specialized functions with specific buildings. 
; For example, AI may Fire Sale if the original factories (War Factory, Construction Yard, Barracks etc.) are destroyed.
; 
; Some of these behaviors are moved to PrerequisiteTypes instead, so new buildings with similar functions may be included in these checks
; 
; This function is enabled by default and is not controllable.
; Compatibility warnings:
;   Adv. Power Plant no longer fulfill prerequisites that require Power Plant.
;   Soviet/Allied Tech Center will also no longer fulfill prerequisites that require the other.
;----------------------------------------------------------------

;-------------------------------------------------
; Refinery
;-------------------------------------------------
; TO-DO: There are multiple logic to this. Decide if it is worth keeping them separated
;    [<BuildingType>] IsRefinery=yes
;    [<BuildingType>] PrerequisiteType=REFINERY
;    [<BuildingType>] AIBuildType=REFINERY

@SJMP 0x0057FBFF,0x0057FC56 ;_UnitClass_Mission_Guard_RemoveChecksForRefinery_And_ShortOnTiberium


@HACK 0x004D9D06,0x004D9D0D,_BuildingClass__Check_Raise_Money_UseNewRefineryPrereqType
    test dword[edx+HouseClass.Offset.BPreGroupScan],0x10 ; 1 << 4 (PrereqType.REFINERY)
    jmp  0x004D9D0D
@ENDHACK


@HACK 0x004D9BA8,0x004D9BAF,_BuildingClass__Check_Build_Power_UseNewRefineryPrereqType
    test dword[ebx+HouseClass.Offset.BPreGroupScan],0x10 ; 1 << 4 (PrereqType.REFINERY)
    jmp  0x004D9BAF
@ENDHACK


@HACK 0x004D483D,0x004D4844,_HouseClass__AI_SpeakSilosNeeded_Check
    test byte[eax+HouseClass.Offset.BPreGroupScan],0x12 ; CONYARD | REFINERY
    jmp  0x004D4844
@ENDHACK


@HACK 0x0057E333,0x0057E33A,_UnitClass_Mission_Harvest_RefineryCheck
    test byte[eax+HouseClass.Offset.BPreGroupScan],0x10 ; REFINERY
    jmp  0x0057E33A
@ENDHACK


@HACK 0x0058033B,0x00580342,_UnitClass_Mission_Repair_RefineryCheck2
    test byte[eax+HouseClass.Offset.BPreGroupScan],0x10 ; REFINERY
    jmp  0x00580342
@ENDHACK


;-------------------------------------------------
; Factories (including Con Yard)
;-------------------------------------------------

@HACK 0x004D4903,0x004D490A,_HouseClass__AI_SpeakLowPower_Check
    test byte[eax+HouseClass.Offset.BPreGroupScan],0x2 ; CONYARD
    jmp  0x004D490A
@ENDHACK


@HACK 0x004D9CA4,0x004D9CAE,_BuildingClass__Check_Fire_Sale_UseNewFactoriesPrereqType
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x1C0C2 ; 1 << 1,1 << 6,1 << 7,1 << 14,1 << 15,1 << 16
    jmp  0x004D9CAE
@ENDHACK




;-------------------------------------------------
; Defenses
;-------------------------------------------------

@HACK 0x004D9BE9,0x004D9BF3,_BuildingClass__Check_Build_Power_UseNewAdvDefensePrereqType
    test dword[ebx+HouseClass.Offset.BPreGroupScan],0x1800 ; 1 << 11 (ADV.DEFENSE),1 << 12 (AA.DEFENSE)
    jmp  0x004D9BF3
@ENDHACK


@HACK 0x0056B4B4,0x0056B4BE,_TEventClass__Operator_NoFactories_Check
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x1C0C2 ; 1 << 1,1 << 6,1 << 7,1 << 14,1 << 15,1 << 16
    jmp  0x0056B4BE
@ENDHACK


; Low power messages shall change depending on whether you have an advanced defense or AA defense
@HACK 0x004D496F,0x004D49B2,_HouseClass__AI_Replace_AAPowerCheck
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x800 ; ADV.DEFENSE
    jz   .TeslaOffline
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x1000 ; AA.DEFENSE
    jz   .AAOffline
    mov  edx,0x203
    jmp  0x004D49B2
.TeslaOffline:
    mov  edx,0x202
    jmp  0x004D49B2
.AAOffline:
    mov  edx,0x201
    jmp  0x004D49B2
@ENDHACK



;-------------------------------------------------
; Repair Facility
;-------------------------------------------------

@HACK 0x0057E783,0x0057E78A,_UnitClass_Mission_Harvest_RepairCheck
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x200 ; REPAIR
    jmp  0x0057E78A
@ENDHACK




;-------------------------------------------------
; Fakes
;-------------------------------------------------

[section .text]
_TEventClass__Operator_FakesDestroyed_Check:
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x00200000 ; 1 << 21
    jmp  0x0056B412

@SET 0x0056B24C,{dd _TEventClass__Operator_FakesDestroyed_Check}


