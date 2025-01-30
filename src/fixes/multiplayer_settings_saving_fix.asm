;----------------------------------------------------------------
; src/fixes/multiplayer_settings_saving_fix.asm
;
; Properly saves the Session Type. 
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@LJMP 0x0051614C, _Skirmish_Menu_Write_Multiplayer_Settings
@LJMP 0x00509C22, _Network_Menu_Write_Multiplayer_Settings

_Skirmish_Menu_Write_Multiplayer_Settings:
    mov  eax,Globals___Session_Type
    jmp  0x00516153

_Network_Menu_Write_Multiplayer_Settings:
    call 0x005C21E0

    mov  eax,Globals___Session_Type
    call 0x0054B510

    jmp  0x00509C27
