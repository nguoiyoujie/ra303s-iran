;----------------------------------------------------------------
; src/fixes/savegame_diskspace_fix.asm
;
; Fixes a rare issue where the game sometimes thinks you have don't have much disk space left if you actually have a lot left
; This fix changes the "get disk space" function to always return enough disk space to pass the game's checks
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
@HACK 0x004AB108,0x004AB13F,_Disk_Space_Available__Skip
    mov  eax,0x800001
    retn
@ENDHACK
