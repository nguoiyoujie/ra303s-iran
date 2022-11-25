@HOOK 0x004D40AD _HouseClass__Can_Build_DontCombineFlags
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

@HOOK 0x004DD108 _HouseClass__Recalc_Attributes_SetSpecialTypes
@HOOK 0x004D5193 _HouseClass__Super_Weapon_Handler_GPS_Check1
@HOOK 0x004D51C9 _HouseClass__Super_Weapon_Handler_GPS_Check2
@HOOK 0x004D52E3 _HouseClass__Super_Weapon_Handler_GPS_Check3
@HOOK 0x004D52A4 _HouseClass__Super_Weapon_Handler_GPS_LaunchCheck1
@HOOK 0x004D5371 _HouseClass__Super_Weapon_Handler_GPS_LaunchCheck2
@HOOK 0x004D5418 _HouseClass__Super_Weapon_Handler_Chronosphere_Check1
@HOOK 0x004D54DE _HouseClass__Super_Weapon_Handler_Chronosphere_Check2

@HOOK 0x004D5584 _HouseClass__Super_Weapon_Handler_IronCurtain_Check1
@HOOK 0x004D55EE _HouseClass__Super_Weapon_Handler_IronCurtain_Check2
@HOOK 0x004D591D _HouseClass__Super_Weapon_Handler_NukeMissile_Check1
@HOOK 0x004D588C _HouseClass__Super_Weapon_Handler_NukeMissile_Check2
@HOOK 0x004D59C4 _HouseClass__Super_Weapon_Handler_SpyPlane_Check1
@HOOK 0x004D5A3D _HouseClass__Super_Weapon_Handler_SpyPlane_Check2
@HOOK 0x004D5AAA _HouseClass__Super_Weapon_Handler_Paradrop_Check1
@HOOK 0x004D5AFF _HouseClass__Super_Weapon_Handler_Paradrop_Check2
@HOOK 0x004D5B6C _HouseClass__Super_Weapon_Handler_Parabomb_Check1
@HOOK 0x004D5BBD _HouseClass__Super_Weapon_Handler_Parabomb_Check2

@HOOK 0x004D483D _HouseClass__AI_SpeakSilosNeeded_Check
@HOOK 0x004D4903 _HouseClass__AI_SpeakLowPower_Check
@HOOK 0x004D4EAA _HouseClass__AI_RadarMap_Check1
@HOOK 0x004D4E49 _HouseClass__AI_RadarMap_Check2
@HOOK 0x004D4DDF _HouseClass__AI_RadarJammed_Check
@HOOK 0x0057E333 _UnitClass_Mission_Harvest_RefineryCheck
@HOOK 0x0057E783 _UnitClass_Mission_Harvest_RepairCheck
@HOOK 0x0057FBFF _UnitClass_Mission_Guard_RemoveChecksForRefinery_And_ShortOnTiberium
@HOOK 0x0058033B _UnitClass_Mission_Repair_RefineryCheck2

@HOOK 0x0045D73A _BuildingClass_Mission_Missile_SpecialWeapon_GPSCheck
@HOOK 0x0045D8E0 _BuildingClass_Mission_Missile_SpecialWeapon_NuclearLaunchCheck
@HOOK 0x004D6B89 _HouseClass__PlaceSpecialBlast_NukeMissile_LaunchCheck

@HOOK 0x0056B4B4 _TEventClass__Operator_NoFactories_Check
@HOOK 0x0056B4E7 _TEventClass__Operator_BuildingExists_Check
@HOOK 0x0056B259 _TEventClass__Operator_FakesDestroyed_Check

; with the new system, do not combine the STRUCTF_ADVANCED_POWER with STRUCTF_POWER, or STRUCTF_SOVIET_TECH with STRUCTF_ADVANCED_TECH
_HouseClass__Can_Build_DontCombineFlags:
    jmp  0x004D40CE

; The type location offset is 1A4h, but the game code extracts from 1A1h, then performs a bit shift by 18 places to emulate masking.
; Our new location is 13Bh (ActiveBScan), so we replace 1A1h with 138h.
_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType1:
    mov  ecx,dword [ecx + 138h]
    jmp  0x004DD5C5

