;----------------------------------------------------------------
; sym.inc
;
; Game Symbol Definitions
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
%include "macros/setsym.inc"

setcglob 0x005D6148,start
setcglob 0x005E5904,GetCommandLineA                             


setcglob 0x005E66A8,_imp__timeGetTime
setcglob 0x005E667C,_imp__Sleep

setcglob 0x005C23F0,_Buffer_Fill_Rect
setcglob 0x005C4DE0,_Buffer_Clear
setcglob 0x005C9D60,Set_Video_Mode

; AUDIO.CPP
setcglob 0x00425CA0,Audio___Voc_From_Name                                      ; VocType Voc_From_Name(char const * name)
setcglob 0x00425D1C,Audio___Sound_Effect_At_Coord                              ; void Sound_Effect(VocType voc, COORDINATE coord, int variation, HousesType house)
setcglob 0x00425F24,Audio___Sound_Effect                                       ; int Sound_Effect(VocType voc, fixed volume, int variation, signed short pan_value, HousesType house)
setcglob 0x005FE090,Audio___SoundEffectName                                    ; SoundEffectName[VOC_COUNT]

; ANIM.CPP
setcglob 0x00423ED0,Anim___Anim_From_Name                                      ; AnimType Anim_From_Name(char const * name)
setcglob 0x00424608,AnimClass__new
setcglob 0x00424648,AnimClass__AnimClass

; CCFile.CPP
; !!! FileClass is a base type, check what derived type these addresses really point to
setcglob 0x004627D4,CCFileClass__CCFileClass                                   ; CCFileClass::CCFileClass(char const * filename)
setcglob 0x00462860,CCFileClass__Write                                         ; long CCFileClass::Write(void const * buffer, long size)
setcglob 0x00462AA8,CCFileClass__Close                                         ; void CCFileClass::Close(void)
setcglob 0x00462AD4,CCFileClass__Open                                          ; int CCFileClass::Open(int rights)
setcglob 0x00462A30,CCFileClass__Is_Available                                  ; int CCFileClass::Is_Available(int )
;setcglob 0x00462DD4,CCFile_Find_File                                          

; CCINI.CPP
setcglob 0x004C7C60,CCINIClass__CCINIClass                                     
setcglob 0x00462F50,CCINIClass__Load                                           ; bool CCINIClass::Load(FileClass & file, bool withdigest)
setcglob 0x004637A8,CCINIClass__Put_HousesType                                 ; bool CCINIClass::Put_HousesType(char const * section, char const * entry, HousesType value)
setcglob 0x00463830,CCINIClass__Put_VQType                                     ; int CCINIClass::Put_VQType(char *, char *, VQType)
setcglob 0x00463948,CCINIClass__Put_ThemeType                                  ; int CCINIClass::Put_ThemeType(char *, char *, ThemeType)

; BASE.INI
setcglob 0x00426944,BaseClass__Write_INI                                       ; void BaseClass::Write_INI(CCINIClass & ini)

; BUILDING.CPP
setcglob 0x0045EB04,BuildingClass__Exit_Coord                                  ; COORDINATE BuildingClass::Exit_Coord(void) const
setcglob 0x0045F07C,BuildingClass__Write_INI                                   ; void BuildingClass::Write_INI(CCINIClass & ini)
setcglob 0x0045A794,BuildingClass__Begin_Mode                                  ; void BuildingClass::Begin_Mode(BStateType bstate)
setcglob 0x004537B4,BuildingTypeClass__From_Name                               

; CARGO.CPP
setcglob 0x00462448,CargoClass__Detach_Object
setcglob 0x0046247C,CargoClass__Attached_Object                                ; FootClass * CargoClass::Attached_Object(void) const

; CELL.CPP
setcglob 0x0049F0B0,CellClass__Cell_Building
setcglob 0x0049FDE0,CellClass__Cell_Coord                                      ; COORDINATE CellClass::Cell_Coord(void) const
setcglob 0x004A01EC,CellClass__Adjacent_Cell                                   ; CellClass const * CellClass::Adjacent_Cell(FacingType face) const
setcglob 0x004A1BE8,CellClass__Is_Bridge_Here                                  ; bool CellClass::Is_Bridge_Here(void)

; COMBAT.CPP
setcglob 0x004A31F0,Modify_Damage                                              ; int Modify_Damage(int damage, WarheadType warhead, ArmorType armor, int distance)

; COORD.CPP
setcglob 0x004AC3C0,Coord___Coord_Cell                                         ; CELL Coord_Cell(COORDINATE coord)
;setcglob ??????????,Coord___Distance_As_Target                                ; int Distance(TARGET target1, TARGET target2)
setcglob 0x004AC41C,Coord___Distance_As_Coord                                  ; int Distance(COORDINATE coord1, COORDINATE coord2)

; CONQUER.CPP
setcglob 0x004A765C,Conquer___Call_Back                                        ; void Call_Back(void)
setcglob 0x004A96E8,Conquer___CC_Draw_Shape                                    ; void CC_Draw_Shape(const ObjectClass *object, const char *shape_file_name, void const * shapefile, int shapenum, int x, int y, WindowNumberType window, ShapeFlags_Type flags, void const * fadingdata, void const * ghostdata, DirType rotation, long virtualscale, char override_owner)

; DIALOG.CPP
setcglob 0x004ADB5C,Dialog___Draw_Box                                          ; void Draw_Box(int x, int y, int w, int h, BoxStyleEnum up, bool filled)

setcglob 0x004AE7FC,Fancy_Text_Print 

; DISPLAY.CPP
setcglob 0x004AF7DC,DisplayClass__Passes_Proximity_Check
setcglob 0x004B545C,DisplayClass__Write_INI                                    ; void DisplayClass::Write_INI(CCINIClass & ini)

; EVENT.CPP
setcglob 0x004BCDF8,EventClass__EventClass

; FACE.CPP
setcglob 0x004BEA20,Face_Desired_Facing8                                       ; DirType Desired_Facing8(int x1, int y1, int x2, int y2)
setcglob 0x004BEA7C,Face_Desired_Facing256                                     ; int Desired_Facing256(int x1, int y1, int x2, int y2)

; FACTORY.CPP
setcglob 0x004BF330,FactoryClass__Has_Completed
setcglob 0x004BF368,FactoryClass__Get_Object                                   ; TechnoClass * FactoryClass::Get_Object(void) const

