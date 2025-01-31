; unused
; Crashes sometimes with 7 AI players, seems to try to get an eight one then


;[section .data] 
;usedremaps: TIMES 25 db 0
;%define amountofremaps    10    ; Total amount of remaps starting from 0, the default is 7 (so 8 remaps)
;
;
;@HACK 0x0053E158,0x0053E15D,_Assign_Houses_Colour_Remaps_NULL_Check
;;    cmp  eax,0x14
;;    jz   0x0053E184
;;    call HouseClass__As_Pointer
;;    jmp  0x0053E15D
;@ENDHACK
;
;
;@HACK 0x0053B81D,0x0053B823,_Assign_Houses_Colour_Remaps_Cleanup
;    xor  edx,edx
;.Loop:
;    mov  byte[usedremaps+edx],0
;    inc  edx
;    cmp  edx,24
;    jnz  .Loop
;    pop  edi
;    pop  esi
;    pop  edx
;    pop  ecx
;    pop  ebx
;    pop  ebp
;    jmp  0x0053B823
;@ENDHACK
;
;
;@HACK 0x0053DFCE,0x0053DFD3,_Assign_Houses_Color_Remaps_Index_Check2
;    mov  byte[usedremaps+edx],1
;    call 0x004D8CA8
;    jmp  0x0053DFD3
;@ENDHACK
;
;
;@HACK 0x0053E052,0x0053E057,_Assign_Houses_Color_Remaps_Indexes
;    mov  edi,amountofremaps
;    jmp  0x0053E057
;@ENDHACK
;
;
;@HACK 0x0053E069,0x0053E06F,_Assign_Houses_Color_Remaps_Index_Check
;    cmp  byte cl,[usedremaps+ebx]
;    jnz  0x0053E059
;    mov  byte[usedremaps+ebx],1
;    jmp  0x0053E06F
;@ENDHACK
;