_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType2:
    mov  ecx,dword [ecx + 138h]
    jmp  0x004DD623
	
_HouseClass__Recalc_Attributes_ReplaceTypeWithPrereqType3:
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

_HouseClass__Recalc_Attributes_SetSpecialTypes:
;ecx is 0
    mov  dword [eax + 0x137],ecx
    mov  dword [eax + 0x13b],ecx
    mov  dword [eax + 0x14f],ecx
    mov  dword [eax + 0x153],ecx
    mov  dword [eax + 0x143],ecx
    mov  dword [eax + 0x147],ecx
    mov  dword [eax + 0x15b],ecx
    mov  dword [eax + 0x15f],ecx
    mov  dword [eax + 0x167],ecx
    mov  dword [eax + 0x16b],ecx
    lea  eax, [Houses.SpecialScan]
    lea  eax, [eax + edx*4]
    mov  dword [eax],ecx
    lea  eax, [Houses.Radar]
    lea  eax, [eax + edx]
    mov  byte [eax],cl
    jmp  0x004DD144

_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType1:
    mov  ecx,dword [eax + 138h]
    jmp  0x00456AAB
		
_BuildingClass__Unlimbo_ReplaceTypeWithPrereqType2:
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


_HouseClass__Super_Weapon_Handler_GPS_Check1:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x100   ; GPS 1 << 8
    pop  ebx   
    pop  ecx   
    jmp  0x004D519A

_HouseClass__Super_Weapon_Handler_GPS_Check2:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x100   ; GPS 1 << 8
    pop  ebx   
    pop  ecx   
    jmp  0x004D51D0

_HouseClass__Super_Weapon_Handler_GPS_Check3:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x100   ; GPS 1 << 8
    pop  ebx   
    pop  ecx   
    jmp  0x004D52EA

_HouseClass__Super_Weapon_Handler_GPS_LaunchCheck1:
    movsx eax,al
    ; eax is the id
    push ebx
    push ecx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx, 0x100; SpecialType.GPS (8)
    pop  ecx
    pop  ebx
    jz   0x004D525E
    jmp  0x004D52AB

_HouseClass__Super_Weapon_Handler_GPS_LaunchCheck2:
    movsx eax,al
    ; eax is the id
    push ebx
    push ecx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx, 0x100; SpecialType.GPS (8)
    pop  ecx
    pop  ebx
    jz   0x004D5327
    jmp  0x004D5378


_HouseClass__Super_Weapon_Handler_Chronosphere_Check1:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x8   ; CHRONOSPHERE 1 << 3
    pop  ebx   
    pop  ecx   
    jmp  0x004D541F

_HouseClass__Super_Weapon_Handler_Chronosphere_Check2:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x8   ; CHRONOSPHERE 1 << 3
    pop  ebx   
    pop  ecx   
    jmp  0x004D54E5

_HouseClass__Super_Weapon_Handler_IronCurtain_Check1:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x80   ; IRONCURTAIN 1 << 7
    pop  ebx   
    pop  ecx   
    jmp  0x004D558B

_HouseClass__Super_Weapon_Handler_IronCurtain_Check2:
; Also remove the USSR / Ukraine check
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x80   ; IRONCURTAIN 1 << 7
    pop  ebx   
    pop  ecx   
    jmp  0x004D560F ; use 0x004D55F5 if we want to restore check for USSR / Ukraine


_HouseClass__Super_Weapon_Handler_NukeMissile_Check1:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x4   ; NUCLEAR_BOMB 1 << 2
    pop  ebx   
    pop  ecx   
    jmp  0x004D5924

_HouseClass__Super_Weapon_Handler_NukeMissile_Check2:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x4   ; NUCLEAR_BOMB 1 << 2
    pop  ebx   
    pop  ecx   
    jmp  0x004D5893

_HouseClass__Super_Weapon_Handler_SpyPlane_Check1:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x40   ; SPY_MISSION 1 << 6
    pop  ebx   
    pop  ecx   
    jmp  0x004D59CB

_HouseClass__Super_Weapon_Handler_SpyPlane_Check2:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x40   ; SPY_MISSION 1 << 6
    pop  ebx   
    pop  ecx   
    jmp  0x004D5A44

