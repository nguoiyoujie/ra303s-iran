;----------------------------------------------------------------
; src/defines/specialtypes.asm
;
; Special Type Definitions
;   List of support powers. In future, work on expanding the support power list can be defined here.
;
;----------------------------------------------------------------

; SpecialTypes (0-15)
%assign SpecialType.NONE                          0
%assign SpecialType.SONAR_PULSE                   1 ; Sonar pulse checks not implemented
%assign SpecialType.NUCLEAR_BOMB                  2
%assign SpecialType.CHRONOSPHERE                  3
%assign SpecialType.PARA_BOMB                     4
%assign SpecialType.PARA_INFANTRY                 5
%assign SpecialType.SPY_MISSION                   6
%assign SpecialType.IRON_CURTAIN                  7
%assign SpecialType.GPS                           8

str.SpecialType.NONE                              db"NONE",0
str.SpecialType.SONAR_PULSE                       db"SONARPULSE",0
str.SpecialType.NUCLEAR_BOMB                      db"NUCLEARBOMB",0 
str.SpecialType.CHRONOSPHERE                      db"CHRONOSPHERE",0
str.SpecialType.PARA_BOMB                         db"PARABOMB",0
str.SpecialType.PARA_INFANTRY                     db"PARAINFANTRY",0
str.SpecialType.SPY_MISSION                       db"SPYPLANE",0
str.SpecialType.IRON_CURTAIN                      db"IRONCURTAIN",0
str.SpecialType.GPS                               db"GPS",0

strlist.SpecialTypes                              dd str.SpecialType.NONE, \
                                                     str.SpecialType.SONAR_PULSE, \
                                                     str.SpecialType.NUCLEAR_BOMB, \
                                                     str.SpecialType.CHRONOSPHERE, \
                                                     str.SpecialType.PARA_BOMB, \
                                                     str.SpecialType.PARA_INFANTRY, \
                                                     str.SpecialType.SPY_MISSION, \
                                                     str.SpecialType.IRON_CURTAIN, \
                                                     str.SpecialType.GPS, \
                                                     0
