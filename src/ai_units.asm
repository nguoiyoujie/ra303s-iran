;added by lovalmidas
; hook into AI_Unit() to change how AI weights units in order to make its choices. This is done to support the additional units beyond the original UNIT_COUNT
; Note that AI behavior depends on Can_Build() checks and new units will be treated similar to Aftermath units due to being placed after them
@HOOK 0x004DB7F4 _HouseClass__AI_Unit_Extend_Stackframe
@HOOK 0x004DB880 _HouseClass__AI_Unit_Extend_CounterList_1
@HOOK 0x004DB892 _HouseClass__AI_Unit_Fix_Crash
@HOOK 0x004DB969 _HouseClass__AI_Unit_Extend_CounterList_2
@HOOK 0x004DBA40 _HouseClass__AI_Unit_Extend_CounterList_3
@HOOK 0x004DBA6D _HouseClass__AI_Unit_Extend_CounterList_4
@HOOK 0x004DBA95 _HouseClass__AI_Unit_Extend_CounterList_5
@HOOK 0x004DBAC9 _HouseClass__AI_Unit_Extend_CounterList_6
@HOOK 0x004DBB2D _HouseClass__AI_Unit_Extend_CounterList_7
@HOOK 0x004DBB9D _HouseClass__AI_Unit_Extend_CounterList_8
@HOOK 0x004DBBAE _HouseClass__AI_Unit_Extend_CounterList_9
@HOOK 0x004DBBB6 _HouseClass__AI_Unit_Extend_BestList_1
@HOOK 0x004DBBE4 _HouseClass__AI_Unit_Extend_BestList_2
@HOOK 0x004DBB6F _HouseClass__AI_Unit_Extend_Remove_CanBuild_From_TeamTypeCheck
; this section deals with the AI with BaseBuilding, to include the additional units in its random building roster
@HOOK 0x004DBC45 _HouseClass__AI_Unit_Extend_BaseBuildingList_1
@HOOK 0x004DBC58 _HouseClass__AI_Unit_Extend_BaseBuildingList_2
@HOOK 0x004DBC6B _HouseClass__AI_Unit_Extend_BaseBuildingList_3
@HOOK 0x004DBC78 _HouseClass__AI_Unit_Extend_BaseBuildingList_4
@HOOK 0x004DBCDF _HouseClass__AI_Unit_Extend_BaseBuildingList_5
; extends the check to new unittypeclass
@HOOK 0x004DBBC5 _HouseClass__AI_Unit_Expand
@HOOK 0x004DBC89 _HouseClass__AI_Unit_Expand_Choice
@HOOK 0x004DBCAE _HouseClass__AI_Unit_Expand_Choice_2
;added by lovalmidas/

; hold in reserve - it is known in AI_Vessels and AI_Infantry that the house point (eax) may be corrupted
UnitAIHouseClassPointer dd 0

; Warning: crude and arbitary extension of stackframe!
_HouseClass__AI_Unit_Extend_Stackframe:
    sub  esp,0x5e8  ; was e8, add 500h to hold counter[UNIT_COUNT] (0xfffffc04) (200h) and bestlist[UNIT_COUNT] (0xfffffa04) (200h)
    mov  [ebp-20h],eax
    mov  dword [UnitAIHouseClassPointer],eax
    jmp  0x004DB7FD

; possible corruption of [ebp-20h]
; A crash like this has not happened yet, this is pre-emptive
_HouseClass__AI_Unit_Fix_Crash:
    mov  dword eax,[UnitAIHouseClassPointer]
    add  eax,5
    jmp  0x004DB898

_HouseClass__AI_Unit_Extend_CounterList_1:
    mov  ebx,558h ; was 58
    lea  eax,[ebp + 0xfffffa04] ; was 0xffffff04, zero bytes
    jmp  0x004DB88B

_HouseClass__AI_Unit_Extend_CounterList_2:
    mov  dword [ebp + ebx*0x4 + 0xfffffc04],0x1
    jmp  0x004DB974

_HouseClass__AI_Unit_Extend_CounterList_3:
    cmp  esi,dword [ebx + ebp*0x1 + 0xfffffc04]
    jmp  0x004DBA47

_HouseClass__AI_Unit_Extend_CounterList_4:
    mov  dword [ebp + ecx*0x4 + 0xfffffc04],ebx
    jmp  0x004DBA74

_HouseClass__AI_Unit_Extend_CounterList_5:
    cmp  dword [ebp + eax*0x4 + 0xfffffc04],0x0
    jmp  0x004DBA9D

_HouseClass__AI_Unit_Extend_CounterList_6:
    dec  dword [ebp + eax*0x4 + 0xfffffc04]
    jmp  0x004DBAD0

_HouseClass__AI_Unit_Extend_CounterList_7:
    cmp  dword [ebp + eax*0x4 + 0xfffffc04],0x0
    jmp  0x004DBB35

_HouseClass__AI_Unit_Extend_CounterList_8:
    cmp  esi,dword [ebp + eax*0x4 + 0xfffffc04]
    jmp  0x004DBBA4

_HouseClass__AI_Unit_Extend_CounterList_9:
    cmp  esi,dword [ebp + eax*0x4 + 0xfffffc04]
    jmp  0x004DBBB5

_HouseClass__AI_Unit_Extend_BestList_1:
    mov  al,byte [ebp + -0x18]
    mov  byte [ecx + ebp*0x1 + 0xfffffa03],al  ; was -0x4d
    jmp  0x004DBBBD

_HouseClass__AI_Unit_Extend_BestList_2:
    mov  al,byte [eax + ebp*0x1 + 0xfffffa04] ; was -0x4c
    mov  byte [edx + 0x536],al
    jmp  0x004DBBEE

_HouseClass__AI_Unit_Extend_Remove_CanBuild_From_TeamTypeCheck:
    jmp  0x004DBB73



_HouseClass__AI_Unit_Extend_BaseBuildingList_1:
    ; manipulating local memory locations
    mov  dword [ebp + eax*0x4 + 0xfffffc04],0x14 ; was 0xffffff5c, counter's offset is 0xffffff04
    jmp  0x004DBC50

_HouseClass__AI_Unit_Extend_BaseBuildingList_2:
    mov  dword [ebp + eax*0x4 + 0xfffffc04],0x1
    jmp  0x004DBC63

_HouseClass__AI_Unit_Extend_BaseBuildingList_3:
    mov  dword [ebp + eax*0x4 + 0xfffffc04],edi
    jmp  0x004DBC72

_HouseClass__AI_Unit_Extend_BaseBuildingList_4:
    mov  ecx,dword [ebp + eax*0x4 + 0xfffffc04]
    jmp  0x004DBC7F

_HouseClass__AI_Unit_Extend_BaseBuildingList_5:
    mov  esi,dword [edx + ebp*0x1 + 0xfffffc04]
    jmp  0x004DBCE6

_HouseClass__AI_Unit_Expand:
    cmp  bl,[NewUnitTypeHeapCount] ; was UNIT_COUNT (0x16)
    jl   0x004DBB27
    jmp  0x004DBBCE

_HouseClass__AI_Unit_Expand_Choice:
    cmp  al,[NewUnitTypeHeapCount] ; was UNIT_COUNT (0x16)
    jl   0x004DBC05
    jmp  0x004DBC91

_HouseClass__AI_Unit_Expand_Choice_2:
    cmp  dh,[NewUnitTypeHeapCount] ; was UNIT_COUNT (0x16)
    jl   0x004DBCD6
    jmp  0x004DBCB3