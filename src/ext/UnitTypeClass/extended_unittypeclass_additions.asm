; No need to enable this
;@HOOK 0x005814A4 _UnitClass_Should_Crush_It_Crusher_Addition

_UnitClass_Should_Crush_It_Crusher_Addition:
    push ebx
    UnitTypeClass.Crusher.Get(eax,bl)
    cmp  bl,0
    pop  ebx
    jz   0x005814C2 ; Dont_Crush
    jmp  0x005814AD
