;----------------------------------------------------------------
; src/features/entering_transports_triggers_event.asm
;
; Before, only capturing structures and cell triggers may trigger the Player Entered... event
; Now, entering allied structures and entering transports may also trigger the event.
;
; This function is enabled by default. 
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@CLEAR 0x004EC4D9 0x90 0x004EC4DA
@CLEAR 0x004ECB7D 0x90 0x004ECB7E
@CLEAR 0x0057BE5A 0x90 0x0057BE5B

@HOOK 0x004EC4D4 _InfantryClass__Per_Cell_Process_Any_Trigger_PlayerEnteredEvent
@HOOK 0x004EC5A2 _InfantryClass__Per_Cell_Process_Engineer_Trigger_Skip
@HOOK 0x004EC723 _InfantryClass__Per_Cell_Process_Spy_Trigger_Skip
@HOOK 0x004ECB78 _InfantryClass__Per_Cell_Process_Any_Enter_Transport_PlayerEnteredEvent
@HOOK 0x0057BE55 _UnitClass__Per_Cell_Process_Any_Enter_Transport_PlayerEnteredEvent



_InfantryClass__Per_Cell_Process_Any_Trigger_PlayerEnteredEvent:
    push eax
    push esi
    mov  esi,dword[edi+21h]
    mov  ebx,dword[ebp-1ch]
    xor  ecx,ecx
    cmp  esi,-1
    jnz  .Trigger
    xor  eax,eax
    jmp  .NoTrigger
.Trigger:
    push 0 ; TriggerClass__Spring
    mov  edx,[0x00601810]
    mov  eax,esi
    imul eax,[edx+0x4]
    mov  edx,[edx+0x10]
    add  eax,edx
    mov  edx,1
    call TriggerClass__Spring
.NoTrigger:
    pop  esi
    pop  eax
    mov  al,byte[eax+196h] ;restore
    jmp  0x004EC4DA

; Remove existing triggers; the above code includes both Engineer and Spy
_InfantryClass__Per_Cell_Process_Engineer_Trigger_Skip:
    jmp  0x004EC5E6

_InfantryClass__Per_Cell_Process_Spy_Trigger_Skip:
    jmp  0x004EC765

; Trigger event when infantry enters any transport with attached trigger
_InfantryClass__Per_Cell_Process_Any_Enter_Transport_PlayerEnteredEvent:
    push eax
    mov  esi,dword[edi+21h]
    mov  ebx,dword[ebp-1ch]
    xor  ecx,ecx
    cmp  esi,-1
    jnz  .Trigger
    xor  eax,eax
    jmp  .NoTrigger
.Trigger:
    push 0 ; TriggerClass__Spring
    mov  edx,[0x00601810]
    mov  eax,esi
    imul eax,[edx+0x4]
    mov  edx,[edx+0x10]
    add  eax,edx
    mov  edx,1
    call TriggerClass__Spring
.NoTrigger:
    pop  eax
    mov  edx,dword[ebp-1ch] ;restore
    mov  edx,dword[edx+11h] ;restore
    jmp  0x004ECB7E

; Trigger event when a unit enters any transport with attached trigger
_UnitClass__Per_Cell_Process_Any_Enter_Transport_PlayerEnteredEvent:
    push eax
    push esi
    mov  esi,dword[esi+21h]
    mov  ebx,dword[ebp-1ch]
    xor  ecx,ecx
    cmp  esi,-1
    jnz  .Trigger
    xor  eax,eax
    jmp  .NoTrigger
.Trigger:
    push 0 ; TriggerClass__Spring
    mov  edx,[0x00601810]
    mov  eax,esi
    imul eax,[edx+0x4]
    mov  edx,[edx+0x10]
    add  eax,edx
    mov  edx,1
    call TriggerClass__Spring
.NoTrigger:
    pop  esi
    pop  eax
    mov  edx,dword[ebp-1ch] ;restore
    mov  edx,dword[edx+11h] ;restore
    jmp  0x0057BE5B
