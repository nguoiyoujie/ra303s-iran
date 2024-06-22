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

; standard library
%define __strdup                                                  0x005C3900 ; strdup()
%define __strstr                                                  0x005CEC59 ; strstr()

; AUDIO.CPP
%define Audio___Sound_Effect_At_Coord                             0x00425D1C ; void Sound_Effect(VocType voc, COORDINATE coord, int variation, HousesType house)
%define Audio___Sound_Effect                                      0x00425F24 ; int Sound_Effect(VocType voc, fixed volume, int variation, signed short pan_value, HousesType house)
%define Audio___SoundEffectName                                   0x005FE090 ; SoundEffectName[VOC_COUNT]

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

; BASE.INI
%define BaseClass__Write_INI                                      0x00426944 ; void BaseClass::Write_INI(CCINIClass & ini)

; BUILDING.CPP
%define BuildingClass__Exit_Coord                                 0x0045EB04 ; COORDINATE BuildingClass::Exit_Coord(void) const
%define BuildingClass__Write_INI                                  0x0045F07C ; void BuildingClass::Write_INI(CCINIClass & ini)
%define BuildingClass__Begin_Mode                                 0x0045A794 ; void BuildingClass::Begin_Mode(BStateType bstate)

; CARGO.CPP
%define CargoClass__Attached_Object                               0x0046247C ; FootClass * CargoClass::Attached_Object(void) const

; CELL.CPP
%define CellClass__Cell_Coord                                     0x0049FDE0 ; COORDINATE CellClass::Cell_Coord(void) const
%define CellClass__Adjacent_Cell                                  0x004A01EC ; CellClass const * CellClass::Adjacent_Cell(FacingType face) const
%define CellClass__Is_Bridge_Here                                 0x004A1BE8 ; bool CellClass::Is_Bridge_Here(void)

; COORD.CPP
%define Coord___Coord_Cell                                        0x004AC3C0 ; CELL Coord_Cell(COORDINATE coord)
;%define Coord___Distance_As_Target                                ?????????? ; int Distance(TARGET target1, TARGET target2)
%define Coord___Distance_As_Coord                                 0x004AC41C ; int Distance(COORDINATE coord1, COORDINATE coord2)



; CONQUER.CPP
%define Conquer___Call_Back                                       0x004A765C ; void Call_Back(void)
%define Conquer___CC_Draw_Shape                                   0x004A96E8 ; void CC_Draw_Shape(const ObjectClass *object, const char *shape_file_name, void const * shapefile, int shapenum, int x, int y, WindowNumberType window, ShapeFlags_Type flags, void const * fadingdata, void const * ghostdata, DirType rotation, long virtualscale, char override_owner)

; DIALOG.CPP
%define Dialog___Draw_Box                                         0x004ADB5C ; void Draw_Box(int x, int y, int w, int h, BoxStyleEnum up, bool filled)

; DISPLAY.CPP
%define DisplayClass__Write_INI                                   0x004B545C ; void DisplayClass::Write_INI(CCINIClass & ini)

; FACE.CPP
%define Face_Desired_Facing8                                      0x004BEA20 ; DirType Desired_Facing8(int x1, int y1, int x2, int y2)
%define Face_Desired_Facing256                                    0x004BEA7C ; int Desired_Facing256(int x1, int y1, int x2, int y2)


; FACTORY.CPP
%define FactoryClass__Get_Object                                  0x004BF368 ; TechnoClass * FactoryClass::Get_Object(void) const

; HDATA.CPP
%define HouseTypeClass__From_Name                                 0x004CD0E4 ; HousesType HouseTypeClass::From_Name(char const * name)


