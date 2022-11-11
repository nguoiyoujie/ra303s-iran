@HOOK 0x004BDAB5 _EventClass_Execute_BattleControlTerminated_DelayBlackScreen

%define BCTInitDelay          0xE80000 ; by trial and error

bctdelay dd 0


_EventClass_Execute_BattleControlTerminated_DelayBlackScreen:
    mov  dword [bctdelay], BCTInitDelay
.Delay:
    cmp  dword [bctdelay], 0
	jz   .Proceed
    mov  eax, dword [bctdelay]
    dec  eax
    mov  dword [bctdelay], eax
    jmp  .Delay
.Proceed:
    call 0x00426344 
    test eax, eax
    jz   0x004BDAC5
    call 0x004A765C 
    jmp  .Proceed

