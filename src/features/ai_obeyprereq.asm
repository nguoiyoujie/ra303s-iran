;----------------------------------------------------------------
; src/features/ai_obeyprereq.asm
;
; Via a Rules configuration, enforces prerequisites for AI in Singleplayer
;
;----------------------------------------------------------------

@HOOK 0x004D4064 _HouseClass_Can_Build_ComputerObeyPrereqInSP

_HouseClass_Can_Build_ComputerObeyPrereqInSP:
    cmp  byte [SingleplayerAIObeyPrerequisites], 1
    jz   0x004D407D
    test byte [esi + 0x42],0x2
    jnz  0x004D407D
    jmp  0x004D406A