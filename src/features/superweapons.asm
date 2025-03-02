;----------------------------------------------------------------
; src/features/superweapons.asm
;
; Move superweapon / specials information to a holding position, for future work to extend them.
; Allow buildingtypes to specify their specials.
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

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

@HOOK 0x0045D73A _BuildingClass_Mission_Missile_SpecialWeapon_GPSCheck
@HOOK 0x0045D8E0 _BuildingClass_Mission_Missile_SpecialWeapon_NuclearLaunchCheck
@HOOK 0x004D6B89 _HouseClass__PlaceSpecialBlast_NukeMissile_LaunchCheck

@HOOK 0x004D68DC _HouseClass__Place_Special_Blast_SwitchRoute
@HOOK 0x004D71B4 _HouseClass__Place_Special_Blast_Redefine_Chrono2
@HOOK 0x004D5460 _HouseClass__Super_Weapon_Handler_Chronosphere_Check_new_Chrono2
@HOOK 0x004B343F _DisplayClass__TacticalClass__Action_Chrono_Target_Icon_new_Chrono2
@HOOK 0x0057E1C5 _UnitClass__Mission_Unload__Chrono_Tank_new_Chrono2
@HOOK 0x0057F708 _UnitClass__What_Action__Chrono_Tank_new_Chrono2
@HOOK 0x00566898 _TechnoClass__Record_The_Kill__Chrono_Tank_new_Chrono2
@HOOK 0x005666AE _TechnoClass__Take_Damage__Chrono_Tank_new_Chrono2


%define        SpecialChrono2        0xFE


_HouseClass__Recalc_Attributes_SetSpecialTypes:
;ecx is 0
    mov  dword [eax + HouseClass.Offset.BScan],ecx
    mov  dword [eax + HouseClass.Offset.ActiveBScan],ecx
    mov  dword [eax + HouseClass.Offset.UScan],ecx
    mov  dword [eax + HouseClass.Offset.ActiveUScan],ecx
    mov  dword [eax + HouseClass.Offset.IScan],ecx
    mov  dword [eax + HouseClass.Offset.ActiveIScan],ecx
    mov  dword [eax + HouseClass.Offset.AScan],ecx
    mov  dword [eax + HouseClass.Offset.ActiveAScan],ecx
    mov  dword [eax + HouseClass.Offset.VScan],ecx
    mov  dword [eax + HouseClass.Offset.ActiveVScan],ecx
    mov  dword [eax + HouseClass.Offset.BPreGroupScan],ecx
    ; zero out 32-bit SpecialScan
    lea  eax, [Houses.SpecialScan]
    lea  eax, [eax + edx*4]
    mov  dword [eax],ecx
    ; zero out 8-bit Radar
    lea  eax, [Houses.Radar]
    lea  eax, [eax + edx]
    mov  byte [eax],cl
    ; zero out 256-bit BScan
    lea  eax, [Houses.BScan]
    push edx
    shl  edx,5
    lea  eax, [eax + edx]
    mov  edx,8
.RepeatZero:
    mov  dword [eax],ecx
    dec  edx
    add  eax,4
    cmp  edx,0
    jg   .RepeatZero
    pop  edx
    jmp  0x004DD144


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
    movzx eax,al
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
    movzx eax,al
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

_BuildingClass_Mission_Missile_SpecialWeapon_GPSCheck:
    movzx eax,al
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
    movzx eax,al
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
    call HouseClass__Find_Building
    mov  ebx,eax
    test eax,eax
    jnz  0x004D6BA1 ;.Found

.Next:
    mov  eax,esi
    movzx eax,al
    inc  al
    cmp  al, byte [BuildingTypeClass.Count]
    jb   .CheckSpecialWeapons ;use unsigned check

.NotFound:
    jmp  0x004D6BC7


; Moving SPC_CHRONO2 from 8 to 0xFE
_HouseClass__Place_Special_Blast_SwitchRoute:
    cmp  dx,SpecialChrono2
    jz   0x004D71F0 ; SPC_CHRONO2
    cmp  dx,0x8
    ja   0x004D7668 ; end of handling
    jmp  0x004D68E5 ; specials 0-6


_HouseClass__Place_Special_Blast_Redefine_Chrono2:
    mov  byte [Globals___Map_IsTargettingMode],SpecialChrono2
    jmp  0x004D71BB

_HouseClass__Super_Weapon_Handler_Chronosphere_Check_new_Chrono2:
    mov  ah,byte [Globals___Map_IsTargettingMode]
    cmp  ah,0x2
    jz   0x004D54C4
    cmp  ah,SpecialChrono2
    jz   0x004D5479
    jmp  0x004D54CB

_DisplayClass__TacticalClass__Action_Chrono_Target_Icon_new_Chrono2:
    cmp  byte [Globals___Map_IsTargettingMode],SpecialChrono2
    jz   0x004B344C
    jg   0x004B34BD
    mov  byte [ebp-10h], 0x11 ; ACTION_PARA_INFANTRY (to replace later)
    jmp  0x004B34BD

_UnitClass__Mission_Unload__Chrono_Tank_new_Chrono2:
    mov  byte [Globals___Map_IsTargettingMode],SpecialChrono2
    jmp  0x0057E1CC

_UnitClass__What_Action__Chrono_Tank_new_Chrono2:
    cmp  byte [Globals___Map_IsTargettingMode],SpecialChrono2
    jnz  0x0057F718
    jmp  0x0057F711

_TechnoClass__Record_The_Kill__Chrono_Tank_new_Chrono2:
    cmp  byte [Globals___Map_IsTargettingMode],SpecialChrono2
    jnz  0x005668F8
    jmp  0x005668A5

_TechnoClass__Take_Damage__Chrono_Tank_new_Chrono2:
    cmp  byte [Globals___Map_IsTargettingMode],SpecialChrono2
    jnz  0x00566711
    jmp  0x005666B7

