;----------------------------------------------------------------
; src/fixes/error_dialog_title_fix.asm
;
; Use "Red Alert" instead of "Command & Conquer" for the message box window title
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HOOK 0x005BE913 _Print_Sound_Error_Fix_Window_Title

str_redalert db"Red Alert",0

; this function shows a message box with the title "Command & Conquer"
; fix it to show "Red Alert" instead
_Print_Sound_Error_Fix_Window_Title:
    push str_redalert
    jmp  0x005BE918
