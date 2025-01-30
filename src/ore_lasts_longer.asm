

[section .data]
ReduceEveryOneCell dd 0

; NOTE THIS FILE IS ONLY FOR TESTING AND COMMENTED OUT IN MAIN.ASM

@HACK 0x0049FE2C,0x0049FE31,_CellCass__Reduce_Tiberium_Last_Longer
    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
    jnz  .Normal_Code
    cmp  dword[ReduceEveryOneCell],0
    jz   .Custom_Reduce
    mov  dword[ReduceEveryOneCell],0
.Normal_Code:
    inc  ebx
    cmp  ebx,edx
    jle  0x0049FE3D
    jmp  0x0049FE31
.Custom_Reduce:
    mov  dword[ReduceEveryOneCell],1
    mov  ebx,1
    jmp  0x0049FE4F
@ENDHACK
