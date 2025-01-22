;----------------------------------------------------------------
; src/defines/housetypes.asm
;
; HouseType Definitions
;   HouseType represents a house supported by the game
;
;----------------------------------------------------------------

; HouseType
%define HouseType.Spain                    0
%define HouseType.Greece                   1
%define HouseType.USSR                     2
%define HouseType.England                  3
%define HouseType.Ukraine                  4
%define HouseType.Germany                  5
%define HouseType.France                   6
%define HouseType.Turkey                   7
%define HouseType.GoodGuy                  8
%define HouseType.BadGuy                   9
%define HouseType.Neutral                  10
%define HouseType.Special                  11
%define HouseType.Multi1                   12
%define HouseType.Multi2                   13
%define HouseType.Multi3                   14
%define HouseType.Multi4                   15
%define HouseType.Multi5                   16
%define HouseType.Multi6                   17
%define HouseType.Multi7                   18
%define HouseType.Multi8                   19

;new Houses
%define HouseType.Multi9                   20
%define HouseType.Multi10                  21
%define HouseType.Multi11                  22
%define HouseType.Multi12                  23
%define HouseType.Multi13                  24
%define HouseType.Multi14                  25
%define HouseType.Multi15                  26
%define HouseType.Multi16                  27
%define HouseType.Multi17                  28
%define HouseType.Multi18                  29
%define HouseType.Multi19                  30
%define HouseType.Multi20                  31


;PlayerColorType
%define PlayerColorType.YELLOW             0
%define PlayerColorType.LTBLUE             1
%define PlayerColorType.RED                2
%define PlayerColorType.GREEN              3
%define PlayerColorType.ORANGE             4
%define PlayerColorType.GREY               5
%define PlayerColorType.BLUE               6
%define PlayerColorType.BROWN              7
%define PlayerColorType.WHITE              8
%define PlayerColorType.BLACK              9
%define PlayerColorType.FLAMING_BLUE       10
%define PlayerColorType.TRUE_GREY          11
%define PlayerColorType.DIRTY_GREEN        12

%define PlayerColorType.MAX                12

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



