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

;%assign DriveClass__Assign_Destination                            0x004B67C8 ; void DriveClass::Assign_Destination(TARGET target)

; standard library
%assign __strdup                                                  0x005C3900 ; strdup()
%assign __strstr                                                  0x005CEC59 ; strstr()

; AUDIO.CPP
%assign Audio___Voc_From_Name                                     0x00425CA0 ; VocType Voc_From_Name(char const * name)
%assign Audio___Sound_Effect_At_Coord                             0x00425D1C ; void Sound_Effect(VocType voc, COORDINATE coord, int variation, HousesType house)
%assign Audio___Sound_Effect                                      0x00425F24 ; int Sound_Effect(VocType voc, fixed volume, int variation, signed short pan_value, HousesType house)
%assign Audio___SoundEffectName                                   0x005FE090 ; SoundEffectName[VOC_COUNT]



; CCFile.CPP
; !!! FileClass is a base type, check what derived type these addresses really point to
%assign CCFileClass__CCFileClass                                  0x004627D4 ; CCFileClass::CCFileClass(char const * filename)
%assign CCFileClass__Write                                        0x00462860 ; long CCFileClass::Write(void const * buffer, long size)
%assign CCFileClass__Close                                        0x00462AA8 ; void CCFileClass::Close(void)
%assign CCFileClass__Open                                         0x00462AD4 ; int CCFileClass::Open(int rights)
%assign CCFileClass__Is_Available                                 0x00462A30 ; int CCFileClass::Is_Available(int )
;%assign CCFile_Find_File                                          0x00462DD4

; CCINI.CPP
%assign CCINIClass__Load                                          0x00462F50 ; bool CCINIClass::Load(FileClass & file, bool withdigest)

%assign CCINIClass__Put_VQType                                    0x00463830 ; bool CCINIClass::Put_VQType(char const * section, char const * entry, VQType value)
%assign CCINIClass__Put_ThemeType                                 0x00463948 ; bool CCINIClass::Put_ThemeType(char const * section, char const * entry, ThemeType value)

; BASE.INI
%assign BaseClass__Write_INI                                      0x00426944 ; void BaseClass::Write_INI(CCINIClass & ini)

; BUILDING.CPP
%assign BuildingClass__Exit_Coord                                 0x0045EB04 ; COORDINATE BuildingClass::Exit_Coord(void) const
%assign BuildingClass__Write_INI                                  0x0045F07C ; void BuildingClass::Write_INI(CCINIClass & ini)
%assign BuildingClass__Begin_Mode                                 0x0045A794 ; void BuildingClass::Begin_Mode(BStateType bstate)

; CARGO.CPP
%assign CargoClass__Attached_Object                               0x0046247C ; FootClass * CargoClass::Attached_Object(void) const

; CELL.CPP
%assign CellClass__Cell_Coord                                     0x0049FDE0 ; COORDINATE CellClass::Cell_Coord(void) const
%assign CellClass__Adjacent_Cell                                  0x004A01EC ; CellClass const * CellClass::Adjacent_Cell(FacingType face) const
%assign CellClass__Is_Bridge_Here                                 0x004A1BE8 ; bool CellClass::Is_Bridge_Here(void)

; COORD.CPP
%assign Coord___Coord_Cell                                        0x004AC3C0 ; CELL Coord_Cell(COORDINATE coord)
;%assign Coord___Distance_As_Target                                ?????????? ; int Distance(TARGET target1, TARGET target2)
%assign Coord___Distance_As_Coord                                 0x004AC41C ; int Distance(COORDINATE coord1, COORDINATE coord2)



; CONQUER.CPP
%assign Conquer___Call_Back                                       0x004A765C ; void Call_Back(void)
%assign Conquer___CC_Draw_Shape                                   0x004A96E8 ; void CC_Draw_Shape(const ObjectClass *object, const char *shape_file_name, void const * shapefile, int shapenum, int x, int y, WindowNumberType window, ShapeFlags_Type flags, void const * fadingdata, void const * ghostdata, DirType rotation, long virtualscale, char override_owner)

; DIALOG.CPP
%assign Dialog___Draw_Box                                         0x004ADB5C ; void Draw_Box(int x, int y, int w, int h, BoxStyleEnum up, bool filled)