; HOUSE.CPP
%define HouseClass__HousesType                                    0x004D2C48 ; HouseClass::operator HousesType(void) const
%define HouseClass__As_Pointer                                    0x004D2CB0 ; HouseClass * HouseClass::As_Pointer(HousesType house)
%define HouseClass__Assign_Handicap                               0x004D2D48 ; DiffType HouseClass::Assign_Handicap(DiffType handicap)
%define HouseClass__Can_Build                                     0x004D4014 ; bool HouseClass::Can_Build(ObjectTypeClass const * type, HousesType house) const
%define HouseClass__Available_Money                               0x004D5E00 ; long HouseClass::Available_Money(void) const
%define HouseClass__Is_Ally                                       0x004D5FC8 ; bool HouseClass::Is_Ally(HousesType house)
%define HouseClass__Make_Ally                                     0x004D6060 ; void HouseClass::Make_Ally(HousesType house)
%define HouseClass__MPlayer_Defeated                              0x004D8270 ; void HouseClass::MPlayer_Defeated(void)
%define HouseClass__Flag_To_Die                                   0x004D8B40 ; bool HouseClass::Flag_To_Die(void)
%define HouseClass__Where_To_Go                                   0x004DD9FC ; CELL HouseClass::Where_To_Go(FootClass const * object)
%define HouseClass__Fetch_Factory                                 0x004DDBD0 ; FactoryClass * HouseClass::Fetch_Factory(RTTIType rtti) const
%define HouseClass__Get_Quantity                                  0x004DDCE8 ; int HouseClass::Get_Quantity(StructType building) - Warning: Only works up original Building count!
%define HouseClass__Write_INI                                     0x004DDEB0 ; void HouseClass::Write_INI(CCINIClass & ini)
%define HouseClass__Is_No_YakMig                                  0x004DE094 ; bool HouseClass::Is_No_YakMig(void) const
%define HouseClass__Computer_Paranoid                             0x004DE640 ; void HouseClass::Computer_Paranoid(void)

; ADATA.CPP
%define AnimTypeClass__AnimTypeClass                              0x00407388 ; AnimTypeClass::AnimTypeClass(AnimType,char                *,int,int,int,int,int,int,int,int,int,int,int,fixed,int,int,int,int,int,int,VocType,AnimType)
%define AnimTypeClass__new                                        0x00407564 ; AnimTypeClass::operator new(uint)

; AADATA.CPP
%define AircraftTypeClass__AircraftTypeClass                      0x00401210 ; AircraftTypeClass::AircraftTypeClass(AircraftType,int,char *,int,int,int,int,int,int,int,int,int,int,int,int,StructType,int,int,MissionType)
%define AircraftTypeClass__new                                    0x00401324 ; AircraftTypeClass::operator new(uint)
%define AircraftTypeClass__As_Reference                           0x004040F0 ; AircraftTypeClass & AircraftTypeClass::As_Reference(AircraftType type)

; BDATA.CPP
%define BuildingTypeClass__BuildingTypeClass                      0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
%define BuildingTypeClass__new                                    0x00429F0C ; BuildingTypeClass::operator new(uint)

; TYPE.H
%define BulletTypeClass__BulletTypeClass                          0x00426A20 ; BulletTypeClass::BulletTypeClass(char *)
%define BulletTypeClass__new                                      0x00426AB0 ; BulletTypeClass::operator new(uint)

; BULLET.CPP
%define BulletClass__BulletClass                                  0x00460B90 ; BulletClass::BulletClass(BulletType,long,TechnoClass *,int,WarheadType,int)
%define BulletClass__new                                          0x00460EAC ; BulletClass::operator new(uint)

; IDATA.CPP
%define InfantryTypeClass__InfantryTypeClass                      0x004DF5E0 ; InfantryTypeClass::InfantryTypeClass(InfantryType,int,char *,int,int,int,int,int,int,int,int,PipEnum,DoInfoStruct *,int,int,char *)
%define InfantryTypeClass__new                                    0x004DF728 ; InfantryTypeClass::operator new(uint)
%define InfantryTypeClass__As_Reference                           0x004EB1B8 ; InfantryTypeClass & InfantryTypeClass::As_Reference(InfantryType type)

; INFANTRY.CPP
%define InfantryClass__Write_INI                                  0x004F0A84 ; void InfantryClass::Write_INI(CCINIClass & ini)

