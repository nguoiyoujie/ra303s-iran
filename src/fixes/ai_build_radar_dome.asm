;----------------------------------------------------------------
; src/fixes/ai_build_radar_dome.asm
;
; For some reason, the AI will build the Radar Dome only if there is an air threat (at least one non-allied house has an air unit).
; Of course, the Radar is used for many more things.
; 
; This function is enabled by including the following key in Rules.ini. 
;   Rules.ini > [AI] > BuildRadarWithoutAirThreatCheck=true/false
;
; Defaults to true in Skirmish mode, and false otherwise
; 
; Compatibility changes from 3.03p:
; 3.03p used [AI] > ReenableAITechUpCheck and [AI] > RemoveAITechupCheck. These keys had been replaced. Use the following conversions:
;   ReenableAITechUpCheck=false -> BuildRadarWithoutAirThreatCheck=false
;   ReenableAITechUpCheck=true AND RemoveAITechupCheck=false -> leave BuildRadarWithoutAirThreatCheck empty
;   ReenableAITechUpCheck=true AND RemoveAITechupCheck=true -> BuildRadarWithoutAirThreatCheck=true
;
;----------------------------------------------------------------

@LJMP 0x004DAFA4, _HouseClass__AI_Building_Build_Radar_Dome
@LJMP 0x004DAFD5, _HouseClass__AI_Building_Build_Radar_Dome_Have_War_Check

_HouseClass__AI_Building_Build_Radar_Dome:
    jnz  0x004DB0E4
    cmp  byte [Rules.AI.BuildRadarWithoutAirThreatCheck],-1
    jz   .Normal_Code
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    je   .No_Techup_Check
    cmp  byte [Rules.AI.BuildRadarWithoutAirThreatCheck],1
    jz   .No_Techup_Check

.Normal_Code:
    jmp  0x004DAFAA

.No_Techup_Check:
    jmp  0x004DAFB7


_HouseClass__AI_Building_Build_Radar_Dome_Have_War_Check:
    jnz  0x004DB050
    ; do we need to do this check twice?
    cmp  byte [Rules.AI.BuildRadarWithoutAirThreatCheck],-1
    jz   .Normal_Code
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .War_Check
    cmp  byte [Rules.AI.BuildRadarWithoutAirThreatCheck],1
    jz   .War_Check
    jmp  .Normal_Code

.War_Check:
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x80 ; WARFACTORY
    ;cmp  dword [ecx+30Eh],0 ; war factory count 
    jz   0x004DB050

.Normal_Code:
    jmp  0x004DAFDB
