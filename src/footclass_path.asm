    ; BasicPath had a distance check against StrayDistance or CloseEnoughDistance. 
    ; This may prevent a move from being initiated if the destination is too close. 
    ; Remove it, and rely on the game to check only when the unit is blocked

%assign PathAbandonLimit    0x96  ; 150 frames

[section .data]
Temp.Path.Vessel dd 0 

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
;@SJMP 0x0057F0C5,0x0057F0FB ;_UnitClass_Can_Enter_Cell_SkipNavCom_Check


@HACK 0x004EDB70,0x004EDB79,_InfantryClass_Can_Enter_Cell_HandleFriendlyBlockedCell
	cmp  byte[ebx+FootClass.Offset.PathAbandon],PathAbandonLimit
	jle  .MoveMovingBlock
.MoveAbandon:
    mov  byte[ebp-0x10],5 ; MOVE_NO
	mov  byte[ebx+FootClass.Offset.PathAbandon],0 ; reset
    jmp  0x004EDB79
.MoveMovingBlock:
    inc  byte[ebx+FootClass.Offset.PathAbandon]
    mov  byte[ebp-0x10],2 ; MOVE_MOVING_BLOCK
    jmp  0x004EDB79
@ENDHACK


@HACK 0x004EDB83,0x004EDB8C,_InfantryClass_Can_Enter_Cell_HandleFriendlyBlockedCell2
	cmp  byte[ebx+FootClass.Offset.PathAbandon],PathAbandonLimit
	jle  .MoveTemp
.MoveAbandon:
    mov  byte[ebp-0x10],5 ; MOVE_NO
	mov  byte[ebx+FootClass.Offset.PathAbandon],0 ; reset
    jmp  0x004EDB8C
.MoveTemp:
    inc  byte[ebx+FootClass.Offset.PathAbandon]
    mov  byte[ebp-0x10],4 ; MOVE_TEMP
    jmp  0x004EDB8C
@ENDHACK


@HACK 0x004EDCA4,0x004EDCAA,_InfantryClass_Can_Enter_Cell_MoveOKResetCounter
    cmp  byte[ebp-0x10],0
    jne  0x004EDCE8
	mov  byte[ecx+FootClass.Offset.PathAbandon],0 ; reset
    jmp  0x004EDCAA
@ENDHACK


@HACK 0x0057F00C,0x0057F015,_UnitClass_Can_Enter_Cell_HandleFriendlyBlockedCell
	cmp  byte[ebx+FootClass.Offset.PathAbandon],PathAbandonLimit
	jle  .MoveMovingBlock
.MoveAbandon:
    mov  byte[ebp-0x10],5 ; MOVE_NO
	mov  byte[ebx+FootClass.Offset.PathAbandon],0 ; reset
    jmp  0x0057F015
.MoveMovingBlock:
    inc  byte[ebx+FootClass.Offset.PathAbandon]
    mov  byte[ebp-0x10],2 ; MOVE_MOVING_BLOCK
    jmp  0x0057F015
@ENDHACK


@HACK 0x0057F0BC,0x0057F0C5,_UnitClass_Can_Enter_Cell_HandleFriendlyBlockedCell2
	cmp  byte[ebx+FootClass.Offset.PathAbandon],PathAbandonLimit
	jle  .MoveTemp
.MoveAbandon:
    mov  byte[ebp-0x10],5 ; MOVE_NO
	mov  byte[ebx+FootClass.Offset.PathAbandon],0 ; reset
    jmp  0x0057F0C5
.MoveTemp:
    inc  byte[ebx+FootClass.Offset.PathAbandon]
    mov  byte[ebp-0x10],4 ; MOVE_TEMP
    jmp  0x0057F0C5
@ENDHACK


@HACK 0x0057F198,0x0057F19E,_UnitClass_Can_Enter_Cell_MoveOKResetCounter
    cmp  byte[ebp-0x24],0
    jne  0x0057F208
	mov  byte[ecx+FootClass.Offset.PathAbandon],0 ; reset
    jmp  0x0057F19E
@ENDHACK


; this is not sufficient for Vessel class, as they might not have a scatter logic built for them
@HACK 0x00589ED5,0x00589EDA,_VesselClass_Can_Enter_Cell_Save_VesselClass
    mov  esi,eax
    mov  [Temp.Path.Vessel],eax
    movsx ecx,dx
    jmp  0x00589EDA
@ENDHACK


@HACK 0x0058A02A,0x0058A030,_VesselClass_Can_Enter_Cell_HandleBlockedCell
    jz   0x0058A030
    mov  esi,[Temp.Path.Vessel]
	cmp  byte[esi+FootClass.Offset.PathAbandon],PathAbandonLimit
	jle  .MoveMovingBlock
.MoveAbandon:
    mov  byte[ebp-0x10],5 ; MOVE_NO
	mov  byte[esi+FootClass.Offset.PathAbandon],0 ; reset
    jmp  0x0058A030
.MoveMovingBlock:
    inc  byte[esi+FootClass.Offset.PathAbandon]
    mov  byte[ebp-0x10],2 ; MOVE_MOVING_BLOCK
    jmp  0x0058A030
@ENDHACK
