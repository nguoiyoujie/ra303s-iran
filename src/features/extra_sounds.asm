;----------------------------------------------------------------
; src/features/extra_sounds.asm
;
; Enables the use of unused sound effects that was present in the mix files. Namely, GRENADE1 and MGUNINF1
; 
; This function is enabled by the keys:
;   For GRENADE1: RedAlert.ini > [Options] > UseGrenadeThrowingSound=yes
;   For MGUNINF1: RedAlert.ini > [Options] > AlternativeRifleSound=yes
; 
; No compatibility issues is expected as the map dimensions was not expected to be changed in the unmodified game.
; Mod Warning: Enabling this will override the Report= keys that the original weapon uses! Mods may choose to modify the weapons' Report= keys directly instead.
;
;----------------------------------------------------------------

@LJMP 0x0058FF40,_Change_Weapon_Sounds

_Change_Weapon_Sounds:
    call 0x00463428

    cmp  byte[esi],12 ; [M1Carbine]
    jz   .Modify_Grenade_Sound

    cmp  byte[esi],9 ; [Grenade]
    jz   .Modify_Rifle_Sound

.No_Change:
    jmp  0x0058FF45

.Modify_Grenade_Sound:
    cmp  byte[RedAlert.Options.UseGrenadeThrowingSound],1
    jnz  .No_Change

    mov  word[esi+0x23],41 ; GRENADE1
    jmp  0x0058FF49

.Modify_Rifle_Sound:
    cmp  byte[RedAlert.Options.AlternativeRifleSound],1
    jnz  .No_Change

    mov  word[esi+0x23],56 ; MGUNINF1
    jmp  0x0058FF49
