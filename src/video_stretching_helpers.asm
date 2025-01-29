;keep a global flag telling telling the cnc-ddraw version patched by me (iran) to video stretch or not
;use the unused 'Processor' byte at 0x00607D78, this is supposed to be used to store CPU procressor info
;but isn't actually used

@LJMP 0x0053AF3B, _Campaign_Do_Win_ScoreClass__Presentation
@LJMP 0x0053B037, _Campaign_Do_Win_Map_Selection
@LJMP 0x0053ADF6, _Campaign_Do_Win_Multiplayer_Score_Presentation
@LJMP 0x0053B3E6, _Do_Win_Multiplayer_Score_Presentation
@LJMP 0x0053B6CF, _Do_Lose_Multiplayer_Score_Presentation

%define __processor 0x00607D78

_Campaign_Do_Win_ScoreClass__Presentation:
    mov  byte [__processor], 1

    call ScoreClass__Presentation
    mov  byte [__processor], 0
    jmp  0x0053AF40

_Campaign_Do_Win_Map_Selection:
    mov  byte [__processor], 1

    call MapSel___Map_Selection
    mov  byte [__processor], 0
    jmp  0x0053B03C

_Campaign_Do_Win_Multiplayer_Score_Presentation:
    mov  byte [__processor], 1

    call Score___Multi_Score_Presentation
    mov  byte [__processor], 0
    jmp  0x0053ADFB

_Do_Win_Multiplayer_Score_Presentation:
    mov  byte [__processor], 1

    call Score___Multi_Score_Presentation
    mov  byte [__processor], 0
    jmp  0x0053B3EB

_Do_Lose_Multiplayer_Score_Presentation:
    mov  byte [__processor], 1

    call Score___Multi_Score_Presentation
    mov  byte [__processor], 0
    jmp  0x0053B6D4
