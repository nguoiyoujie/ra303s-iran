;----------------------------------------------------------------
; src/features/mousewheel_scrolling.asm
;
; Enables scrolling over the sidebar using the mousewheel
;
; This function is enabled by the folliwing key:
;   RedAlert.ini > [Options] > MouseWheelScrolling=yes
;
; No compatibility issues is expected as this function was not present in the unmodified game.
;
;----------------------------------------------------------------

cextern SidebarClass__Scroll
cextern Globals___Map
cextern Globals___PlayerPtr


[section .data] 
Scrolling db 0


; Intercepting void Check_For_Focus_Loss(void) in WINSTUB.CPP
@HACK 0x005B38DD,0x005B38E2,_Mouse_Wheel_Sidebar_Scrolling
    cmp  byte[RedAlert.Options.MouseWheelScrolling],1
    jnz  .out
    mov  esi,[ebp+0xC]
    cmp  esi,0x20A ;WM_MOUSEHWHEEL
    jnz  .out
    mov  ecx,[Globals___PlayerPtr]
    test ecx,ecx
    jz   .out
    mov  cl,byte[Scrolling]
    test cl,cl
    jnz  .out
;    mov        ebx,2
;    mov        eax,[0x00665EB0]
;    call    0x005BBF30 ;   WinTimerClass::Get_System_Tick_Count(void)
;    cdq
;    idiv    ebx
;    cmp        dword edx,0
;    jnz        .out
    mov  byte[Scrolling],1
    mov  edx,[ebp+0x10]
    shr  edx,0x10
    test dx,dx
    jl   .scroll
    mov  ebx,0xFFFFFFFF
    mov  edx,1
    mov  eax,Globals___Map
    call SidebarClass__Scroll
    jmp  .done
.scroll:
    mov  ebx,0xFFFFFFFF
    xor  edx,edx
    mov  eax,Globals___Map
    call SidebarClass__Scroll
.done:
    mov  byte[Scrolling],0
.out:
    cmp  esi,0x1C
    jb   0x005B38EE
    jmp  0x005B38E2
@ENDHACK
