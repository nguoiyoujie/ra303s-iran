;----------------------------------------------------------------
; src/defines/fixediheapclass_templates.asm
;
; Macros to access AnimTypeClass offsets
;
;----------------------------------------------------------------

; FixedHeapClass
;   size 0x??
;     unsigned IsAllocated:1  offset 0
;     int Size offset 4
;     int TotalCount offset 8
;     int ActiveCount offset 12
;     void* array Buffer offset 16
;     ? FreeFlag offset 20

; FixedIHeapClass
;   size 0x4C
;     FixedHeapClass 
;     + DynamicVectorClass<void *> ActivePointers (
;        void * * Vector 
;        unsigned VectorMax
;        unsigned IsAllocated:1
;        int ActiveCount 
;        int GrowthStep 

; GLOBALS.CPP
; AircraftClass

; AnimClass

; BuildingClass

; BulletClass

; FactoryClass

; HouseClass
%define HouseClass.ORIGINAL_SIZE           0x17A8
%define HouseClass.NEW_SIZE                0x27A8

; InfantryClass

; OverlayClass

; SmudgeClass

; TeamClass

; TeamTypeClass                            0x0065DBA8
%define TeamTypeClass.Count                0x0065DBB4
%define TeamTypeClass.Array                0x0065DBDC

; TemplateClass                            0x0065DBF4
%define TemplateClass.Count                0x0065DC00
%define TemplateClass.Array                0x0065DC28

; TerrainClass                             0x0065DC40
%define TerrainClass.Count                 0x0065DC4C
%define TerrainClass.Array                 0x0065DC74

; TriggerClass                             0x0065DC8C
%define TriggerClass.Count                 0x0065DC98
%define TriggerClass.Array                 0x0065DCC0

; TriggerTypeClass                         0x0065DCD8
%define TriggerTypeClass.Count             0x0065DCE4
%define TriggerTypeClass.Array             0x0065DD0C

; HouseTypeClass                           0x0065DD24
%define HouseTypeClass.Count               0x0065DD30
%define HouseTypeClass.Array               0x0065DD58

; BuildingTypeClass                        0x0065DD70
%define BuildingTypeClass.Count            0x0065DD7C
%define BuildingTypeClass.Array            0x0065DDA4
%define BuildingTypeClass.ORIGINAL_MAX     57h
%define BuildingTypeClass.ORIGINAL_SIZE    207h
%define BuildingTypeClass.NEW_SIZE         307h

; AircraftTypeClass                        0x0065DDBC
%define AircraftTypeClass.Count            0x0065DDC8
%define AircraftTypeClass.Array            0x0065DDF0
%define AircraftTypeClass.ORIGINAL_MAX     7h
%define AircraftTypeClass.ORIGINAL_SIZE    19Dh
%define AircraftTypeClass.NEW_SIZE         240h

; InfantryTypeClass                        0x0065DE08
%define InfantryTypeClass.Count            0x0065DE14
%define InfantryTypeClass.Array            0x0065DE3C
%define InfantryTypeClass.ORIGINAL_MAX     1Ah
%define InfantryTypeClass.ORIGINAL_SIZE    1A2h
%define InfantryTypeClass.NEW_SIZE         240h

; BulletTypeClass                          0x0065DE54
%define BulletTypeClass.Count              0x0065DE60
%define BulletTypeClass.Array              0x0065DE88
%define BulletTypeClass.ORIGINAL_MAX       12h
%define BulletTypeClass.ORIGINAL_SIZE      146h
%define BulletTypeClass.NEW_SIZE           146h ; size change not implemented

; AnimTypeClass                            0x0065DEA0
%define AnimTypeClass.Count                0x0065DEAC
%define AnimTypeClass.Array                0x0065DED4
%define AnimTypesHeap.ORIGINAL_MAX         50h
%define AnimTypeClass.ORIGINAL_SIZE        162h
%define AnimTypeClass.NEW_SIZE             180h

; UnitTypeClass                            0x0065DEEC
%define UnitTypeClass.Count                0x0065DEF8
%define UnitTypeClass.Array                0x0065DF20
%define UnitTypeClass.ORIGINAL_MAX         16h
%define UnitTypeClass.ORIGINAL_SIZE        19Eh
%define UnitTypeClass.NEW_SIZE             240h

; VesselTypeClass                          0x0065DF38
%define VesselTypeClass.Count              0x0065DF44
%define VesselTypeClass.Array              0x0065DF6C
%define VesselTypeClass.ORIGINAL_MAX       7h
%define VesselTypeClass.ORIGINAL_SIZE      19Eh
%define VesselTypeClass.NEW_SIZE           240h

; TemplateTypeClass

; TerrainTypeClass

; OverlayTypeClass

; SmudgeTypeClass





; WarheadTypeClass in WARHEAD.CPP
%define WarheadTypeClass.Count             0x0069160C
%define WarheadTypeClass.Array             0x00691634
%define WarheadTypeClass.ORIGINAL_SIZE     22h
%define WarheadTypeClass.NEW_SIZE          22h ; size change not implemented

; WeaponTypeClass in WEAPOM.CPP
%define WeaponTypeClass.Array              0x00691680
%define WeaponTypeClass.Count              0x00691658