;----------------------------------------------------------------
; src/defines/gametypes.asm
;
; GameType Definitions
;   Per description from Remastered source: 
;   Types of games; used to tell which protocol we're using
;
;----------------------------------------------------------------

; GameType
%define GameType.GAME_NORMAL                 0  ; not multiplayer
%define GameType.GAME_MODEM                  1  ; modem game
%define GameType.GAME_NULL_MODEM             2  ; NULL-modem
%define GameType.GAME_IPX                    3  ; IPX Network game
%define GameType.GAME_INTERNET               4  ; Internet H2H
%define GameType.GAME_SKIRMISH               5  ; 1 plr vs. AI's
%define GameType.GAME_TEN                    6  ; TEN Network game
%define GameType.GAME_MPATH                  7  ; MPath Network game

