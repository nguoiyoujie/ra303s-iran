; New prerequisite check values

; SpecialTypes (0-15)
%define SpecialType.NONE                          0
%define SpecialType.SONAR_PULSE                   1 ; Sonar pulse checks not implemented
%define SpecialType.NUCLEAR_BOMB                  2
%define SpecialType.CHRONOSPHERE                  3
%define SpecialType.PARA_BOMB                     4
%define SpecialType.PARA_INFANTRY                 5
%define SpecialType.SPY_MISSION                   6
%define SpecialType.IRON_CURTAIN                  7
%define SpecialType.GPS                           8


str.SpecialType.SONAR_PULSE                       db"SONARPULSE",0
str.SpecialType.NUCLEAR_BOMB                      db"NUCLEARBOMB",0 
str.SpecialType.CHRONOSPHERE                      db"CHRONOSPHERE",0
str.SpecialType.PARA_BOMB                         db"PARABOMB",0
str.SpecialType.PARA_INFANTRY                     db"PARAINFANTRY",0
str.SpecialType.SPY_MISSION                       db"SPYPLANE",0
str.SpecialType.IRON_CURTAIN                      db"IRONCURTAIN",0
str.SpecialType.GPS                               db"GPS",0


strlist.SpecialTypes                              dd str.SpecialType.SONAR_PULSE,str.SpecialType.NUCLEAR_BOMB,str.SpecialType.CHRONOSPHERE,str.SpecialType.PARA_BOMB,str.SpecialType.PARA_INFANTRY,str.SpecialType.SPY_MISSION,str.SpecialType.IRON_CURTAIN,str.SpecialType.GPS


; store the new specialtype record per house (use 32-bit instead of 16-bit in case we use a different location within BuildingType to store the special type)
Houses.SpecialScan                                times 32 dd 0 
Houses.Radar                                      times 32 db 0 







