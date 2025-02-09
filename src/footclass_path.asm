    ; BasicPath had a distance check against StrayDistance or CloseEnoughDistance. 
    ; This may prevent a move from being initiated if the destination is too close. 
    ; Remove it, and rely on the game to check only when the unit is blocked

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

; AI units tend to get stuck. Here's how to unstick them...

; test: see if this releases blocking units
@SJMP 0x0057F0C5,0x0057F0FB ;_UnitClass_Can_Enter_Cell_SkipNavCom_Check


@HACK 0x004EDB70,0x004EDB79,_InfantryClass_Can_Enter_Cell_HandleFriendlyBlockedCell
	cmp  byte[ebx+FootClass.Offset.PathAbandon],0
	jg   .MoveMovingBlock
.MoveAbandon:
    mov  byte[ebp-0x10],5 ; MOVE_NO
	mov  byte[ebx+FootClass.Offset.PathAbandon],0x5A ; 90 frames
    jmp  0x004EDB79
.MoveMovingBlock:
    mov  byte[ebp-0x10],2 ; MOVE_MOVING_BLOCK
    jmp  0x004EDB79
@ENDHACK


@HACK 0x004EDB83,0x004EDB8C,_InfantryClass_Can_Enter_Cell_HandleFriendlyBlockedCell2
	cmp  byte[ebx+FootClass.Offset.PathAbandon],0
	jg   .MoveTemp
.MoveAbandon:
    mov  byte[ebp-0x10],5 ; MOVE_NO
	mov  byte[ebx+FootClass.Offset.PathAbandon],0x5A ; 90 frames
    jmp  0x004EDB8C
.MoveTemp:
    mov  byte[ebp-0x10],4 ; MOVE_TEMP
    jmp  0x004EDB8C
@ENDHACK


@HACK 0x0057F00C,0x0057F015,_UnitClass_Can_Enter_Cell_HandleFriendlyBlockedCell
	cmp  byte[ebx+FootClass.Offset.PathAbandon],0
	jg   .MoveMovingBlock
.MoveAbandon:
    mov  byte[ebp-0x10],5 ; MOVE_NO
	mov  byte[ebx+FootClass.Offset.PathAbandon],0x5A ; 90 frames
    jmp  0x0057F015
.MoveMovingBlock:
    mov  byte[ebp-0x10],2 ; MOVE_MOVING_BLOCK
    jmp  0x0057F015
@ENDHACK


@HACK 0x0057F0BC,0x0057F0C5,_UnitClass_Can_Enter_Cell_HandleFriendlyBlockedCell2
	cmp  byte[ebx+FootClass.Offset.PathAbandon],0
	jg   .MoveTemp
.MoveAbandon:
    mov  byte[ebp-0x10],5 ; MOVE_NO
	mov  byte[ebx+FootClass.Offset.PathAbandon],0x5A ; 90 frames
    jmp  0x0057F0C5
.MoveTemp:
    mov  byte[ebp-0x10],4 ; MOVE_TEMP
    jmp  0x0057F0C5
@ENDHACK
