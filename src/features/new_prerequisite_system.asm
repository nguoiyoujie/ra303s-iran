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
;   Adv. Power Plant no longer fulfill prerequisites that require Power Plant
;----------------------------------------------------------------

@HOOK 0x004D40AD _HouseClass__Can_Build_DontCombineFlags
@HOOK 0x004D40DF _HouseClass__Can_Build_ReimplementExtendedPrerequisiteCheck
@HOOK 0x004DD5BF _HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType1
@HOOK 0x004DD61D _HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType2
@HOOK 0x004DD6CA _HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType3
@HOOK 0x004DD728 _HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType4
@HOOK 0x00456AA5 _BuildingClass__Unlimbo_ReplaceTypeWithPrereqType1
@HOOK 0x00456B01 _BuildingClass__Unlimbo_ReplaceTypeWithPrereqType2
@HOOK 0x004D7E30 _BuildingClass__Does_Enemy_Building_Exist_UsePrereqType
@HOOK 0x004D9D06 _BuildingClass__Check_Raise_Money_UseNewRefineryPrereqType
@HOOK 0x004D9BA8 _BuildingClass__Check_Build_Power_UseNewRefineryPrereqType
@HOOK 0x004D9BE9 _BuildingClass__Check_Build_Power_UseNewAdvDefensePrereqType
@HOOK 0x004D9CA4 _BuildingClass__Check_Fire_Sale_UseNewFactoriesPrereqType

@HOOK 0x004D483D _HouseClass__AI_SpeakSilosNeeded_Check
@HOOK 0x004D4903 _HouseClass__AI_SpeakLowPower_Check
@HOOK 0x004D4EAA _HouseClass__AI_RadarMap_Check1
@HOOK 0x004D4E49 _HouseClass__AI_RadarMap_Check2
@HOOK 0x004D4DDF _HouseClass__AI_RadarJammed_Check
@HOOK 0x0057E333 _UnitClass_Mission_Harvest_RefineryCheck
@HOOK 0x0057E783 _UnitClass_Mission_Harvest_RepairCheck
@HOOK 0x0057FBFF _UnitClass_Mission_Guard_RemoveChecksForRefinery_And_ShortOnTiberium
@HOOK 0x0058033B _UnitClass_Mission_Repair_RefineryCheck2

@HOOK 0x0056B4B4 _TEventClass__Operator_NoFactories_Check
@HOOK 0x0056B4E7 _TEventClass__Operator_BuildingExists_Check
@HOOK 0x0056B259 _TEventClass__Operator_FakesDestroyed_Check

; with the new system, do not combine the STRUCTF_ADVANCED_POWER with STRUCTF_POWER, or STRUCTF_SOVIET_TECH with STRUCTF_ADVANCED_TECH
_HouseClass__Can_Build_DontCombineFlags:
    jmp  0x004D40CE

_HouseClass__Can_Build_ReimplementExtendedPrerequisiteCheck:
    ; edx is the technotype pointer 
    ; esi is the houseclass pointer 
    xor  eax,eax
    TechnoTypeClass.ExtPrerequisiteOffset.Get(edx,ax)
    cmp  ax,0
    jz   .Fulfilled
    lea  eax, [edx + eax] ; eax is now pointer to start of the prerequisite fields
    mov  ebx, dword [esi + 1] ; HouseClass->ID     
    ; AND over 256-bit BScan
    lea  ecx, [Houses.BScan]
    shl  ebx,5
    lea  ecx, [ecx + ebx] ; ecx is now pointer to start of the house's new BScan fields
    mov  edx,8
.RepeatIter:
    mov  ebx,dword [eax]
    and  ebx,dword [ecx]
    cmp  ebx,dword [eax]
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
    mov  eax,0 ; prerequisite is not met
    jmp  0x004D40E4
    
; The type location offset is 1A4h, but the game code extracts from 1A1h, then performs a bit shift by 18 places to emulate masking.
; Our new location is 13Bh (ActiveBScan), so we replace 1A1h with 138h.
_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType1:
    ;mov  ecx,dword [ecx + 138h]
    jmp  0x004DD5D1 ; skip the 32 check