; HDATA.CPP
setcglob 0x004CB774,HouseTypeClass__HouseTypeClass                             ; HouseTypeClass::HouseTypeClass(HousesType house, char const * ini, int fullname, char const * ext, int lemon, PlayerColorType remapcolor, char prefix)
setcglob 0x004CB820,HouseTypeClass__new                                        ; void * HouseTypeClass::operator new(size_t)
setcglob 0x004CD0E4,HouseTypeClass__From_Name                                  ; HousesType HouseTypeClass::From_Name(char const * name)
setcglob 0x004CD174,HouseTypeClass__Read_INI                                   ; bool HouseTypeClass::Read_INI(CCINIClass & ini)

setcglob 0x004CD818,FixedIHeapClass__Allocate                                  

; HOUSE.CPP                                                                    
setcglob 0x004D2C48,HouseClass__HousesType                                     ; HouseClass::operator HousesType(void) const
setcglob 0x004D2CB0,HouseClass__As_Pointer                                     ; HouseClass * HouseClass::As_Pointer(HousesType house)
setcglob 0x004D2D48,HouseClass__Assign_Handicap                                ; DiffType HouseClass::Assign_Handicap(DiffType handicap)
setcglob 0x004D4014,HouseClass__Can_Build                                      ; bool HouseClass::Can_Build(ObjectTypeClass const * type, HousesType house) const
setcglob 0x004D5E00,HouseClass__Available_Money                                ; long HouseClass::Available_Money(void) const
setcglob 0x004D5FC8,HouseClass__Is_Ally                                        ; bool HouseClass::Is_Ally(HousesType house)
setcglob 0x004D6060,HouseClass__Make_Ally                                      ; void HouseClass::Make_Ally(HousesType house)
setcglob 0x004D68CC,HouseClass__Place_Special_Blast
setcglob 0x004D7A18,HouseClass__Manual_Place
setcglob 0x004D8270,HouseClass__MPlayer_Defeated                               ; void HouseClass::MPlayer_Defeated(void)
setcglob 0x004D8F34,HouseClass__Find_Building                                  ; BuildingClass * HouseClass::Find_Building(StructType type, ZoneType zone) const
setcglob 0x004D8B40,HouseClass__Flag_To_Die                                    ; bool HouseClass::Flag_To_Die(void)
setcglob 0x004DCC30,HouseClass__Tracking_Add                             
setcglob 0x004DD0A4,HouseClass__Which_Zone
setcglob 0x004DD9FC,HouseClass__Where_To_Go                                    ; CELL HouseClass::Where_To_Go(FootClass const * object)
setcglob 0x004DDBD0,HouseClass__Fetch_Factory                                  ; FactoryClass * HouseClass::Fetch_Factory(RTTIType rtti) const
setcglob 0x004DDCE8,HouseClass__Get_Quantity                                   ; int HouseClass::Get_Quantity(StructType building) - Warning: Only works up original Building count!
setcglob 0x004DDEB0,HouseClass__Write_INI                                      ; void HouseClass::Write_INI(CCINIClass & ini)
setcglob 0x004DE094,HouseClass__Is_No_YakMig                                   ; bool HouseClass::Is_No_YakMig(void) const
setcglob 0x004DE640,HouseClass__Computer_Paranoid                              ; void HouseClass::Computer_Paranoid(void)

; ADATA.CPP
setcglob 0x00407388,AnimTypeClass__AnimTypeClass                               ; AnimTypeClass::AnimTypeClass(AnimType,char *,int,int,int,int,int,int,int,int,int,int,int,fixed,int,int,int,int,int,int,VocType,AnimType)
setcglob 0x00407564,AnimTypeClass__new                                         ; AnimTypeClass::operator new(uint)

; AADATA.CPP
setcglob 0x00401210,AircraftTypeClass__AircraftTypeClass                       ; AircraftTypeClass::AircraftTypeClass(AircraftType,int,char *,int,int,int,int,int,int,int,int,int,int,int,int,StructType,int,int,MissionType)
setcglob 0x00401324,AircraftTypeClass__new                                     ; AircraftTypeClass::operator new(uint)
setcglob 0x004040F0,AircraftTypeClass__As_Reference                            ; AircraftTypeClass & AircraftTypeClass::As_Reference(AircraftType type)

; AIRCRAFT.CPP
setcglob 0x004229F8,AircraftClass__Mission_Guard
setcglob 0x00422FC8,AircraftClass__Mission_Guard_Area

; BDATA.CPP
setcglob 0x00429CEC,BuildingTypeClass__BuildingTypeClass                       ; BuildingTypeClass::BuildingTypeClass(StructType,int,char *,FacingType,ulong,RemapType,int,int,int,int,int,int,int,int,int,int,int,int,int,int,int,RTTIType,DirType,BSizeType,short *,short *,short *)
setcglob 0x00429F0C,BuildingTypeClass__new                                     ; BuildingTypeClass::operator new(uint)
setcglob 0x00453804,BuildingTypeClass__Create_And_Place                        ; int const BuildingTypeClass::Create_And_Place(short,HousesType)
setcglob 0x00453A6C,BuildingTypeClass__As_Reference                            ; BuildingTypeClass & BuildingTypeClass::As_Reference(StructType type)
setcglob 0x00453BB4,BuildingTypeClass__Bib_And_Offset                          ; bool BuildingTypeClass::Bib_And_Offset(SmudgeType & bib, CELL & cell) const

; TYPE.H
setcglob 0x00426A20,BulletTypeClass__BulletTypeClass                           ; BulletTypeClass::BulletTypeClass(char *)
setcglob 0x00426AB0,BulletTypeClass__new                                       ; BulletTypeClass::operator new(uint)

; BULLET.CPP
setcglob 0x00460B90,BulletClass__BulletClass                                   ; BulletClass::BulletClass(BulletType,long,TechnoClass *,int,WarheadType,int)
setcglob 0x00460EAC,BulletClass__new                                           ; BulletClass::operator new(uint)

; FOOT.CPP
setcglob 0x004C1104,FootClass__Mission_Guard

; IDATA.CPP
setcglob 0x004DF5E0,InfantryTypeClass__InfantryTypeClass                       ; InfantryTypeClass::InfantryTypeClass(InfantryType,int,char *,int,int,int,int,int,int,int,int,PipEnum,DoInfoStruct *,int,int,char *)
setcglob 0x004DF728,InfantryTypeClass__new                                     ; InfantryTypeClass::operator new(uint)
setcglob 0x004EB1B8,InfantryTypeClass__As_Reference                            ; InfantryTypeClass & InfantryTypeClass::As_Reference(InfantryType type)