; DISPLAY.CPP
%assign DisplayClass__Write_INI                                   0x004B545C ; void DisplayClass::Write_INI(CCINIClass & ini)

; FACE.CPP
%assign Face_Desired_Facing8                                      0x004BEA20 ; DirType Desired_Facing8(int x1, int y1, int x2, int y2)
%assign Face_Desired_Facing256                                    0x004BEA7C ; int Desired_Facing256(int x1, int y1, int x2, int y2)


; FACTORY.CPP
%assign FactoryClass__Get_Object                                  0x004BF368 ; TechnoClass * FactoryClass::Get_Object(void) const

; HDATA.CPP
%assign HouseTypeClass__HouseTypeClass                            0x004CB774 ; HouseTypeClass::HouseTypeClass(HousesType house, char const * ini, int fullname, char const * ext, int lemon, PlayerColorType remapcolor, char prefix)
%assign HouseTypeClass__new                                       0x004CB820 ; void * HouseTypeClass::operator new(size_t)
%assign HouseTypeClass__From_Name                                 0x004CD0E4 ; HousesType HouseTypeClass::From_Name(char const * name)
%assign HouseTypeClass__Read_INI                                  0x004CD174 ; bool HouseTypeClass::Read_INI(CCINIClass & ini)

%assign FixedIHeapClass__Allocate                                 0x004CD818 

; HOUSE.CPP
%assign HouseClass__HousesType                                    0x004D2C48 ; HouseClass::operator HousesType(void) const
%assign HouseClass__As_Pointer                                    0x004D2CB0 ; HouseClass * HouseClass::As_Pointer(HousesType house)
%assign HouseClass__Assign_Handicap                               0x004D2D48 ; DiffType HouseClass::Assign_Handicap(DiffType handicap)
%assign HouseClass__Can_Build                                     0x004D4014 ; bool HouseClass::Can_Build(ObjectTypeClass const * type, HousesType house) const
%assign HouseClass__Available_Money                               0x004D5E00 ; long HouseClass::Available_Money(void) const
%assign HouseClass__Is_Ally                                       0x004D5FC8 ; bool HouseClass::Is_Ally(HousesType house)
%assign HouseClass__Make_Ally                                     0x004D6060 ; void HouseClass::Make_Ally(HousesType house)
%assign HouseClass__MPlayer_Defeated                              0x004D8270 ; void HouseClass::MPlayer_Defeated(void)
%assign HouseClass__Find_Building                                 0x004D8F34 ; BuildingClass * HouseClass::Find_Building(StructType type, ZoneType zone) const
%assign HouseClass__Flag_To_Die                                   0x004D8B40 ; bool HouseClass::Flag_To_Die(void)
%assign HouseClass__Where_To_Go                                   0x004DD9FC ; CELL HouseClass::Where_To_Go(FootClass const * object)
%assign HouseClass__Fetch_Factory                                 0x004DDBD0 ; FactoryClass * HouseClass::Fetch_Factory(RTTIType rtti) const
%assign HouseClass__Get_Quantity                                  0x004DDCE8 ; int HouseClass::Get_Quantity(StructType building) - Warning: Only works up original Building count!
%assign HouseClass__Write_INI                                     0x004DDEB0 ; void HouseClass::Write_INI(CCINIClass & ini)
%assign HouseClass__Is_No_YakMig                                  0x004DE094 ; bool HouseClass::Is_No_YakMig(void) const
%assign HouseClass__Computer_Paranoid                             0x004DE640 ; void HouseClass::Computer_Paranoid(void)



; ADATA.CPP
%assign AnimTypeClass__AnimTypeClass                              0x00407388 ; AnimTypeClass::AnimTypeClass(AnimType,char                *,int,int,int,int,int,int,int,int,int,int,int,fixed,int,int,int,int,int,int,VocType,AnimType)
%assign AnimTypeClass__new                                        0x00407564 ; AnimTypeClass::operator new(uint)

; AADATA.CPP
%assign AircraftTypeClass__AircraftTypeClass                      0x00401210 ; AircraftTypeClass::AircraftTypeClass(AircraftType,int,char *,int,int,int,int,int,int,int,int,int,int,int,int,StructType,int,int,MissionType)
%assign AircraftTypeClass__new                                    0x00401324 ; AircraftTypeClass::operator new(uint)
%assign AircraftTypeClass__As_Reference                           0x004040F0 ; AircraftTypeClass & AircraftTypeClass::As_Reference(AircraftType type)

