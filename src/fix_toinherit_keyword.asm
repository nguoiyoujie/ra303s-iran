;ToInherit= works in multiplayer maps, so after loading say a savegame of Allies mission 4, quitting and starting up the Marooned II multiplayer map, random units supposed to carry over spawn on the map.

@HOOK 0x0053D7FB _Read_Scenario_INI_Load_ToInherit

_Read_Scenario_INI_Load_ToInherit:
    cmp  byte [Globals___Session_Type], GameType.GAME_NORMAL
    jnz  .Return_False

    call INIClass__Get_Bool
    jmp  0x0053D800

.Return_False:
    mov  eax, 0
    jmp  0x0053D800
