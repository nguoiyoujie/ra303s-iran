;----------------------------------------------------------------
; src/features/ingame_chat_improvments.asm
;
; Increases the linger time for a chat message to 15 seconds
; 
; This function is enabled by default and is not configurable.
; No compatibility issues is expected. 
;
;----------------------------------------------------------------
; 004A79A8

; This controls the number of concurrent messages on screen, perhaps this can be configurable
;@HACK 0x0050559B,_Check_MessageList_Messages_Count
;;    cmp     eax,[edx+0xC] ; default check is for 6?
;    cmp  eax,12 ; default check is for 6?
;    jle  0x005055EB
;    jmp  0x005055A0
;@ENDHACK

@HACK 0x00534D59,0x00534D5F,_Load_MessageDelay
    mov  ax,0x100 ; 0x100 = 15 seconds
    mov  [edx],ax
    jmp  0x00534D5F
@ENDHACK
