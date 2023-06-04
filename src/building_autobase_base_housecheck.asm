; Autobase AI (if not human) uses Base buildings regardless of whether the House matches the AI. This adds such a check

@HOOK 0x004593AB _BuildingClass_ExitObject_Base_HouseCheck

; TO-DO: Control this behaviour via an INI key

_BuildingClass_ExitObject_Base_HouseCheck:
    test byte [eax + 0x42],2
    jnz  0x00459582
    push edx
    mov  edx,0x0067F28C ; BaseClass
    mov  dl,byte [edx + 0x18] ; BaseClass->House
    cmp  byte [eax + 1],dl
    pop  edx
    jne  .SkipBase_NextBuildable
    jmp  0x004593B5

.SkipBase_NextBuildable:
    xor  eax,eax
    jmp  0x004593F3
