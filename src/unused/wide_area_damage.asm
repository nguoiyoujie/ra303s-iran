;@HOOK 0x004A38E5 _Combat_Wide_Area_Damage_FixInverseDamageSpread


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