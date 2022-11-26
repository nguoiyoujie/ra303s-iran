;Read INI settings
;We want to expand the modifiers, so we move all offsets after modifiers to clear the way for future expansion. Turns out that there are only two int values, which both may as well be byte values. They can fit into the space that holds bool values. Very convenient, as we do not need to worry about moving the heavily use Modifier
@HOOK 0x0058FB6D _WarheadTypeClass__Read_INI_MoveNewOffsets_ExplosionSet_InfantryDeath
@HOOK 0x0058FC04 _WarheadTypeClass__Read_INI_Expand_Modifier_5_to_9
@HOOK 0x004EBF1D _Combat_InfantryDeathCheck
@HOOK 0x004A37BC _Combat_ExplosionSetCheck
@HOOK 0x005900C0 _ArmorType_NameFrom_Expand_Array
@HOOK 0x005900D4 _ArmorType_NameFrom_Expand_Array2

@HOOK 0x004A3275 _Combat_Modify_Damage_SpreadFactor_Zero
@HOOK 0x004A321B _Combat_Modify_Damage_NegativeDamage_Always_Count
@HOOK 0x004A325E _Combat_Modify_Damage_NegativeDamage_Always_Count2
@HOOK 0x004A3287 _Combat_Modify_Damage_NegativeDamage_Always_Count3
@HOOK 0x004A32AA _Combat_Modify_Damage_NegativeDamage_Always_Count4
@HOOK 0x004A32B1 _Combat_Modify_Damage_NegativeDamage_Always_Count5

_WarheadTypeClass__Read_INI_MoveNewOffsets_ExplosionSet_InfantryDeath:
    WarheadTypeClass.ExplosionSet.Read(esi,edi)
    WarheadTypeClass.InfantryDeath.Read(esi,edi)

    push 0x80
    mov  ecx, str.ArmorDefault ;old: 0x005F1A04 ; ASCII "100%%,100%%,100%%,100%%,100%%"
    jmp  0x0058FBA3

_WarheadTypeClass__Read_INI_Expand_Modifier_5_to_9:
    ; the reading code can handle strings with less elements than expected, defaulting them to 0%
    cmp  dl, 9
    jl   0x0058FBDC
    jmp  0x0058FC09

_Combat_InfantryDeathCheck:
    push edx
    xor  edx,edx
    WarheadTypeClass.InfantryDeath.Get(eax, dl)
    mov  eax,edx
    pop  edx
    xor  edi,edi
    cmp  eax,0x5
    ja   0x004EC066
    jmp  0x004EBF2B

_Combat_ExplosionSetCheck:
    push edx
    xor  edx,edx
    WarheadTypeClass.ExplosionSet.Get(eax, dl)
    mov  eax,edx
    pop  edx
    dec  eax
    cmp  eax,0x5
    ja   0x004A35EE
    jmp  0x004A37C9

_ArmorType_NameFrom_Expand_Array:
    cmp  dl,0x9 ;change to 11 when class size is expanded
    jl   0x005900CC
    jmp  0x005900E9

_ArmorType_NameFrom_Expand_Array2:
    mov  dword eax,[eax*0x4 + strlist.ArmorTypes]
    jmp  0x005900DB


_Combat_Modify_Damage_SpreadFactor_Zero:
;if spread factor is 0, distances above 8 will not apply damage
    sub  eax,edx
    cmp  eax, 0x08
    jg   .DistanceOver8
    sar  eax,1
    jmp  0x004A328E
.DistanceOver8:
    xor  ebx,ebx ;set damage to 0
    xor  esi,esi ;set damage to 0
    jmp  0x004A328E

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
; have IDIV work with negative values
    push edx
    xor  edx,edx
    mov  eax,ecx
    cdq  ;sign extend to 64-bit edx:eax
    sar  ecx,0x1f
    idiv ebx
    pop  edx
    jmp  0x004A328E

_Combat_Modify_Damage_NegativeDamage_Always_Count4:
; do not subject negative values to MinDamage or MaxDamage
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

