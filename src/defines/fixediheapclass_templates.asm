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
; AircraftClass                            0x0065D818
%define AircraftClass.Count                0x0065D824
%define AircraftClass.Array                0x0065D84C
%define AircraftClass.ORIGINAL_SIZE        15Fh
; Count controlled by [Maximums]

; AnimClass                                0x0065D864
%define AnimClass.Count                    0x0065D870
%define AnimClass.Array                    0x0065D898
%define AnimClass.ORIGINAL_SIZE            4Ch
; Count controlled by [Maximums]

; BuildingClass                            0x0065D8B0
%define BuildingClass.Count                0x0065D8BC
%define BuildingClass.Array                0x0065D8E4
%define BuildingClass.ORIGINAL_SIZE        FBh
; Count controlled by [Maximums]

; BulletClass                              0x0065D8FC
%define BulletClass.Count                  0x0065D908
%define BulletClass.Array                  0x0065D930
%define BulletClass.ORIGINAL_SIZE          4Bh
; Count controlled by [Maximums]

; FactoryClass                             0x0065D948
%define FactoryClass.Count                 0x0065D954
%define FactoryClass.Array                 0x0065DA7C
%define FactoryClass.ORIGINAL_SIZE         2Eh
; Count controlled by [Maximums]

; HouseClass                               0x0065D994
%define HouseClass.Count                   0x0065D9A0
%define HouseClass.Array                   0x0065DAC8
%define HouseClass.ORIGINAL_SIZE           17A8h
%define HouseClass.NEW_SIZE                2C10h
; Count controlled by [Maximums]

; InfantryClass                            0x0065D9E0
%define InfantryClass.Count                0x0065D9EC
%define InfantryClass.Array                0x0065DA14
%define InfantryClass.ORIGINAL_SIZE        154h
; Count controlled by [Maximums]

; OverlayClass                             0x0065DA2C
%define OverlayClass.Count                 0x0065DA38
%define OverlayClass.Array                 0x0065DA60
%define OverlayClass.ORIGINAL_SIZE         2Bh
; Count controlled by [Maximums]

; SmudgeClass                              0x0065DA78
%define SmudgeClass.Count                  0x0065DA84
%define SmudgeClass.Array                  0x0065DAAC
%define SmudgeClass.ORIGINAL_SIZE          2Bh
; Count controlled by [Maximums]

; TeamClass                                0x0065DAC4
%define TeamClass.Count                    0x0065DAD0
%define TeamClass.Array                    0x0065DAF8
%define TeamClass.ORIGINAL_SIZE            5Dh
; Count controlled by [Maximums]

; TeamTypeClass                            0x0065DB10
%define TeamTypeClass.Count                0x0065DB1C
%define TeamTypeClass.Array                0x0065DB44
%define TeamTypeClass.ORIGINAL_SIZE        D1h
; Count controlled by [Maximums]

; TemplateClass                            0x0065DB5C
%define TemplateClass.Count                0x0065DB68
%define TemplateClass.Array                0x0065DB90
%define TemplateClass.ORIGINAL_SIZE        2Bh
; Count controlled by [Maximums]

; TerrainClass                             0x0065DBA8
%define TerrainClass.Count                 0x0065DBB4
%define TerrainClass.Array                 0x0065DBDC
%define TerrainClass.ORIGINAL_SIZE         40h
; Count controlled by [Maximums]

; TriggerClass                             0x0065DBF4
%define TriggerClass.Count                 0x0065DC00
%define TriggerClass.Array                 0x0065DC28
%define TriggerClass.ORIGINAL_SIZE         2Dh
; Count controlled by [Maximums]

; UnitClass                                0x0065DC40
%define UnitClass.Count                    0x0065DC4C
%define UnitClass.Array                    0x0065DC74
%define UnitClass.ORIGINAL_SIZE            17Ah
; Count controlled by [Maximums]

