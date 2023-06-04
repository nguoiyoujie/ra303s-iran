;reads the keyword boolean AftermathFastBuildSpeed from the section [Aftermath] in rules.ini to enable quick build spede with the Aftermath expansion enabled (it's normally disabled if the expansion is enabled)

@HOOK 0x005611F3 _Time_To_Build_NewUnitsEnabled_Check

_Time_To_Build_NewUnitsEnabled_Check:

    cmp  byte [AftermathFastBuildSpeed],1

    jz   0x00561206

    cmp  byte [FastAMBuildSpeed],1
    jz   .Fast_AM_For_Skirmish_And_Singleplayer

.Normal_Code:
    cmp  dword [Globals___NewUnitsEnabled],0
    jz   0x00561206
    jmp  0x005611FC

.Fast_AM_For_Skirmish_And_Singleplayer:
    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    jz   .Fast_Speed
    cmp  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .Fast_Speed

    jmp  .Normal_Code

.Fast_Speed:
    jmp  0x00561206
