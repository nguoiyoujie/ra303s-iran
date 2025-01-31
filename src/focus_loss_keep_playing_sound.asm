;----------------------------------------------------------------
; src/fixes/focus_loss_keep_playing_sound.asm
;
; Allows the music to persist internally when Alt-Tab is used in the game to access other windows.
; Effectively this prevents the music from resetting and changing when leaving the game window.
; 
; This function is activated by default and is not configurable.
; No compatibility issues is expected. 
;
;----------------------------------------------------------------
; Fixes the "music changes when alt+tabbing out" bug for some reason
@SJMP 0x005B3491,0x005B349B ; _Focus_Loss

;@HACK 0x005B3624,_Check_For_Focus_Loss
;    mov  ebp,800000
;    xor  eax,eax
;    retn
;@ENDHACK


;@HACK 0x005BF220,_Attempt_Audio_Restore
;    retn
;@ENDHACK
