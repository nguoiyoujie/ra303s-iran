;----------------------------------------------------------------
; src/features/no_screenshake.asm
;
; Removes screenshake
;
; This function is enabled by including the following key(s): 
;   Rules.ini > [General] > NoScreenShake=true/false
;   Spawn.ini > [Settings] > NoScreenShake=true/false
;
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@HACK 0x004AB678,0x004AB67F,_Shake_The_Screen_Return_At_Prologue
    cmp  byte[Rules.General.NoScreenShake],1
    jz   .Early_Return
    push ebp
    mov  ebp,esp
    push ebx
    push ecx
    push edx
    push esi
    jmp  0x004AB67F
.Early_Return:
    jmp  0x004ABF4A ; jump to retn instruction at the end of the function
@ENDHACK
