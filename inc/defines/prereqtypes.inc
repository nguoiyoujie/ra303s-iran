;----------------------------------------------------------------
; inc/defines/prereqtypes.inc
;
; Prerequisite Type Definitions
;   Prerequisite Types emulate Prerequisite Groups from Tiberian Sun, allowing OR logic to be used for Prerequisite checks
;
;   Up to 32 (0 to 31 inclusive) Prerequisite Types are supported.
;
;----------------------------------------------------------------

%ifndef DEFINE_PREREQTYPES
%define DEFINE_PREREQTYPES 

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

cextern str.PrereqType.NONE       
cextern str.PrereqType.CONYARD    
cextern str.PrereqType.POWER      
cextern str.PrereqType.ADV.POWER  
cextern str.PrereqType.REFINERY   
cextern str.PrereqType.ORESILO    
cextern str.PrereqType.BARRACKS   
cextern str.PrereqType.WARFACTORY 
cextern str.PrereqType.RADAR      
cextern str.PrereqType.REPAIR     
cextern str.PrereqType.DEFENSE    
cextern str.PrereqType.ADV.DEFENSE
cextern str.PrereqType.AA.DEFENSE 
cextern str.PrereqType.TECH       
cextern str.PrereqType.AIRSTRIP   
cextern str.PrereqType.HELIPAD    
cextern str.PrereqType.SHIPYARD   
cextern str.PrereqType.LAB        
cextern str.PrereqType.ADV.LAB    
cextern str.PrereqType.ADV.WEAPON1
cextern str.PrereqType.ADV.WEAPON2
cextern str.PrereqType.FAKES      
cextern str.PrereqType.USER.22    
cextern str.PrereqType.USER.23    
cextern str.PrereqType.USER.24    
cextern str.PrereqType.USER.25    
cextern str.PrereqType.USER.26    
cextern str.PrereqType.USER.27    
cextern str.PrereqType.USER.28    
cextern str.PrereqType.USER.29    
cextern str.PrereqType.MISC       
cextern str.PrereqType.CIVBUILDING

cextern strlist.PrereqTypes       
   
%endif 
