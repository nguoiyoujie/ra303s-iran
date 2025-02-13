;----------------------------------------------------------------
; src/features/ai_load_infantry_to_any_transport.asm
;
; In skirmish and multiplayer, AI automatically loaded infantry into APCs and Phase Transports. Now, AI will load infantry into any vehicle with Passenger slots.
; 
; This function is enabled by default for Skirmish and multiplayer AI (so long as the House AI meets the criteria for [IQ] > GuardArea). For singleplayer, it is enabled by the key:
;   [AI] > GuardAreaLoadTransportsInSingleplayer=yes (in addition to [IQ] > GuardArea)
; 
; No compatibility issues is expected as this was not a configurable parameter.
;
;----------------------------------------------------------------

cextern Globals___Session_Type
cextern UnitClass__Mission_Guard

cextern Rules.AI.GuardAreaLoadTransportsInSingleplayer


@HACK 0x005819F5,0x005819FC,_UnitClass__Mission_Guard_Area_Enable_For_Singleplayer
    cmp  byte[Globals___Session_Type],0
    jz   .CheckRulesAI
    jmp  0x00581A02
.CheckRulesAI:
    cmp  byte[Rules.AI.GuardAreaLoadTransportsInSingleplayer],1
    je   0x00581A02
    jmp  0x00581C37
@ENDHACK


@HACK 0x00581A28,0x00581A30,_UnitClass__Mission_Guard_Area_Check_Passengers ; check Passenges>0 instead of hardcoded ID
    push edi
    movzx eax,al ; use movzx
    UnitTypeClass.FromIndex(eax,edi)
    cmp  byte[edi+UnitTypeClass.Offset.DeploysInto],0 ; hijack for MCV code
    jne   .MCVCode
    cmp  dword[edi+TechnoTypeClass.Offset.MaxPassengers],0
    pop  edi
    jnz  0x00581A64 ; enter
    jmp  0x00581C37 ; bail    
.MCVCode:
    mov  eax,ecx
    call UnitClass__Mission_Guard
    jmp  0x00581C3E ; exit    
@ENDHACK