_HouseClass__Super_Weapon_Handler_Paradrop_Check1:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x20   ; PARA_INFANTRY 1 << 5
    pop  ebx   
    pop  ecx   
    jmp  0x004D5AB1

_HouseClass__Super_Weapon_Handler_Paradrop_Check2:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x20   ; PARA_INFANTRY 1 << 5
    pop  ebx   
    pop  ecx   
    jmp  0x004D5B06

_HouseClass__Super_Weapon_Handler_Parabomb_Check1:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x10   ; PARA_BOMB 1 << 4
    pop  ebx   
    pop  ecx   
    jmp  0x004D5B73

_HouseClass__Super_Weapon_Handler_Parabomb_Check2:
    push ecx
    push ebx
    xor  ebx, ebx
    mov  bl, byte [esi+1] ; ID
    lea  ecx, [Houses.SpecialScan]
    lea  ecx, [ecx + ebx*4]
    test dword [ecx],0x10   ; PARA_BOMB 1 << 4
    pop  ebx   
    pop  ecx   
    jmp  0x004D5BC4

_HouseClass__AI_SpeakSilosNeeded_Check:
    test byte [eax + 13bh], 0x12 ; CONYARD | REFINERY
    jmp  0x004D4844

_HouseClass__AI_SpeakLowPower_Check:
    test byte [eax + 13bh], 0x2 ; CONYARD
    jmp  0x004D490A


; For now we use the new Prerequisite system to check for radar. In the future different variables can be introduced to _HouseClass__Recalc_Attributes_SetSpecialTypes to activate them
_HouseClass__AI_RadarMap_Check1:
;	test dword [eax + 13bh],0x100 ; 1 << 8
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


_BuildingClass_Mission_Missile_SpecialWeapon_GPSCheck:
    movsx eax,al
    ; eax is the id
    push ebx
    push ecx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx, 0x100; SpecialType.GPS (8)
    pop  ecx
    pop  ebx
    jnz  0x0045D8A6
    jmp  0x0045D8BA

_BuildingClass_Mission_Missile_SpecialWeapon_NuclearLaunchCheck:
    movsx eax,al
    ; eax is the id
    push ebx
    push ecx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx, 0x4; SpecialType.NUCLEAR_BOMB (2)
    pop  ecx
    pop  ebx
    jnz  0x0045DC1A
    jmp  0x0045D8EC

_HouseClass__PlaceSpecialBlast_NukeMissile_LaunchCheck:
; cycle through all building IDs until the first match
    xor  eax,eax
.CheckSpecialWeapons:
    ; eax is the id
    push ebx
    push ecx
    push eax
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx, 0x4; SpecialType.NUCLEAR_BOMB (2)
    pop  eax
    pop  ecx
    pop  ebx
    mov  esi,eax
    jz   .Next

.FindBuilding:
    mov  ebx,0xffffffff
    mov  edx,esi
    mov  eax,dword [ebp-0x28]
    call 0x004D8F34 ; HouseClass::Find_Building
    mov  ebx,eax
    test eax,eax
    jnz  0x004D6BA1 ;.Found

.Next:
    mov  eax,esi
    and  eax,0xff
    inc  al
    cmp  al, byte [NewBuildingTypeHeapCount]
    jl   .CheckSpecialWeapons

.NotFound:
    jmp  0x004D6BC7


_TEventClass__Operator_NoFactories_Check:
    test dword [eax + 13Bh], 0x1C0C2 ; 1 << 1, 1 << 6, 1 << 7, 1 << 14, 1 << 15, 1 << 16
    jmp  0x0056B4BE

_TEventClass__Operator_BuildingExists_Check:
; don't use ActiveBScan anymore, since that is used by the new prerequisite system
    ;mov  eax,  ; houseclass
    mov  edx,ecx  ; structtype id
    sar  edx,18h
    call 0x004DDCE8 ; HouseClass::Get_Quantity(structtype)
    test eax,eax
    jmp  0x0056B4F9

_TEventClass__Operator_FakesDestroyed_Check:
    sub  esp,0xc
    mov  esi,eax
    mov  dword [0x0056B24C], .Check
    jmp  0x0056B25E
.Check:
    test dword [eax + 13Bh], 0x00200000 ; 1 << 21
    jmp  0x0056B412
