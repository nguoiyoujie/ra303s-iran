;----------------------------------------------------------------
; src/fixes/score_screen_print_colour_fix.asm
;
; Sets the font colors properly in the score screen
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
@LJMP 0x005431C0, _ScoreClass__Do_GDI_Graph_Force_Font_Colour

_ScoreClass__Do_GDI_Graph_Force_Font_Colour:
    Save_Registers

    push 0xF
    push 0

    mov  eax,0x00604C74 ; offset Score_Soviet_Red
    cmp  dword[ebp-0xC8],1
    je   .Soviet_Colour

    mov  eax,0x00604C54 ; offset Score_Allies_Blue

.Soviet_Colour:

    push eax
    call 0x005CC454; Set_Font_Colour?
    add  esp,0xC

    Restore_Registers
    mov  eax,[ebp-0xB8]
    jmp  0x005431C6
