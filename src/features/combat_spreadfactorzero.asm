;----------------------------------------------------------------
; src/features/combat_spreadfactorzero.asm
;
; Spread factor adjustments
; Mainly for Medic/Mechanic weapons, as they are supposed to be pinpoint weapons.
; Yet all weapons target the position, instead of the object. It explains why healing is a lot less effective on a moving object.
; This behavior is not changed. Rather, it is generalized - i.e. no longer exclusive to negative damage weapons - and maintained here due to other changes (combat_negativedamage) that dehardcodes negative damage weapons.
;
;----------------------------------------------------------------

@LJMP 0x004A3275, _Combat_Modify_Damage_SpreadFactor_Zero

_Combat_Modify_Damage_SpreadFactor_Zero:
;if spread factor is 0, distances above 8 will not apply damage, overriding distance adjustments
    sub  eax,edx
    cmp  eax, 0x08
    jg   .DistanceOver8
    sar  eax,1
    jmp  0x004A328E
.DistanceOver8:
    xor  ebx,ebx ;set damage to 0
    xor  esi,esi ;set damage to 0
    jmp  0x004A328E