; INIT.CPP
%define Init___Select_Game                                        0x004F44DC ; bool Select_Game(bool fade)
%define Init___Random                                             0x004F5EC4 ; void Init_Random(void)

; IPXADDR.CPP
%define IPXAddressClass__IPXAddressClass                          0x004F9950 ; IPXAddressClass::IPXAddressClass(void)

; IPXMGR.CPP
%define IPXManagerClass__Set_Timing                               0x004FA910 ; void IPXManagerClass::Set_Timing (unsigned long retrydelta, unsigned long maxretries, unsigned long timeout)

; MAP.CPP
%define MapClass__In_Radar                                        0x004FE8AC ; bool MapClass::In_Radar(CELL cell) const
%define MapClass__Nearby_Location                                 0x004FFAC4 ; CELL MapClass::Nearby_Location(CELL cell, SpeedType speed, int zone, MZoneType check, bool checkflagged, int locationmod) const

; MAPSEL.CPP
%define MapSel___Map_Selection                                    0x00500A68 ; char const * Map_Selection(void)

; MIXFILE.CPP
%define MFCD__Retrieve                                            0x005B9330 ; void const * MixFileClass<T>::Retrieve(char const * filename)

; OBJECT.CPP
%define ObjectClass__Health_Ratio                                 0x0051E77B ; fixed ObjectClass::Health_Ratio(void)

; OVERLAY.CPP
%define OverlayTypeClass__As_Reference                            0x00524C10 ; OverlayTypeClass & OverlayTypeClass::As_Reference(OverlayType type)
%define OverlayClass__Write_INI                                   0x0052736C ; void OverlayClass::Write_INI(CCINIClass & ini)

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
%define ScenarioClass__Do_BW_Fade                                 0x00539BF8 ; void ScenarioClass::Do_BW_Fade(void)
%define ScenarioClass__Set_Scenario_Name                          0x0053CFB0 ; void ScenarioClass::Set_Scenario_Name(int scenario, ScenarioPlayerType player, ScenarioDirType dir, ScenarioVarType var)
%define Scenario___Create_Units                                   0x0053E204 ; static void Create_Units(bool official)
%define Scenario___Start_Scenario                                 0x0053A0A4 ; bool Start_Scenario(char * name, bool briefing)

; SCORE.CPP
%define ScoreClass__Presentation                                  0x00540670 ; void ScoreClass::Presentation(void)
%define Score___Multi_Score_Presentation                          0x00546678 ; void Multi_Score_Presentation(void)


; SESSION.CPP
%define SessionClass__Create_Connections                          0x0054A4F8 ; int SessionClass::Create_Connections(void)

; SIDEBAR.CPP
%define SidebarClass__Activate                                    0x0054DA70 ; bool SidebarClass::Activate(int control)

%define SidebarClass__One_Time                                    0x0054D07C ; void SidebarClass::StripClass::One_Time(int )
%define SidebarClass__Init_IO                                     0x0054D144 ; void SidebarClass::StripClass::Init_IO(int id)
%define SidebarClass__Reload_Sidebar                              0x0054D340 ; void SidebarClass::Reload_Sidebar(void)
%define SidebarClass__Add                                         0x0054D61C ; int SidebarClass::Add(RTTIType,int)
%define SidebarClass__Scroll                                      0x0054D684 ; bool SidebarClass::Scroll(bool up, int column)

%define SidebarClass__StripClass__Flag_To_Redraw                  0x0054E2CC ; void SidebarClass::StripClass::Flag_To_Redraw(void)
%define SidebarClass__StripClass__Add                             0x0054E1F8 ; bool SidebarClass::StripClass::Add(RTTIType type, int id, bool via_capture)

; SDATA.CPP
%define SmudgeTypeClass__As_Reference                             0x00549F34 ; SmudgeTypeClass & SmudgeTypeClass::As_Reference(SmudgeType type)

; SMUDGE.CPP
%define SmudgeClass__Write_INI                                    0x005501E4 ; void SmudgeClass::Write_INI(CCINIClass & ini)