; VesselClass                              0x0065DC8C
%define VesselClass.Count                  0x0065DC98
%define VesselClass.Array                  0x0065DCC0
%define VesselClass.ORIGINAL_SIZE          178h
; Count controlled by [Maximums]

; TriggerTypeClass                         0x0065DCD8
%define TriggerTypeClass.Count             0x0065DCE4
%define TriggerTypeClass.Array             0x0065DD0C
%define TriggerTypeClass.ORIGINAL_SIZE     59h
; Count controlled by [Maximums]

; HouseTypeClass                           0x0065DD24
%define HouseTypeClass.Count               0x0065DD30
%define HouseTypeClass.Array               0x0065DD58
%define HouseTypeClass.ORIGINAL_COUNT      14h
%define HouseTypeClass.NEW_COUNT           20h

; BuildingTypeClass                        0x0065DD70
%define BuildingTypeClass.Count            0x0065DD7C
%define BuildingTypeClass.Array            0x0065DDA4
%define BuildingTypeClass.ORIGINAL_COUNT   57h
%define BuildingTypeClass.ORIGINAL_SIZE    207h
%define BuildingTypeClass.NEW_SIZE         2C7h

; AircraftTypeClass                        0x0065DDBC
%define AircraftTypeClass.Count            0x0065DDC8
%define AircraftTypeClass.Array            0x0065DDF0
%define AircraftTypeClass.ORIGINAL_COUNT   7h
%define AircraftTypeClass.ORIGINAL_SIZE    19Dh
%define AircraftTypeClass.NEW_SIZE         289h

; InfantryTypeClass                        0x0065DE08
%define InfantryTypeClass.Count            0x0065DE14
%define InfantryTypeClass.Array            0x0065DE3C
%define InfantryTypeClass.ORIGINAL_COUNT   1Ah
%define InfantryTypeClass.ORIGINAL_SIZE    1A2h
%define InfantryTypeClass.NEW_SIZE         3B0h

; BulletTypeClass                          0x0065DE54
%define BulletTypeClass.Count              0x0065DE60
%define BulletTypeClass.Array              0x0065DE88
%define BulletTypeClass.ORIGINAL_COUNT     12h
%define BulletTypeClass.ORIGINAL_SIZE      146h
%define BulletTypeClass.NEW_SIZE           146h ; size change not yet implemented

; AnimTypeClass                            0x0065DEA0
%define AnimTypeClass.Count                0x0065DEAC
%define AnimTypeClass.Array                0x0065DED4
%define AnimTypesHeap.ORIGINAL_COUNT       50h
%define AnimTypeClass.ORIGINAL_SIZE        162h
%define AnimTypeClass.NEW_SIZE             180h

; UnitTypeClass                            0x0065DEEC
%define UnitTypeClass.Count                0x0065DEF8
%define UnitTypeClass.Array                0x0065DF20
%define UnitTypeClass.ORIGINAL_COUNT       16h
%define UnitTypeClass.ORIGINAL_SIZE        19Eh
%define UnitTypeClass.NEW_SIZE             316h

; VesselTypeClass                          0x0065DF38
%define VesselTypeClass.Count              0x0065DF44
%define VesselTypeClass.Array              0x0065DF6C
%define VesselTypeClass.ORIGINAL_COUNT     7h
%define VesselTypeClass.ORIGINAL_SIZE      19Eh
%define VesselTypeClass.NEW_SIZE           30Eh

; TemplateTypeClass

; TerrainTypeClass

; OverlayTypeClass

; SmudgeTypeClass


; SoundEffects
%define SoundEffects.ORIGINAL_COUNT        165

; WarheadTypeClass in WARHEAD.CPP
%define WarheadTypeClass.Count             0x0069160C
%define WarheadTypeClass.Array             0x00691634
%define WarheadTypeClass.ORIGINAL_SIZE     22h
%define WarheadTypeClass.NEW_SIZE          22h ; size change not implemented

; WeaponTypeClass in WEAPOM.CPP
%define WeaponTypeClass.Array              0x00691680
%define WeaponTypeClass.Count              0x00691658