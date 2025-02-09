;----------------------------------------------------------------
; src/features/weapon_zeroversus.asm
;
; Weapons will now be restricted from firing at targets with armor that it has 0% versus against. Negative versus is still fair game.
; 
; This function is enabled by default and is not configurable.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

cextern TechnoClass__What_Weapon_Should_I_Use

@HACK 0x004F0E83,0x004F0E88,_InfantryClass__Firing_AI_CheckInvalidWeapon
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x004F11DE
    jmp  0x004F0E88
@ENDHACK


@HACK 0x0057A307,0x0057A30C,_UnitClass__Firing_AI_CheckInvalidWeapon
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x0057A347
    jmp  0x0057A30C
@ENDHACK


@HACK 0x0058D226,0x0058D22B,_VesselClass__Combat_AI_CheckInvalidWeapon
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x0058D260
    jmp  0x0058D22B
@ENDHACK


@HACK 0x0045CD35,0x0045CD3A,_BuildingClass__Mission_Attack_CheckInvalidWeapon
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x0045CB9D
    jmp  0x0045CD3A
@ENDHACK


@HACK 0x00562F1C,0x00562F21,_TechnoClass__Evaluate_Object_CheckInvalidWeapon
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x0056349C
    jmp  0x00562F21
@ENDHACK


@HACK 0x005645C4,0x005645C9,_TechnoClass__AI_CheckInvalidWeapon
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x005645E0
    jmp  0x005645C9
@ENDHACK


@HACK 0x00565C33,0x00565C38,_TechnoClass__What_Action_CheckInvalidWeapon
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x00565CF6
    jmp  0x00565C38
@ENDHACK


@HACK 0x00565FC1,0x00565FC6,_TechnoClass__What_Action_CheckInvalidWeapon2 ; targeting the ground/overlay uses WOOD armor
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x00566002
    jmp  0x00565FC6
@ENDHACK


@HACK 0x0056842F,0x00568434,_TechnoClass__Is_Allowed_To_Retaliate_CheckInvalidWeapon
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x0056855B
    jmp  0x00568434
@ENDHACK


@HACK 0x00568643,0x00568648,_TechnoClass__Target_Something_Nearby_CheckInvalidWeapon
    call TechnoClass__What_Weapon_Should_I_Use
    cmp  dword eax,-1
    je   0x0056866C
    jmp  0x00568648
@ENDHACK


@HACK 0x00560C82,0x00560C93,_TechnoClass__What_Weapon_Should_I_Use_CheckNoScore
    mov  eax,[ebp-0x18]
    cmp  eax,[ebp-0x1C]
    jle  .CheckPrimary
.CheckSecondary:
    test eax,eax
    jz   .RetNone
.RetSecondary:
    mov  al,1
    movzx eax,al
    jmp  0x00560C93
.CheckPrimary:
    cmp  dword [ebp-0x1C],0
    je   .RetNone
.RetPrimary:
    xor  eax,eax
    jmp  0x00560C93
.RetNone:
    mov  dword eax,-1
    jmp  0x00560C93
@ENDHACK


; _TechnoClass__What_Weapon_Should_I_Use_CheckNoScore bypasses the below. But, need to hijack the other code to check for -1 weapon.
;@HACK 0x00564D6B,0x00564D72,_TechnoClass__Can_Fire_Discard_ZeroVersus
;    mov  [ebp-0x14],eax
;    test eax,eax
;    jz   0x00564D72 ; skip with FIRE_CANT
;    ; eax is the weapon, ecx is the owner?, edx is the target
;    push ebx
;    push ecx
;    push edx
;    push eax
;    mov  ecx,[eax+WeaponTypeClass.Offset.WarheadPtr] ; ecx is now Warhead
;    test edx,edx
;    jz   .Ret
;    AbstractClass.RTTI.Get(edx,bl)
;    cmp  bl,RTTIType.Infantry
;    je   .CheckInfantry  
;    cmp  bl,RTTIType.Unit
;    je   .CheckUnit  
;    cmp  bl,RTTIType.Building
;    je   .CheckBuilding  
;    cmp  bl,RTTIType.Aircraft
;    je   .CheckAircraft      
;    cmp  bl,RTTIType.Vessel
;    je   .CheckVessel
;    jmp  .Ret
;
;.CheckInfantry:
;    InfantryClass.Class.Get(edx,ebx)
;    InfantryTypeClass.FromIndex(ebx,edx)
;    ObjectTypeClass.Armor.Get(edx,bl)
;    movzx ebx,bl
;    mov  word bx,[ecx+WarheadTypeClass.Offset.Modifier+ebx*2]
;    test bx,bx
;    jz   .Ret_CantFire ; verses is 0, skip with FIRE_CANT
;    jmp  .Ret
;
;.CheckUnit:
;    UnitClass.Class.Get(edx,ebx)
;    UnitTypeClass.FromIndex(ebx,edx)
;    ObjectTypeClass.Armor.Get(edx,bl)
;    movzx ebx,bl
;    mov  word bx,[ecx+WarheadTypeClass.Offset.Modifier+ebx*2]
;    test bx,bx
;    jz   .Ret_CantFire ; verses is 0, skip with FIRE_CANT
;    jmp  .Ret
;
;.CheckBuilding:
;    BuildingClass.Class.Get(edx,ebx)
;    BuildingTypeClass.FromIndex(ebx,edx)
;    ObjectTypeClass.Armor.Get(edx,bl)
;    movzx ebx,bl
;    mov  word bx,[ecx+WarheadTypeClass.Offset.Modifier+ebx*2]
;    test bx,bx
;    jz   .Ret_CantFire ; verses is 0, skip with FIRE_CANT
;    jmp  .Ret
;
;.CheckAircraft:
;    AircraftClass.Class.Get(edx,ebx)
;    AircraftTypeClass.FromIndex(ebx,edx)
;    ObjectTypeClass.Armor.Get(edx,bl)
;    movzx ebx,bl
;    mov  word bx,[ecx+WarheadTypeClass.Offset.Modifier+ebx*2]
;    test bx,bx
;    jz   .Ret_CantFire ; verses is 0, skip with FIRE_CANT
;    jmp  .Ret
;
;.CheckVessel:
;    VesselClass.Class.Get(edx,ebx)
;    VesselTypeClass.FromIndex(ebx,edx)
;    ObjectTypeClass.Armor.Get(edx,bl)
;    movzx ebx,bl
;    mov  word bx,[ecx+WarheadTypeClass.Offset.Modifier+ebx*2]
;    test bx,bx
;    jz   .Ret_CantFire ; verses is 0, skip with FIRE_CANT
;
;.Ret:
;    pop  eax
;    pop  edx
;    pop  ecx
;    pop  ebx
;    jmp  0x00564D7F
;.Ret_CantFire:
;    pop  eax
;    pop  edx
;    pop  ecx
;    pop  ebx
;    mov  cl,5 ; FIRE_ILLEGAL
;    jmp  0x00564D74
;@ENDHACK
