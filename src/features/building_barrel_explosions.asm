;----------------------------------------------------------------
; src/features/building_barrel_explosions.asm
;
; Use INI values to perform Barrel explosions, which is basically a warhead applied on the 4 cardinal directions of the building
;
; This function can be enabled by supplying [<BuildingType>] > SpreadExplosionDamage and SpreadExplosionWarhead values
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

[section .data] 
spread_explosion_damage dd 0
spread_explosion_warhead dd 0


@HACK 0x00457695,0x004576D7,_BuildingClass_Take_Damage_CheckSpreadExplosionDamage ;66
    ; al = ID
    movzx eax,al
    push ebx
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.SpreadExplosionDamage.Get(ebx,edx)
    BuildingTypeClass.SpreadExplosionWarhead.Get(ebx,ecx)
    test edx,edx
    pop  ebx
    jz   0x00457818 ; Continue
    mov  [spread_explosion_damage],edx
    mov  [spread_explosion_warhead],ecx
    jmp  0x004576D7 ; Barrel sequence
@ENDHACK


@HACK 0x0045770D,0x00457716,_BuildingClass_Take_Damage_ApplyDamage_N ;9
    push dword[spread_explosion_warhead]
    add  edx,eax 
    push dword[spread_explosion_damage]
    jmp  0x00457716
@ENDHACK


@HACK 0x00457755,_BuildingClass_Take_Damage_ApplyDamage_E ;9
    push dword[spread_explosion_warhead]
    add  eax,edx 
    push dword[spread_explosion_damage]
    jmp  0x0045775E
@ENDHACK


@HACK 0x0045779E,0x004577A9,_BuildingClass_Take_Damage_ApplyDamage_S ;11
    push dword[spread_explosion_warhead]
    xor  ecx,ecx
    add  eax,ebx 
    push dword[spread_explosion_damage]
    jmp  0x004577A9
@ENDHACK


@HACK 0x004577E7,0x004577F0,_BuildingClass_Take_Damage_ApplyDamage_W ;9
    push dword[spread_explosion_warhead]
    add  eax,ecx 
    push dword[spread_explosion_damage]
    jmp  0x004577F0
@ENDHACK

