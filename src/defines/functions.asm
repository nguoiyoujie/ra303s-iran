;----------------------------------------------------------------
; src/defines/functions.asm
;
; Variable and Function Call Definitions
;   Call references shall be stored here for easy reference.
;   This can also be used to build and document function addresses
;   List them in increasing order of address. They should automatically organize into class structures.
;
; Name convention
;   Take the <class_name>::<method_name>. 
;   If this is a static method, use <filename_without_.cpp>___<method_name>
;   Replace each ':' with '_'
;   (optional) Add, as a comment, the function signature as seen in Remastered
;
;----------------------------------------------------------------

;%define DriveClass__Assign_Destination                            0x004B67C8 ; void DriveClass::Assign_Destination(TARGET target)

; CCFile.CPP
; !!! FileClass is a base type, check what derived type these addresses really point to
%define CCFileClass__CCFileClass                                  0x004627D4 ; CCFileClass::CCFileClass(char const * filename)
%define CCFileClass__Write                                        0x00462860 ; long CCFileClass::Write(void const * buffer, long size)
%define CCFileClass__Close                                        0x00462AA8 ; void CCFileClass::Close(void)
%define CCFileClass__Open                                         0x00462AD4 ; int CCFileClass::Open(int rights)
%define CCFileClass__Is_Available                                 0x00462A30 ; int CCFileClass::Is_Available(int )
;%define CCFile_Find_File                                          0x00462DD4

; CCINI.CPP
%define CCINIClass__Load                                          0x00462F50 ; bool CCINIClass::Load(FileClass & file, bool withdigest)

%define CCINIClass__Put_VQType                                    0x00463830 ; bool CCINIClass::Put_VQType(char const * section, char const * entry, VQType value)
%define CCINIClass__Put_ThemeType                                 0x00463948 ; bool CCINIClass::Put_ThemeType(char const * section, char const * entry, ThemeType value)





; BUILDING.CPP
%define BuildingClass__Exit_Coord                                 0x0045EB04 ; COORDINATE BuildingClass::Exit_Coord(void) const



; CELL.CPP
%define CellClass__Cell_Coord                                     0x0049FDE0 ; COORDINATE CellClass::Cell_Coord(void) const
%define CellClass__Adjacent_Cell                                  0x004A01EC ; CellClass const * CellClass::Adjacent_Cell(FacingType face) const
%define CellClass__Is_Bridge_Here                                 0x004A1BE8 ; bool CellClass::Is_Bridge_Here(void)

; COORD.CPP
%define Coord___Coord_Cell                                        0x004AC3C0 ; CELL Coord_Cell(COORDINATE coord)




; CONQUER.CPP
%define Conquer___Call_Back                                       0x004A765C ; void Call_Back(void)

; HOUSE.CPP
%define HouseClass__As_Pointer                                    0x004D2CB0 ; HouseClass * HouseClass::As_Pointer(HousesType house)
%define HouseClass__Is_Ally                                       0x004D5FC8 ; bool HouseClass::Is_Ally(HousesType house)
%define HouseClass__Make_Ally                                     0x004D6060 ; void HouseClass::Make_Ally(HousesType house)
%define HouseClass__MPlayer_Defeated                              0x004D8270 ; void HouseClass::MPlayer_Defeated(void)
%define HouseClass__Flag_To_Die                                   0x004D8B40 ; bool HouseClass::Flag_To_Die(void)
%define HouseClass__Where_To_Go                                   0x004DD9FC ; CELL HouseClass::Where_To_Go(FootClass const * object)
%define HouseClass__Computer_Paranoid                             0x004DE640 ; void HouseClass::Computer_Paranoid(void)



; MAP.CPP
%define MapClass__Nearby_Location                                 0x004FFAC4 ; CELL MapClass::Nearby_Location(CELL cell, SpeedType speed, int zone, MZoneType check, bool checkflagged, int locationmod) const

; OVERLAY.CPP
%define OverlayTypeClass__As_Reference                            0x00524C10 ; OverlayTypeClass & OverlayTypeClass::As_Reference(OverlayType type)

