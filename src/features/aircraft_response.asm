;----------------------------------------------------------------
; src/features/aircraft_response.asm
;
; Allows aircraft voices to be customized by INI.
;
; This function is enabled by defining ResponseSelect=, ResponseMove=, or ResponseAttack= in the aircraft type definitions
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

extern RandomClass_Random
extern Globals___NonCriticalRandomNumber


@HACK 0x0042315F,0x00423164,_AircraftClass__Response_Select_CustomVoice
    ; edx is the unit/vessel class
    mov  al,byte[ecx+0x146] ; ID
    movzx eax,al
    AircraftTypeClass.FromIndex(eax,edx) 
    AircraftTypeClass.Response_Select.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+AircraftTypeClass.Offset.Response_Select_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x0042317E
.Retn:
    mov  ebx,5
    jmp  0x00423164
@ENDHACK


@HACK 0x00423107,0x0042310C,_AircraftClass__Response_Move_CustomVoice
    mov  al,byte[ecx+0x146] ; ID
    movzx eax,al
    AircraftTypeClass.FromIndex(eax,edx) 
    AircraftTypeClass.Response_Move.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+AircraftTypeClass.Offset.Response_Move_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x00423126
.Retn:
    mov  ebx,1
    jmp  0x0042310C
@ENDHACK


@HACK 0x004230AF,0x004230B4,_AircraftClass__Response_Attack_CustomVoice
    mov  al,byte[ecx+0x146] ; ID
    movzx eax,al
    AircraftTypeClass.FromIndex(eax,edx) 
    AircraftTypeClass.Response_Attack.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+AircraftTypeClass.Offset.Response_Attack_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004230CE
.Retn:
    mov  ebx,1
    jmp  0x004230B4
@ENDHACK