; BDATA.CPP
%assign BuildingTypeClass__BuildingTypeClass                      0x00429CEC ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
%assign BuildingTypeClass__new                                    0x00429F0C ; BuildingTypeClass::operator new(uint)
%assign BuildingTypeClass__Create_And_Place                       0x00453804 ; int const BuildingTypeClass::Create_And_Place(short,HousesType)
%assign BuildingTypeClass__As_Reference                           0x00453A6C ; BuildingTypeClass & BuildingTypeClass::As_Reference(StructType type)
%assign BuildingTypeClass__Bib_And_Offset                         0x00453BB4 ; bool BuildingTypeClass::Bib_And_Offset(SmudgeType & bib, CELL & cell) const

; TYPE.H
%assign BulletTypeClass__BulletTypeClass                          0x00426A20 ; BulletTypeClass::BulletTypeClass(char *)
%assign BulletTypeClass__new                                      0x00426AB0 ; BulletTypeClass::operator new(uint)

; BULLET.CPP
%assign BulletClass__BulletClass                                  0x00460B90 ; BulletClass::BulletClass(BulletType,long,TechnoClass *,int,WarheadType,int)
%assign BulletClass__new                                          0x00460EAC ; BulletClass::operator new(uint)

; IDATA.CPP
%assign InfantryTypeClass__InfantryTypeClass                      0x004DF5E0 ; InfantryTypeClass::InfantryTypeClass(InfantryType,int,char *,int,int,int,int,int,int,int,int,PipEnum,DoInfoStruct *,int,int,char *)
%assign InfantryTypeClass__new                                    0x004DF728 ; InfantryTypeClass::operator new(uint)
%assign InfantryTypeClass__As_Reference                           0x004EB1B8 ; InfantryTypeClass & InfantryTypeClass::As_Reference(InfantryType type)

; INFANTRY.CPP
%assign InfantryClass__Can_Fire                                   0x004EDF98 ; InfantryClass::Can_Fire(long, int)
%assign InfantryClass__Write_INI                                  0x004F0A84 ; void InfantryClass::Write_INI(CCINIClass & ini)

; INIT.CPP
%assign Init___Select_Game                                        0x004F44DC ; bool Select_Game(bool fade)
%assign Init___Random                                             0x004F5EC4 ; void Init_Random(void)

; IPXADDR.CPP
%assign IPXAddressClass__IPXAddressClass                          0x004F9950 ; IPXAddressClass::IPXAddressClass(void)

; IPXMGR.CPP
%assign IPXManagerClass__Set_Timing                               0x004FA910 ; void IPXManagerClass::Set_Timing (unsigned long retrydelta, unsigned long maxretries, unsigned long timeout)

; MAP.CPP
%assign MapClass__In_Radar                                        0x004FE8AC ; bool MapClass::In_Radar(CELL cell) const
%assign MapClass__Place_Down                                      0x004FE918 ; void MapClass::Place_Down(CELL cell, ObjectClass * object)
%assign MapClass__Pick_Up                                         0x004FEA28 ; void MapClass::Pick_Up(CELL cell, ObjectClass * object)
%assign MapClass__Nearby_Location                                 0x004FFAC4 ; CELL MapClass::Nearby_Location(CELL cell, SpeedType speed, int zone, MZoneType check, bool checkflagged, int locationmod) const




; MAPSEL.CPP
%assign MapSel___Map_Selection                                    0x00500A68 ; char const * Map_Selection(void)

; MIXFILE.CPP
%assign MFCD__Retrieve                                            0x005B9330 ; void const * MixFileClass<T>::Retrieve(char const * filename)

; OBJECT.CPP
%assign ObjectClass__Health_Ratio                                 0x0051E77B ; fixed ObjectClass::Health_Ratio(void)

; OVERLAY.CPP
%assign OverlayTypeClass__As_Reference                            0x00524C10 ; OverlayTypeClass & OverlayTypeClass::As_Reference(OverlayType type)
%assign OverlayClass__Write_INI                                   0x0052736C ; void OverlayClass::Write_INI(CCINIClass & ini)

