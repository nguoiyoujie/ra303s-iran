;----------------------------------------------------------------
; src/features/building_autobase_base_housecheck.asm
;
; Autobase AI (if not human) uses Base buildings regardless of whether the House matches the AI. This adds such a check, ensuring only the player indicated in the [Base] Section performs production
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@HACK 0x004593AB,_BuildingClass_ExitObject_Base_HouseCheck
    ; TO-DO: Control this behaviour via an INI key
    test byte[eax+0x42],2
    jnz  0x00459582
    push edx
    mov  dl,byte[Globals___Base_House]
    cmp  byte[eax+1],dl
    pop  edx
    jne  .SkipBase_NextBuildable
    jmp  0x004593B5
.SkipBase_NextBuildable:
    xor  eax,eax
    jmp  0x004593F3
@ENDHACK
