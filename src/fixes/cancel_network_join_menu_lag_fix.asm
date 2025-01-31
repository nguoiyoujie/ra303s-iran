;----------------------------------------------------------------
; src/fixes/cancel_network_join_menu_lag_fix.asm
;
; Fixes the lag when Network Join was cancelled.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@SJMP 0x00508AB7,0x00508ACD ; _Net_Join_Dialog_Cancel_Lag_Fix