; REINF.CPP
%assign _Pop_Group_Out_Of_Object                                  0x00532C10 ; static bool _Pop_Group_Out_Of_Object(FootClass * group, TechnoClass * object)
%assign _Create_Group                                             0x00532E44 ; static FootClass * _Create_Group(TeamTypeClass const * teamtype)
%assign _Consists_Only_Of_Infantry                                0x00533098 ; static bool _Consists_Only_Of_Infantry(FootClass const * first)
%assign _Who_Can_Pop_Out_Of                                       0x005330C4 ; static TechnoClass * _Who_Can_Pop_Out_Of(CELL origin)
%assign Do_Reinforcements                                         0x00533178 ; bool Do_Reinforcements(TeamTypeClass const * teamtype)

; RULES.CPP
%assign RulesClass__General                                       0x005342DC
%assign RulesClass__Recharge                                      0x00535CF0
%assign RulesClass__AI                                            0x00536698
%assign RulesClass__Powerups                                      0x00536D3C
%assign RulesClass__Land_Types                                    0x00536E8C
%assign RulesClass__Themes                                        0x00537164
%assign RulesClass__IQ                                            0x00537278
%assign RulesClass__Objects                                       0x005373DC
%assign RulesClass__Difficulty                                    0x00537564

; SCENARIO.CPP
%assign ScenarioClass__Do_BW_Fade                                 0x00539BF8 ; void ScenarioClass::Do_BW_Fade(void)
%assign ScenarioClass__Set_Scenario_Name                          0x0053CFB0 ; void ScenarioClass::Set_Scenario_Name(int scenario, ScenarioPlayerType player, ScenarioDirType dir, ScenarioVarType var)
%assign Scenario___Create_Units                                   0x0053E204 ; static void Create_Units(bool official)
%assign Scenario___Start_Scenario                                 0x0053A0A4 ; bool Start_Scenario(char * name, bool briefing)

; SCORE.CPP
%assign ScoreClass__Presentation                                  0x00540670 ; void ScoreClass::Presentation(void)
%assign Score___Multi_Score_Presentation                          0x00546678 ; void Multi_Score_Presentation(void)


; SESSION.CPP
%assign SessionClass__Create_Connections                          0x0054A4F8 ; int SessionClass::Create_Connections(void)

; SIDEBAR.CPP
%assign SidebarClass__Activate                                    0x0054DA70 ; bool SidebarClass::Activate(int control)

%assign SidebarClass__One_Time                                    0x0054D07C ; void SidebarClass::StripClass::One_Time(int )
%assign SidebarClass__Init_IO                                     0x0054D144 ; void SidebarClass::StripClass::Init_IO(int id)
%assign SidebarClass__Reload_Sidebar                              0x0054D340 ; void SidebarClass::Reload_Sidebar(void)
%assign SidebarClass__Add                                         0x0054D61C ; int SidebarClass::Add(RTTIType,int)
%assign SidebarClass__Scroll                                      0x0054D684 ; bool SidebarClass::Scroll(bool up, int column)

%assign SidebarClass__StripClass__Flag_To_Redraw                  0x0054E2CC ; void SidebarClass::StripClass::Flag_To_Redraw(void)
%assign SidebarClass__StripClass__Add                             0x0054E1F8 ; bool SidebarClass::StripClass::Add(RTTIType type, int id, bool via_capture)

; SDATA.CPP
%assign SmudgeTypeClass__As_Reference                             0x00549F34 ; SmudgeTypeClass & SmudgeTypeClass::As_Reference(SmudgeType type)

; SMUDGE.CPP
%assign SmudgeClass__new                                          0x0054FC10 ; void * SmudgeClass::operator new(size_t )
%assign SmudgeClass__SmudgeClass                                  0x0054FC50 ; SmudgeClass::SmudgeClass(SmudgeType type, COORDINATE pos, HousesType house) :
%assign SmudgeClass__Write_INI                                    0x005501E4 ; void SmudgeClass::Write_INI(CCINIClass & ini)

; TERRAIN.CPP
%assign TerrainClass__Write_INI                                   0x0056AD6C ; void TerrainClass::Write_INI(CCINIClass & ini)

; TEAMTYPE.CPP
%assign TeamTypeClass__Write_INI                                  0x0056076C ; void TeamTypeClass::Write_INI(CCINIClass & ini)

