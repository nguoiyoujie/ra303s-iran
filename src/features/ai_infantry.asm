;----------------------------------------------------------------
; src/features/ai_infantry.asm
;
; Extends House AI with the following features
; - Infantry production obey Can_Build() checks
; - AI will consider training new infantry beyond the original set when Auto Production is enabled
; - AI will consider training new infantry listed in Teams
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------


; Fix crash where the house pointer is somehow displaced in the AI_Infantry function (eax)
;@HOOK 0x004DC455 _HouseClass__AI_Infantry_Fix_Crash
;@HOOK 0x004DC468 _HouseClass__AI_Infantry_Fix_Crash2
;@HOOK 0x004DC160 _HouseClass__AI_Infantry_Fix_CrashSet

;added by lovalmidas
; hook into AI_Infantry() to change how AI weights units in order to make its choices. This is done to support the additional units beyond the original INFANTRY_COUNT
; Note that AI behavior depends on Can_Build() checks and new units will be treated similar to Aftermath units due to being placed after them

@HOOK 0x004DC516 _HouseClass__AI_Infantry_Expand
;@HOOK 0x004DC62B _HouseClass__AI_Infantry_Expand_Choice
;@HOOK 0x004DC346 _HouseClass__AI_Infantry_Extend_CounterList_test

@HOOK 0x004DC160 _HouseClass__AI_Infantry_Extend_Stackframe
@HOOK 0x004DC19A _HouseClass__AI_Infantry_Extend_CounterList_1
@HOOK 0x004DC282 _HouseClass__AI_Infantry_Extend_CounterList_2
@HOOK 0x004DC363 _HouseClass__AI_Infantry_Extend_CounterList_3
@HOOK 0x004DC37F _HouseClass__AI_Infantry_Extend_CounterList_4
@HOOK 0x004DC3A8 _HouseClass__AI_Infantry_Extend_CounterList_5
@HOOK 0x004DC3D0 _HouseClass__AI_Infantry_Extend_CounterList_6
@HOOK 0x004DC404 _HouseClass__AI_Infantry_Extend_CounterList_7
@HOOK 0x004DC47E _HouseClass__AI_Infantry_Extend_CounterList_8
@HOOK 0x004DC4EE _HouseClass__AI_Infantry_Extend_CounterList_9
@HOOK 0x004DC4FF _HouseClass__AI_Infantry_Extend_CounterList_10
@HOOK 0x004DC4A5 _HouseClass__AI_Infantry_Extend_Remove_CanBuild_From_TeamTypeCheck

@HOOK 0x004DC506 _HouseClass__AI_Infantry_Extend_BestList_1
;@HOOK 0x004DC50E _HouseClass__AI_Infantry_Extend_BestList_1B
@HOOK 0x004DC534 _HouseClass__AI_Infantry_Extend_BestList_2

;@HOOK 0x004DC5B5 _HouseClass__AI_Infantry_Extend_TypeTrackList_1
;@HOOK 0x004DC638 _HouseClass__AI_Infantry_Extend_TypeTrackList_2
;@HOOK 0x004DC643 _HouseClass__AI_Infantry_Extend_TypeTrackList_3
;@HOOK 0x004DC650 _HouseClass__AI_Infantry_Extend_TypeTrackList_4
;@HOOK 0x004DC65A _HouseClass__AI_Infantry_Extend_TypeTrackList_5
;@HOOK 0x004DC66C _HouseClass__AI_Infantry_Extend_TypeTrackList_6
;@HOOK 0x004DC679 _HouseClass__AI_Infantry_Extend_TypeTrackList_7
;@HOOK 0x004DC6B7 _HouseClass__AI_Infantry_Extend_TypeTrackList_8
;@HOOK 0x004DC6E5 _HouseClass__AI_Infantry_Extend_TypeTrackList_9
;@HOOK 0x004DC6F3 _HouseClass__AI_Infantry_Extend_TypeTrackList_10

;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_1
;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_2
;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_3
;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_4
;@HOOK 0x00400000 _HouseClass__AI_Infantry_Extend_BaseBuildingList_5

; capacity for exactly 256 infantry types, sufficient to support 0x00 - 0xFF
InfantryAIHouseClassPointer dd 0
;InfantryAIHouseClassIndexer db 0
InfantryAIHouseClassCounter TIMES 256 dd 0
InfantryAIHouseClassBestCounter TIMES 256 db 0

; possible corruption of [ebp-38h]
_HouseClass__AI_Infantry_Fix_Crash:
    mov  dword edi,[InfantryAIHouseClassPointer]
    xor  dh,dh
    xor  ecx,ecx
	; skip 004dc45c
	add  edi,0x5
    jmp  0x004DC462

; This part of the code runs only when the infantry type is Dog, but this breaks eax (doubling as iteration index) resulting in infinite loop
;_HouseClass__AI_Infantry_Fix_Crash2:
;    mov  dword eax,[InfantryAIHouseClassPointer]
;    test byte [eax+150h],4h
;    jmp  0x004DC472

;_HouseClass__AI_Infantry_Fix_CrashSet: ; to be replaced by _HouseClass__AI_Infantry_Extend_Stackframe when ready to introduce
;    sub  esp,12Ch
;    mov  [ebp-38h],eax
;    mov  dword [InfantryAIHouseClassPointer],eax
;    jmp  0x004DC169

; Warning: crude and arbitary extension of stackframe!
_HouseClass__AI_Infantry_Extend_Stackframe:
    sub  esp,0x12c
    mov  [ebp-38h],eax
    mov  dword [InfantryAIHouseClassPointer],eax
