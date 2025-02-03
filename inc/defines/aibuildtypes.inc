;----------------------------------------------------------------
; inc/defines/aibuildtypes.inc
;
; AI Building Type Definitions
;   Allows the AI to categorize their building orders
;
;----------------------------------------------------------------

%ifndef DEFINE_AIBUILDTYPES
%define DEFINE_AIBUILDTYPES 

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

cextern str.AIBuildType.NONE          
cextern str.AIBuildType.POWER         
cextern str.AIBuildType.REFINERY      
cextern str.AIBuildType.BARRACKS      
cextern str.AIBuildType.WARFACTORY    
cextern str.AIBuildType.TECH          
cextern str.AIBuildType.DEFENSE       
cextern str.AIBuildType.ADV.DEFENSE   
cextern str.AIBuildType.AA.DEFENSE    
cextern str.AIBuildType.AIRSTRIP      
cextern str.AIBuildType.HELIPAD       
cextern str.AIBuildType.GENERIC       

cextern strlist.AIBuildTypes 

%endif 