; TECHNO.CPP
%assign TechnoClass__Combat_Damage                                0x00560CBC ; int TechnoClass::Combat_Damage(int which) 
%assign TechnoClass__Owner                                        0x00564358 ; HouseType TechnoClass::Owner(void)  
%assign TechnoTypeClass__Read_INI                                 0x00569914 ;
%assign TechnoTypeClass__Legal_Placement                          0x00569E30 ;

; TRIGGER.CPP
%assign TriggerClass__Spring                                      0x0056CC54 ; bool TriggerClass::Spring(TEventType event, ObjectClass * obj, CELL cell, bool forced)

; TRIGTYPE.CPP
%assign TriggerTypeClass__Write_INI                               0x0056D640 ; void TriggerTypeClass::Write_INI(CCINIClass & ini)

; UDATA.CPP
%assign UnitTypeClass_UnitTypeClass                               0x0056E09C ; UnitTypeClass::UnitTypeClass( lots of args..)
%assign UnitTypeClass_new                                         0x0056E290 ; UnitTypeClass::operator new(uint)
%assign UnitTypeClass__As_Reference                               0x00578C24 ; UnitTypeClass & UnitTypeClass::As_Reference(UnitType type)

; UNIT.CPP
%assign UnitClass__Write_INI                                      0x00581298 ; void UnitClass::Write_INI(CCINIClass & ini)

; VDATA.CPP
%assign VesselTypeClass_VesselTypeClass                           0x00581F0C ; VesselTypeClass::VesselTypeClass(VesselType,int,char *,AnimType,int,int,int,int,int,int,int,int,int,int)
%assign VesselTypeClass_new                                       0x00581FEC ; VesselTypeClass::operator new(uint)
%assign VesselTypeClass__As_Reference                             0x00584858 ; VesselTypeClass & VesselTypeClass::As_Reference(VesselType type)



; VESSEL.CPP
%assign VesselClass__Write_INI                                    0x0058CC18 ; void VesselClass::Write_INI(CCINIClass & ini)

; VORTEX.CPP
%assign Vortex___ChronalVortex                                    0x006904B4 ; ChronalVortexClass ChronalVortex;
%assign ChronalVortexClass__Appear                                0x0058E0F4 ; void ChronalVortexClass::Appear (COORDINATE coordinate)
%assign ChronalVortexClass__Stop                                  0x0058E304 ; void ChronalVortexClass::Stop(void)

; WARHEAD.CPP
%assign Warhead___Warheads                                        0x00691600 ; TFixedIHeapClass<WarheadTypeClass> Warheads;
%assign WarheadTypeClass__WarheadTypeClass                        0x0058F9D8 ; WarheadTypeClass::WarheadTypeClass(char const * name)
%assign WarheadTypeClass__new                                     0x0058FA64 ; void * WarheadTypeClass::operator new(size_t)

; WEAPON.CPP
%assign Weapon__Weapons                                           0x0069164C ; TFixedIHeapClass<WeaponTypeClass> Weapons;
%assign WeaponTypeClass__WeaponTypeClass                          0x0058FD98 ; WeaponTypeClass::WeaponTypeClass(char const * name)
%assign WeaponTypeClass__new                                      0x0058FE18 ; void * WeaponTypeClass::operator new(size_t)


; GAUGE.CPP
%assign GaugeClass__GaugeClass                                    0x004C4CF0 ; GaugeClass::GaugeClass(unsigned id, int x, int y, int w, int h)


; GSCREEN.CPP
%assign GScreenClass__Flag_To_Redraw                              0x004CAFF4 ; void GScreenClass::Flag_To_Redraw(bool complete)
%assign GScreenClass__Render                                      0x004CB110 ; void GScreenClass::Render(void)

; GBUFFER.CPP
%assign GraphicBufferClass__Set_Logic_Page                        0x005C0FE7 ; GraphicViewPortClass *Set_Logic_Page(GraphicViewPortClass &ptr)
%assign GraphicBufferClass__Lock                                  0x005C101A ; BOOL GraphicBufferClass::Lock(void)
%assign GraphicBufferClass__Unlock                                0x005C1191 ; BOOL GraphicBufferClass::Unlock(void)

