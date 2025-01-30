;----------------------------------------------------------------
; src/features/battlecontrolterminated_delayblackscreen.asm
;
; Adds a fixed delay to "Battle Control Terminated", to prevent the fading screen from cutting off the announcer
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

; This is experimental, as sometimes the game blackouts before the announcer finishes saying "Battle Control Terminated"
; This should be replaced by a proper announcer check
@LJMP 0x004BDAB5, _EventClass_Execute_BattleControlTerminated_DelayBlackScreen

%define BCTInitDelay          0xE80000 ; by trial and error

[section .data] 
bctdelay dd 0


[section .text] 
_EventClass_Execute_BattleControlTerminated_DelayBlackScreen:
    mov  dword[bctdelay],BCTInitDelay
.Delay:
    cmp  dword[bctdelay],0
	jz   .Proceed
    mov  eax,dword[bctdelay]
    dec  eax
    mov  dword[bctdelay],eax
    call Conquer___Call_Back 
    jmp  .Delay
.Proceed:
    call 0x00426344 
    test eax,eax
    jz   0x004BDAC5
    call Conquer___Call_Back 
    jmp  .Proceed

