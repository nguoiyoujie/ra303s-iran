;----------------------------------------------------------------
; src/fixes/multiplayer_settings_saving_fix.asm
;
; Properly saves the Session Type. 
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@HACK 0x0051614C,0x00516153,_Skirmish_Menu_Write_Multiplayer_Settings
    mov  eax,Globals___Session_Type
    jmp  0x00516153
@ENDHACK


@HACK 0x00509C22,0x00509C27,_Network_Menu_Write_Multiplayer_Settings
    call 0x005C21E0 ; Show_Mouse()
    mov  eax,Globals___Session_Type
    call 0x0054B510
    jmp  0x00509C27
@ENDHACK