; NETDLG.CPP
%assign NetDlg___Init_Network                                     0x005063C8 ; bool Init_Network (void)

; WSPUDP.CPP
%assign UDPInterfaceClass__UDPInterfaceClass                      0x005A8560 ; UDPInterfaceClass::UDPInterfaceClass (void)
%assign UDPInterfaceClass__Open_Socket                            0x005A8698 ; bool UDPInterfaceClass::Open_Socket ( SOCKET )

; WSPROTO.CPP
%assign WinsockInterfaceClass__Init                               0x005A817C ; bool WinsockInterfaceClass::Init(void)
%assign WinsockInterfaceClass__Start_Listening                    0x005A80AC ; bool WinsockInterfaceClass::Start_Listening (void)
%assign WinsockInterfaceClass__Discard_In_Buffers                 0x005A812C ; void WinsockInterfaceClass::Discard_In_Buffers (void)
%assign WinsockInterfaceClass__Discard_Out_Buffers                0x005A8154 ; void WinsockInterfaceClass::Discard_Out_Buffers (void)

; MIXFILE.CPP
%assign MixFileClass_CCFileClass_Retrieve                         0x005B8F30 ; void const * MixFileClass<T>::Retrieve(char const * filename)
%assign MixFileClass_CCFileClass_Cache                            0x005B93F0 ; bool MixFileClass<T>::Cache(char const * filename, Buffer const * buffer)


%assign RandomClass_Random                                        0x005BC960 ; RandomClass::operator()(int, int)

; PALETTEC.CPP
%assign PaletteClass__Set                                         0x005BCF44 ; void PaletteClass::Set(int time, void (* callback)(void)) const

; REINF.CPP
%assign Reinf___Do_Reinforcements                                 0x00533178 ; bool Do_Reinforcements(TeamTypeClass const * teamtype)



; GLOBALS.CPP
%assign Globals___Houses                                          0x006017F0 ; TFixedIHeapClass<HouseClass> Houses;
%assign Globals___HouseTypes                                      0x00601818 ; TFixedIHeapClass<HouseTypeClass> HouseTypeClass;
%assign Globals___BuildingTypes                                   0x0060181C ; TFixedIHeapClass<BuildingTypeClass> BuildingTypes;

%assign Globals___FormSpeed                                       0x0065E0D0
%assign Globals___FormMaxSpeed                                    0x0065E0D1

%assign Globals___AntsEnabled                                     0x00665DDC
%assign Globals___NewUnitsEnabled                                 0x00665DE0
%assign Globals___EngineerCaptureLevel                            0x00665E04
%assign Globals___FastKey                                         0x00665F68 ; PKey FastKey;


;%assign Globals___Options                                         ?????????? ; GameOptionsClass Options;
%assign Globals___Options_KeyResign                               0x006681C0 ; KeyNumType KeyResign;


%assign Globals___RuleINI                                         0x00666688 ; CCINIClass RuleINI;
; %assign Globals___AftermathINI                                   0x0066668C ; CCINIClass AftermathINI;
%assign Globals___Rule                                            0x00666704 ; RulesClass Rule; This rules contains the combination of both RULES.INI and AFTRMATH.INI
%assign Globals___Rule_MaxIQ                                      0x00666780 ; int RulesClass::MaxIQ
%assign Globals___Rule_MessageDelay                               0x006667C7 ; int RulesClass::MessageDelay
%assign Globals___Rule_AtomDamage                                 0x006667EB ; int RulesClass::AtomDamage

%assign Globals___Rule_IsMCVDeploy_Address                        0x00666831 ; unsigned RulesClass::IsMCVDeploy:1;
%assign Globals___Rule_IsMCVDeploy_BitMask                        0x80       ; unsigned RulesClass::IsMCVDeploy:1;

%assign Globals___Rule_GoldValue                                  0x00666888 ; int RulesClass::GoldValue
%assign Globals___Rule_GemValue                                   0x0066688C ; int RulesClass::GemValue
%assign Globals___Rule_IronCurtainDuration                        0x006668EA ; int RulesClass::IronCurtainDuration

%assign Globals___Keyboard                                        0x00666904 ; KeyboardClass * Keyboard;

%assign Globals___NonCriticalRandomNumber                         0x00667760 ; RandomClass NonCriticalRandomNumber;

