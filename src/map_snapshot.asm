;----------------------------------------------------------------
; src/map_snapshot.asm
;
; Generates the map file at the moment of the current game. Usually used for inspection.
;
; This function is enabled by default and may be activated by pressing the relevant keyboard toggle.
; No compatibility issues is expected as this was not a function in the original game.
;----------------------------------------------------------------

cextern CCFileClass__CCFileClass
cextern CCINIClass__CCINIClass
cextern HouseClass__Write_INI
cextern TeamTypeClass__Write_INI
cextern TriggerTypeClass__Write_INI
cextern DisplayClass__Write_INI
cextern TerrainClass__Write_INI
cextern UnitClass__Write_INI
cextern VesselClass__Write_INI
cextern InfantryClass__Write_INI
cextern BuildingClass__Write_INI
cextern BaseClass__Write_INI
cextern OverlayClass__Write_INI
cextern SmudgeClass__Write_INI
cextern Globals___Scen_Description
cextern Globals___Scen_IntroMovie
cextern Globals___Scen_BriefMovie
cextern Globals___Scen_WinMovie
cextern Globals___Scen_LoseMovie
cextern Globals___Scen_ActionMovie
cextern Globals___Scen_TransitTheme
cextern Globals___Scen_CarryOverPercent
cextern Globals___Scen_CarryOverCap
cextern Globals___Scen_Percent
cextern Globals___Scen_ToCarryOver_Address
cextern Globals___Scen_ToCarryOver_Bitmask
cextern Globals___Scen_IsToInherit_Address
cextern Globals___Scen_IsToInherit_Bitmask
cextern Globals___Scen_IsTanyaEvac_Address
cextern Globals___Scen_IsTanyaEvac_Bitmask
cextern Globals___Scen_IsEndOfGame_Address
cextern Globals___Scen_IsEndOfGame_Bitmask
cextern Globals___Scen_IsInheritTimer_Address 
cextern Globals___Scen_IsInheritTimer_Bitmask 
cextern Globals___Scen_IsNoSpyPlane_Address   
cextern Globals___Scen_IsNoSpyPlane_Bitmask   
cextern Globals___Scen_IsSkipScore_Address    
cextern Globals___Scen_IsSkipScore_Bitmask    
cextern Globals___Scen_IsOneTimeOnly_Address  
cextern Globals___Scen_IsOneTimeOnly_Bitmask  
cextern Globals___Scen_IsNoMapSel_Address     
cextern Globals___Scen_IsNoMapSel_Bitmask     
cextern Globals___Scen_IsTruckCrate_Address   
cextern Globals___Scen_IsTruckCrate_Bitmask   
cextern Globals___Scen_IsMoneyTiberium_Address
cextern Globals___Scen_IsMoneyTiberium_Bitmask
cextern Globals___Map
cextern Globals___Base


cextern str_Basic
cextern str_Intro
cextern str_Brief
cextern str_Win
cextern str_Lose
cextern str_Action
cextern str_Player
cextern str_Theme
cextern str_CarryOverMoney
cextern str_ToCarryOver
cextern str_IsToInherit
cextern str_TimerInherit
cextern str_CivEvac
cextern str_NewINIFormat
cextern str_CarryOverCap
cextern str_EndOfGame
cextern str_NoSpyPlane
cextern str_SkipScore
cextern str_OneTimeOnly
cextern str_SkipMapSelect
cextern str_FillSilos
cextern str_TruckCrate
cextern str_Percent


[section .rdata]
str_MapSnap_MPR db"MapSnap.MPR",0


; sizes not actually verified
[section .data] 
MapSnapshot_CCINIClass  TIMES 256 db 0
MapSnapshot_FileClass   TIMES 256 db 0


[section .text] 
Create_Map_Snapshot:
    Save_Registers

    ; Initialize output file
    mov  edx,str_MapSnap_MPR
    mov  eax,MapSnapshot_FileClass
    call CCFileClass__CCFileClass

    ; initialize CCINIClass
    mov  eax,MapSnapshot_CCINIClass
    call CCINIClass__CCINIClass

