;----------------------------------------------------------------
; src/features/battlecontrolterminated_delayblackscreen.asm
;
; Adds a fixed delay to "Battle Control Terminated", to prevent the fading screen from cutting off the announcer
; Adopting system tick and sleep methods thanks to CnCNet's implementation
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

cextern _imp__timeGetTime
cextern _imp__Sleep
cextern Conquer___Call_Back

%define BCTDelayms          2000 ; 2 seconds ; was 4


@HACK 0x004BDAB5,_EventClass_Execute_BattleControlTerminated_DelayBlackScreen
    push eax
    push edi
    call [_imp__timeGetTime]
    mov edi,eax
.Delay:
    call Conquer___Call_Back ; allow the speaker to speak, also prevent hang
    push 200
    call [_imp__Sleep] ; Sleep 200ms
    call [_imp__timeGetTime]
    sub dword eax,edi
    cmp eax,BCTDelayms
    jb .Delay
.Proceed:
    pop  edi
    pop  eax
    call 0x00426344 ; Is_Speaking()
    test eax,eax
    jz   0x004BDAC5
    call Conquer___Call_Back 
    jmp  .Proceed
@ENDHACK