;    mov  byte [InfantryAIHouseClassIndexer],0
    jmp  0x004DC169
	
_HouseClass__AI_Infantry_Expand:
    cmp  al,[InfantryTypeClass.Count] ; was INFANTRY_COUNT (0x1A)
    jl   0x004DC462
    jmp  0x004DC51E

_HouseClass__AI_Infantry_Expand_Choice:
    cmp  al,[InfantryTypeClass.Count] ; was INFANTRY_COUNT (0x1A)
    jge  0x004DC713
    jmp  0x004DC574

_HouseClass__AI_Infantry_Extend_CounterList_test:
    mov  dword [ecx + InfantryAIHouseClassCounter],1
    jmp  0x004DC38F

_HouseClass__AI_Infantry_Extend_CounterList_1:
    mov  ebx,68h
    lea  eax,[ebp + 0xffffff44]
    mov  edi,dword [ebp-38h]
	xor  edx,edx
    xor  ecx,ecx
	call 0x005C4E50
    mov  ebx,400h
    lea  eax,[InfantryAIHouseClassCounter]
    mov  edi,dword [ebp-38h]
	xor  edx,edx
    xor  ecx,ecx
	call 0x005C4E50
    mov  ebx,100h
    lea  eax,[InfantryAIHouseClassBestCounter]
    mov  edi,dword [ebp-38h]
	xor  edx,edx
    xor  ecx,ecx
	call 0x005C4E50
;    xor  eax,eax
;    mov  byte [InfantryAIHouseClassIndexer],al
    jmp  0x004DC1AC ;0x004DC1A0

_HouseClass__AI_Infantry_Extend_CounterList_2:
    lea  ebx,[ebx*4 + InfantryAIHouseClassCounter] ; was 0xffffff44, zero bytes
    jmp  0x004DC289

_HouseClass__AI_Infantry_Extend_CounterList_3:
    mov  esi,dword [edx + InfantryAIHouseClassCounter]
    jmp  0x004DC36A

_HouseClass__AI_Infantry_Extend_CounterList_4:
    mov  dword [edx + InfantryAIHouseClassCounter],esi
    jmp  0x004DC386

_HouseClass__AI_Infantry_Extend_CounterList_5:
    mov  dword [ebx*4 + InfantryAIHouseClassCounter],edx
    jmp  0x004DC3AF

_HouseClass__AI_Infantry_Extend_CounterList_6:
    cmp  dword [eax*4 + InfantryAIHouseClassCounter],0
    jmp  0x004DC3D8

_HouseClass__AI_Infantry_Extend_CounterList_7:
    dec  dword [eax*4 + InfantryAIHouseClassCounter]
    jmp  0x004DC40B

_HouseClass__AI_Infantry_Extend_CounterList_8:
    cmp  dword [eax*4 + InfantryAIHouseClassCounter],0
    jmp  0x004DC486

_HouseClass__AI_Infantry_Extend_CounterList_9:
    cmp  esi,dword [eax*4 + InfantryAIHouseClassCounter]
    jmp  0x004DC4F5

_HouseClass__AI_Infantry_Extend_CounterList_10:
    mov  esi,dword [eax*4 + InfantryAIHouseClassCounter]
    jmp  0x004DC506

_HouseClass__AI_Infantry_Extend_Remove_CanBuild_From_TeamTypeCheck:
    jmp  0x004DC4C4

_HouseClass__AI_Infantry_Extend_BestList_1:
    ;mov  al,byte [InfantryAIHouseClassIndexer]
    mov  al,byte [ebp + 0xffffffe8]
    mov  byte [ecx + InfantryAIHouseClassBestCounter],al
    inc  ecx ;increment after use of ecx to avoid needing to offset by 1 later
    jmp  0x004DC50E

;_HouseClass__AI_Infantry_Extend_BestList_1B:
;    mov  al,byte [InfantryAIHouseClassIndexer]
;    inc  al
;    mov  byte [InfantryAIHouseClassIndexer],al
;    jmp  0x004DC516

_HouseClass__AI_Infantry_Extend_BestList_2:
    mov  al,byte [eax + InfantryAIHouseClassBestCounter]
	mov  byte [edx + 0x537],al
    jmp  0x004DC53E


;_HouseClass__AI_Infantry_Extend_TypeTrackList_1:
;    mov  dword [ebp + ecx + 0xfffffc44],eax ; was 0xfffffec1, zero bytes
;    jmp  0x004DC5BC
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_2:
;    mov  dword [ebp + ecx + 0xfffffc44],0x3
;    jmp  0x004DC643
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_3:
;    cmp  dword [ebp + ecx + 0xfffffc44],0x0
;    jmp  0x004DC64B
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_4:
;    mov  dword [ebp + ecx + 0xfffffc43],al
;    jmp  0x004DC657
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_5:
;    mov  dword eax,[ebp + ecx + 0xfffffc44]
;    jmp  0x004DC661
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_6:
;    mov  dword [ebp + ecx + 0xfffffc44],0x5
;    jmp  0x004DC677
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_7:
;    mov  dword [ebp + ecx + 0xfffffc44],0x2
;    jmp  0x004DC684
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_8:
;    mov  dword [ebp + ecx + 0xfffffc44],edx
;    jmp  0x004DC6BE
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_9:
;    mov  dword [ebp + ecx + 0xfffffc44],edx
;    jmp  0x004DC6EC
;
;_HouseClass__AI_Infantry_Extend_TypeTrackList_10:
;    mov  dword [ebp + ecx + 0xfffffc44],edx
;    jmp  0x004DC6FA