; Follow SCENARIO.CPP/Write_Scenario_INI (which is not in the binary compilation
;===========================
    ; Write [Basic]

    ; Map name
    mov  eax,Globals___Scen_Description
    call_INIClass__Put_String MapSnapshot_CCINIClass,str_Basic,str_Name,eax

    ; Intro
    call_CCINIClass__Put_VQType MapSnapshot_CCINIClass,str_Basic,str_Intro,byte[Globals___Scen_IntroMovie]

    ; Brief
    call_CCINIClass__Put_VQType MapSnapshot_CCINIClass,str_Basic,str_Brief,byte[Globals___Scen_BriefMovie]

    ; Win
    call_CCINIClass__Put_VQType MapSnapshot_CCINIClass,str_Basic,str_Win,byte[Globals___Scen_WinMovie]

    ; Lose
    call_CCINIClass__Put_VQType MapSnapshot_CCINIClass,str_Basic,str_Lose,byte[Globals___Scen_LoseMovie]

    ; Action
    call_CCINIClass__Put_VQType MapSnapshot_CCINIClass,str_Basic,str_Action,byte[Globals___Scen_ActionMovie]

    ; Player
    mov ecx,dword[Globals___PlayerPtr]
    call_CCINIClass__Put_HousesType MapSnapshot_CCINIClass,str_Basic,str_Player,byte[ecx+1] ; HouseClass::ID

    ; Theme
    call_CCINIClass__Put_ThemeType MapSnapshot_CCINIClass,str_Basic,str_Theme,byte[Globals___Scen_TransitTheme]

    ; CarryOverPercent / CarryOverMoney
    call_INIClass__Put_Fixed MapSnapshot_CCINIClass,str_Basic,str_CarryOverMoney,Globals___Scen_CarryOverPercent

    ; ToCarryOver
    xor  ecx,ecx
    test byte[Globals___Scen_ToCarryOver_Address],Globals___Scen_ToCarryOver_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_ToCarryOver,ecx

    ; IsToInherit
    xor  ecx,ecx
    test byte[Globals___Scen_IsToInherit_Address],Globals___Scen_IsToInherit_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_IsToInherit,ecx

    ; TimerInherit
    xor  ecx,ecx
    test byte[Globals___Scen_IsInheritTimer_Address],Globals___Scen_IsInheritTimer_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_TimerInherit,ecx

    ; CivEvac
    xor  ecx,ecx
    test byte[Globals___Scen_IsTanyaEvac_Address],Globals___Scen_IsTanyaEvac_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_CivEvac,ecx

    ; NewINIFormat
    call_INIClass__Put_Int MapSnapshot_CCINIClass,str_Basic,str_NewINIFormat,dword[0x00665DE8] ; this points to what?

    ; CarryOverCap
    call_INIClass__Put_Int MapSnapshot_CCINIClass,str_Basic,str_CarryOverCap,dword[Globals___Scen_CarryOverCap]

    ; EndOfGame
    xor  ecx,ecx
    test byte[Globals___Scen_IsEndOfGame_Address],Globals___Scen_IsEndOfGame_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_EndOfGame,ecx

    ; NoSpyPlane
    xor  ecx,ecx
    test byte[Globals___Scen_IsNoSpyPlane_Address],Globals___Scen_IsNoSpyPlane_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_NoSpyPlane,ecx

    ; SkipScore
    xor  ecx,ecx
    test byte[Globals___Scen_IsSkipScore_Address],Globals___Scen_IsSkipScore_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_SkipScore,ecx
    
    ; OneTimeOnly
    xor  ecx,ecx
    test byte[Globals___Scen_IsOneTimeOnly_Address],Globals___Scen_IsOneTimeOnly_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_OneTimeOnly,ecx
    
    ; SkipMapSelect
    xor  ecx,ecx
    test byte[Globals___Scen_IsNoMapSel_Address],Globals___Scen_IsNoMapSel_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_SkipMapSelect,ecx
    
    ; FillSilos
    xor  ecx,ecx
    test byte[Globals___Scen_IsMoneyTiberium_Address],Globals___Scen_IsMoneyTiberium_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_FillSilos,ecx
    
    ; TruckCrate
    xor  ecx,ecx
    test byte[Globals___Scen_IsTruckCrate_Address],Globals___Scen_IsTruckCrate_Bitmask
    setne cl
    call_INIClass__Put_Bool MapSnapshot_CCINIClass,str_Basic,str_TruckCrate,ecx
    
    ; Percent
    call_INIClass__Put_Int MapSnapshot_CCINIClass,str_Basic,str_Percent,dword[Globals___Scen_Percent]

;=========================
    ; Write other stuff
    mov  eax,MapSnapshot_CCINIClass
    call HouseClass__Write_INI

    mov  eax,MapSnapshot_CCINIClass
    call TeamTypeClass__Write_INI

    mov  eax,MapSnapshot_CCINIClass
    call TriggerTypeClass__Write_INI

    ; Map
    mov  edx,MapSnapshot_CCINIClass
    mov  eax,Globals___Map
    call DisplayClass__Write_INI

    mov  eax,MapSnapshot_CCINIClass
    call TerrainClass__Write_INI

    mov  eax,MapSnapshot_CCINIClass
    call UnitClass__Write_INI

    mov  eax,MapSnapshot_CCINIClass
    call VesselClass__Write_INI

    mov  eax,MapSnapshot_CCINIClass
    call InfantryClass__Write_INI
    
    mov  eax,MapSnapshot_CCINIClass
    call BuildingClass__Write_INI

    ; Base    
    mov  edx,MapSnapshot_CCINIClass
    mov  eax,Globals___Base
    call BaseClass__Write_INI

    mov  eax,MapSnapshot_CCINIClass
    call OverlayClass__Write_INI
    
    mov  eax,MapSnapshot_CCINIClass
    call SmudgeClass__Write_INI

    ; Briefing
    ; 	if (strlen(Scen.BriefingText)) {
	;       ini.Put_TextBlock("Briefing",Scen.BriefingText);
	;   }

.Save_File:
    xor  ebx,ebx
    mov  edx,MapSnapshot_FileClass
    mov  eax,MapSnapshot_CCINIClass
    call INIClass__Save

.Ret:
    Restore_Registers
    retn
