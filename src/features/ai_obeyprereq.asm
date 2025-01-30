;----------------------------------------------------------------
; src/features/ai_obeyprereq.asm
;
; Via a Rules configuration, enforces prerequisites for AI in Singleplayer
;
;----------------------------------------------------------------

;@LJMP 0x004D4064, _HouseClass_Can_Build_ComputerObeyPrereqInSP

;@CLEAR 0x004D4069,0x90,0x004D406A
;_HouseClass_Can_Build_ComputerObeyPrereqInSP:
;    cmp  byte[Rules.AI.SingleplayerAIObeyPrerequisites],1
;    jz   0x004D407D
;    test byte[esi+0x42],0x2
;    jnz  0x004D407D
;    jmp  0x004D406A