_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType2:
    mov  ecx,dword [ecx + 138h]
    jmp  0x004DD623
    
_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType3:
    push esi
    push ecx
    push ebx
    push eax
    mov  ecx,dword [ecx + 1a1h]
    sar  ecx,0x18
    ; ecx is now the building type ID
    ; eax+0x93 (TechnoClass->House) contains the id of the house it belongs to
    mov  esi,[eax + 0x93]
    ; we want to set Houses.BScan[<houseID> * 256 + <buildingtypeID>]
    ; Turn_On_Bit <byte> <Bit>
    ;   <byte> = <houseID> * 32 + <buildingtypeID> >> 3
    ;   <Bit>  = <buildingtypeID> & 0x7
    lea  ebx,[Houses.BScan]
    shl  esi,5
    add  ebx,esi
    mov  esi,ecx
    sar  esi,3
    add  ebx,esi
    and  ecx,7
    mov  al, 1
    shl  al, cl
    or   byte [ebx], al

    pop  eax
    pop  ebx
    pop  ecx
    pop  esi
    mov  ecx,dword [ecx + 138h]
    jmp  0x004DD6D0
    
_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType4:
    push eax
    push ecx
    mov  ecx,dword [ecx + 138h]
    mov  esi,0x1
    sar  ecx,0x18
    shl  esi,cl
    mov  ecx,esi
    or   dword [eax],ecx
    pop  ecx
    pop  eax
; Set special types
    push ebx
    xor  ebx, ebx
    lea  eax, [eax-0x13f]
    mov  bl, byte [eax+1] ; ID
    xor  eax, eax
    push ecx
    BuildingTypeClass.SpecialWeapons.Get(ecx,ax)
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    or   dword [ecx],eax   
; Set IsRadar
    pop  ecx
    BuildingTypeClass.IsRadar.Get(ecx,al)
    lea  ecx, [Houses.Radar]
    lea  ecx, [ecx + ebx]
    or   byte [ecx],al   
    pop  ebx
    jmp  0x004DD73C

_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType1:
    mov  ecx,dword [eax + 138h]
    jmp  0x00456AAB
        
_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType2:
    ; clashes with DeploysInto logic, as buildings will perform Unlimbo but be deleted thereafter
    ;push esi
    ;push ecx
    ;push ebx
    ;push eax
    ;mov  ecx,dword [eax + 1a1h]
    ;sar  ecx,0x18
    ;; ecx is now the building type ID
    ;; eax+0x93 (TechnoClass->House) contains the id of the house it belongs to
    ;mov  esi,[eax + 0x93]
    ;; we want to set Houses.BScan[<houseID> * 256 + <buildingtypeID>]
    ;; Turn_On_Bit <byte> <Bit>
    ;;   <byte> = <houseID> * 32 + <buildingtypeID> >> 3
    ;;   <Bit>  = <buildingtypeID> & 0x7
    ;lea  ebx,[Houses.BScan]
    ;shl  esi,5
    ;add  ebx,esi
    ;mov  esi,ecx
    ;sar  esi,3
    ;add  ebx,esi
    ;and  ecx,0xf
    ;mov  al, 1
    ;shl  al, cl
    ;or   byte [ebx], al
	;
    ;pop  eax
    ;pop  ebx
    ;pop  ecx
    ;pop  esi

    mov  ecx,dword [eax + 138h]
    jmp  0x00456B07

; Does_Enemy_Building_Exist is not used by the game, but we could use it~
_BuildingClass__Does_Enemy_Building_Exist_UsePrereqType:
    BuildingTypeClass.FromIndex(edx,ecx)
    TechnoTypeClass.PrereqType.Get(ecx,al)
    jmp  0x004D7E35
    
_BuildingClass__Check_Raise_Money_UseNewRefineryPrereqType:
    test dword [edx + 137h], 0x10 ; 1 << 4
    jmp  0x004D9D0D

_BuildingClass__Check_Build_Power_UseNewRefineryPrereqType:
    test dword [ebx + 137h], 0x10 ; 1 << 4
    jmp  0x004D9BAF

