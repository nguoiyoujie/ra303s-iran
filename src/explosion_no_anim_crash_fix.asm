; When a warhead attempts to explode with an invalid Explosion number, Combat_Anim function returns ANIM_NONE (-1).
; In TechnoClass::Take_Damage, the game tries to create an animation with ANIM_NONE anyway, which results in a crash.
; The code we are hooking in is past the point where the AnimClass is allocated, we cannot skip the initialization at this stage, so we modify the animation to ANIM_NAPALM2 (8)

@HOOK 0x005665D3 _TechnoClass_Take_Damage_SkipAnim_if_ANIM_NONE
@HOOK 0x00566547 _TechnoClass_Take_Damage_UseDeathWeapon
;@HOOK 0x004A38E5 _Combat_Wide_Area_Damage_FixInverseDamageSpread



_TechnoClass_Take_Damage_SkipAnim_if_ANIM_NONE:
; check eax return of Combat_Anim

    cmp   al,0xFF
	;jz    0x005665E1  ;; AnimClass already allocated, skipping will result in crash
	jnz   .Normal
	mov   al,8 ;ANIM_NAPALM2
.Normal:
    mov   ebx,dword [ebp - 0x20]
    movsx edx,al
    mov   eax,dword [ebp - 0x1c]
    jmp   0x005665DC
	

_TechnoClass_Take_Damage_UseDeathWeapon:
    mov  edx,dword [eax + TechnoTypeClass.Offset.DeathWeapon]
    test edx,edx

    jz   .UsePrimaryWeapon
    mov  edx,dword [esi + 0x11]
    mov  eax,esi
    call dword [edx + 0x34]
    mov  eax,dword [eax + TechnoTypeClass.Offset.DeathWeapon]
; Use the Weapon damage
	mov  edi,dword [eax + WeaponTypeClass.Offset.Damage]
    mov  eax,dword [eax + WeaponTypeClass.Offset.WarheadPtr]
    mov  al,byte [eax]
    mov  byte [ebp - 0x14],al
    ;jmp  0x0056656A ; use unit's MaxStrength as the blast damage
    jmp  0x0056657B


.UsePrimaryWeapon:
    mov  edx,dword [eax + TechnoTypeClass.Offset.PrimaryWeapon]
    jmp  0x0056654D
	
	
; Genius move by Westwood.
; In Combat::Wide_Area_Damage
; 	int damage = rawdamage * Inverse(fixed(cell_radius, dist_from_center)); 
; was used, when
;   int damage = rawdamage * fixed(cell_radius, dist_from_center); 
; is the correct multiplication

;_Combat_Wide_Area_Damage_FixInverseDamageSpread:
;    mov  edx,eax
	; we swap ebx and edx, inversing the inverse
;    mov  ebx,edi
;    lea  eax, [ebp -0x14]
;    jmp  0x004A38EC
