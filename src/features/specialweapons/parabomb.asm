;----------------------------------------------------------------
; src/features/specialweapons/parabomb.asm
;
; Handles the Parabomb special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D5B6C,0x004D5B73,_HouseClass__Super_Weapon_Handler_Parabomb_Check1
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x10   ; PARA_BOMB 1 << 4
    pop  ebx   
    pop  ecx   
    jmp  0x004D5B73
@ENDHACK


@HACK 0x004D5BBD,0x004D5BC4,_HouseClass__Super_Weapon_Handler_Parabomb_Check2
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x10   ; PARA_BOMB 1 << 4
    pop  ebx   
    pop  ecx   
    jmp  0x004D5BC4
@ENDHACK
