;----------------------------------------------------------------
; src/defines/gametypes.asm
;
; GameType Definitions
;   Per description from Remastered source: 
;   Types of games; used to tell which protocol we're using
;
;----------------------------------------------------------------

; GameType
%assign GameType.GAME_NORMAL                 0  ; not multiplayer
%assign GameType.GAME_MODEM                  1  ; modem game
%assign GameType.GAME_NULL_MODEM             2  ; NULL-modem
%assign GameType.GAME_IPX                    3  ; IPX Network game
%assign GameType.GAME_INTERNET               4  ; Internet H2H
%assign GameType.GAME_SKIRMISH               5  ; 1 plr vs. AI's
%assign GameType.GAME_TEN                    6  ; TEN Network game
%assign GameType.GAME_MPATH                  7  ; MPath Network game

