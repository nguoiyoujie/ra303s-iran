;----------------------------------------------------------------
; src/fixes/mouse_fixes.asm
;
; Perform mouse coordinate fixes, in case the requested coordinates are outside the screen bounds.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@HACK 0x005D8F79,0x005D8F7F,_ASM_Set_Mouse_Cursor_Mouse_Coords_Check
    cmp  dword eax,[ScreenWidth]
    JG   .Exit
    cmp  dword ebx,[ScreenHeight]
    JG   .Exit
    mov  [ebp-4h],eax ; y
    mov  [ebp-8h],ebx ; x
    jmp  0x005D8F7F
.Exit:
    pop  esi
    pop  edi
    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
    leave
    retn
@ENDHACK
