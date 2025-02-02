;----------------------------------------------------------------
; src/features/specialweapons/nuke.asm
;
; Handles the Nuclear Missile special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D591D,0x004D5924,_HouseClass__Super_Weapon_Handler_NukeMissile_Check1
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x4   ; NUCLEAR_BOMB 1 << 2
    pop  ebx   
    pop  ecx   
    jmp  0x004D5924
@ENDHACK


@HACK 0x004D588C,0x004D5893,_HouseClass__Super_Weapon_Handler_NukeMissile_Check2
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x4   ; NUCLEAR_BOMB 1 << 2
    pop  ebx   
    pop  ecx   
    jmp  0x004D5893
@ENDHACK


@HACK 0x0045D8E0,0x0045D8EC,_BuildingClass_Mission_Missile_SpecialWeapon_NuclearLaunchCheck
    movzx eax,al
    ; eax is the id
    push ebx
    push ecx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx,0x4; SpecialType.NUCLEAR_BOMB (2)
    pop  ecx
    pop  ebx
    jnz  0x0045DC1A
    jmp  0x0045D8EC
@ENDHACK


@HACK 0x004D6B89,0x004D6B8E,_HouseClass__PlaceSpecialBlast_NukeMissile_LaunchCheck
    ; cycle through all building IDs until the first match
    xor  eax,eax
.CheckSpecialWeapons:
    ; eax is the id
    push ebx
    push ecx
    push eax
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpecialWeapons.Get(ebx,cx)
    test cx,0x4; SpecialType.NUCLEAR_BOMB (2)
    pop  eax
    pop  ecx
    pop  ebx
    mov  esi,eax
    jz   .Next

.FindBuilding:
    mov  ebx,0xFFFFFFFF
    mov  edx,esi
    mov  eax,dword[ebp-0x28]
    call HouseClass__Find_Building
    mov  ebx,eax
    test eax,eax
    jnz  0x004D6BA1 ;.Found

.Next:
    mov  eax,esi
    movzx eax,al
    inc  al
    cmp  al,byte[BuildingTypeClass.Count]
    jb   .CheckSpecialWeapons ;use unsigned check

.NotFound:
    jmp  0x004D6BC7
@ENDHACK
