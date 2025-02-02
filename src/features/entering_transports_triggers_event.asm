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

cextern TriggerClass__Spring

; Remove existing triggers; the below code includes both Engineer and Spy
@SJMP 0x004EC5A2,0x004EC5E6 ; _InfantryClass__Per_Cell_Process_Engineer_Trigger_Skip
@SJMP 0x004EC723,0x004EC765 ; _InfantryClass__Per_Cell_Process_Spy_Trigger_Skip

@HACK 0x004EC4D4,0x004EC4DA,_InfantryClass__Per_Cell_Process_Any_Trigger_PlayerEnteredEvent
    push eax
    push esi
    mov  esi,dword[edi+0x21]
    mov  ebx,dword[ebp-0x1C]
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
    mov  al,byte[eax+0x196] ;restore
    jmp  0x004EC4DA
@ENDHACK


; Trigger event when infantry enters any transport with attached trigger
@HACK 0x004ECB78,0x004ECB7E,_InfantryClass__Per_Cell_Process_Any_Enter_Transport_PlayerEnteredEvent
    push eax
    mov  esi,dword[edi+0x21]
    mov  ebx,dword[ebp-0x1C]
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
    mov  edx,dword[ebp-0x1C] ;restore
    mov  edx,dword[edx+0x11] ;restore
    jmp  0x004ECB7E
@ENDHACK


; Trigger event when a unit enters any transport with attached trigger
@HACK 0x0057BE55,0x0057BE5B,_UnitClass__Per_Cell_Process_Any_Enter_Transport_PlayerEnteredEvent
    push eax
    push esi
    mov  esi,dword[esi+0x21]
    mov  ebx,dword[ebp-0x1C]
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
    mov  edx,dword[ebp-0x1C] ;restore
    mov  edx,dword[edx+0x11] ;restore
    jmp  0x0057BE5B
@ENDHACK

