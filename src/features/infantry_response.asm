;----------------------------------------------------------------
; src/features/infantry_response.asm
;
; Allows infantry voices to be customized by INI.
;
; This function is enabled by defining ResponseSelect=, ResponseMove=, or ResponseAttack= in the infantry type definitions
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@HOOK 0x004EF463 _InfantryClass__Response_Select_CustomVoice
@HOOK 0x004EF6C3 _InfantryClass__Response_Move_CustomVoice
@HOOK 0x004EF92B _InfantryClass__Response_Attack_CustomVoice

_InfantryClass__Response_Select_CustomVoice:
    push eax
    mov  al,byte[eax+0x196] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,edx) 
    InfantryTypeClass.Response_Select.Get(edx,eax)
    test eax,eax
    jz   .Retn
    pop  ecx
    lea  ecx,[edx+InfantryTypeClass.Offset.Response_Select_Data]
    jmp  0x004EF5B6

.Retn:
    pop  eax
    test byte[eax+0x192],0x10 ; IsCivilian
    jmp  0x004EF46A


_InfantryClass__Response_Move_CustomVoice:
    push eax
    mov  al,byte[eax+0x196] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,edx) 
    InfantryTypeClass.Response_Move.Get(edx,eax)
    test eax,eax
    jz   .Retn
    pop  ecx
    lea  ecx,[edx+InfantryTypeClass.Offset.Response_Move_Data]
    jmp  0x004EF826

.Retn:
    pop  eax
    test byte[eax+0x192],0x10 ; IsCivilian
    jmp  0x004EF6CA


_InfantryClass__Response_Attack_CustomVoice:
    push eax
    mov  al,byte[eax+0x196] ; ID
    movsx eax,al
    InfantryTypeClass.FromIndex(eax,edx) 
    InfantryTypeClass.Response_Attack.Get(edx,eax)
    test eax,eax
    jz   .Retn
    pop  ecx
    lea  ecx,[edx+InfantryTypeClass.Offset.Response_Attack_Data]
    jmp  0x004EFA70

.Retn:
    pop  eax
    test byte[eax+0x192],0x10 ; IsCivilian
    jmp  0x004EF932