;----------------------------------------------------------------
; src/features/multiplayer_predetermined_alliances.asm
;
; Allows spawner to define initial multiplayer alliances.
; 
; This function is enabled by with the following settings:
;   Spawn.ini > [Multi{X}_Alliances] > HouseAlly{Y}={HouseID}
; where {X} is 1 to 8 and {Y} is One to Seven
; 
; No compatibility issues is expected as initial alliances are unsupported in the unmodified game.
;
;----------------------------------------------------------------

@HOOK 0x0053DC0B _Read_Scenario_INI_Ally_Test

str_HouseAllyOne        db"HouseAllyOne",0
str_HouseAllyTwo        db"HouseAllyTwo",0
str_HouseAllyThree      db"HouseAllyThree",0
str_HouseAllyFour       db"HouseAllyFour",0
str_HouseAllyFive       db"HouseAllyFive",0
str_HouseAllySix        db"HouseAllySix",0
str_HouseAllySeven      db"HouseAllySeven",0

str_Multi1_Alliances    db"Multi1_Alliances",0
str_Multi2_Alliances    db"Multi2_Alliances",0
str_Multi3_Alliances    db"Multi3_Alliances",0
str_Multi4_Alliances    db"Multi4_Alliances",0
str_Multi5_Alliances    db"Multi5_Alliances",0
str_Multi6_Alliances    db"Multi6_Alliances",0
str_Multi7_Alliances    db"Multi7_Alliances",0
str_Multi8_Alliances    db"Multi8_Alliances",0

; args <HouseType that will ally>, <HouseType to ally>
%macro Ally_House 2
    mov  eax, %1 ; House that will ally another house
    call HouseClass__As_Pointer
    mov  edx, %2    ; House to be allied
    call HouseClass__Make_Ally
%endmacro

; Loads alliances from map for a HouseType
; args <HouseType>, <INI section string>, <INIClass>
%macro Load_Alliances 3
    call_INIClass__Get_Int %3, %2, str_HouseAllyOne, 0
    cmp  eax, 0
    jz   .Dont_Ally_1_%1
    mov  edx, eax
    Ally_House %1, edx

.Dont_Ally_1_%1:
    call_INIClass__Get_Int %3, %2, str_HouseAllyTwo, 0
    cmp  eax, 0
    jz   .Dont_Ally_2_%1
    mov  edx, eax
    Ally_House %1, edx

.Dont_Ally_2_%1:

    call_INIClass__Get_Int %3, %2, str_HouseAllyThree, 0
    cmp  eax, 0
    jz   .Dont_Ally_3_%1
    mov  edx, eax
    Ally_House %1, edx

.Dont_Ally_3_%1:

    call_INIClass__Get_Int %3, %2, str_HouseAllyFour, 0
    cmp  eax, 0
    jz   .Dont_Ally_4_%1
    mov  edx, eax
    Ally_House %1, edx

.Dont_Ally_4_%1:

    call_INIClass__Get_Int %3, %2, str_HouseAllyFive, 0
    cmp  eax, 0
    jz   .Dont_Ally_5_%1
    mov  edx, eax
    Ally_House %1, edx

.Dont_Ally_5_%1:

    call_INIClass__Get_Int %3, %2, str_HouseAllySix, 0
    cmp  eax, 0
    jz   .Dont_Ally_6_%1
    mov  edx, eax
    Ally_House %1, edx

.Dont_Ally_6_%1:

    call_INIClass__Get_Int %3, %2, str_HouseAllySeven, 0
    cmp  eax, 0
    jz   .Dont_Ally_7_%1
    mov  edx, eax
    Ally_House %1, edx

.Dont_Ally_7_%1:

%endmacro

_Read_Scenario_INI_Ally_Test:
    call 0x0053DED4  ; Assign_Houses(void)

    Save_Registers

    mov  esi, CCINIClass_Spawn ; SPAWN.INI
    ; args <HouseType>, <INI section string>, <INIClass>
    Load_Alliances HouseType.Multi1, str_Multi1_Alliances, esi
    Load_Alliances HouseType.Multi2, str_Multi2_Alliances, esi
    Load_Alliances HouseType.Multi3, str_Multi3_Alliances, esi
    Load_Alliances HouseType.Multi4, str_Multi4_Alliances, esi
    Load_Alliances HouseType.Multi5, str_Multi5_Alliances, esi
    Load_Alliances HouseType.Multi6, str_Multi6_Alliances, esi
    Load_Alliances HouseType.Multi7, str_Multi7_Alliances, esi
    Load_Alliances HouseType.Multi8, str_Multi8_Alliances, esi

    ; Have Multi1 ally Multi2
;    Ally_House HouseType.Multi1, HouseType.Multi2
    ; Have Multi2 ally Multi1
;    Ally_House HouseType.Multi2, HouseType.Multi1

    Restore_Registers

    jmp  0x0053DC10
