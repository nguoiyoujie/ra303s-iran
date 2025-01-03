;----------------------------------------------------------------
; src/features/ai_units.asm
;
; Extends House AI with the following features
; - Unit production obey Can_Build() checks
; - AI will consider training new units beyond the original set when Auto Production is enabled
; - AI will consider training new units listed in Teams
;
; If House AI has already selected a unit to build based on Teams, it will skip processing of AutoBase selection (if AutoBase is enabled). That way Team fulfillment take priority.
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

;added by lovalmidas
; hook into AI_Unit() to change how AI weights units in order to make its choices. This is done to support the additional units beyond the original UNIT_COUNT
; Note that AI behavior depends on Can_Build() checks and new units will be treated similar to Aftermath units due to being placed after them
@HOOK 0x004DBBB6 _HouseClass__AI_Unit_Extend_BestList_1
@HOOK 0x004DBBE4 _HouseClass__AI_Unit_Extend_BestList_2
@HOOK 0x004DBB6A _HouseClass__AI_Unit_Extend_Remove_CanBuild_From_TeamTypeCheck
; extends the check to new unittypeclass
@HOOK 0x004DBBC5 _HouseClass__AI_Unit_Expand
@HOOK 0x004DBC89 _HouseClass__AI_Unit_Expand_Choice
@HOOK 0x004DBCAE _HouseClass__AI_Unit_Expand_Choice_2
;added by lovalmidas/

; we should rewrite the income check to accomodate additional refinery types
; unhardcode Harvester first 
@SETD 0x004DB83B HouseClass.Offset.NewBQuantity_Refinery ; Refinery
@SETD 0x004DB841 HouseClass.Offset.NewUQuantity_Harvester ; Harvester

; Warning stack manipulation!
@SETD 0x004DB7F6 0x5e8 ; was 0xE8, add 200h to hold counter[UNIT_COUNT] (400h) and bestlist[UNIT_COUNT] (100h)
; this section deals with the AI with Teams
@SETD 0x004DB881 0x500 ; was 0x58, for memset
@SETD 0x004DB887 -1532 ; 0xfffffa04 ; was 0xffffff04
@SETD 0x004DB96C -1532
@SETD 0x004DBA43 -1532
@SETD 0x004DBA70 -1532
@SETD 0x004DBA98 -1532
@SETD 0x004DBACC -1532
@SETD 0x004DBB30 -1532
@SETD 0x004DBBA0 -1532
@SETD 0x004DBBB1 -1532
; this section deals with the AI with BaseBuilding, to include the additional units in its random building roster
@SETD 0x004DBC48 -1276 ; 0xfffffb04 ; was 0xffffff5c
@SETD 0x004DBC5B -1276
@SETD 0x004DBC6E -1276
@SETD 0x004DBC7B -1276
@SETD 0x004DBCE2 -1276


@HOOK 0x004DBC37 _HouseClass__AI_Unit_Set_Weight

_HouseClass__AI_Unit_Extend_BestList_1:
    mov  al,byte [ebp + -0x18]
    mov  byte [ecx + ebp*0x1 - 1533],al  ; was -0x4d
    jmp  0x004DBBBD

_HouseClass__AI_Unit_Extend_BestList_2:
    mov  al,byte [eax + ebp*0x1 - 1532] ; was -0x4c
    mov  byte[edx+HouseClass.Offset.BuildUnit],al
    jmp  0x004DBCF6 ; skip AutoBase

_HouseClass__AI_Unit_Extend_Remove_CanBuild_From_TeamTypeCheck:
    jmp  0x004DBB73

_HouseClass__AI_Unit_Expand:
    cmp  byte bl,[UnitTypeClass.Count] ; was UNIT_COUNT (0x16)
    jl   0x004DBB27
    jmp  0x004DBBCE

_HouseClass__AI_Unit_Expand_Choice:
    cmp  byte al,[UnitTypeClass.Count] ; was UNIT_COUNT (0x16)
    jl   0x004DBC05
    jmp  0x004DBC91

_HouseClass__AI_Unit_Expand_Choice_2:
    cmp  byte dh,[UnitTypeClass.Count] ; was UNIT_COUNT (0x16)
    jl   0x004DBCD6
    jmp  0x004DBCB3

_HouseClass__AI_Unit_Set_Weight:
    mov  eax,dword[ebp-0x1f]
    shr  eax,0x18
    ; HouseClass us ebp-0x20
    push ebx 
    push edx 
    push edi
    mov  edx,dword[ebp-0x20]
    lea  edx,[edx+eax*4+HouseClass.Offset.NewUQuantity] ; House->NewIQuantity[unit]
.CheckLimit:
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.AIBuildLimit.Get(edi,ebx)
    cmp  ebx,0 ; 0 or negative values = no limit
    jle  .Set
    cmp  ebx,dword[edx]
    jle  .Clear
.Set:
    UnitTypeClass.AIBuildWeight.Get(edi,ebx)
    mov  dword [ebp + eax*4 -1276],ebx
    jmp  .Done
.Clear:
    mov  dword [ebp + eax*4 -1276],0
.Done:
    pop  edi
    pop  edx
    pop  ebx
    jmp  0x004DBC72    

