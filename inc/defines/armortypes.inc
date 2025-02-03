;----------------------------------------------------------------
; inc/defines/armortypes.inc
;
; ArmorType Definitions
;   ArmorType represent a set of armors used to modify incoming damage based on Warhead.
;   Used for damage calculus.
;
;   Red Alert originally supports 5 types. This file allows more types to be used.
;
;----------------------------------------------------------------

%ifndef DEFINE_ARMORTYPES
%define DEFINE_ARMORTYPES 

; Base ArmorTypes
%assign ArmorType.None        0
%assign ArmorType.Wood        1
%assign ArmorType.Light       2
%assign ArmorType.Heavy       3
%assign ArmorType.Concrete    4
%assign ArmorType.Flak        5
%assign ArmorType.Plate       6
%assign ArmorType.Medium      7
%assign ArmorType.Steel       8
%assign ArmorType.Special_1   9
%assign ArmorType.Special_2   10

cextern str.ArmorType.None        
cextern str.ArmorType.Wood        
cextern str.ArmorType.Light       
cextern str.ArmorType.Heavy       
cextern str.ArmorType.Concrete    
cextern str.ArmorType.Flak        
cextern str.ArmorType.Plate       
cextern str.ArmorType.Medium      
cextern str.ArmorType.Steel       
cextern str.ArmorType.Special_1   
cextern str.ArmorType.Special_2  

cextern strlist.ArmorTypes   

cextern str.ArmorDefault      

%endif