;----------------------------------------------------------------
; src/features/forced_alliances.asm
;
; Allows suppression of ally requests, so no new alliances may be issued for the game
; 
; This function is enabled by by filling in one or more of the following INI keys:
;   Rules.ini/Map > [AI] > ForcedAlliances - Suppresses ally requests. Also disables Computer_Paranoid() (ai_mutual_alliance.asm)
;
; No compatibility issues is expected as these AI customizations was not a feature of the unmodified game.
;
;----------------------------------------------------------------

@HOOK 0x004BD167 EventClass__Execute_Ally_Forced_Alliances


EventClass__Execute_Ally_Forced_Alliances:
    mov  eax, 0x0065D994

    cmp  byte [Toggle_Feature_ForcedAlliances], 1
    jz   0x004BDFED ; jump to EVENT_EXECUTE_NULL

    jmp  0x004BD16C
