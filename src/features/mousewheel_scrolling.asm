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

; Intercepting void Check_For_Focus_Loss(void) in WINSTUB.CPP
@HOOK 0x005B38DD _Mouse_Wheel_Sidebar_Scrolling
;@HOOK 0x0054E3BB _SidebarClass_StripClass__AI_Scroll_Check

Scrolling db 0
ProcessingSidebar dd 0

_Mouse_Wheel_Sidebar_Scrolling:
    cmp  byte [Toggle_Feature_MouseWheelScrolling], 1
    jnz  .out
    mov  esi, [ebp+0Ch]
    cmp  esi, 20Ah ;WM_MOUSEHWHEEL
    jnz  .out

    mov  ecx, [Globals___PlayerPtr]
    test ecx, ecx
    jz   .out

    mov  cl, byte [Scrolling]
    test cl, cl
    jnz  .out


;    mov        ebx, 2
;    mov        eax, [0x00665EB0]
;    call    0x005BBF30 ;   WinTimerClass::Get_System_Tick_Count(void)
;    cdq
;    idiv    ebx
;    cmp        dword edx, 0
;    jnz        .out

    mov  byte [Scrolling], 1
    mov  edx, [ebp+10h]
    shr  edx, 10h
    test dx, dx
    jl   .scroll

    mov  ebx, 0FFFFFFFFh
    mov  edx, 1
    mov  eax, Globals___Map
    call SidebarClass__Scroll

    jmp  .done

;-----------------------------------------------
.scroll:
    mov  ebx, 0FFFFFFFFh
    xor  edx, edx
    mov  eax, Globals___Map
    call SidebarClass__Scroll

.done:
    mov  byte [Scrolling], 0

.out:
    cmp  esi, 1Ch
    jb   0x5B38EE

    jmp  0x5B38E2
