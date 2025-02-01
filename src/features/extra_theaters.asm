;----------------------------------------------------------------
; src/features/extra_theatres.asm
;
; Extend the theatres to support 12 fixed theatres:
;   TEMPERATE, SNOW, INTERIOR, WINTER, DESERT, JUNGLE, BARREN, CAVE, CUSTOM1, CUSTOM2, CUSTOM3, CUSTOM4
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as those theaters were not available in the original game
;
;----------------------------------------------------------------

%define THEATERS_COUNT 12 ; was 3

@SET 0x004F7805,{mov edx,5500000} ; _Init_Heaps_Larger_Theater_Buffer
;@SJMP 0x0041C6A1,0x0041C6A6 ; _AnimTypeClass__Init_Theater_Check_NOP
@SJMP 0x0056AAE9,0x0056AAF1 ; _TerrainClass__Unlimbo_Theater_Check_NOP
;@SJMP 0x00524B68,0x00524B8B ; _OverlayTypeClass__Init_Theater_Check_NOP
@SJMP 0x0049EAF5,0x0049EAF9 ; _TemplateTypeClass__Init_Theater_Check_NOP
@SJMP 0x0055B8FA,0x0055B900 ; _TerrainTypeClass__Init_Theater_Check_NOP

; point to our array instead of the pre-existing one
@SET 0x0055B909,{add eax,Temperate_Name} ; _TerrainTypeClass__Init_Theater
@SET 0x00549E0A,{add eax,Temperate_Name} ; _SmudgeTypeClass__Init_Theater
@SET 0x00524B76,{add eax,Temperate_Name} ; _OverlayTypeClass__Init_Theater
@SET 0x004AF0D4,{add eax,Temperate_Name} ; _DisplayClass__Init_Theater2
@SET 0x004AF057,{add eax,Temperate_Name} ; _DisplayClass__Init_Theater
@SET 0x004A9450,{add eax,Temperate_Name} ; _Fading_Table_Name_Theater
@SET 0x0049EB02,{add eax,Temperate_Name} ; _TemplateTypeClass__Init_Theater
@SET 0x004638A4,{mov ecx,Temperate_Name} ; _CCINIClass__Put_TheaterType_Theater
@SET 0x00453988,{add eax,Temperate_Name} ; _BuildingTypeClass__Init_Theater2
@SET 0x00453943,{add edx,Temperate_Name} ; _BuildingTypeClass__Init_Theater
@SET 0x0041C6AF,{add eax,Temperate_Name} ; _AnimTypeClass__Init_Theater
@SET 0x004A7AEB,{add edx,Temperate_Name} ; _Theater_From_Name_New_Theaters_Array
@SET 0x004A7AD4,{cmp dl,THEATERS_COUNT} ; _Theater_From_Name_New_Theaters_Counter_Check
; If no match is found, revert to TEMPERATE instead of crashing the game
@SET 0x004A7AFF,{mov al,0x1}


[section .rdata]
; Recreating theatre array
; <16 byte name>, <10 byte mix reference>, <4 byte extension>
; All entries must be NULL-terminated.
Temperate_Name  db"TEMPERATE", 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Temperate_Root  db"TEMPERAT", 0, 0 ; 10 bytes
Temperate_Ext   db"TEM", 0 ; 4 bytes
Snow_Name       db"SNOW", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Snow_Root       db"SNOW", 0, 0, 0, 0, 0, 0 ; 10 bytes
Snow_Ext        db"SNO", 0 ; 4 bytes
Interior_Name   db"INTERIOR", 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Interior_Root   db"INTERIOR", 0, 0 ; 10 bytes
Interior_Ext    db"INT", 0 ; 4 bytes
Winter_Name     db"WINTER", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Winter_Root     db"WINTER", 0, 0, 0, 0 ; 10 bytes
Winter_Ext      db"WIN", 0 ; 4 bytes, needs to be changed back to WIN
Desert_Name     db"DESERT", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Desert_Root     db"DESERT", 0, 0, 0, 0 ; 10 bytes
Desert_Ext      db"DES", 0 ; 4 bytes
Jungle_Name     db"JUNGLE", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Jungle_Root     db"JUNGLE", 0, 0, 0, 0 ; 10 bytes
Jungle_Ext      db"JUN",0 ; 4 bytes
Barren_Name     db"BARREN", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Barren_Root     db"BARREN", 0, 0, 0, 0 ; 10 bytes
Barren_Ext      db"BAR",0 ; 4 bytes
Cave_Name       db"CAVE", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Cave_Root       db"CAVE", 0, 0, 0, 0, 0, 0 ; 10 bytes
Cave_Ext        db"CAV",0 ; 4 bytes

; User customizations, until a true variable loader can be implemented (if needed)
Custom1_Name    db"CUSTOM1", 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Custom1_Root    db"CUSTOM1", 0, 0, 0 ; 10 bytes
Custom1_Ext     db"CM1",0 ; 4 bytes
Custom2_Name    db"CUSTOM2", 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Custom2_Root    db"CUSTOM2", 0, 0, 0 ; 10 bytes
Custom2_Ext     db"CM2",0 ; 4 bytes
Custom3_Name    db"CUSTOM3", 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Custom3_Root    db"CUSTOM3", 0, 0, 0 ; 10 bytes
Custom3_Ext     db"CM3",0 ; 4 bytes
Custom4_Name    db"CUSTOM4", 0, 0, 0, 0, 0, 0, 0, 0, 0 ; 16 bytes
Custom4_Root    db"CUSTOM4", 0, 0, 0 ; 10 bytes
Custom4_Ext     db"CM4",0 ; 4 bytes




