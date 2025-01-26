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


;added by lovalmidas
; hook into AI_Infantry() to change how AI weights units in order to make its choices. This is done to support the additional units beyond the original INFANTRY_COUNT
; Note that AI behavior depends on Can_Build() checks and new units will be treated similar to Aftermath units due to being placed after them

@HOOK 0x004DC516 _HouseClass__AI_Infantry_Expand
@HOOK 0x004DC62B _HouseClass__AI_Infantry_Expand_Choice

@SETD 0x004DC162 0x72c ; was 0x12c, add 600h to hold counter[INFANTRY_COUNT] (500h) and bestlist[INFANTRY_COUNT] (100h)
@SETD 0x004DC196 0x600 ; was 0x68, for memset
@SETD 0x004DC19C -1724 ; 0xfffff944 ; was 0xffffff44
@SETD 0x004DC285 -1724
@SETD 0x004DC366 -1724
@SETD 0x004DC382 -1724
@SETD 0x004DC3AB -1724
@SETD 0x004DC3D3 -1724
@SETD 0x004DC407 -1724
@SETD 0x004DC481 -1724
@SETD 0x004DC4F1 -1724
@SETD 0x004DC502 -1724

; this section deals with the AI with BaseBuilding, to include the additional units in its random building roster
@SETD 0x004DC5B8 -1468 ; 0xfffffa44
@SETD 0x004DC63B -1468
@SETD 0x004DC646 -1468
@SETD 0x004DC653 -1469 ; -1
@SETD 0x004DC65D -1468
@SETD 0x004DC66F -1468
@SETD 0x004DC67C -1468
@SETD 0x004DC6BA -1468
@SETD 0x004DC6E8 -1468
@SETD 0x004DC6F6 -1468
@SETD 0x004DC748 -1468
@SETD 0x004DC756 -1469 ; -1

@SETB 0x004DC5C0 0xE8 ; convert sar eax,18 to shr eax,18
@CLEAR 0x004DC5C5 0x90 0x004DC5CA ; don't reduce by INFANTRY_RA_COUNT
@SETD 0x004DC5D9 HouseClass.Offset.NewIQuantity
@SETD 0x004DC5E0 HouseClass.Offset.NewIQuantity

@HOOK 0x004DC4A5 _HouseClass__AI_Infantry_Extend_Remove_CanBuild_From_TeamTypeCheck
@HOOK 0x004DC702 _HouseClass__AI_Infantry_Set_Weight ; 0x004DC6F1

_HouseClass__AI_Infantry_Expand:
    cmp  al,[InfantryTypeClass.Count] ; was INFANTRY_COUNT (0x1A)
    jb   0x004DC462
    jmp  0x004DC51E

_HouseClass__AI_Infantry_Expand_Choice:
    cmp  al,[InfantryTypeClass.Count] ; was INFANTRY_COUNT (0x1A)
    jae  0x004DC713
    jmp  0x004DC574

_HouseClass__AI_Infantry_Extend_Remove_CanBuild_From_TeamTypeCheck:
    jmp  0x004DC4C4

; Warning: AIBuildLimit doesn't work correctly because buildings clear BuildInfantry when starting production; allowing BuildInfantry to be set again while another instance of the unit is producing 
_HouseClass__AI_Infantry_Set_Weight:
    xor  eax,eax
    mov  al,bh
    push edx ; HouseClass
    push edi
    mov  edx,dword[ebp-0x38]
    lea  edx,[edx+eax*4+HouseClass.Offset.NewIQuantity] ; House->NewIQuantity[unit]
    InfantryTypeClass.FromIndex(eax,edi)
    InfantryTypeClass.IsDog.Get(edi,bl)  ; do not build IsDog units. AI handles them poorly
    cmp  bl,1
    je   .Clear
.CheckLimit:
    InfantryTypeClass.AIBuildLimit.Get(edi,eax)
    cmp  eax,0 ; 0 or negative values = no limit
    jle  .Set
    cmp  eax,dword[edx]
    jle  .Clear
.Set:
    InfantryTypeClass.AIBuildWeight.Get(edi,eax)
    mov  dword [ecx + ebp*1 -1468],eax
    jmp  .Done
.Clear:
    mov  dword [ecx + ebp*1 -1468],0
.Done:
    pop  edi
    pop  edx
    jmp  0x004DC643
