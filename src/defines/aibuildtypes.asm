;----------------------------------------------------------------
; src/defines/aibuildtypes.asm
;
; AI Building Type Definitions
;   Allows the AI to categorize their building orders
;
;----------------------------------------------------------------

; AIBuildTypes
%assign AIBuildType.NONE                        0 ; never build
%assign AIBuildType.POWER                       1 ; basic power. Subect to Rule.PowerSurplus
%assign AIBuildType.REFINERY                    2 ; refinery. Subject to Rule.RefineryRatio & Rule.RefineryLimit
%assign AIBuildType.BARRACKS                    3 ; barracks. Subject to Rule.BarracksRatio & Rule.BarracksLimit
%assign AIBuildType.WARFACTORY                  4 ; war factory. Subject to Rule.WarRatio & Rule.WarLimit
%assign AIBuildType.TECH                        5 ; tech building (radar, tech centre). Subject to 1 each
%assign AIBuildType.DEFENSE                     6 ; basic defense. Subject to Rule.TeslaRatio & Rule.TeslaLimit
%assign AIBuildType.ADV.DEFENSE                 7 ; tesla. Subject to Rule.DefenseRatio & Rule.DefenseLimit
%assign AIBuildType.AA.DEFENSE                  8 ; SAM / AAGun. Subject to Rule.AARatio & Rule.AALimit
%assign AIBuildType.AIRSTRIP                    9 ; Airstrip. Subject to Rule.AirstripRatio && Rule.AirstripLimit
%assign AIBuildType.HELIPAD                     10 ; Helipad. Subject to Rule.HelipadRatio && Rule.HelipadLimit
%assign AIBuildType.GENERIC                     11 ; lowest priority. Subject to AIBuildLimit

; PrerequisiteType_Enums
str.AIBuildType.NONE                            db"NONE",0
str.AIBuildType.POWER                           db"POWER",0
str.AIBuildType.REFINERY                        db"REFINERY",0
str.AIBuildType.BARRACKS                        db"BARRACKS",0
str.AIBuildType.WARFACTORY                      db"WARFACTORY",0
str.AIBuildType.TECH                            db"TECH",0
str.AIBuildType.DEFENSE                         db"DEFENSE",0
str.AIBuildType.ADV.DEFENSE                     db"ADV.DEFENSE",0
str.AIBuildType.AA.DEFENSE                      db"AA.DEFENSE",0
str.AIBuildType.AIRSTRIP                        db"AIRSTRIP",0
str.AIBuildType.HELIPAD                         db"HELIPAD",0
str.AIBuildType.GENERIC                         db"GENERIC",0


strlist.AIBuildTypes                            dd str.AIBuildType.NONE, \
                                                  str.AIBuildType.POWER, \
                                                  str.AIBuildType.REFINERY, \
                                                  str.AIBuildType.BARRACKS, \
                                                  str.AIBuildType.WARFACTORY, \
                                                  str.AIBuildType.TECH, \
                                                  str.AIBuildType.DEFENSE, \
                                                  str.AIBuildType.ADV.DEFENSE, \
                                                  str.AIBuildType.AA.DEFENSE, \
                                                  str.AIBuildType.AIRSTRIP, \
                                                  str.AIBuildType.HELIPAD, \
                                                  str.AIBuildType.GENERIC, \
                                                  0
   
