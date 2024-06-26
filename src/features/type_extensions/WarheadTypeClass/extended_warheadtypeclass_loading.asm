;Read INI settings
;We want to expand the modifiers, so we move all offsets after modifiers to clear the way for future expansion. Turns out that there are only two int values, which both may as well be byte values. They can fit into the space that holds bool values. Very convenient, as we do not need to worry about moving the heavily used Modifier
@HOOK 0x0058FB6D _WarheadTypeClass__Read_INI_MoveNewOffsets_ExplosionSet_InfantryDeath
@HOOK 0x0058FC04 _WarheadTypeClass__Read_INI_Expand_Modifier_5_to_9
@HOOK 0x004EBF1D _Combat_InfantryDeathCheck
@HOOK 0x004A37BC _Combat_ExplosionSetCheck
@HOOK 0x005900C0 _ArmorType_NameFrom_Expand_Array
@HOOK 0x005900D4 _ArmorType_NameFrom_Expand_Array2



_WarheadTypeClass__Read_INI_MoveNewOffsets_ExplosionSet_InfantryDeath:
    WarheadTypeClass.ExplosionSet.Read(esi,edi)
    WarheadTypeClass.InfantryDeath.Read(esi,edi)

    push 0x80
    mov  ecx,str.ArmorDefault ;old: 0x005F1A04 ; ASCII "100%%,100%%,100%%,100%%,100%%"
    jmp  0x0058FBA3

_WarheadTypeClass__Read_INI_Expand_Modifier_5_to_9:
    ; the reading code can handle strings with less elements than expected, defaulting them to 0%
    cmp  dl,9
    jl   0x0058FBDC
    jmp  0x0058FC09

_Combat_InfantryDeathCheck:
    push edx
    xor  edx,edx
    WarheadTypeClass.InfantryDeath.Get(eax,dl)
    mov  eax,edx
    pop  edx
    xor  edi,edi
    cmp  eax,0x5
    ja   0x004EC066
    jmp  0x004EBF2B

_Combat_ExplosionSetCheck:
    push edx
    xor  edx,edx
    WarheadTypeClass.ExplosionSet.Get(eax,dl)
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


