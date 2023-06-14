;----------------------------------------------------------------
; src/features/combat_negativedamage.asm
;
; Negative damage adjustments.
; Allows generic weapons to use negative damage. Negative damage are not (yet) subject to spread rules so as not to risk introducing breaking changes to Medic and Mechanic heal.
; Allows AI use of negative damage weapons. This allows AI to use Medics and Mechanics
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as Medics and Mechanics was not given to the AI in the unmodified game. Modders and mappers beware.
;
;----------------------------------------------------------------

@HOOK 0x004A321B _Combat_Modify_Damage_NegativeDamage_Always_Count
@HOOK 0x004A325E _Combat_Modify_Damage_NegativeDamage_Always_Count2
@HOOK 0x004A3287 _Combat_Modify_Damage_NegativeDamage_Always_Count3
@HOOK 0x004A32AA _Combat_Modify_Damage_NegativeDamage_Always_Count4
@HOOK 0x004A32B1 _Combat_Modify_Damage_NegativeDamage_Always_Count5
@HOOK 0x00564517 _TechnoClass__AI_AllowAIToTargetAlliesWithNegativeDamageWeapons

_Combat_Modify_Damage_NegativeDamage_Always_Count:
; don't consider any distance or warhead checks, just apply the negative damage
    jmp  0x004A323E
    ;    jmp  0x004A3236

_Combat_Modify_Damage_NegativeDamage_Always_Count2:
; replace shr with sar to support negative values
    sar  ebx,0x8
    mov  esi,ebx
    jmp  0x004A3263


_Combat_Modify_Damage_NegativeDamage_Always_Count3:
; have idiv work with negative values
    push edx
    xor  edx,edx
    mov  eax,ecx
    cdq  ;sign extend to 64-bit edx:eax
    sar  ecx,0x1f
    idiv ebx
    pop  edx
    jmp  0x004A328E

_Combat_Modify_Damage_NegativeDamage_Always_Count4:
; do not subject negative values to MinDamage or MaxDamage, since that will truncate it to MinDamage
    sar  dl,0x1f
    push edx
    xor  edx,edx
    cdq  ;sign extend to 64-bit edx:eax
    idiv ebx
    mov  esi,eax
    pop  edx
    jmp  0x004A32B1

_Combat_Modify_Damage_NegativeDamage_Always_Count5:
    test eax,eax
    jle  0x004A32CE
    cmp  ecx,0x4
    jge  0x004A32C2
    jmp  0x004A32B6

_TechnoClass__AI_AllowAIToTargetAlliesWithNegativeDamageWeapons:
    push ecx
    mov  eax,ecx    ; ecx is the current unit
    mov  edx,-1
    call TechnoClass__Combat_Damage
    pop  ecx
    test eax,eax  
    jl   0x00564524
    mov  ebx,dword [ecx + 0x11]
    mov  eax,ecx
    jmp  0x0056451c
