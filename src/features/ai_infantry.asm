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


@SET 0x004DC160,{sub esp,0x72C} ; was 0x12C, add 0x600 to hold counter[INFANTRY_COUNT] (0x500) and bestlist[INFANTRY_COUNT] (0x100)
@SET 0x004DC195,{mov ebx,0x600} ; was 0x68,for memset
@SET 0x004DC19A,{lea eax,[ebp-0x6BC]} ; 0xFFFFF944 ; was 0xFFFFFF44
@SET 0x004DC282,{lea ebx,[ebp+ebx*4-0x6BC]}
@SET 0x004DC363,{lea esi,[ebp+edx-0x6BC]}
@SET 0x004DC37F,{mov dword[ebp+edx-0x6BC],esi}
@SET 0x004DC3A8,{mov dword[ebp+ebx*4-0x6BC],edx}
@SET 0x004DC3D0,{cmp dword[ebp+eax*4-0x6BC],0}
@SET 0x004DC404,{dec dword[ebp+eax*4-0x6BC]}
@SET 0x004DC47E,{cmp dword[ebp+eax*4-0x6BC],0}
@SET 0x004DC4EE,{cmp esi,dword[ebp+eax*4-0x6BC]}
@SET 0x004DC4FF,{mov esi,dword[ebp+eax*4-0x6BC]}

; this section deals with the AI with BaseBuilding, to include the additional units in its random building roster
@SET 0x004DC5B5,{mov dword[ebp+ecx-0x5BC],eax} ; 0xFFFFFA44
@SET 0x004DC638,{mov dword[ebp+ecx-0x5BC],3}
@SET 0x004DC643,{cmp dword[ebp+ecx-0x5BC],0}
@SET 0x004DC650,{mov byte[ebp+ecx-0x5BD],al} ; -1
@SET 0x004DC65A,{mov eax,dword[ebp+ecx-0x5BC]}
@SET 0x004DC66C,{mov dword[ebp+ecx-0x5BC],5}
@SET 0x004DC679,{mov dword[ebp+ecx-0x5BC],2}
@SET 0x004DC6B7,{mov dword[ebp+ecx-0x5BC],edx}
@SET 0x004DC6E5,{mov dword[ebp+ecx-0x5BC],edx}
@SET 0x004DC6F3,{mov dword[ebp+ecx-0x5BC],eax}
@SET 0x004DC745,{mov ecx,dword[ebp+eax-0x5BC]}
@SET 0x004DC753,{mov al,byte[ebp+eax-0x5BD]} ; -1

; convert sar eax,18 to shr eax,18
@SET 0x004DC5BF,{shr eax,0x18} 
@SJMP 0x004DC5C5,0x004DC5CA ; don't reduce by INFANTRY_RA_COUNT
@SET 0x004DC5D6,{mov eax,dword[edi+eax*1+HouseClass.Offset.NewIQuantity]}
@SET 0x004DC5DD,{cmp eax,dword[edx+HouseClass.Offset.NewIQuantity]}

@SJMP 0x004DC4A5,0x004DC4C4 ;_HouseClass__AI_Infantry_Extend_Remove_CanBuild_From_TeamTypeCheck


@HACK 0x004DC516,0x004DC51E,_HouseClass__AI_Infantry_Expand
    cmp  al,[InfantryTypeClass.Count] ; was INFANTRY_COUNT (0x1A)
    jb   0x004DC462
    jmp  0x004DC51E
@ENDHACK


@HACK 0x004DC62B,0x004DC638,_HouseClass__AI_Infantry_Expand_Choice
    cmp  al,[InfantryTypeClass.Count] ; was INFANTRY_COUNT (0x1A)
    jae  0x004DC713
    jmp  0x004DC574
@ENDHACK


; Warning: AIBuildLimit doesn't work correctly because buildings clear BuildInfantry when starting production; allowing BuildInfantry to be set again while another instance of the unit is producing 
@HACK 0x004DC702,0x004DC713,_HouseClass__AI_Infantry_Set_Weight ; 0x004DC6F1
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
    mov  dword[ecx+ebp*1-1468],eax
    jmp  .Done
.Clear:
    mov  dword[ecx+ebp*1-1468],0
.Done:
    pop  edi
    pop  edx
    jmp  0x004DC643
@ENDHACK

