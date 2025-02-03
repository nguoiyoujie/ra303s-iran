;----------------------------------------------------------------
; inc/defines/specialtypes.inc
;
; Special Type Definitions
;   List of support powers. In future, work on expanding the support power list can be defined here.
;
;----------------------------------------------------------------

%ifndef DEFINE_SPECIALTYPES
%define DEFINE_SPECIALTYPES 

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

cextern str.SpecialType.NONE         
cextern str.SpecialType.SONAR_PULSE  
cextern str.SpecialType.NUCLEAR_BOMB 
cextern str.SpecialType.CHRONOSPHERE 
cextern str.SpecialType.PARA_BOMB    
cextern str.SpecialType.PARA_INFANTRY
cextern str.SpecialType.SPY_MISSION  
cextern str.SpecialType.IRON_CURTAIN 
cextern str.SpecialType.GPS          

cextern strlist.SpecialTypes         

%endif
