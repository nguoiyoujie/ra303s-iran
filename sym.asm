;----------------------------------------------------------------
; sym.inc
;
; Game symbols for reference 
;
;----------------------------------------------------------------
%include "macros/setsym.inc"

setcglob 0x005D6148, start

setcglob 0x005E66A8, _imp__timeGetTime
setcglob 0x005E667C, _imp__Sleep

; AUDIO.CPP
setcglob 0x00425CA0, Audio___Voc_From_Name ; VocType Voc_From_Name(char const * name)
setcglob 0x00425D1C, Audio___Sound_Effect_At_Coord ; void Sound_Effect(VocType voc, COORDINATE coord, int variation, HousesType house)
setcglob 0x00425F24, Audio___Sound_Effect ; int Sound_Effect(VocType voc, fixed volume, int variation, signed short pan_value, HousesType house)
setcglob 0x005FE090, Audio___SoundEffectName ; SoundEffectName[VOC_COUNT]

; CCFile.CPP
; !!! FileClass is a base type, check what derived type these addresses really point to
setcglob 0x004627D4, CCFileClass__CCFileClass ; CCFileClass::CCFileClass(char const * filename)
setcglob 0x00462860, CCFileClass__Write ; long CCFileClass::Write(void const * buffer, long size)
setcglob 0x00462AA8, CCFileClass__Close ; void CCFileClass::Close(void)
setcglob 0x00462AD4, CCFileClass__Open ; int CCFileClass::Open(int rights)
setcglob 0x00462A30, CCFileClass__Is_Available ; int CCFileClass::Is_Available(int )
;setcglob 0x00462DD4, CCFile_Find_File

; CCINI.CPP
setcglob 0x004C7C60, CCINIClass__CCINIClass 
setcglob 0x00462F50, CCINIClass__Load ; bool CCINIClass::Load(FileClass & file, bool withdigest)
setcglob 0x004637A8, CCINIClass__Put_HousesType ; bool CCINIClass::Put_HousesType(char const * section, char const * entry, HousesType value)
setcglob 0x00463830, CCINIClass__Put_VQType ; int CCINIClass::Put_VQType(char *, char *, VQType)
setcglob 0x00463948, CCINIClass__Put_ThemeType ; int CCINIClass::Put_ThemeType(char *, char *, ThemeType)


; BASE.INI
setcglob 0x00426944, BaseClass__Write_INI ; void BaseClass::Write_INI(CCINIClass & ini)

; BUILDING.CPP
setcglob 0x0045EB04, BuildingClass__Exit_Coord ; COORDINATE BuildingClass::Exit_Coord(void) const
setcglob 0x0045F07C, BuildingClass__Write_INI ; void BuildingClass::Write_INI(CCINIClass & ini)
setcglob 0x0045A794, BuildingClass__Begin_Mode ; void BuildingClass::Begin_Mode(BStateType bstate)

; CARGO.CPP
setcglob 0x0046247C, CargoClass__Attached_Object ; FootClass * CargoClass::Attached_Object(void) const

; CELL.CPP
;setcglob 0x0049FDE0, CellClass__Cell_Coord ; COORDINATE CellClass::Cell_Coord(void) const
;setcglob 0x004A01EC, CellClass__Adjacent_Cell ; CellClass const * CellClass::Adjacent_Cell(FacingType face) const
;setcglob 0x004A1BE8, CellClass__Is_Bridge_Here ; bool CellClass::Is_Bridge_Here(void)

; COORD.CPP
;setcglob 0x004AC3C0, Coord___Coord_Cell ; CELL Coord_Cell(COORDINATE coord)
;setcglob ??????????, Coord___Distance_As_Target ; int Distance(TARGET target1, TARGET target2)
;setcglob 0x004AC41C, Coord___Distance_As_Coord ; int Distance(COORDINATE coord1, COORDINATE coord2)

; CONQUER.CPP
setcglob 0x004A765C, Conquer___Call_Back ; void Call_Back(void)
;setcglob 0x004A96E8, Conquer___CC_Draw_Shape ; void CC_Draw_Shape(const ObjectClass *object, const char *shape_file_name, void const * shapefile, int shapenum, int x, int y, WindowNumberType window, ShapeFlags_Type flags, void const * fadingdata, void const * ghostdata, DirType rotation, long virtualscale, char override_owner)




setcglob 0x005789AC,UnitTypeClass__One_Time    



setcglob 0x004AE7FC,Fancy_Text_Print 