; INFANTRY.CPP
setcglob 0x004EDF98,InfantryClass__Can_Fire                                    ; InfantryClass::Can_Fire(long, int)
setcglob 0x004F0A84,InfantryClass__Write_INI                                   ; void InfantryClass::Write_INI(CCINIClass & ini)

; INIT.CPP
setcglob 0x004F44DC,Init___Select_Game                                         ; bool Select_Game(bool fade)
setcglob 0x004F5EC4,Init___Random                                              ; void Init_Random(void)

; IPXADDR.CPP
setcglob 0x004F9950,IPXAddressClass__IPXAddressClass                           ; IPXAddressClass::IPXAddressClass(void)

; IPXMGR.CPP
setcglob 0x004FA910,IPXManagerClass__Set_Timing                                ; void IPXManagerClass::Set_Timing (unsigned long retrydelta, unsigned long maxretries, unsigned long timeout)

; MAP.CPP
setcglob 0x006025D0,Map__RadiusOffset                                          ; int const MapClass::RadiusOffset[]
setcglob 0x00602AA4,Map__RadiusCount                                           ; int const MapClass::RadiusCount[11]

setcglob 0x004FE8AC,MapClass__In_Radar                                         ; bool MapClass::In_Radar(CELL cell) const
setcglob 0x004FE918,MapClass__Place_Down                                       ; void MapClass::Place_Down(CELL cell, ObjectClass * object)
setcglob 0x004FEA28,MapClass__Pick_Up                                          ; void MapClass::Pick_Up(CELL cell, ObjectClass * object)
setcglob 0x004FFAC4,MapClass__Nearby_Location                                  ; CELL MapClass::Nearby_Location(CELL cell, SpeedType speed, int zone, MZoneType check, bool checkflagged, int locationmod) const

; MAPSEL.CPP
setcglob 0x00500A68,MapSel___Map_Selection                                     ; char const * Map_Selection(void)

; MIXFILE.CPP
setcglob 0x005B9330,MFCD__Retrieve                                             ; void const * MixFileClass<T>::Retrieve(char const * filename)

; OBJECT.CPP
setcglob 0x0051E77B,ObjectClass__Health_Ratio                                  ; fixed ObjectClass::Health_Ratio(void)

; OVERLAY.CPP
setcglob 0x00524C10,OverlayTypeClass__As_Reference                             ; OverlayTypeClass & OverlayTypeClass::As_Reference(OverlayType type)
setcglob 0x0052736C,OverlayClass__Write_INI                                    ; void OverlayClass::Write_INI(CCINIClass & ini)

; REINF.CPP
setcglob 0x00532C10,_Pop_Group_Out_Of_Object                                   ; static bool _Pop_Group_Out_Of_Object(FootClass * group, TechnoClass * object)
setcglob 0x00532E44,_Create_Group                                              ; static FootClass * _Create_Group(TeamTypeClass const * teamtype)
setcglob 0x00533098,_Consists_Only_Of_Infantry                                 ; static bool _Consists_Only_Of_Infantry(FootClass const * first)
setcglob 0x005330C4,_Who_Can_Pop_Out_Of                                        ; static TechnoClass * _Who_Can_Pop_Out_Of(CELL origin)
setcglob 0x00533178,Do_Reinforcements                                          ; bool Do_Reinforcements(TeamTypeClass const * teamtype)

; RADAR.CPP
setcglob 0x005329EC,RadarClass__Flag_Cell

; RULES.CPP
setcglob 0x005342DC,RulesClass__General                                       
setcglob 0x00535CF0,RulesClass__Recharge                                      
setcglob 0x00536698,RulesClass__AI                                            
setcglob 0x00536D3C,RulesClass__Powerups                                      
setcglob 0x00536E8C,RulesClass__Land_Types                                    
setcglob 0x00537164,RulesClass__Themes                                        
setcglob 0x00537278,RulesClass__IQ                                            
setcglob 0x005373DC,RulesClass__Objects                                       
setcglob 0x00537564,RulesClass__Difficulty                                    

; SCENARIO.CPP
setcglob 0x00539BF8,ScenarioClass__Do_BW_Fade                                  ; void ScenarioClass::Do_BW_Fade(void)
setcglob 0x0053CFB0,ScenarioClass__Set_Scenario_Name                           ; void ScenarioClass::Set_Scenario_Name(int scenario, ScenarioPlayerType player, ScenarioDirType dir, ScenarioVarType var)
setcglob 0x0053E204,Scenario___Create_Units                                    ; static void Create_Units(bool official)
setcglob 0x0053A0A4,Scenario___Start_Scenario                                  ; bool Start_Scenario(char * name, bool briefing)

; SCORE.CPP
setcglob 0x00540670,ScoreClass__Presentation                                   ; void ScoreClass::Presentation(void)
setcglob 0x00546678,Score___Multi_Score_Presentation                           ; void Multi_Score_Presentation(void)

; SESSION.CPP
setcglob 0x0054A4F8,SessionClass__Create_Connections                           ; int SessionClass::Create_Connections(void)

; SIDEBAR.CPP
setcglob 0x0054DA70,SidebarClass__Activate                                     ; bool SidebarClass::Activate(int control)

setcglob 0x0054D07C,SidebarClass__One_Time                                     ; void SidebarClass::StripClass::One_Time(int )
setcglob 0x0054D144,SidebarClass__Init_IO                                      ; void SidebarClass::StripClass::Init_IO(int id)
setcglob 0x0054D340,SidebarClass__Reload_Sidebar                               ; void SidebarClass::Reload_Sidebar(void)
setcglob 0x0054D61C,SidebarClass__Add                                          ; int SidebarClass::Add(RTTIType,int)
setcglob 0x0054D684,SidebarClass__Scroll                                       ; bool SidebarClass::Scroll(bool up, int column)

setcglob 0x0054E2CC,SidebarClass__StripClass__Flag_To_Redraw                   ; void SidebarClass::StripClass::Flag_To_Redraw(void)
setcglob 0x0054E1F8,SidebarClass__StripClass__Add                              ; bool SidebarClass::StripClass::Add(RTTIType type, int id, bool via_capture)

; SDATA.CPP
setcglob 0x00549F34,SmudgeTypeClass__As_Reference                              ; SmudgeTypeClass & SmudgeTypeClass::As_Reference(SmudgeType type)

