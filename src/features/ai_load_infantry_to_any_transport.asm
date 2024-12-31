;----------------------------------------------------------------
; src/features/ai_load_infantry_to_any_transport.asm
;
; In skirmish and multiplayer, AI automatically loaded infantry into APCs and Phase Transports. Now, AI will load infantry into any vehicle with Passenger slots.
; 
; This function is enabled by default for Skirmish and multiplayer AI (so long as the House AI meets the criteria for [IQ] > GuardArea). For singleplayer, it is enabled by the key:
;   [AI] > GuardAreaLoadTransportsInSingleplayer=yes
; 
; No compatibility issues is expected as this was not a configurable parameter.
;
;----------------------------------------------------------------

@HOOK 0x005819F5 _UnitClass__Mission_Guard_Area_Enable_For_Singleplayer
@HOOK 0x00581A28 _UnitClass__Mission_Guard_Area_Check_Passengers

_UnitClass__Mission_Guard_Area_Enable_For_Singleplayer:
    cmp  byte[0x0067F2B4],0
    jz   .CheckRulesAI
    jmp  0x00581A02
.CheckRulesAI:
    cmp  byte[Rules.AI.GuardAreaLoadTransportsInSingleplayer],1
    je   0x00581A02
    jmp  0x00581C37


_UnitClass__Mission_Guard_Area_Check_Passengers: ; check Passenges>0 instead of hardcoded ID
    push eax
    push ebx
    push edx
    push edi
    movzx eax,al ; use movzx
    UnitTypeClass.FromIndex(eax,edi)
    TechnoTypeClass.MaxPassengers.Get(edi,edx) 
    cmp  edx,0
    pop  edi
    pop  edx
    pop  ebx
    pop  eax
    jnz  0x00581A64 ; enter
    jmp  0x00581C37 ; bail    

