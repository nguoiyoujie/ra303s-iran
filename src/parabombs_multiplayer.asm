@LJMP 0x004D5B13, _Parabombs_Single_Player_Check

_Parabombs_Single_Player_Check:
    cmp  byte [Rules.General.ParabombsInMultiplayer],1
    jz   0x004D5B1C

    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    jmp  0x004D5B1A
