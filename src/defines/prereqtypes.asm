;----------------------------------------------------------------
; src/defines/prereqtypes.asm
;
; Prerequisite Type Definitions
;   Prerequisite Types emulate Prerequisite Groups from Tiberian Sun, allowing OR logic to be used for Prerequisite checks
;
;   Up to 32 (0 to 31 inclusive) Prerequisite Types are supported.
;
;----------------------------------------------------------------

; PrereqTypes
%assign PrereqType.NONE                        0
%assign PrereqType.CONYARD                     1
%assign PrereqType.POWER                       2
%assign PrereqType.ADV.POWER                   3
%assign PrereqType.REFINERY                    4
%assign PrereqType.ORESILO                     5
%assign PrereqType.BARRACKS                    6
%assign PrereqType.WARFACTORY                  7
%assign PrereqType.RADAR                       8
%assign PrereqType.REPAIR                      9
%assign PrereqType.DEFENSE                     10
%assign PrereqType.ADV.DEFENSE                 11
%assign PrereqType.AA.DEFENSE                  12
%assign PrereqType.TECH                        13
%assign PrereqType.AIRSTRIP                    14
%assign PrereqType.HELIPAD                     15
%assign PrereqType.SHIPYARD                    16
%assign PrereqType.LAB                         17
%assign PrereqType.ADV.LAB                     18
%assign PrereqType.ADV.WEAPON1                 19
%assign PrereqType.ADV.WEAPON2                 20
%assign PrereqType.FAKES                       21
%assign PrereqType.USER.22                     22
%assign PrereqType.USER.23                     23
%assign PrereqType.USER.24                     24
%assign PrereqType.USER.25                     25
%assign PrereqType.USER.26                     26
%assign PrereqType.USER.27                     27
%assign PrereqType.USER.28                     28
%assign PrereqType.USER.29                     29
%assign PrereqType.MISC                        30
%assign PrereqType.CIVBUILDING                 31

; PrerequisiteType_Enums
str.PrereqType.NONE                            db"NONE",0
str.PrereqType.CONYARD                         db"CONYARD",0
str.PrereqType.POWER                           db"POWER",0
str.PrereqType.ADV.POWER                       db"ADV.POWER",0
str.PrereqType.REFINERY                        db"REFINERY",0
str.PrereqType.ORESILO                         db"ORESILO",0
str.PrereqType.BARRACKS                        db"BARRACKS",0
str.PrereqType.WARFACTORY                      db"WARFACTORY",0
str.PrereqType.RADAR                           db"RADAR",0
str.PrereqType.REPAIR                          db"REPAIR",0
str.PrereqType.DEFENSE                         db"DEFENSE",0
str.PrereqType.ADV.DEFENSE                     db"ADV.DEFENSE",0
str.PrereqType.AA.DEFENSE                      db"AA.DEFENSE",0
str.PrereqType.TECH                            db"TECH",0
str.PrereqType.AIRSTRIP                        db"AIRSTRIP",0
str.PrereqType.HELIPAD                         db"HELIPAD",0
str.PrereqType.SHIPYARD                        db"SHIPYARD",0
str.PrereqType.LAB                             db"LAB",0
str.PrereqType.ADV.LAB                         db"ADV.LAB",0
str.PrereqType.ADV.WEAPON1                     db"ADV.WEAPON1",0
str.PrereqType.ADV.WEAPON2                     db"ADV.WEAPON2",0
str.PrereqType.FAKES                           db"FAKES",0
str.PrereqType.USER.22                         db"USER.22",0
str.PrereqType.USER.23                         db"USER.23",0
str.PrereqType.USER.24                         db"USER.24",0
str.PrereqType.USER.25                         db"USER.25",0
str.PrereqType.USER.26                         db"USER.26",0
str.PrereqType.USER.27                         db"USER.27",0
str.PrereqType.USER.28                         db"USER.28",0
str.PrereqType.USER.29                         db"USER.29",0
str.PrereqType.MISC                            db"MISC",0
str.PrereqType.CIVBUILDING                     db"CIVBUILDING",0

strlist.PrereqTypes                            dd str.PrereqType.NONE, \
                                                  str.PrereqType.CONYARD, \
                                                  str.PrereqType.POWER, \
                                                  str.PrereqType.ADV.POWER, \
                                                  str.PrereqType.REFINERY, \
                                                  str.PrereqType.ORESILO, \
                                                  str.PrereqType.BARRACKS, \
                                                  str.PrereqType.WARFACTORY, \
                                                  str.PrereqType.RADAR, \
                                                  str.PrereqType.REPAIR, \
                                                  str.PrereqType.DEFENSE, \
                                                  str.PrereqType.ADV.DEFENSE, \
                                                  str.PrereqType.AA.DEFENSE, \
                                                  str.PrereqType.TECH, \
                                                  str.PrereqType.AIRSTRIP, \
                                                  str.PrereqType.HELIPAD, \
                                                  str.PrereqType.SHIPYARD, \
                                                  str.PrereqType.LAB, \
                                                  str.PrereqType.ADV.LAB, \
                                                  str.PrereqType.ADV.WEAPON1, \
                                                  str.PrereqType.ADV.WEAPON2, \
                                                  str.PrereqType.FAKES, \
                                                  str.PrereqType.USER.22, \
                                                  str.PrereqType.USER.23, \
                                                  str.PrereqType.USER.24, \
                                                  str.PrereqType.USER.25, \
                                                  str.PrereqType.USER.26, \
                                                  str.PrereqType.USER.27, \
                                                  str.PrereqType.USER.28, \
                                                  str.PrereqType.USER.29, \
                                                  str.PrereqType.MISC, \
                                                  str.PrereqType.CIVBUILDING, \
                                                  0
   
