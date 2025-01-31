;----------------------------------------------------------------
; src/fixes/animate_score_objects_crash_fix.asm
;
; Fix the crash during the score animation, in case a certain buffer is NULL
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@HACK 0x005464EE,0x005464F3,_Animate_Score_Objs_PseudoSeenBuff_NULL_Check
    cmp  dword esi,0
    je   .Ret
    mov  eax,[esi+0x20]
    xor  edi,edi
    jmp  0x005464F3
.Ret:
    jmp  0x005464B8
@ENDHACK