; SMUDGE.CPP
setcglob 0x0054FC10,SmudgeClass__new                                           ; void * SmudgeClass::operator new(size_t )
setcglob 0x0054FC50,SmudgeClass__SmudgeClass                                   ; SmudgeClass::SmudgeClass(SmudgeType type, COORDINATE pos, HousesType house) :
setcglob 0x005501E4,SmudgeClass__Write_INI                                     ; void SmudgeClass::Write_INI(CCINIClass & ini)

; TARGET.CPP
setcglob 0x00554EE0,TargetClass__TargetClass_Target
setcglob 0x00554EEC,TargetClass__TargetClass_AbstractClass
setcglob 0x00554F38,TargetClass__TargetClass_AbstractTypeClass
setcglob 0x00554F84,TargetClass__TargetClass_CellClass
setcglob 0x00555384,Target___As_Coord                                          ; COORDINATE As_Coord(TARGET target)
setcglob 0x005558E8,Target___As_Target                                         ; TARGET As_Target(CELL cell)
setcglob 0x0055514C,Target___As_Techno                                         ; TechnoClass * As_Techno(TARGET target, bool check_active)

; TERRAIN.CPP
setcglob 0x0056AD6C,TerrainClass__Write_INI                                    ; void TerrainClass::Write_INI(CCINIClass & ini)

; TEAMTYPE.CPP
setcglob 0x0056076C,TeamTypeClass__Write_INI                                   ; void TeamTypeClass::Write_INI(CCINIClass & ini)

; TECHNO.CPP
setcglob 0x00560CBC,TechnoClass__Combat_Damage                                 ; int TechnoClass::Combat_Damage(int which) 
setcglob 0x00560B14,TechnoClass__What_Weapon_Should_I_Use
setcglob 0x00564358,TechnoClass__Owner                                         ; HouseType TechnoClass::Owner(void)  
setcglob 0x00568610,TechnoClass__Target_Something_Nearby
setcglob 0x00569914,TechnoTypeClass__Read_INI                                  
setcglob 0x00569E30,TechnoTypeClass__Legal_Placement                           


; TRIGGER.CPP
setcglob 0x0056CC54,TriggerClass__Spring                                       ; bool TriggerClass::Spring(TEventType event, ObjectClass * obj, CELL cell, bool forced)

; TRIGTYPE.CPP
setcglob 0x0056D640,TriggerTypeClass__Write_INI                                ; void TriggerTypeClass::Write_INI(CCINIClass & ini)

; UDATA.CPP
setcglob 0x0056E09C,UnitTypeClass_UnitTypeClass                                ; UnitTypeClass::UnitTypeClass( lots of args..)
setcglob 0x0056E290,UnitTypeClass_new                                          ; UnitTypeClass::operator new(uint)
setcglob 0x005789AC,UnitTypeClass__One_Time    
setcglob 0x00578C24,UnitTypeClass__As_Reference                                ; UnitTypeClass & UnitTypeClass::As_Reference(UnitType type)

; UNIT.CPP
setcglob 0x0057FB98,UnitClass__Mission_Guard
setcglob 0x00581298,UnitClass__Write_INI                                       ; void UnitClass::Write_INI(CCINIClass & ini)

; VDATA.CPP
setcglob 0x00581F0C,VesselTypeClass_VesselTypeClass                            ; VesselTypeClass::VesselTypeClass(VesselType,int,char *,AnimType,int,int,int,int,int,int,int,int,int,int)
setcglob 0x00581FEC,VesselTypeClass_new                                        ; VesselTypeClass::operator new(uint)
setcglob 0x00584858,VesselTypeClass__As_Reference                              ; VesselTypeClass & VesselTypeClass::As_Reference(VesselType type)

; VESSEL.CPP
setcglob 0x0058CC18,VesselClass__Write_INI                                     ; void VesselClass::Write_INI(CCINIClass & ini)

; VORTEX.CPP
setcglob 0x006904B4,Vortex___ChronalVortex                                     ; ChronalVortexClass ChronalVortex;
setcglob 0x0058E0F4,ChronalVortexClass__Appear                                 ; void ChronalVortexClass::Appear (COORDINATE coordinate)
setcglob 0x0058E304,ChronalVortexClass__Stop                                   ; void ChronalVortexClass::Stop(void)

; WARHEAD.CPP
setcglob 0x00691600,Warhead___Warheads                                         ; TFixedIHeapClass<WarheadTypeClass> Warheads;
setcglob 0x0058F9D8,WarheadTypeClass__WarheadTypeClass                         ; WarheadTypeClass::WarheadTypeClass(char const * name)
setcglob 0x0058FA64,WarheadTypeClass__new                                      ; void * WarheadTypeClass::operator new(size_t)

; WEAPON.CPP
setcglob 0x0069164C,Weapon__Weapons                                            ; TFixedIHeapClass<WeaponTypeClass> Weapons;
setcglob 0x0058FD98,WeaponTypeClass__WeaponTypeClass                           ; WeaponTypeClass::WeaponTypeClass(char const * name)
setcglob 0x0058FE18,WeaponTypeClass__new                                       ; void * WeaponTypeClass::operator new(size_t)

; UTRACKER.CPP
setcglob 0x00581C98,UnitTrackerClass__Increment_Unit_Total                     ; void UnitTrackerClass::Increment_Unit_Total(int unit_type)
setcglob 0x00581CA4,UnitTrackerClass__Decrement_Unit_Total                     ; void UnitTrackerClass::Increment_Unit_Total(int unit_type)

; GAUGE.CPP
setcglob 0x004C4CF0,GaugeClass__GaugeClass                                     ; GaugeClass::GaugeClass(unsigned id, int x, int y, int w, int h)

; GSCREEN.CPP
setcglob 0x004CAFF4,GScreenClass__Flag_To_Redraw                               ; void GScreenClass::Flag_To_Redraw(bool complete)
setcglob 0x004CB110,GScreenClass__Render                                       ; void GScreenClass::Render(void)

; GBUFFER.CPP
setcglob 0x005C0850,GraphicViewPortClass__GraphicViewPortClass
setcglob 0x005C094F,GraphicViewPortClass__Attach                               ; GraphicViewPortClass::Attach(GraphicBufferClass *,int,int,int,int)
setcglob 0x005C0FE7,GraphicBufferClass__Set_Logic_Page                         ; GraphicViewPortClass *Set_Logic_Page(GraphicViewPortClass &ptr)
setcglob 0x005C101A,GraphicBufferClass__Lock                                   ; BOOL GraphicBufferClass::Lock(void)
setcglob 0x005C1191,GraphicBufferClass__Unlock                                 ; BOOL GraphicBufferClass::Unlock(void)

