    ; BasicPath had a distance check against StrayDistance or CloseEnoughDistance. 
	; This may prevent a move from being initiated if the destination is too close. 
	; Remove it, and rely on the game to check only when the unit is blocked

cextern Process_Mouse

@HACK 0x004C37A1,0x004C37A6,_FootClass__Is_On_Priority_Mission_Units_Outside_Map_Have_Priority
	mov  ebp,esp
	push eax
	test byte[eax+TechnoClass.Offset.IsLocked],1<<(TechnoClass.Bit.IsLocked-1)
	pop  eax
	jz   .Ret1
	mov  eax,[eax+0x24]
	jmp  0x004C37A6
.Ret1:
	mov  al,1
	jmp  0x004C37AF
@ENDHACK


@HACK 0x004C0A36,0x004C0A3C,_FootClass__BasicPath_Units_Outside_Map_Ignore_CloseEnough
	push eax
	test byte[eax+TechnoClass.Offset.IsLocked],1<<(TechnoClass.Bit.IsLocked-1)
	jnz  .Ret
	xor  eax,eax
	jmp  0x004C0A5C
.Ret:
	pop  eax
	jmp  0x004C0A3C
@ENDHACK

; TO-DO: Check if this actually does anything useful...
;@SJMP 0x004C0A88,0x004C0A8E ; _FootClass__BasicPath_AlwaysPathToExactNavCom


