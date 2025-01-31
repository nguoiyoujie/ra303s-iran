;----------------------------------------------------------------
; src/fixes/modem_menu_remove.asm
;
; Remove serial/modem menu dialogs by making "Modem/Serial" button in the "Multiplayer Game" menu not do anything
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
@HACK 0x00503C20,0x00503C25,_Select_MPlayer_Game_Serial_Menu
    xor  eax,eax
    jmp  0x00503C25
@ENDHACK
