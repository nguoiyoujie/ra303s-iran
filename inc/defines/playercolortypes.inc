;----------------------------------------------------------------
; inc/defines/playercolortypes.inc
;
; PlayerColorType Definitions
;   PlayerColorType represents a color supported by the game
;
;----------------------------------------------------------------

%ifndef DEFINE_PLAYERCOLORTYPES
%define DEFINE_PLAYERCOLORTYPES 

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
%assign PlayerColorType.DESERT             13
%assign PlayerColorType.STEEL              14
%assign PlayerColorType.NOD_GREY           15
%assign PlayerColorType.PURPLE             16
%assign PlayerColorType.DARK_GOLD          17
%assign PlayerColorType.DARK_BLUE          18
%assign PlayerColorType.DARK_RED           19
%assign PlayerColorType.DARK_GREEN         20
%assign PlayerColorType.DARK_ORANGE        21
%assign PlayerColorType.CHOCOLATE          22

%assign PlayerColorType.MAX                22

cextern str.PlayerColorType.YELLOW           
cextern str.PlayerColorType.LTBLUE           
cextern str.PlayerColorType.RED              
cextern str.PlayerColorType.GREEN            
cextern str.PlayerColorType.ORANGE           
cextern str.PlayerColorType.GREY             
cextern str.PlayerColorType.BLUE             
cextern str.PlayerColorType.BROWN            
cextern str.PlayerColorType.WHITE            
cextern str.PlayerColorType.BLACK            
cextern str.PlayerColorType.FLAMING_BLUE     
cextern str.PlayerColorType.TRUE_GREY        
cextern str.PlayerColorType.DIRTY_GREEN      
cextern str.PlayerColorType.DESERT     
cextern str.PlayerColorType.STEEL      
cextern str.PlayerColorType.NOD_GREY   
cextern str.PlayerColorType.PURPLE     
cextern str.PlayerColorType.DARK_GOLD  
cextern str.PlayerColorType.DARK_BLUE  
cextern str.PlayerColorType.DARK_RED   
cextern str.PlayerColorType.DARK_GREEN 
cextern str.PlayerColorType.DARK_ORANGE
cextern str.PlayerColorType.CHOCOLATE  

cextern strlist.PlayerColorTypes

%endif

