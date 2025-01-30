;----------------------------------------------------------------
; src/features/aftermath_fast_buildspeed_option.asm
;
; Reads the keyword boolean AftermathFastBuildSpeed from the section [Aftermath] in rules.ini to enable quick build speed with the Aftermath expansion enabled (it's normally disabled if the expansion is enabled)
;
; This function is enabled by including the following key(s): 
;   Rules.ini > [Aftermath] > AftermathFastBuildSpeed=true/false
;
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@LJMP 0x005611F3, _Time_To_Build_NewUnitsEnabled_Check

_Time_To_Build_NewUnitsEnabled_Check:

    cmp  byte[Rules.Aftermath.AftermathFastBuildSpeed],1

    jz   0x00561206

    cmp  byte[RedAlert.Options.FastAMBuildSpeed],1 ; legacy option?
    jz   .Fast_AM_For_Skirmish_And_Singleplayer

.Normal_Code:
    cmp  dword[Globals___NewUnitsEnabled],0
    jz   0x00561206
    jmp  0x005611FC

.Fast_AM_For_Skirmish_And_Singleplayer:
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jz   .Fast_Speed
    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .Fast_Speed

    jmp  .Normal_Code

.Fast_Speed:
    jmp  0x00561206
