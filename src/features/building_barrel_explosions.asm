;----------------------------------------------------------------
; src/features/building_barrel_explosions.asm
;
; Use INI values to perform Barrel explosions, which is basically a warhead applied on the 4 cardinal directions of the building
;
; This function can be enabled by supplying [<BuildingType>] > SpreadExplosionDamage and SpreadExplosionWarhead values
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@LJMP 0x00457695, _BuildingClass_Take_Damage_CheckSpreadExplosionDamage ;66
@LJMP 0x0045770D, _BuildingClass_Take_Damage_ApplyDamage_N ;9
@LJMP 0x00457755, _BuildingClass_Take_Damage_ApplyDamage_E ;9
@LJMP 0x0045779E, _BuildingClass_Take_Damage_ApplyDamage_S ;11
@LJMP 0x004577E7, _BuildingClass_Take_Damage_ApplyDamage_W ;9

[section .data] 
spread_explosion_damage dd 0
spread_explosion_warhead dd 0


[section .text] 
_BuildingClass_Take_Damage_CheckSpreadExplosionDamage:
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

_BuildingClass_Take_Damage_ApplyDamage_N:
    push dword[spread_explosion_warhead]
    add  edx,eax 
    push dword[spread_explosion_damage]
    jmp  0x00457716

_BuildingClass_Take_Damage_ApplyDamage_E:
    push dword[spread_explosion_warhead]
    add  eax,edx 
    push dword[spread_explosion_damage]
    jmp  0x0045775E

_BuildingClass_Take_Damage_ApplyDamage_S:
    push dword[spread_explosion_warhead]
    xor  ecx,ecx
    add  eax,ebx 
    push dword[spread_explosion_damage]
    jmp  0x004577A9

_BuildingClass_Take_Damage_ApplyDamage_W:
    push dword[spread_explosion_warhead]
    add  eax,ecx 
    push dword[spread_explosion_damage]
    jmp  0x004577F0