; TERRAIN.CPP
%define TerrainClass__Write_INI                                   0x0056AD6C ; void TerrainClass::Write_INI(CCINIClass & ini)

; TEAMTYPE.CPP
%define TeamTypeClass__Write_INI                                  0x0056076C ; void TeamTypeClass::Write_INI(CCINIClass & ini)

; TECHNO.CPP
%define TechnoClass__Combat_Damage                                0x00560CBC ; int TechnoClass::Combat_Damage(int which) 
%define TechnoClass__Owner                                        0x00564358 ; HouseType TechnoClass::Owner(void)  

; TRIGGER.CPP
%define TriggerClass__Spring                                      0x0056CC54 ; bool TriggerClass::Spring(TEventType event, ObjectClass * obj, CELL cell, bool forced)

; TRIGTYPE.CPP
%define TriggerTypeClass__Write_INI                               0x0056D640 ; void TriggerTypeClass::Write_INI(CCINIClass & ini)

; UDATA.CPP
%define UnitTypeClass_UnitTypeClass                               0x0056E09C ; UnitTypeClass::UnitTypeClass( lots of args..)
%define UnitTypeClass_new                                         0x0056E290 ; UnitTypeClass::operator new(uint)
%define UnitTypeClass__As_Reference                               0x00578C24 ; UnitTypeClass & UnitTypeClass::As_Reference(UnitType type)

; UNIT.CPP
%define UnitClass__Write_INI                                      0x00581298 ; void UnitClass::Write_INI(CCINIClass & ini)

; VDATA.CPP
%define VesselTypeClass_VesselTypeClass                           0x00581F0C ; VesselTypeClass::VesselTypeClass(VesselType,int,char *,AnimType,int,int,int,int,int,int,int,int,int,int)
%define VesselTypeClass_new                                       0x00581FEC ; VesselTypeClass::operator new(uint)
%define VesselTypeClass__As_Reference                             0x00584858 ; VesselTypeClass & VesselTypeClass::As_Reference(VesselType type)



; VESSEL.CPP
%define VesselClass__Write_INI                                    0x0058CC18 ; void VesselClass::Write_INI(CCINIClass & ini)

; VORTEX.CPP
%define Vortex___ChronalVortex                                    0x006904B4 ; ChronalVortexClass ChronalVortex;
%define ChronalVortexClass__Appear                                0x0058E0F4 ; void ChronalVortexClass::Appear (COORDINATE coordinate)
%define ChronalVortexClass__Stop                                  0x0058E304 ; void ChronalVortexClass::Stop(void)

; WARHEAD.CPP
%define Warhead___Warheads                                        0x00691600 ; TFixedIHeapClass<WarheadTypeClass> Warheads;
%define WarheadTypeClass__WarheadTypeClass                        0x0058F9D8 ; WarheadTypeClass::WarheadTypeClass(char const * name)
%define WarheadTypeClass__new                                     0x0058FA64 ; void * WarheadTypeClass::operator new(size_t)

; WEAPON.CPP
%define Weapon__Weapons                                           0x0069164C ; TFixedIHeapClass<WeaponTypeClass> Weapons;
%define WeaponTypeClass__WeaponTypeClass                          0x0058FD98 ; WeaponTypeClass::WeaponTypeClass(char const * name)
%define WeaponTypeClass__new                                      0x0058FE18 ; void * WeaponTypeClass::operator new(size_t)


; GAUGE.CPP
%define GaugeClass__GaugeClass                                    0x004C4CF0 ; GaugeClass::GaugeClass(unsigned id, int x, int y, int w, int h)


; GSCREEN.CPP
%define GScreenClass__Flag_To_Redraw                              0x004CAFF4 ; void GScreenClass::Flag_To_Redraw(bool complete)
%define GScreenClass__Render                                      0x004CB110 ; void GScreenClass::Render(void)

