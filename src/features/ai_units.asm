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

; hold in reserve - it is known in AI_Vessels and AI_Infantry that the house point (eax) may be corrupted
UnitAIHouseClassPointer dd 0

; Warning stack manipulation!
@SETD 0x004DB7F6 0x2e8 ; was 0xE8, add 500h to hold counter[UNIT_COUNT] (0xfffffc04) (200h) and bestlist[UNIT_COUNT] (0xfffffa04) (200h)
@SETD 0x004DB881 0x258 ; was 0x58
; this section deals with the AI with Teams
@SETD 0x004DB887 -764 ; 0xfffffd04
@SETD 0x004DB96C -508 ; 0xfffffe04
@SETD 0x004DBA43 -508 ; 0xfffffe04
@SETD 0x004DBA70 -508 ; 0xfffffe04
@SETD 0x004DBA98 -508 ; 0xfffffe04
@SETD 0x004DBACC -508 ; 0xfffffe04
@SETD 0x004DBB30 -508 ; 0xfffffe04
@SETD 0x004DBBA0 -508 ; 0xfffffe04
@SETD 0x004DBBB1 -508 ; 0xfffffe04
; this section deals with the AI with BaseBuilding, to include the additional units in its random building roster
@SETD 0x004DBC48 -508 ; 0xfffffe04 ; was 0xffffff5c, counter's offset is 0xffffff04
@SETD 0x004DBC5B -508 ; 0xfffffe04
@SETD 0x004DBC6E -508 ; 0xfffffe04
@SETD 0x004DBC7B -508 ; 0xfffffe04
@SETD 0x004DBCE2 -508 ; 0xfffffe04

_HouseClass__AI_Unit_Extend_BestList_1:
    mov  al,byte [ebp + -0x18]
    mov  byte [ecx + ebp*0x1 + 0xfffffd03],al  ; was -0x4d
    jmp  0x004DBBBD

_HouseClass__AI_Unit_Extend_BestList_2:
    mov  al,byte [eax + ebp*0x1 + 0xfffffd04] ; was -0x4c
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