%assign Globals___Scen                                            0x006678E8 ; ScenarioClass Scen;
%assign Globals___Scen_RandomNumber                               0x006678E8 ; RandomClass ScenarioClass::RandomNumber;
%assign Globals___Scen_Difficulty                                 0x006678EC ; DiffType ScenarioClass::Difficulty;	
%assign Globals___Scen_CDifficulty                                0x006678ED ; DiffType ScenarioClass::CDifficulty;

%assign Globals___Scen_Scenario                                   0x006679D3 ; int ScenarioClass::Scenario;
;%assign Globals___Scen_Theater                                    0x006679D7 ; TheaterType ScenarioClass::Theater;
%assign Globals___Scen_ScenarioName                               0x006679D8 ; char ScenarioClass::ScenarioName[_MAX_FNAME+_MAX_EXT];
%assign Globals___Scen_Description                                0x00667BD8 ; char ScenarioClass::Description[DESCRIP_MAX];
%assign Globals___Scen_IntroMovie                                 0x00667C04 ; VQType IntroMovie;
%assign Globals___Scen_BriefMovie                                 0x00667C05 ; VQType BriefMovie;
%assign Globals___Scen_WinMovie                                   0x00667C06 ; VQType WinMovie;
%assign Globals___Scen_LoseMovie                                  0x00667C07 ; VQType LoseMovie;
%assign Globals___Scen_ActionMovie                                0x00667C08 ; VQType ActionMovie;
; BriefingText
%assign Globals___Scen_TransitTheme                               0x00668009 ; ThemeType TransitTheme;
%assign Globals___Scen_PlayerHouse                                0x0066800A ; HousesType PlayerHouse; Warning - this is not used
%assign Globals___Scen_CarryOverPercent                           0x0066800B ; fixed CarryOverPercent;
%assign Globals___Scen_CarryOverMoney                             0x0066800D ; int CarryOverMoney;
%assign Globals___Scen_CarryOverCap                               0x00668011 ; int CarryOverCap;
%assign Globals___Scen_Percent                                    0x00668015 ; int Percent;
%assign Globals___Scen_GlobalFlags                                0x00668019 ; bool GlobalFlags[30];
;IsBridgeChanged
;IsGlobalChanged
%assign Globals___Scen_ToCarryOver_Address                        0x006680A1 ; unsigned IsToCarryOver:1;
%assign Globals___Scen_ToCarryOver_Bitmask                        0x04       ; unsigned IsToCarryOver:1;
%assign Globals___Scen_IsToInherit_Address                        0x006680A1 ; unsigned IsToInherit:1;
%assign Globals___Scen_IsToInherit_Bitmask                        0x08       ; unsigned IsToInherit:1;
%assign Globals___Scen_IsTanyaEvac_Address                        0x006680A1 ; unsigned IsTanyaEvac:1;
%assign Globals___Scen_IsTanyaEvac_Bitmask                        0x10       ; unsigned IsTanyaEvac:1;
;IsFadingBW
;IsFadingColor
%assign Globals___Scen_IsEndOfGame_Address                        0x006680A1 ; unsigned IsEndOfGame:1;
%assign Globals___Scen_IsEndOfGame_Bitmask                        0x80       ; unsigned IsEndOfGame:1;
%assign Globals___Scen_IsInheritTimer_Address                     0x006680A2 ; unsigned IsInheritTimer:1;
%assign Globals___Scen_IsInheritTimer_Bitmask                     0x01       ; unsigned IsInheritTimer:1;