setcglob 0x005C13E4,Buffer_Draw_Line

; MOUSEWW.CPP
setcglob 0x005C1980,WWMouseClass__Process_Mouse
setcglob 0x005C2180,Process_Mouse

; NETDLG.CPP
setcglob 0x005063C8,NetDlg___Init_Network                                      ; bool Init_Network (void)

; WSPUDP.CPP
setcglob 0x005A8560,UDPInterfaceClass__UDPInterfaceClass                       ; UDPInterfaceClass::UDPInterfaceClass (void)
setcglob 0x005A8698,UDPInterfaceClass__Open_Socket                             ; bool UDPInterfaceClass::Open_Socket ( SOCKET )

; WSPROTO.CPP
setcglob 0x005A817C,WinsockInterfaceClass__Init                                ; bool WinsockInterfaceClass::Init(void)
setcglob 0x005A80AC,WinsockInterfaceClass__Start_Listening                     ; bool WinsockInterfaceClass::Start_Listening (void)
setcglob 0x005A812C,WinsockInterfaceClass__Discard_In_Buffers                  ; void WinsockInterfaceClass::Discard_In_Buffers (void)
setcglob 0x005A8154,WinsockInterfaceClass__Discard_Out_Buffers                 ; void WinsockInterfaceClass::Discard_Out_Buffers (void)

; MIXFILE.CPP
setcglob 0x005B8F30,MixFileClass_CCFileClass_Retrieve                          ; void const * MixFileClass<T>::Retrieve(char const * filename)
setcglob 0x005B93F0,MixFileClass_CCFileClass_Cache                             ; bool MixFileClass<T>::Cache(char const * filename, Buffer const * buffer)


setcglob 0x005BC960,RandomClass_Random                                         ; RandomClass::operator()(int, int)
         
; PALETTEC.CPP
setcglob 0x005BCF44,PaletteClass__Set                                          ; void PaletteClass::Set(int time, void (* callback)(void)) const
         
; REINF.CPP
setcglob 0x00533178,Reinf___Do_Reinforcements                                  ; bool Do_Reinforcements(TeamTypeClass const * teamtype)
         
; DIPTHONG.CPP
setcglob 0x005C5070,Extract_String                                             ; char *Extract_String(void const *data, int string)

; GLOBALS.CPP
setcglob 0x006016B0,Globals___ScreenWidth
setcglob 0x006016B4,Globals___ScreenHeight

setcglob 0x006016CC,Globals___WindowList

setcglob 0x006017F0,Globals___Houses                                           ; TFixedIHeapClass<HouseClass> Houses;
setcglob 0x00601818,Globals___HouseTypes                                       ; TFixedIHeapClass<HouseTypeClass> HouseTypeClass;
setcglob 0x0060181C,Globals___BuildingTypes                                    ; TFixedIHeapClass<BuildingTypeClass> BuildingTypes;
setcglob 0x0065D7C0,Globals___SaveGameVersion
setcglob 0x0065E0D0,Globals___FormSpeed                                       
setcglob 0x0065E0D1,Globals___FormMaxSpeed                                    
setcglob 0x00665DDC,Globals___AntsEnabled                                     
setcglob 0x00665DE0,Globals___NewUnitsEnabled                                 

