;----------------------------------------------------------------
; src/fixes/error_dialog_title_fix.asm
;
; One of the error dialog boxes used "Command & Conquer" as its title. Use "Red Alert" instead of "Command & Conquer"
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
cextern str_RedAlert

@SET 0x005BE913,{push str_RedAlert} ; _Print_Sound_Error_Fix_Window_Title
