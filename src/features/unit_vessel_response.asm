;----------------------------------------------------------------
; src/features/unit_vessel_response.asm
;
; Allows unit and vessel voices to be customized by INI.
;
; This function is enabled by defining ResponseSelect=, ResponseMove=, or ResponseAttack= in the infantry type definitions
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

; This code assumes that UnitTypeClass.Offset.Response_Select and VesselTypeClass.Offset.Response_Select are the same.
; This is because we use their common type class DriveClass to run the logic for both.
; Ensure that this assumption is upheld

@HOOK 0x004B6207 _DriveClass__Response_Select_CustomVoice
@HOOK 0x004B625F _DriveClass__Response_Move_CustomVoice
@HOOK 0x004B62B7 _DriveClass__Response_Attack_CustomVoice

; edx is the unit/vessel class
_DriveClass__Response_Select_CustomVoice:
    mov  al,byte[ecx] ; RTTI
    cmp  al,RTTIType.Unit
    je   .Unit
    cmp  al,RTTIType.Vessel
    je   .Vessel
    jmp  .Retn
.Unit:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    UnitTypeClass.FromIndex(eax,edx) 
    UnitTypeClass.Response_Select.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+UnitTypeClass.Offset.Response_Select_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B6226
.Vessel:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    VesselTypeClass.FromIndex(eax,edx) 
    VesselTypeClass.Response_Select.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+VesselTypeClass.Offset.Response_Select_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B6226
.Retn:
    mov  ebx,5
    jmp  0x004B620C


_DriveClass__Response_Move_CustomVoice:
    mov  al,byte[ecx] ; RTTI
    cmp  al,RTTIType.Unit
    je   .Unit
    cmp  al,RTTIType.Vessel
    je   .Vessel
    jmp  .Retn
.Unit:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    UnitTypeClass.FromIndex(eax,edx) 
    UnitTypeClass.Response_Move.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+UnitTypeClass.Offset.Response_Move_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B627E
.Vessel:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    VesselTypeClass.FromIndex(eax,edx) 
    VesselTypeClass.Response_Move.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+VesselTypeClass.Offset.Response_Move_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B627E
.Retn:
    mov  ebx,1
    jmp  0x004B6264


_DriveClass__Response_Attack_CustomVoice:
    mov  al,byte[ecx] ; RTTI
    cmp  al,RTTIType.Unit
    je   .Unit
    cmp  al,RTTIType.Vessel
    je   .Vessel
    jmp  .Retn
.Unit:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    UnitTypeClass.FromIndex(eax,edx) 
    UnitTypeClass.Response_Select.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+UnitTypeClass.Offset.Response_Attack_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B62D6
.Vessel:
    mov  al,byte[ecx+0x15C] ; ID
    movzx eax,al
    VesselTypeClass.FromIndex(eax,edx) 
    VesselTypeClass.Response_Attack.Get(edx,eax)
    test eax,eax
    jz   .Retn
    lea  ecx,[edx+VesselTypeClass.Offset.Response_Attack_Data]
    lea  ebx,[eax-1]
    mov  eax,Globals___NonCriticalRandomNumber
    xor  edx,edx
    call RandomClass_Random
    mov  dx,word[ecx+eax*2]
    mov  ebx,dword[0x006016C0]
    jmp  0x004B62D6
.Retn:
    mov  ebx,1
    jmp  0x004B62BC