setcglob 0x00665E04,Globals___EngineerCaptureLevel                            
setcglob 0x00665E08,Globals___WWMouse                            
setcglob 0x00665F68,Globals___FastKey                                          ; PKey FastKey;
;setcglob ??????????,Globals___Options                                          ; GameOptionsClass Options;
setcglob 0x006681C0,Globals___Options_KeyResign                                ; KeyNumType KeyResign;
setcglob 0x00666688,Globals___RuleINI                                          ; CCINIClass RuleINI;
setcglob 0x0066668C,Globals___AftermathINI                                     ; CCINIClass AftermathINI;
setcglob 0x00666704,Globals___Rule                                             ; RulesClass Rule; This rules contains the combination of both RULES.INI and AFTRMATH.INI
setcglob 0x00666780,Globals___Rule_MaxIQ                                       ; int RulesClass::MaxIQ
setcglob 0x006667C7,Globals___Rule_MessageDelay                                ; int RulesClass::MessageDelay
setcglob 0x006667EB,Globals___Rule_AtomDamage                                  ; int RulesClass::AtomDamage
setcglob 0x00666831,Globals___Rule_IsMCVDeploy_Address                         ; unsigned RulesClass::IsMCVDeploy:1;
setcglob 0x80      ,Globals___Rule_IsMCVDeploy_BitMask                         ; unsigned RulesClass::IsMCVDeploy:1;
setcglob 0x00666888,Globals___Rule_GoldValue                                   ; int RulesClass::GoldValue
setcglob 0x0066688C,Globals___Rule_GemValue                                    ; int RulesClass::GemValue
setcglob 0x006668EA,Globals___Rule_IronCurtainDuration                         ; int RulesClass::IronCurtainDuration
setcglob 0x00666904,Globals___Keyboard                                         ; KeyboardClass * Keyboard;
setcglob 0x00667760,Globals___NonCriticalRandomNumber                          ; RandomClass NonCriticalRandomNumber;
setcglob 0x006678E8,Globals___Scen                                             ; ScenarioClass Scen;
setcglob 0x006678E8,Globals___Scen_RandomNumber                                ; RandomClass ScenarioClass::RandomNumber;
setcglob 0x006678EC,Globals___Scen_Difficulty                                  ; DiffType ScenarioClass::Difficulty;	
setcglob 0x006678ED,Globals___Scen_CDifficulty                                 ; DiffType ScenarioClass::CDifficulty;
setcglob 0x006679D3,Globals___Scen_Scenario                                    ; int ScenarioClass::Scenario;
setcglob 0x006679D7,Globals___Scen_Theater                                     ; TheaterType ScenarioClass::Theater;
setcglob 0x006679D8,Globals___Scen_ScenarioName                                ; char ScenarioClass::ScenarioName[_MAX_FNAME+_MAX_EXT];
setcglob 0x00667BD8,Globals___Scen_Description                                 ; char ScenarioClass::Description[DESCRIP_MAX];
setcglob 0x00667C04,Globals___Scen_IntroMovie                                  ; VQType IntroMovie;
setcglob 0x00667C05,Globals___Scen_BriefMovie                                  ; VQType BriefMovie;
setcglob 0x00667C06,Globals___Scen_WinMovie                                    ; VQType WinMovie;
setcglob 0x00667C07,Globals___Scen_LoseMovie                                   ; VQType LoseMovie;
setcglob 0x00667C08,Globals___Scen_ActionMovie                                 ; VQType ActionMovie;
; BriefingText
setcglob 0x00668009,Globals___Scen_TransitTheme                                ; ThemeType TransitTheme;
setcglob 0x0066800A,Globals___Scen_PlayerHouse                                 ; HousesType PlayerHouse; Warning - this is not used
setcglob 0x0066800B,Globals___Scen_CarryOverPercent                            ; fixed CarryOverPercent;
setcglob 0x0066800D,Globals___Scen_CarryOverMoney                              ; int CarryOverMoney;
setcglob 0x00668011,Globals___Scen_CarryOverCap                                ; int CarryOverCap;
setcglob 0x00668015,Globals___Scen_Percent                                     ; int Percent;
setcglob 0x00668019,Globals___Scen_GlobalFlags                                 ; bool GlobalFlags[30];
;IsBridgeChanged
;IsGlobalChanged
setcglob 0x006680A1,Globals___Scen_ToCarryOver_Address                         ; unsigned IsToCarryOver:1;
setcglob 0x04      ,Globals___Scen_ToCarryOver_Bitmask                         ; unsigned IsToCarryOver:1;
setcglob 0x006680A1,Globals___Scen_IsToInherit_Address                         ; unsigned IsToInherit:1;
setcglob 0x08      ,Globals___Scen_IsToInherit_Bitmask                         ; unsigned IsToInherit:1;
setcglob 0x006680A1,Globals___Scen_IsTanyaEvac_Address                         ; unsigned IsTanyaEvac:1;
setcglob 0x10      ,Globals___Scen_IsTanyaEvac_Bitmask                         ; unsigned IsTanyaEvac:1;
;IsFadingBW
;IsFadingColor
setcglob 0x006680A1,Globals___Scen_IsEndOfGame_Address                         ; unsigned IsEndOfGame:1;
setcglob 0x80      ,Globals___Scen_IsEndOfGame_Bitmask                         ; unsigned IsEndOfGame:1;
setcglob 0x006680A2,Globals___Scen_IsInheritTimer_Address                      ; unsigned IsInheritTimer:1;
setcglob 0x01      ,Globals___Scen_IsInheritTimer_Bitmask                      ; unsigned IsInheritTimer:1;
setcglob 0x006680A2,Globals___Scen_IsNoSpyPlane_Address                        ; unsigned IsNoSpyPlane:1;
setcglob 0x02      ,Globals___Scen_IsNoSpyPlane_Bitmask                        ; unsigned IsNoSpyPlane:1;
setcglob 0x006680A2,Globals___Scen_IsSkipScore_Address                         ; unsigned IsSkipScore:1;
setcglob 0x04      ,Globals___Scen_IsSkipScore_Bitmask                         ; unsigned IsSkipScore:1;
setcglob 0x006680A2,Globals___Scen_IsOneTimeOnly_Address                       ; unsigned IsOneTimeOnly:1;
setcglob 0x08      ,Globals___Scen_IsOneTimeOnly_Bitmask                       ; unsigned IsOneTimeOnly:1;
setcglob 0x006680A2,Globals___Scen_IsNoMapSel_Address                          ; unsigned IsNoMapSel:1;
setcglob 0x10      ,Globals___Scen_IsNoMapSel_Bitmask                          ; unsigned IsNoMapSel:1;
setcglob 0x006680A2,Globals___Scen_IsTruckCrate_Address                        ; unsigned IsTruckCrate:1;
setcglob 0x20      ,Globals___Scen_IsTruckCrate_Bitmask                        ; unsigned IsTruckCrate:1;
setcglob 0x006680A2,Globals___Scen_IsMoneyTiberium_Address                     ; unsigned IsMoneyTiberium:1;
setcglob 0x40      ,Globals___Scen_IsMoneyTiberium_Bitmask                     ; unsigned IsMoneyTiberium:1;
setcglob 0x006680C4,Globals___Frame                                            ; long Frame;
setcglob 0x006680C8,Globals___PlayerWins                                       ; bool PlayerWins;
setcglob 0x006680CC,Globals___PlayerLoses                                      ; bool PlayerLoses;
setcglob 0x006680D0,Globals___PlayerRestarts                                   ; bool PlayerRestarts;
setcglob 0x006680D4,Globals___PlayerAborts                                     ; bool PlayerAborts;
setcglob 0x00668250,Globals___Map                                              ; MouseClass Map;
setcglob 0x0066826C,Globals___Map_Array                                        ; VectorClass<CellClass> MapClass::Array;
setcglob 0x00668E9A,Globals___Map_IsZoomed_Address                             ; unsigned RadarClass::IsZoomed:1;
setcglob 0x01      ,Globals___Map_IsZoomed_Bitmask                             ; unsigned RadarClass::IsZoomed:1;
setcglob 0x00668EC7,Globals___Map_IsTargettingMode                             ; SpecialWeaponType DisplayClass::IsTargettingMode;
;ScoreClass Score;
;CreditClass CreditDisplay;
;SpecialClass Special;
setcglob 0x00669914,Globals___ScenarioInit                                     ; int ScenarioInit;
;int BuildLevel = 10;
setcglob 0x00669924,Globals___GameActive
setcglob 0x00669958,Globals___PlayerPtr                                        ; HouseClass * PlayerPtr;
setcglob 0x0066995C,Globals___CCPalette
setcglob 0x00669C5C,Globals___GamePalette
setcglob 0x00669F5C,Globals___BlackPalette                                     ; PaletteClass BlackPalette(RGBClass(0, 0, 0));
setcglob 0x0066A25C,Globals___WhitePalette                                     ; PaletteClass WhitePalette(RGBClass(RGBClass::MAX_VALUE, RGBClass::MAX_VALUE, RGBClass::MAX_VALUE));
setcglob 0x0066A55C,Globals___OriginalPalette
; Globals___ScorePalette
setcglob 0x0067F28C,Globals___Base                                             ; BaseClass Base;
setcglob 0x0067F2A4,Globals___Base_House                                       ; HousesType House;
;setcglob 0x0067F2B4,Globals___Session                                         ; SessionClass Session;
setcglob 0x0067F2B4,Globals___Session_Type                                     ; GameType SessionClass::Type;
setcglob 0x0067F325,Globals___Session_MaxAhead                                 ; GameType SessionClass::MaxAhead;
setcglob 0x0067F329,Globals___Session_FrameSendRate                            ; GameType SessionClass::FrameSendRate;
setcglob 0x006805B0,Globals___Ipx                                              ; IPXManagerClass Ipx;
setcglob 0x00680654,Globals___Seed                                            
setcglob 0x00680658,Globals___CustomSeed                                      
setcglob 0x0068065C,Globals___VisiblePage                                      ; GraphicBufferClass VisiblePage;
setcglob 0x00680700,Globals___HiddenPage                                       ; GraphicBufferClass HiddenPage;
setcglob 0x006807A4,Globals___SeenBuff                                         ; GraphicViewPortClass	SeenBuff(&VisiblePage, 0, 0, 3072, 3072);
setcglob 0x006807CC,Globals___HidPage                                          ; GraphicViewPortClass	HidPage(&HiddenPage, 0, 0, 3072, 3072);

