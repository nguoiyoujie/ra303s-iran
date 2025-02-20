;----------------------------------------------------------------
; src/fixes/mouse_buffer_fix.asm
;
; Mouse buffers were called by two functions. One set is governed by a time period, but not guarded by an atomic mutex. This is likely cause of crashes.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

cextern Globals___Frame

; test mouse crash fix?
;@SJMP 0x005C17B0,0x005C17B7 ; WWMouseClass_WWMouseClass_SkipWINMM ; this skips hooking Process_Mouse() to external library

@HACK 0x005C2184,0x005C218A,_WWMouseClass_Process_Mouse_SpecialDialog_Only
	cmp  byte[0x00680834],0 ; is there a special dialog in play?
	jnz  .Continue
    ; also check Frame, (GameActive is 1 even on the main menu)
	cmp  byte[Globals___Frame],0 ; Frame is 0 on the main menu
    jne  .Skip
.Continue:
	mov  dword edx,[0x006AC284]
	jmp  0x005C218A
.Skip:
    jmp  0x005C21B0
@ENDHACK
