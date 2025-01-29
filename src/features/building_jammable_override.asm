;----------------------------------------------------------------
; src/features/building_jammable_override.asm
;
; Buildings now use IsJammable. Which disables radar and attack.
;
; This function is enabled by setting [<BuildingType>] > IsJammable=true
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@LJMP 0x004566CB, _BuildingClass_AI_UseIsJammable
@LJMP 0x0045C88E, _BuildingClass_MissionAttack_Jammed_PreventsAttack
@LJMP 0x0057B0F2, _UnitClass_Take_Damage_UseIsNoSmoke

_BuildingClass_AI_UseIsJammable:
    ; eax is the id
    push ebx
    push ecx
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.IsJammable.Get(ebx,cl)
    test cl,cl
    pop  ecx
    pop  ebx
    jz   0x00456814
    jmp  0x0045670A; 0x004566D0



_BuildingClass_MissionAttack_Jammed_PreventsAttack:
    test byte [esi + 0xd7],0x10
    jnz  0x0045CB26
    mov  al,byte [eax + 1a4h]
    jmp  0x0045C894	


_UnitClass_Take_Damage_UseIsNoSmoke:
    ; eax is the id
    push eax
    push ebx
    push ecx
    movzx eax,al
    UnitTypeClass.FromIndex(eax,ebx)
    UnitTypeClass.IsNoSmoke.Get(ebx,cl)
    test cl,cl
    pop  ecx
    pop  ebx
    pop  eax
    jnz  0x0057B1CA
    cmp  eax,0xe
    jz   0x0057B1CA
    jmp  0x0057B0FB
    
