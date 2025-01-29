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
@LJMP 0x005C5AFE, _VQA_Play_SetPriorityClass_NOP_Out
@LJMP 0x005C5D71, _VQA_Play_SetPriorityClass_NOP_Out2

_VQA_Play_SetPriorityClass_NOP_Out2:
    add  esp,8
    jmp  0x005C5D78

_VQA_Play_SetPriorityClass_NOP_Out:
    add  esp,8
    jmp  0x005C5B05
