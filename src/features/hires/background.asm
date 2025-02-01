;----------------------------------------------------------------
; src/features/hires/background.asm
;
; Apply hi-res features to the background. Apparently this is no longer needed in favor of _Buffer_Clear options 
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

;[section .rdata] 
;str_blackbackgroundpcx  db"BLACKBACKGROUND.PCX",0


;@HACK 0x0053B806,0x0053B80B,_hires_DoRestartMissionClearBackground ; uses blackbackground.pcx,not needed anymore
;    push ecx
;    push ebx
;    push edx
;    push eax
;    mov  ebx,0x0066995C
;    mov  edx,Globals___HidPage
;    mov  eax,str_blackbackgroundpcx
;    call 0x005B3CD8
;    pop  eax
;    pop  edx
;    pop  ebx
;    pop  ecx
;    mov  eax,[Globals___Keyboard]
;    jmp  0x0053B80B
;@ENDHACK


;@HACK 0x0053BE6C,0x0053BE71,_hires_RestateMissionClearBackground ; uses blackbackground.pcx,not needed anymore
;    push ecx
;    push ebx
;    push edx
;    push eax
;    mov  ebx,0x0066995C
;    mov  edx,Globals___HidPage
;    mov  eax,str_blackbackgroundpcx
;    call 0x005B3CD8
;    pop  eax
;    pop  edx
;    pop  ebx
;    pop  ecx
;    mov  ebx,0x005F9348
;    jmp  0x0053BE71
;@ENDHACK


;@HACK 0x004F6090,0x004F6097,_hires_MainMenuClearBackground ; load blackbackground.pcx
;    hires_Clear
;    mov  ecx,eax
;    push ecx
;;    mov     ebx,0x0066995C
;;    mov     edx,Globals___HidPage
;;    mov     eax,str_blackbackgroundpcx
;;    call    0x005B3CD8
;    pop  eax
;    mov  ebx,0x0066995C
;    jmp  0x004F6097
;@ENDHACK


;@HACK 0x0050223E,0x00502243,_Blacken_Screen_Border_Menu
;    call Set_Video_Mode
;    mov  eax,1
;    jmp  0x00502243
;@ENDHACK


;@HACK 0x0050228E,0x00502293,_Blacken_Screen_Border_Menu2
;    hires_Clear_2
;    mov  eax,1
;    jmp  0x00502293
;@ENDHACK