; SIDEBAR.CPP
setcglob 0x0068A1E4,SidebarClass__StripClass__UpButton                         ; ShapeButtonClass SidebarClass::StripClass::UpButton[COLUMNS];
setcglob 0x0068A254,SidebarClass__StripClass__DownButton                       ; ShapeButtonClass SidebarClass::StripClass::DownButton[COLUMNS];
setcglob 0x0068A2C4,SidebarClass__StripClass__SelectButton                     ; SidebarClass::StripClass::SelectClass SidebarClass::StripClass::SelectButton[COLUMNS][MAX_VISIBLE];


; are you sure?
setcglob 0x006017D8,Globals___UnitBuildPenalty                                 ; int UnitBuildPenalty;
         
; INTERNET.CPP
setcglob 0x006ABBAC,Internet___PlanetWestwoodGameID                            ; unsigned long PlanetWestwoodGameID;	
setcglob 0x006ABBB0,Internet___PlanetWestwoodStartTime                         ; unsigned long PlanetWestwoodStartTime;

; BUFFGLBL.CPP
setcglob 0x006AC274,BuffGlbl___LogicPage                                       ; GraphicViewPortClass *LogicPage;

; DDRAW.CPP
setcglob 0x006B1498,DDraw___MainWindow      


setcglob 0x005D0F10,Delay                                                      ; Delay(int)
setcglob 0x004ABF4C,List_Copy                                                  ; void List_Copy(short const * source, int len, short * dest)

