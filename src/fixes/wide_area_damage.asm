;----------------------------------------------------------------
; src/fixes/wide_area_damage.asm
;
; The damage calculation for Wide area damage is incorrect, as the damage is inversed. Meaning the damage was the weakest at the center.
; This fixes the calculation
; 
; This function is enabled by including the following key in Rules.ini. 
;   Rules.ini > [General] > FixWideAreaDamage=true
;
; Defaults to false
;
;----------------------------------------------------------------

cextern Rules.General.FixWideAreaDamage

; Genius move by Westwood.
; In Combat::Wide_Area_Damage
; 	int damage = rawdamage * Inverse(fixed(cell_radius, dist_from_center)); 
; was incorrect, use
;   int damage = rawdamage - rawdamage * Inverse(fixed(cell_radius, dist_from_center));
; instead

@HACK 0x004A39BE,0x004A39C4,_Combat_Wide_Area_Damage_FixInverseDamageSpread
    mov  edx,[ebp-0x60] ; original damage
    cmp  byte[Rules.General.FixWideAreaDamage],0
    jz   .Continue
    mov  eax,[ebp-0x54] ; max damage
    cmp  edx,eax
    jl   .Subtract
.Truncate:
    xor  edx,edx ; set to 0
    jmp  .Continue
.Subtract:
    sub  eax,edx ; max damage - original damage
    mov  edx,eax    
.Continue:
    mov  [ebp-0x60],edx ; update damage (for scorch determination)
    mov  eax,[ebp-0x58] ; restore
    jmp  0x004A39C4
@ENDHACK
