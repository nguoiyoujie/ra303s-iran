;----------------------------------------------------------------
; src/defines/housetypes.asm
;
; HouseType Definitions
;   HouseType represents a house supported by the game
;
;----------------------------------------------------------------

; HouseType
%assign HouseType.Spain                    0
%assign HouseType.Greece                   1
%assign HouseType.USSR                     2
%assign HouseType.England                  3
%assign HouseType.Ukraine                  4
%assign HouseType.Germany                  5
%assign HouseType.France                   6
%assign HouseType.Turkey                   7
%assign HouseType.GoodGuy                  8
%assign HouseType.BadGuy                   9
%assign HouseType.Neutral                  10
%assign HouseType.Special                  11
%assign HouseType.Multi1                   12
%assign HouseType.Multi2                   13
%assign HouseType.Multi3                   14
%assign HouseType.Multi4                   15
%assign HouseType.Multi5                   16
%assign HouseType.Multi6                   17
%assign HouseType.Multi7                   18
%assign HouseType.Multi8                   19

;new Houses
%assign HouseType.Multi9                   20
%assign HouseType.Multi10                  21
%assign HouseType.Multi11                  22
%assign HouseType.Multi12                  23
%assign HouseType.Multi13                  24
%assign HouseType.Multi14                  25
%assign HouseType.Multi15                  26
%assign HouseType.Multi16                  27
%assign HouseType.Multi17                  28
%assign HouseType.Multi18                  29
%assign HouseType.Multi19                  30
%assign HouseType.Multi20                  31


;PlayerColorType
%assign PlayerColorType.YELLOW             0
%assign PlayerColorType.LTBLUE             1
%assign PlayerColorType.RED                2
%assign PlayerColorType.GREEN              3
%assign PlayerColorType.ORANGE             4
%assign PlayerColorType.GREY               5
%assign PlayerColorType.BLUE               6
%assign PlayerColorType.BROWN              7
%assign PlayerColorType.WHITE              8
%assign PlayerColorType.BLACK              9
%assign PlayerColorType.FLAMING_BLUE       10
%assign PlayerColorType.TRUE_GREY          11
%assign PlayerColorType.DIRTY_GREEN        12

%assign PlayerColorType.MAX                12

str.PlayerColorType.YELLOW             db"YELLOW",0
str.PlayerColorType.LTBLUE             db"LTBLUE",0
str.PlayerColorType.RED                db"RED",0
str.PlayerColorType.GREEN              db"GREEN",0
str.PlayerColorType.ORANGE             db"ORANGE",0
str.PlayerColorType.GREY               db"GREY",0
str.PlayerColorType.BLUE               db"BLUE",0
str.PlayerColorType.BROWN              db"BROWN",0
str.PlayerColorType.WHITE              db"WHITE",0
str.PlayerColorType.BLACK              db"BLACK",0
str.PlayerColorType.FLAMING_BLUE       db"FLAMING_BLUE",0
str.PlayerColorType.TRUE_GREY          db"TRUE_GREY",0
str.PlayerColorType.DIRTY_GREEN        db"DIRTY_GREEN",0

strlist.PlayerColorTypes			 dd str.PlayerColorType.YELLOW, \
										str.PlayerColorType.LTBLUE, \
										str.PlayerColorType.RED, \
										str.PlayerColorType.GREEN, \
										str.PlayerColorType.ORANGE, \
										str.PlayerColorType.GREY, \
										str.PlayerColorType.BLUE, \
										str.PlayerColorType.BROWN, \
										str.PlayerColorType.WHITE, \
										str.PlayerColorType.BLACK, \
										str.PlayerColorType.FLAMING_BLUE, \
										str.PlayerColorType.TRUE_GREY, \
										str.PlayerColorType.DIRTY_GREEN, \
										0