; RULES.CPP
%define RulesClass__General                                       0x005342DC
%define RulesClass__Recharge                                      0x00535CF0
%define RulesClass__AI                                            0x00536698
%define RulesClass__Powerups                                      0x00536D3C
%define RulesClass__Land_Types                                    0x00536E8C
%define RulesClass__Themes                                        0x00537164
%define RulesClass__IQ                                            0x00537278
%define RulesClass__Objects                                       0x005373DC
%define RulesClass__Difficulty                                    0x00537564

; SCENARIO.CPP
%define ScenarioClass__Set_Scenario_Name                          0x0053CFB0 ; void ScenarioClass::Set_Scenario_Name(int scenario, ScenarioPlayerType player, ScenarioDirType dir, ScenarioVarType var)
%define Scenario___Create_Units                                   0x0053E204 ; static void Create_Units(bool official)


; SMUDGE.CPP
%define SmudgeTypeClass__As_Reference                             0x00549F34 ; SmudgeTypeClass & SmudgeTypeClass::As_Reference(SmudgeType type)

; TECHNO.CPP
%define TechnoClass__Combat_Damage                                0x00560CBC ; int TechnoClass::Combat_Damage(int which) 

; UNIT.CPP
%define UnitTypeClass__As_Reference                               0x00578C24 ; UnitTypeClass & UnitTypeClass::As_Reference(UnitType type)



; PALETTEC.CPP
%define PaletteClass__Set                                         0x005BCF44 ; void PaletteClass::Set(int time, void (* callback)(void)) const

; REINF.CPP
%define Reinf___Do_Reinforcements                                 0x00533178 ; bool Do_Reinforcements(TeamTypeClass const * teamtype)


; macros
%define Count_BulletTypeClass                                     0x0065DE60 ; FixedHeapClass::Buffer
%define Array_BulletTypeClass                                     0x0065DE88 ; FixedHeapClass::Buffer







; GLOBALS.CPP
%define Globals___AntsEnabled                                     0x00665DDC
%define Globals___NewUnitsEnabled                                 0x00665DE0

;%define Globals___Options                                         ?????????? ; GameOptionsClass Options;
%define Globals___Options_KeyResign                               0x006681C0 ; KeyNumType KeyResign;


%define Globals___RuleINI                                         0x00666688 ; CCINIClass RuleINI;
; %define Globals___AftermathINI                                        
%define Globals___Rule                                            0x00666704 ; RulesClass Rule; This rules contains the combination of both RULES.INI and AFTRMATH.INI
%define Globals___Rule_MaxIQ                                      0x00666780 ; int RulesClass.MaxIQ
%define Globals___Rule_MessageDelay                               0x006667C7 ; int RulesClass.MessageDelay
%define Globals___Rule_AtomDamage                                 0x006667EB ; int RulesClass.AtomDamage

%define Globals___Rule_IsMCVDeploy_Address                        0x00666831 ; int RulesClass.IsMCVDeploy
%define Globals___Rule_IsMCVDeploy_BitMask                        0x40       ; int RulesClass.IsMCVDeploy

%define Globals___Rule_GoldValue                                  0x00666888 ; int RulesClass.GoldValue
%define Globals___Rule_GemValue                                   0x0066688C ; int RulesClass.GemValue
%define Globals___Rule_IronCurtainDuration                        0x006668EA ; int RulesClass.IronCurtainDuration

%define Globals___Keyboard                                        0x00666904 ; KeyboardClass * Keyboard;


%define ScenarioNumber                                            0x006679D3
%define ScenarioName                                              0x006679D8



; Globals___PlayerPtr
; Globals___CCPalette
; Globals___GamePalette
%define Globals___BlackPalette                                    0x00669F5C ; PaletteClass BlackPalette(RGBClass(0, 0, 0));
%define Globals___WhitePalette                                    0x0066A25C ; PaletteClass WhitePalette(RGBClass(RGBClass::MAX_VALUE, RGBClass::MAX_VALUE, RGBClass::MAX_VALUE));
; Globals___OriginalPalette
; Globals___ScorePalette


;%define Globals___Session                                         0x0067F2B4 ; SessionClass Session;
%define Globals___Session_Type                                    0x0067F2B4 ; GameType Type;










