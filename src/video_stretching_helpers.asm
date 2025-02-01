;----------------------------------------------------------------
; src/hires/video_stretching_helpers.asm
;
; When higher resolution is used, some elements cannot be resized to the new viewport readily.
; Implement a flag to communicate to cnc-ddraw to resize the viewport on their end, thus stretching the video to fit the space
;
; WARNING: The address is hardcoded in cncddraw (Iran/FunkyFr3sh's ddraw wrapper). Do not modify unless you know are you are doing.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
;use the unused 'Processor' byte at 0x00607D78 (in MMX_Single_Line_Trans / KEYFBUFF.ASM), this is supposed to be used to store CPU procressor info
;but isn't actually used

extern MapSel___Map_Selection
extern ScoreClass__Presentation
extern Score___Multi_Score_Presentation

%define __processor 0x00607D78

@HACK 0x0053AF3B,0x0053AF40,_Campaign_Do_Win_ScoreClass__Presentation
    mov  byte[__processor],1
    call ScoreClass__Presentation
    mov  byte[__processor],0
    jmp  0x0053AF40
@ENDHACK


@HACK 0x0053B037,0x0053B03C,_Campaign_Do_Win_Map_Selection
    mov  byte[__processor],1
    call MapSel___Map_Selection
    mov  byte[__processor],0
    jmp  0x0053B03C
@ENDHACK


@HACK 0x0053ADF6,0x0053ADFB,_Campaign_Do_Win_Multiplayer_Score_Presentation
    mov  byte[__processor],1
    call Score___Multi_Score_Presentation
    mov  byte[__processor],0
    jmp  0x0053ADFB
@ENDHACK


@HACK 0x0053B3E6,0x0053B3EB,_Do_Win_Multiplayer_Score_Presentation
    mov  byte[__processor],1
    call Score___Multi_Score_Presentation
    mov  byte[__processor],0
    jmp  0x0053B3EB
@ENDHACK


@HACK 0x0053B6CF,0x0053B6D4,_Do_Lose_Multiplayer_Score_Presentation
    mov  byte[__processor],1
    call Score___Multi_Score_Presentation
    mov  byte[__processor],0
    jmp  0x0053B6D4
@ENDHACK
