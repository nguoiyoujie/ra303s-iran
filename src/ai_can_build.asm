@HOOK 0x004D4064 _HouseClass_Can_Build_ComputerObeyPrereqInSP

_HouseClass_Can_Build_ComputerObeyPrereqInSP:
    cmp  BYTE [SingleplayerAIObeyPrerequisites], 1
    jz   0x004D407D
    test BYTE [ESI + 0x42],0x2
    jnz  0x004D407D
    jmp  0x004D406A