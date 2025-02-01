
extern Globals___Session_Type

@HACK 0x0041CB90,0x0041CB95,Count_as_Civ_Evac_Check
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jnz  .Check_EvacInMP_Keyword
    jmp  .Normal_Function
.Check_EvacInMP_Keyword:
    cmp  byte[Rules.General.EvacInMP],1
    jz   .Normal_Function
    xor  eax,eax
    retn
.Normal_Function:
    push ebp
    mov  ebp,esp
    push ebx
    push ecx
    jmp  0x0041CB95
@ENDHACK

