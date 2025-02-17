;----------------------------------------------------------------
; src/features/ui_list_enhancements.asm
;
; Strangely, the list functionality allowed using the keyboard to scroll downwards and loop back to start from the bottom, but does not do that for the up key.
; This code allows the up scroll to loop to the end of the list.
; 
; This function is enabled by setting [<AircraftType>] Large=true.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x004FCC4C,0x004FCC51,ListClass__Set_Selected_Index__CheckBelowZero
    mov  ecx,[ecx+0x10]
    cmp  edx,0
    jg   .Continue
    add  edx,ecx
.Continue:
    cmp  edx,ecx
    jnc  0x004FCCA3
    jmp  0x004FCC53
@ENDHACK