; GBUFFER.CPP
%define GraphicBufferClass__Set_Logic_Page                        0x005C0FE7 ; GraphicViewPortClass *Set_Logic_Page(GraphicViewPortClass &ptr)
%define GraphicBufferClass__Lock                                  0x005C101A ; BOOL GraphicBufferClass::Lock(void)
%define GraphicBufferClass__Unlock                                0x005C1191 ; BOOL GraphicBufferClass::Unlock(void)

; NETDLG.CPP
%define NetDlg___Init_Network                                     0x005063C8 ; bool Init_Network (void)

; WSPUDP.CPP
%define UDPInterfaceClass__UDPInterfaceClass                      0x005A8560 ; UDPInterfaceClass::UDPInterfaceClass (void)
%define UDPInterfaceClass__Open_Socket                            0x005A8698 ; bool UDPInterfaceClass::Open_Socket ( SOCKET )

; WSPROTO.CPP
%define WinsockInterfaceClass__Init                               0x005A817C ; bool WinsockInterfaceClass::Init(void)
%define WinsockInterfaceClass__Start_Listening                    0x005A80AC ; bool WinsockInterfaceClass::Start_Listening (void)
%define WinsockInterfaceClass__Discard_In_Buffers                 0x005A812C ; void WinsockInterfaceClass::Discard_In_Buffers (void)
%define WinsockInterfaceClass__Discard_Out_Buffers                0x005A8154 ; void WinsockInterfaceClass::Discard_Out_Buffers (void)






; PALETTEC.CPP
%define PaletteClass__Set                                         0x005BCF44 ; void PaletteClass::Set(int time, void (* callback)(void)) const

; REINF.CPP
%define Reinf___Do_Reinforcements                                 0x00533178 ; bool Do_Reinforcements(TeamTypeClass const * teamtype)



; GLOBALS.CPP
%define Globals___Houses                                          0x006017F0 ; TFixedIHeapClass<HouseClass> Houses;
%define Globals___BuildingTypes                                   0x0060181C ; TFixedIHeapClass<BuildingTypeClass> BuildingTypes;


%define Globals___AntsEnabled                                     0x00665DDC
%define Globals___NewUnitsEnabled                                 0x00665DE0
%define Globals___EngineerCaptureLevel                            0x00665E04


;%define Globals___Options                                         ?????????? ; GameOptionsClass Options;
%define Globals___Options_KeyResign                               0x006681C0 ; KeyNumType KeyResign;


%define Globals___RuleINI                                         0x00666688 ; CCINIClass RuleINI;
; %define Globals___AftermathINI                                   0x0066668C ; CCINIClass AftermathINI;
%define Globals___Rule                                            0x00666704 ; RulesClass Rule; This rules contains the combination of both RULES.INI and AFTRMATH.INI
%define Globals___Rule_MaxIQ                                      0x00666780 ; int RulesClass::MaxIQ
%define Globals___Rule_MessageDelay                               0x006667C7 ; int RulesClass::MessageDelay
%define Globals___Rule_AtomDamage                                 0x006667EB ; int RulesClass::AtomDamage

%define Globals___Rule_IsMCVDeploy_Address                        0x00666831 ; unsigned RulesClass::IsMCVDeploy:1;
%define Globals___Rule_IsMCVDeploy_BitMask                        0x80       ; unsigned RulesClass::IsMCVDeploy:1;

%define Globals___Rule_GoldValue                                  0x00666888 ; int RulesClass::GoldValue
%define Globals___Rule_GemValue                                   0x0066688C ; int RulesClass::GemValue
%define Globals___Rule_IronCurtainDuration                        0x006668EA ; int RulesClass::IronCurtainDuration

%define Globals___Keyboard                                        0x00666904 ; KeyboardClass * Keyboard;


%define Globals___Scen                                            0x006678E8 ; ScenarioClass Scen;
%define Globals___Scen_RandomNumber                               0x006678E8 ; RandomClass ScenarioClass::RandomNumber;
%define Globals___Scen_Difficulty                                 0x006678EC ; DiffType ScenarioClass::Difficulty;	
%define Globals___Scen_CDifficulty                                0x006678ED ; DiffType ScenarioClass::CDifficulty;

