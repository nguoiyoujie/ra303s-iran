;----------------------------------------------------------------
; src/fixes/cpu_affinity_freeze_crash.asm
;
; Fix the freeze/crash due to audio
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
; Fixes lagging audio and movies
@HACK 0x005C5AFE,0x005C5B05,_VQA_Play_SetPriorityClass_NOP_Out
    add  esp,8
    jmp  0x005C5B05
@ENDHACK


@HACK 0x005C5D71,0x005C5D78,_VQA_Play_SetPriorityClass_NOP_Out2
    add  esp,8
    jmp  0x005C5D78
@ENDHACK
