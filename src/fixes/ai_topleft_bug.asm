;----------------------------------------------------------------
; src/fix/ai_topleft_bug.asm
;
; It is possible for HouseClass::Where_To_Go() to return a CELL pointing to location 0.
;
; 3.03p used a solution that recursively calls Where_To_Go if this happens.
; This version returns the unit's current cell instead
; 
; This function is enabled by including the following key in Rules.ini. 
;   Rules.ini > [AI] > FixAISendingTanksTopLeft=true
;
; Defaults to true in Skirmish mode, and false otherwise
;
;----------------------------------------------------------------

@LJMP 0x004DDA00, _HouseClass__Where_To_Go_Save_CurrentObject
@LJMP 0x004DDA71, _HouseClass__Where_To_Go_Use_CurrentCell_on_Location_Failure

_HouseClass__Where_To_Go_Save_CurrentObject:
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    je   .Apply_Fix_For_Skirmish

    cmp  byte [Rules.AI.FixAISendingTanksTopLeft],1
    jnz  .Original_Code

.Apply_Fix_For_Skirmish:
    push ecx
    ; eax is the house, edx is the object to be moved
    ; save the object for future use
    push edx
    mov  ecx,eax
    mov  eax,edx
    jmp  0x004DDA05

.Original_Code:
    push ecx
    mov  ecx,eax
    mov  eax,edx
    jmp  0x004DDA05


_HouseClass__Where_To_Go_Use_CurrentCell_on_Location_Failure:
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    je   .Apply_Fix_For_Skirmish

    cmp  byte [Rules.AI.FixAISendingTanksTopLeft],1
    jnz  .Original_Code

.Apply_Fix_For_Skirmish:
    call MapClass__Nearby_Location
    cmp  eax,-1 ; check for 0xFFFFFFFF cell
    jz   .DefaultToObjectCoord
    test eax,eax ; check for top-left cell
    jz   .DefaultToObjectCoord
    add  esp,4
    jmp  0x004DDA76

.DefaultToObjectCoord:
    pop  edx
    mov  eax, dword [edx+5] ; AbstractClass::Coord
    call Coord___Coord_Cell
    jmp  0x004DDA76

.Original_Code:
    call MapClass__Nearby_Location
    jmp  0x004DDA76



; 3.03p
;@LJMP 0x004DDA00, _HouseClass__Where_To_Go_Fix_AI_Attacking_Top_Left_Bug1
;@LJMP 0x004DDA71, _HouseClass__Where_To_Go_Fix_AI_Attacking_Top_Left_Bug2
;
;
;_HouseClass__Where_To_Go_Fix_AI_Attacking_Top_Left_Bug1:
;    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
;    je   .Apply_Fix_For_Skirmish
;
;    cmp  byte [Rules.AI.FixAISendingTanksTopLeft],1
;    jnz  .Original_Code
;
;.Apply_Fix_For_Skirmish:
;
;    push ecx
;    ; push eax,edx for a future recursive call
;    push eax
;    push edx
;
;    mov  ecx,eax
;    mov  eax,edx
;    jmp  0x004DDA05
;
;.Original_Code:
;    push ecx
;
;    mov  ecx,eax
;    mov  eax,edx
;    jmp  0x004DDA05
;
;
;; In case the Where_To_Go returns 0 
;_HouseClass__Where_To_Go_Fix_AI_Attacking_Top_Left_Bug2:
;    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
;    je   .Apply_Fix_For_Skirmish
;
;    cmp  byte [Rules.AI.FixAISendingTanksTopLeft],1
;    jnz  .Original_Code
;
;.Apply_Fix_For_Skirmish:
;
;    call MapClass__Nearby_Location
;    cmp  eax,0
;    jz   .Recursive_Call_Where_To_Go
;
;    add  esp,8
;    jmp  0x004DDA76
;
;.Recursive_Call_Where_To_Go:
;    pop  edx
;    pop  eax
;    call HouseClass__Where_To_Go
;    lea  esp,[ebp-8]
;    pop  ecx
;    pop  ebx
;    pop  ebp
;    retn
;
;.Original_Code:
;    call MapClass__Nearby_Location
;    jmp  0x004DDA76
;