;----------------------------------------------------------------
; src/features/specialweapons/paradrop.asm
;
; Handles the Paradrop special weapon
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@HACK 0x004D5AAA,0x004D5AB1,_HouseClass__Super_Weapon_Handler_Paradrop_Check1
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x20   ; PARA_INFANTRY 1 << 5
    pop  ebx   
    pop  ecx   
    jmp  0x004D5AB1
@ENDHACK


@HACK 0x004D5AFF,0x004D5B06,_HouseClass__Super_Weapon_Handler_Paradrop_Check2
    push ecx
    push ebx
    xor  ebx,ebx
    mov  bl,byte[esi+1] ; ID
    lea  ecx,[Houses.SpecialScan]
    lea  ecx,[ecx+ebx*4]
    test dword[ecx],0x20   ; PARA_INFANTRY 1 << 5
    pop  ebx   
    pop  ecx   
    jmp  0x004D5B06
@ENDHACK