;---------------------------------------------------------------------------
; Heap arrays
;---------------------------------------------------------------------------
; FixedHeapClass
;   size 0x??
;     unsigned IsAllocated:1  offset 0
;     int Size offset 4
;     int TotalCount offset 8
;     int ActiveCount offset 12
;     void* array Buffer offset 16
;     ? FreeFlag offset 20
;
; FixedIHeapClass
;   size 0x4C
;     FixedHeapClass 
;     + DynamicVectorClass<void *> ActivePointers (
;        void * * Vector 
;        unsigned VectorMax
;        unsigned IsAllocated:1
;        int ActiveCount 
;        int GrowthStep 

; Note we should be checking TotalCount instead of ActiveCount

; GLOBALS.CPP
; AircraftClass              0x0065D818
setcglob 0x0065D820,AircraftClass.Count       
setcglob 0x0065D84C,AircraftClass.Array       
setcglob 0x15F     ,AircraftClass.ORIGINAL_SIZE        
setcglob 0x160     ,AircraftClass.NEW_SIZE        
; Count controlled by [Maximums]

; AnimClass                  0x0065D864
setcglob 0x0065D86C,AnimClass.Count           
setcglob 0x0065D898,AnimClass.Array           
setcglob 0x4C      ,AnimClass.ORIGINAL_SIZE   
setcglob 0x4C      ,AnimClass.NEW_SIZE ;not adjustable yet
; Count controlled by [Maximums]

; BuildingClass              0x0065D8B0
setcglob 0x0065D8B8,BuildingClass.Count       
setcglob 0x0065D8E4,BuildingClass.Array       
setcglob 0xFB      ,BuildingClass.ORIGINAL_SIZE
setcglob 0x100     ,BuildingClass.NEW_SIZE        
; Count controlled by [Maximums]

; BulletClass                0x0065D8FC
setcglob 0x0065D904,BulletClass.Count         
setcglob 0x0065D930,BulletClass.Array         
setcglob 0x4B      ,BulletClass.ORIGINAL_SIZE 
; Count controlled by [Maximums]

; FactoryClass               0x0065D948
setcglob 0x0065D950,FactoryClass.Count        
setcglob 0x0065D97C,FactoryClass.Array        
setcglob 0x2E      ,FactoryClass.ORIGINAL_SIZE
; Count controlled by [Maximums]

; HouseClass                 0x0065D994
setcglob 0x0065D99C,HouseClass.Count          
setcglob 0x0065D9C8,HouseClass.Array          
setcglob 0x17A8    ,HouseClass.ORIGINAL_SIZE  
setcglob 0x4110    ,HouseClass.NEW_SIZE       
; Count controlled by [Maximums]

; InfantryClass              0x0065D9E0
setcglob 0x0065D9E8,InfantryClass.Count       
setcglob 0x0065DA14,InfantryClass.Array       
setcglob 0x154     ,InfantryClass.ORIGINAL_SIZE        
setcglob 0x156     ,InfantryClass.NEW_SIZE        
; Count controlled by [Maximums]

; OverlayClass               0x0065DA2C
setcglob 0x0065DA34,OverlayClass.Count        
setcglob 0x0065DA60,OverlayClass.Array        
setcglob 0x2B      ,OverlayClass.ORIGINAL_SIZE
; Count controlled by [Maximums]

; SmudgeClass                0x0065DA78
setcglob 0x0065DA80,SmudgeClass.Count         
setcglob 0x0065DAAC,SmudgeClass.Array         
setcglob 0x2B      ,SmudgeClass.ORIGINAL_SIZE 
; Count controlled by [Maximums]

; TeamClass                  0x0065DAC4
setcglob 0x0065DACC,TeamClass.Count           
setcglob 0x0065DAF8,TeamClass.Array           
setcglob 0x5D      ,TeamClass.ORIGINAL_SIZE   
; Count controlled by [Maximums]

; TeamTypeClass              0x0065DB10
setcglob 0x0065DB18,TeamTypeClass.Count       
setcglob 0x0065DB44,TeamTypeClass.Array       
setcglob 0xD1      ,TeamTypeClass.ORIGINAL_SIZE        
; Count controlled by [Maximums]

; TemplateClass              0x0065DB5C
setcglob 0x0065DB64,TemplateClass.Count       
setcglob 0x0065DB90,TemplateClass.Array       
setcglob 0x2B      ,TemplateClass.ORIGINAL_SIZE        
; Count controlled by [Maximums]

; TerrainClass               0x0065DBA8
setcglob 0x0065DBB0,TerrainClass.Count        
setcglob 0x0065DBDC,TerrainClass.Array        
setcglob 0x40      ,TerrainClass.ORIGINAL_SIZE
; Count controlled by [Maximums]

; TriggerClass               0x0065DBF4
setcglob 0x0065DBFC,TriggerClass.Count        
setcglob 0x0065DC28,TriggerClass.Array        
setcglob 0x2D      ,TriggerClass.ORIGINAL_SIZE
; Count controlled by [Maximums]

; UnitClass                  0x0065DC40
setcglob 0x0065DC48,UnitClass.Count           
setcglob 0x0065DC74,UnitClass.Array           
setcglob 0x17A     ,UnitClass.ORIGINAL_SIZE   
setcglob 0x180     ,UnitClass.NEW_SIZE   
; Count controlled by [Maximums]

; VesselClass                0x0065DC8C
setcglob 0x0065DC94,VesselClass.Count         
setcglob 0x0065DCC0,VesselClass.Array         
setcglob 0x178     ,VesselClass.ORIGINAL_SIZE 
setcglob 0x180     ,VesselClass.NEW_SIZE 
; Count controlled by [Maximums]

; TriggerTypeClass           0x0065DCD8
setcglob 0x0065DCE0,TriggerTypeClass.Count    
setcglob 0x0065DD0C,TriggerTypeClass.Array    
setcglob 0x59      ,TriggerTypeClass.ORIGINAL_SIZE     
; Count controlled by [Maximums]

; HouseTypeClass             0x0065DD24
setcglob 0x0065DD30,HouseTypeClass.Count      
setcglob 0x0065DD58,HouseTypeClass.Array      
setcglob 0x14      ,HouseTypeClass.ORIGINAL_COUNT      
setcglob 0x20      ,HouseTypeClass.NEW_COUNT  
setcglob 0x21      ,HouseTypeClass.NEW_COUNT_PLUS_ONE    ; for that one SETD function
setcglob 0x13A     ,HouseTypeClass.ORIGINAL_SIZE       
setcglob 0x14A     ,HouseTypeClass.NEW_SIZE   

; BuildingTypeClass          0x0065DD70
setcglob 0x0065DD7C,BuildingTypeClass.Count   
setcglob 0x0065DDA4,BuildingTypeClass.Array   
setcglob 0x57,      BuildingTypeClass.ORIGINAL_COUNT   
setcglob 0x207,     BuildingTypeClass.ORIGINAL_SIZE    
setcglob 0xC53,     BuildingTypeClass.NEW_SIZE

; AircraftTypeClass          0x0065DDBC
setcglob 0x0065DDC8,AircraftTypeClass.Count   
setcglob 0x0065DDF0,AircraftTypeClass.Array   
setcglob 0x7       ,AircraftTypeClass.ORIGINAL_COUNT   
setcglob 0x19D     ,AircraftTypeClass.ORIGINAL_SIZE    
setcglob 0x28A     ,AircraftTypeClass.NEW_SIZE

; InfantryTypeClass          0x0065DE08
setcglob 0x0065DE14,InfantryTypeClass.Count   
setcglob 0x0065DE3C,InfantryTypeClass.Array   
setcglob 0x1A      ,InfantryTypeClass.ORIGINAL_COUNT   
setcglob 0x1A2     ,InfantryTypeClass.ORIGINAL_SIZE    
setcglob 0x3D9     ,InfantryTypeClass.NEW_SIZE

; BulletTypeClass            0x0065DE54
setcglob 0x0065DE60,BulletTypeClass.Count     
setcglob 0x0065DE88,BulletTypeClass.Array     
setcglob 0x12      ,BulletTypeClass.ORIGINAL_COUNT     
setcglob 0x146     ,BulletTypeClass.ORIGINAL_SIZE      
setcglob 0x147     ,BulletTypeClass.NEW_SIZE

; AnimTypeClass              0x0065DEA0
setcglob 0x0065DEAC,AnimTypeClass.Count       
setcglob 0x0065DED4,AnimTypeClass.Array       
setcglob 0x50      ,AnimTypeClass.ORIGINAL_COUNT       
setcglob 0x162     ,AnimTypeClass.ORIGINAL_SIZE        
setcglob 0x180     ,AnimTypeClass.NEW_SIZE    
													   
; UnitTypeClass              0x0065DEEC  
setcglob 0x0065DEF8,UnitTypeClass.Count       
setcglob 0x0065DF20,UnitTypeClass.Array       
setcglob 0x16      ,UnitTypeClass.ORIGINAL_COUNT       
setcglob 0x19E     ,UnitTypeClass.ORIGINAL_SIZE        
setcglob 0x31A     ,UnitTypeClass.NEW_SIZE    
													   
; VesselTypeClass            0x0065DF38  
setcglob 0x0065DF44,VesselTypeClass.Count     
setcglob 0x0065DF6C,VesselTypeClass.Array     
setcglob 0x7       ,VesselTypeClass.ORIGINAL_COUNT     
setcglob 0x19E     ,VesselTypeClass.ORIGINAL_SIZE      
setcglob 0x30F     ,VesselTypeClass.NEW_SIZE  

; TemplateTypeClass

; TerrainTypeClass

; OverlayTypeClass

; SmudgeTypeClass


; SoundEffects
setcglob 0xA5      ,SoundEffects.ORIGINAL_COUNT        

; WarheadTypeClass in WARHEAD.CPP
setcglob 0x0069160C,WarheadTypeClass.Count    
setcglob 0x00691634,WarheadTypeClass.Array    
setcglob 0x22      ,WarheadTypeClass.ORIGINAL_SIZE     
setcglob 0x28      ,WarheadTypeClass.NEW_SIZE

; WeaponTypeClass in WEAPOM.CPP
setcglob 0x00691680,WeaponTypeClass.Array     
setcglob 0x00691658,WeaponTypeClass.Count
setcglob 0x26      ,WeaponTypeClass.ORIGINAL_SIZE     
setcglob 0x2A      ,WeaponTypeClass.NEW_SIZE