_BuildingClass__Check_Build_Power_UseNewAdvDefensePrereqType:
    test dword [ebx + 137h], 0x1800 ; 1 << 11 (ADV.DEFENSE), 1 << 12 (AA.DEFENSE)
    jmp  0x004D9BF3

_BuildingClass__Check_Fire_Sale_UseNewFactoriesPrereqType:
    test dword [eax + 13Bh], 0x1C0C2 ; 1 << 1, 1 << 6, 1 << 7, 1 << 14, 1 << 15, 1 << 16
    jmp  0x004D9CAE

; For now we use the new Prerequisite system to check for radar. In the future different variables can be introduced to _HouseClass__Recalc_Attributes_SetSpecialTypes to activate them
_HouseClass__AI_RadarMap_Check1:
;    test dword [eax + 13bh],0x100 ; 1 << 8
    push eax
    push ecx
    lea  ecx, [Houses.Radar]
    mov  al, byte [eax + 1]
    and  eax, 0xFF
    mov  cl, byte [ecx + eax]
    test cl, 0x1  
    pop  ecx
    pop  eax
    jmp  0x004D4EB1

_HouseClass__AI_RadarMap_Check2:
;    test dword [eax + 13bh],0x100 ; 1 << 8
    push eax
    push ecx
    lea  ecx, [Houses.Radar]
    mov  al, byte [eax + 1]
    and  eax, 0xFF
    mov  cl, byte [ecx + eax]
    test cl, 0x1  
    pop  ecx
    pop  eax
    jmp  0x004D4E50

_HouseClass__AI_RadarJammed_Check:
    ; eax is the id
    push ebx
    push ecx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.IsRadar.Get(ebx,cl)
    test cl,cl
    pop  ecx
    pop  ebx
    jz   0x004D4D77
    jmp  0x004D4DE4

_UnitClass_Mission_Harvest_RefineryCheck:
    test byte [eax + 13bh],0x10 ; REFINERY
    jmp  0x0057E33A

_UnitClass_Mission_Harvest_RepairCheck:
    test dword [eax + 13bh],0x200 ; REPAIR
    jmp  0x0057E78A

_UnitClass_Mission_Guard_RemoveChecksForRefinery_And_ShortOnTiberium:
    jmp  0x0057FC56

; There is another Refinery check that is used to locate the nearest instance of a building type.
; This should be updated into an iterative check

_UnitClass_Mission_Repair_RefineryCheck2:
    test byte [eax + 13bh],0x10 ; REFINERY
    jmp  0x00580342

_TEventClass__Operator_NoFactories_Check:
    test dword [eax + 13Bh], 0x1C0C2 ; 1 << 1, 1 << 6, 1 << 7, 1 << 14, 1 << 15, 1 << 16
    jmp  0x0056B4BE

_TEventClass__Operator_BuildingExists_Check:
; don't use ActiveBScan anymore, since that is used by the new prerequisite system
    ;eax is houseclass, ecx right shifted 18-bits is structtype id
    mov  eax, dword [eax + 1] ; HouseClass->ID     
    shl  eax,5 ; ID * 32 bytes
    lea  eax,[Houses.BScan + eax] ; eax is now pointer to start of the house's new BScan fields
    sar  ecx,18h
    mov  edx,ecx 
    sar  edx,3
    mov  eax,dword [eax + edx] ;e.g. ecx=100=8*12+4 -> check the 4th bit of [Houses.BScan + eax + 12]
    and  ecx,0x7
    mov  edx,1
    shl  edx,cl
    and  eax,edx ; bit match
    test eax,eax
    jmp  0x0056B4F9

    ; GetQuantity method
    ;mov  edx,ecx  ; structtype id
    ;sar  edx,18h
    ;call HouseClass__Get_Quantity ; Warning: Uses fixed array, will produce undefined results for new structures!
    ;test eax,eax
    ;jmp  0x0056B4F9

_TEventClass__Operator_FakesDestroyed_Check:
    sub  esp,0xc
    mov  esi,eax
    mov  dword [0x0056B24C], .Check
    jmp  0x0056B25E
.Check:
    test dword [eax + 13Bh], 0x00200000 ; 1 << 21
    jmp  0x0056B412