%define Globals___Scen_Scenario                                   0x006679D3 ; int ScenarioClass::Scenario;
;%define Globals___Scen_Theater                                    0x006679D7 ; TheaterType ScenarioClass::Theater;
%define Globals___Scen_ScenarioName                               0x006679D8 ; char ScenarioClass::ScenarioName[_MAX_FNAME+_MAX_EXT];
%define Globals___Scen_Description                                0x00667BD8 ; char ScenarioClass::Description[DESCRIP_MAX];
%define Globals___Scen_IntroMovie                                 0x00667C04 ; VQType IntroMovie;
%define Globals___Scen_BriefMovie                                 0x00667C05 ; VQType BriefMovie;
%define Globals___Scen_WinMovie                                   0x00667C06 ; VQType WinMovie;
%define Globals___Scen_LoseMovie                                  0x00667C07 ; VQType LoseMovie;
%define Globals___Scen_ActionMovie                                0x00667C08 ; VQType ActionMovie;
; BriefingText
%define Globals___Scen_TransitTheme                               0x00668009 ; ThemeType TransitTheme;
%define Globals___Scen_PlayerHouse                                0x0066800A ; HousesType PlayerHouse; Warning - this is not used
%define Globals___Scen_CarryOverPercent                           0x0066800B ; fixed CarryOverPercent;
%define Globals___Scen_CarryOverMoney                             0x0066800D ; int CarryOverMoney;
%define Globals___Scen_CarryOverCap                               0x00668011 ; int CarryOverCap;
%define Globals___Scen_Percent                                    0x00668015 ; int Percent;
%define Globals___Scen_GlobalFlags                                0x00668019 ; bool GlobalFlags[30];
;IsBridgeChanged
;IsGlobalChanged
%define Globals___Scen_ToCarryOver_Address                        0x006680A1 ; unsigned IsToCarryOver:1;
%define Globals___Scen_ToCarryOver_Bitmask                        0x04       ; unsigned IsToCarryOver:1;
%define Globals___Scen_IsToInherit_Address                        0x006680A1 ; unsigned IsToInherit:1;
%define Globals___Scen_IsToInherit_Bitmask                        0x08       ; unsigned IsToInherit:1;
%define Globals___Scen_IsTanyaEvac_Address                        0x006680A1 ; unsigned IsTanyaEvac:1;
%define Globals___Scen_IsTanyaEvac_Bitmask                        0x10       ; unsigned IsTanyaEvac:1;
;IsFadingBW
;IsFadingColor
%define Globals___Scen_IsEndOfGame_Address                        0x006680A1 ; unsigned IsEndOfGame:1;
%define Globals___Scen_IsEndOfGame_Bitmask                        0x80       ; unsigned IsEndOfGame:1;
%define Globals___Scen_IsInheritTimer_Address                     0x006680A2 ; unsigned IsInheritTimer:1;
%define Globals___Scen_IsInheritTimer_Bitmask                     0x01       ; unsigned IsInheritTimer:1;

%define Globals___Scen_IsNoSpyPlane_Address                       0x006680A2 ; unsigned IsNoSpyPlane:1;
%define Globals___Scen_IsNoSpyPlane_Bitmask                       0x02       ; unsigned IsNoSpyPlane:1;
%define Globals___Scen_IsSkipScore_Address                        0x006680A2 ; unsigned IsSkipScore:1;
%define Globals___Scen_IsSkipScore_Bitmask                        0x04       ; unsigned IsSkipScore:1;
%define Globals___Scen_IsOneTimeOnly_Address                      0x006680A2 ; unsigned IsOneTimeOnly:1;
%define Globals___Scen_IsOneTimeOnly_Bitmask                      0x08       ; unsigned IsOneTimeOnly:1;
%define Globals___Scen_IsNoMapSel_Address                         0x006680A2 ; unsigned IsNoMapSel:1;
%define Globals___Scen_IsNoMapSel_Bitmask                         0x10       ; unsigned IsNoMapSel:1;
%define Globals___Scen_IsTruckCrate_Address                       0x006680A2 ; unsigned IsTruckCrate:1;
%define Globals___Scen_IsTruckCrate_Bitmask                       0x20       ; unsigned IsTruckCrate:1;
%define Globals___Scen_IsMoneyTiberium_Address                    0x006680A2 ; unsigned IsMoneyTiberium:1;
%define Globals___Scen_IsMoneyTiberium_Bitmask                    0x40       ; unsigned IsMoneyTiberium:1;


