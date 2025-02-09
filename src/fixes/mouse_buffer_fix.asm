;----------------------------------------------------------------
; src/fixes/mouse_buffer_fix.asm
;
; Mouse buffers were called by two functions. One set id governed by a time period. This is like cause of crashes.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

; test: see if this releases blocking units
@SJMP 0x0057F0C5,0x0057F0FB ;_UnitClass_Can_Enter_Cell_SkipNavCom_Check

; test mouse crash fix?
;@SJMP 0x005C17B0,0x005C17B7 ; WWMouseClass_WWMouseClass_SkipWINMM

;@HACK 0x004A544D,0x004A5453,_GameOptionsClass__Run_ProcessMouse_Synchornously
;	jnz  .ProcessMouse
;	jmp  0x004A5427
;.ProcessMouse:
;	call Process_Mouse
;	jmp  0x004A5566
;@ENDHACK


;@HACK 0x004C4885,0x004C488B,_GameOptionsClass__Run_ProcessMouse_Synchornously
;	Save_Registers
;	call Process_Mouse
;	Restore_Registers
;	sub  esp,0x14
;	mov  edx,[ebp-0x28]
;	mov  edx,[edx+0x8]
;	jmp  0x004C488B
;@ENDHACK


@HACK 0x005C2184,0x005C218A,_WWMouseClass_Process_Mouse_SpecialDialog_Only
	cmp  byte [0x00680834],0
	jz   0x005C21B0
	mov  dword edx,[0x006AC284]
	jmp  0x005C218A
@ENDHACK