%assign Globals___Scen_IsNoSpyPlane_Address                       0x006680A2 ; unsigned IsNoSpyPlane:1;
%assign Globals___Scen_IsNoSpyPlane_Bitmask                       0x02       ; unsigned IsNoSpyPlane:1;
%assign Globals___Scen_IsSkipScore_Address                        0x006680A2 ; unsigned IsSkipScore:1;
%assign Globals___Scen_IsSkipScore_Bitmask                        0x04       ; unsigned IsSkipScore:1;
%assign Globals___Scen_IsOneTimeOnly_Address                      0x006680A2 ; unsigned IsOneTimeOnly:1;
%assign Globals___Scen_IsOneTimeOnly_Bitmask                      0x08       ; unsigned IsOneTimeOnly:1;
%assign Globals___Scen_IsNoMapSel_Address                         0x006680A2 ; unsigned IsNoMapSel:1;
%assign Globals___Scen_IsNoMapSel_Bitmask                         0x10       ; unsigned IsNoMapSel:1;
%assign Globals___Scen_IsTruckCrate_Address                       0x006680A2 ; unsigned IsTruckCrate:1;
%assign Globals___Scen_IsTruckCrate_Bitmask                       0x20       ; unsigned IsTruckCrate:1;
%assign Globals___Scen_IsMoneyTiberium_Address                    0x006680A2 ; unsigned IsMoneyTiberium:1;
%assign Globals___Scen_IsMoneyTiberium_Bitmask                    0x40       ; unsigned IsMoneyTiberium:1;


%assign Globals___Frame                                           0x006680C4 ; long Frame;
%assign Globals___PlayerWins                                      0x006680C8 ; bool PlayerWins;
%assign Globals___PlayerLoses                                     0x006680CC ; bool PlayerLoses;
%assign Globals___PlayerRestarts                                  0x006680D0 ; bool PlayerRestarts;
%assign Globals___PlayerAborts                                    0x006680D4 ; bool PlayerAborts;


%assign Globals___Map                                             0x00668250 ; MouseClass Map;
%assign Globals___Map_Array                                       0x0066826C ; VectorClass<CellClass> MapClass::Array;


%assign Globals___Map_IsZoomed_Address                            0x00668E9A ; unsigned RadarClass::IsZoomed:1;
%assign Globals___Map_IsZoomed_Bitmask                            0x01       ; unsigned RadarClass::IsZoomed:1;

%assign Globals___Map_IsTargettingMode                            0x00668EC7 ; SpecialWeaponType DisplayClass::IsTargettingMode;

;ScoreClass Score;
;CreditClass CreditDisplay;
;SpecialClass Special;
%assign Globals___ScenarioInit                                    0x00669914 ; int ScenarioInit;
;int BuildLevel = 10;
;bool GameActive;
%assign Globals___PlayerPtr                                       0x00669958 ; HouseClass * PlayerPtr;
; Globals___CCPalette
; Globals___GamePalette
%assign Globals___BlackPalette                                    0x00669F5C ; PaletteClass BlackPalette(RGBClass(0, 0, 0));
%assign Globals___WhitePalette                                    0x0066A25C ; PaletteClass WhitePalette(RGBClass(RGBClass::MAX_VALUE, RGBClass::MAX_VALUE, RGBClass::MAX_VALUE));
; Globals___OriginalPalette
; Globals___ScorePalette

%assign Globals___Base                                            0x0067F28C ; BaseClass Base;
%assign Globals___Base_House                                      0x0067F28C + 0x18 ; HousesType House;


;%assign Globals___Session                                         0x0067F2B4 ; SessionClass Session;
%assign Globals___Session_Type                                    0x0067F2B4 ; GameType SessionClass::Type;

%assign Globals___Session_MaxAhead                                0x0067F325 ; GameType SessionClass::MaxAhead;
%assign Globals___Session_FrameSendRate                           0x0067F329 ; GameType SessionClass::FrameSendRate;
%assign Globals___Session_Type                                    0x0067F2B4 ; GameType SessionClass::Type;

%assign Globals___Ipx                                             0x006805B0 ; IPXManagerClass Ipx;
%assign Globals___Seed                                            0x00680654
%assign Globals___CustomSeed                                      0x00680658


%assign Globals___VisiblePage                                     0x0068065C ; GraphicBufferClass VisiblePage;
%assign Globals___HiddenPage                                      0x00680700 ; GraphicBufferClass HiddenPage;


; are you sure?
%assign Globals___UnitBuildPenalty                                0x006017D8 ; int UnitBuildPenalty;



; INTERNET.CPP
%assign Internet___PlanetWestwoodGameID                           0x006ABBAC ; unsigned long PlanetWestwoodGameID;	
%assign Internet___PlanetWestwoodStartTime                        0x006ABBB0 ; unsigned long PlanetWestwoodStartTime;

; BUFFGLBL.CPP
%assign BuffGlbl___LogicPage                                      0x006AC274 ; GraphicViewPortClass *LogicPage;