%define Globals___Frame                                           0x006680C4 ; long Frame;
%define Globals___PlayerWins                                      0x006680C8 ; bool PlayerWins;
%define Globals___PlayerLoses                                     0x006680CC ; bool PlayerLoses;
%define Globals___PlayerRestarts                                  0x006680D0 ; bool PlayerRestarts;
%define Globals___PlayerAborts                                    0x006680D4 ; bool PlayerAborts;


%define Globals___Map                                             0x00668250 ; MouseClass Map;
%define Globals___Map_Array                                       0x0066826C ; VectorClass<CellClass> MapClass::Array;


%define Globals___Map_IsZoomed_Address                            0x00668E9A ; unsigned RadarClass::IsZoomed:1;
%define Globals___Map_IsZoomed_Bitmask                            0x01       ; unsigned RadarClass::IsZoomed:1;

%define Globals___Map_IsTargettingMode                            0x00668EC7 ; SpecialWeaponType DisplayClass::IsTargettingMode;

;ScoreClass Score;
;CreditClass CreditDisplay;
;SpecialClass Special;
%define Globals___ScenarioInit                                    0x00669914 ; int ScenarioInit;
;int BuildLevel = 10;
;bool GameActive;
%define Globals___PlayerPtr                                       0x00669958 ; HouseClass * PlayerPtr;
; Globals___CCPalette
; Globals___GamePalette
%define Globals___BlackPalette                                    0x00669F5C ; PaletteClass BlackPalette(RGBClass(0, 0, 0));
%define Globals___WhitePalette                                    0x0066A25C ; PaletteClass WhitePalette(RGBClass(RGBClass::MAX_VALUE, RGBClass::MAX_VALUE, RGBClass::MAX_VALUE));
; Globals___OriginalPalette
; Globals___ScorePalette

%define Globals___Base                                            0x0067F28C ; BaseClass Base;
%define Globals___Base_House                                      0x0067F28C + 0x18 ; HousesType House;


;%define Globals___Session                                         0x0067F2B4 ; SessionClass Session;
%define Globals___Session_Type                                    0x0067F2B4 ; GameType SessionClass::Type;

%define Globals___Session_MaxAhead                                0x0067F325 ; GameType SessionClass::MaxAhead;
%define Globals___Session_FrameSendRate                           0x0067F329 ; GameType SessionClass::FrameSendRate;
%define Globals___Session_Type                                    0x0067F2B4 ; GameType SessionClass::Type;

%define Globals___Ipx                                             0x006805B0 ; IPXManagerClass Ipx;
%define Globals___Seed                                            0x00680654
%define Globals___CustomSeed                                      0x00680658


%define Globals___VisiblePage                                     0x0068065C ; GraphicBufferClass VisiblePage;
%define Globals___HiddenPage                                      0x00680700 ; GraphicBufferClass HiddenPage;


; are you sure?
%define Globals___UnitBuildPenalty                                0x006017D8 ; int UnitBuildPenalty;



; INTERNET.CPP
%define Internet___PlanetWestwoodGameID                           0x006ABBAC ; unsigned long PlanetWestwoodGameID;	
%define Internet___PlanetWestwoodStartTime                        0x006ABBB0 ; unsigned long PlanetWestwoodStartTime;

; BUFFGLBL.CPP
%define BuffGlbl___LogicPage                                      0x006AC274 ; GraphicViewPortClass *LogicPage;








