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

@HOOK 0x0056AAE9 _TerrainClass__TerrainClass_Jump_Over
@HOOK 0x004F7805 _Init_Heaps_Larger_Theater_Buffer
;@HOOK 0x0041C6A1 _AnimTypeClass__Init_Theater_Check_NOP
@HOOK 0x0056AAE9 _TerrainClass__Unlimbo_Theater_Check_NOP
;@HOOK 0x00524B68 _OverlayTypeClass__Init_Theater_Check_NOP
@HOOK 0x0049EAF3 _TemplateTypeClass__Init_Theater_Check_NOP
@HOOK 0x0055B8FA _TerrainTypeClass__Init_Theater_Check_NOP
@HOOK 0x0055B909 _TerrainTypeClass__Init_Theater
@HOOK 0x00549E0A _SmudgeTypeClass__Init_Theater
@HOOK 0x00524B76 _OverlayTypeClass__Init_Theater
@HOOK 0x004AF0D4 _DisplayClass__Init_Theater2
@HOOK 0x004AF057 _DisplayClass__Init_Theater
@HOOK 0x004A9450 _Fading_Table_Name_Theater
@HOOK 0x0049EB02 _TemplateTypeClass__Init_Theater
@HOOK 0x004638A4 _CCINIClass__Put_TheaterType_Theater
@HOOK 0x00453988 _BuildingTypeClass__Init_Theater2
@HOOK 0x00453943 _BuildingTypeClass__Init_Theater
@HOOK 0x0041C6AF _AnimTypeClass__Init_Theater
@HOOK 0x004A7AEB _Theater_From_Name_New_Theaters_Array
@HOOK 0x004A7AD4 _Theater_From_Name_New_Theaters_Counter_Check
; If no match is found, revert to TEMPERATE instead of crashing the game
@SETB 0x004A7B00 0x01

%define THEATERS_COUNT 12 ; was 3

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


_TerrainClass__Unlimbo_Theater_Check_NOP:
    jmp  0x0056AAF1

_TerrainClass__TerrainClass_Jump_Over:
    jmp  0x0056A4E0

_AnimTypeClass__Init_Theater_Check_NOP:
    jmp  0x0041C6A6

_OverlayTypeClass__Init_Theater_Check_NOP:
    jmp  0x00524B8B

_Init_Heaps_Larger_Theater_Buffer:
    mov  edx, 5500000
    jmp  0x004F780A

_TemplateTypeClass__Init_Theater_Check_NOP:
    shl  eax, cl
    jmp  0x0049EAF9

_TerrainTypeClass__Init_Theater_Check_NOP:
    shl  eax, cl
    jmp  0x0055B900

_TerrainTypeClass__Init_Theater:
    add  eax, Temperate_Name
    jmp  0x0055B90E

_SmudgeTypeClass__Init_Theater:
    add  eax, Temperate_Name
    jmp  0x00549E0F

_OverlayTypeClass__Init_Theater:
    add  eax, Temperate_Name
    jmp  0x00524B7B

_DisplayClass__Init_Theater2:
    add  eax, Temperate_Name
    jmp  0x004AF0D9

_DisplayClass__Init_Theater:
    add  eax, Temperate_Name
    jmp  0x004AF05C

_Fading_Table_Name_Theater:
    add  eax, Temperate_Name
    jmp  0x004A9455

_TemplateTypeClass__Init_Theater:
    add  eax, Temperate_Name
    jmp  0x0049EB07

_CCINIClass__Put_TheaterType_Theater:
    mov  ecx, Temperate_Name
    jmp  0x004638A9

_Theater_From_Name_New_Theaters_Array:
    add  edx, Temperate_Name
    jmp  0x004A7AF1

_Theater_From_Name_New_Theaters_Counter_Check:
    cmp  dl, THEATERS_COUNT
    jl   0x004A7AE0
    jmp  0x004A7AFF

_AnimTypeClass__Init_Theater:
    add  eax, Temperate_Name
    jmp  0x0041C6B4

_BuildingTypeClass__Init_Theater:
    add  edx, Temperate_Name
    jmp  0x00453949

_BuildingTypeClass__Init_Theater2:
    add  eax, Temperate_Name
    jmp  0x0045398D
