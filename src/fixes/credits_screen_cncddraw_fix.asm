;----------------------------------------------------------------
; src/fixes/credits_screen_cncddraw_fix.asm
;
; Fixes the credits screen by removing the background
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

[section .rdata]
str_derppp db"derpppp",0

@SJMP 0x004BB74A,0x004BB74F ; Slide_Show_Credits_CnCDDraw_Crash_Fix
@SET 0x004BC2E5,{mov edi,str_derppp} ; _Slide_Show_No_Background

