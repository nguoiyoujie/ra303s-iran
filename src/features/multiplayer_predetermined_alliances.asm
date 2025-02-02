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

cextern HouseClass__As_Pointer
cextern HouseClass__Make_Ally

cextern str_HouseAllyOne
cextern str_HouseAllyTwo
cextern str_HouseAllyThree
cextern str_HouseAllyFour
cextern str_HouseAllyFive
cextern str_HouseAllySix
cextern str_HouseAllySeven
cextern str_Multi1_Alliances
cextern str_Multi2_Alliances
cextern str_Multi3_Alliances
cextern str_Multi4_Alliances
cextern str_Multi5_Alliances
cextern str_Multi6_Alliances
cextern str_Multi7_Alliances
cextern str_Multi8_Alliances


; args <HouseType that will ally>, <HouseType to ally>
%macro Ally_House 2
    mov  eax,%1 ; House that will ally another house
    call HouseClass__As_Pointer
    mov  edx,%2    ; House to be allied
    call HouseClass__Make_Ally
%endmacro

; Loads alliances from map for a HouseType
; args <HouseType>, <INI section string>, <INIClass>
%macro Load_Alliances 3
    call_INIClass__Get_Int %3,%2, str_HouseAllyOne, 0
    cmp  eax,0
    jz   .Dont_Ally_1_%1
    mov  edx,eax
    Ally_House %1,edx
.Dont_Ally_1_%1:
    call_INIClass__Get_Int %3,%2, str_HouseAllyTwo, 0
    cmp  eax,0
    jz   .Dont_Ally_2_%1
    mov  edx,eax
    Ally_House %1,edx
.Dont_Ally_2_%1:
    call_INIClass__Get_Int %3,%2, str_HouseAllyThree, 0
    cmp  eax,0
    jz   .Dont_Ally_3_%1
    mov  edx,eax
    Ally_House %1,edx
.Dont_Ally_3_%1:
    call_INIClass__Get_Int %3,%2, str_HouseAllyFour, 0
    cmp  eax,0
    jz   .Dont_Ally_4_%1
    mov  edx,eax
    Ally_House %1,edx
.Dont_Ally_4_%1:
    call_INIClass__Get_Int %3,%2, str_HouseAllyFive, 0
    cmp  eax,0
    jz   .Dont_Ally_5_%1
    mov  edx,eax
    Ally_House %1,edx
.Dont_Ally_5_%1:
    call_INIClass__Get_Int %3,%2, str_HouseAllySix, 0
    cmp  eax,0
    jz   .Dont_Ally_6_%1
    mov  edx,eax
    Ally_House %1,edx
.Dont_Ally_6_%1:
    call_INIClass__Get_Int %3,%2, str_HouseAllySeven, 0
    cmp  eax,0
    jz   .Dont_Ally_7_%1
    mov  edx,eax
    Ally_House %1,edx
.Dont_Ally_7_%1:
%endmacro


@HACK 0x0053DC0B,0x0053DC10,_Read_Scenario_INI_Ally_Test
    call 0x0053DED4  ; Assign_Houses(void)
    Save_Registers
    mov  esi,CCINIClass_Spawn ; SPAWN.INI
    ; args <HouseType>, <INI section string>, <INIClass>
    Load_Alliances HouseType.Multi1, str_Multi1_Alliances,esi
    Load_Alliances HouseType.Multi2, str_Multi2_Alliances,esi
    Load_Alliances HouseType.Multi3, str_Multi3_Alliances,esi
    Load_Alliances HouseType.Multi4, str_Multi4_Alliances,esi
    Load_Alliances HouseType.Multi5, str_Multi5_Alliances,esi
    Load_Alliances HouseType.Multi6, str_Multi6_Alliances,esi
    Load_Alliances HouseType.Multi7, str_Multi7_Alliances,esi
    Load_Alliances HouseType.Multi8, str_Multi8_Alliances,esi
    Restore_Registers
    jmp  0x0053DC10
@ENDHACK