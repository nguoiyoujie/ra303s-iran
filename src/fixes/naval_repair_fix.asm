;----------------------------------------------------------------
; src/fixes/naval_repair_fix.asm
;
; Fix repair bug where vessels are still being repaired after moving away from the shipyard
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
; Fixes repairing on enemy naval yard and repairing on the move
; Taken from AlexB's Arda, with AlexB's help

@HOOK 0x004BD891 _EventClass__Execute_Vessel_Repair_Fixes

%define        Event_Execute_NULL    0x004BDFED

_EventClass__Execute_Vessel_Repair_Fixes:
    cmp  byte [Globals___Session_Type], GameType.GAME_NORMAL
    jz   .Apply_Fix

    cmp  byte [Globals___Session_Type], GameType.GAME_SKIRMISH
    jz   .Apply_Fix

    cmp  byte [Toggle_Fix_NavalRepairExploit], 1
    jz   .Apply_Fix

.Normal_Code:
    cmp  byte [esi+9], 2
    jnz  Event_Execute_NULL ; jumptable 004BD12D cases 6,21,22,24
    jmp  0x004BD89B

.Apply_Fix:
    Save_Registers

    cmp  byte [esi+9], 2
    jnz  .Fix_Event_Execute_NULL

    mov  eax, [ebp-0x24]


    ; Get HouseType of vessel to be repaired
    mov  edx, [eax+0x93]

    mov  eax, [ebp-0x28]

    cmp  eax, 0 ; check for null pointer
    jz   .Null_Pointer

    ; Get HouseClass of building to repair the vessel
    mov  eax, [eax+0x93]
    call HouseClass__As_Pointer

    ; Check alliance
    call HouseClass__Is_Ally

    cmp  eax, 0
    jz   .Fix_Event_Execute_NULL

    jmp  .Do_Repairs

.Fix_Event_Execute_NULL:
    mov  eax, [ebp-0x24] ; unit being repaired

    mov  dl, [eax+160h]  ; eax+160h is related to repair on the move fix
    and  dl, 0FEh
    mov  [eax+160h], dl

    mov  dl, [eax+160h]  ; eax+160h is related to repair on the move fix
    and  dl, 0FDh
    mov  [eax+160h], dl
    Restore_Registers
    jmp  Event_Execute_NULL

.Do_Repairs:
    Restore_Registers
    jmp  0x004BD89B

.Null_Pointer:
    Restore_Registers
    jmp  0x004BD89B ; null pointe gets checked around here too, use that code
