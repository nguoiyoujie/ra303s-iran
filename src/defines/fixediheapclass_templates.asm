;----------------------------------------------------------------
; src/defines/fixediheapclass_templates.asm
;
; Constants to access AnimTypeClass offsets
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

; Note: %assign doesn't work with certain hexadecimal prefixes (the letter ones). Better to use 0x00 format throughout 

; GLOBALS.CPP
; AircraftClass                            0x0065D818
%assign AircraftClass.Count                0x0065D824
%assign AircraftClass.Array                0x0065D84C
%assign AircraftClass.ORIGINAL_SIZE        0x15F
; Count controlled by [Maximums]

; AnimClass                                0x0065D864
%assign AnimClass.Count                    0x0065D870
%assign AnimClass.Array                    0x0065D898
%assign AnimClass.ORIGINAL_SIZE            0x4C
; Count controlled by [Maximums]

; BuildingClass                            0x0065D8B0
%assign BuildingClass.Count                0x0065D8BC
%assign BuildingClass.Array                0x0065D8E4
%assign BuildingClass.ORIGINAL_SIZE        0xFB
; Count controlled by [Maximums]

; BulletClass                              0x0065D8FC
%assign BulletClass.Count                  0x0065D908
%assign BulletClass.Array                  0x0065D930
%assign BulletClass.ORIGINAL_SIZE          0x4B
; Count controlled by [Maximums]

; FactoryClass                             0x0065D948
%assign FactoryClass.Count                 0x0065D954
%assign FactoryClass.Array                 0x0065DA7C
%assign FactoryClass.ORIGINAL_SIZE         0x2E
; Count controlled by [Maximums]

; HouseClass                               0x0065D994
%assign HouseClass.Count                   0x0065D9A0
%assign HouseClass.Array                   0x0065D9C8
%assign HouseClass.ORIGINAL_SIZE           0x17A8
%assign HouseClass.NEW_SIZE                0x2C11
; Count controlled by [Maximums]

; InfantryClass                            0x0065D9E0
%assign InfantryClass.Count                0x0065D9EC
%assign InfantryClass.Array                0x0065DA14
%assign InfantryClass.ORIGINAL_SIZE        0x154
; Count controlled by [Maximums]

; OverlayClass                             0x0065DA2C
%assign OverlayClass.Count                 0x0065DA38
%assign OverlayClass.Array                 0x0065DA60
%assign OverlayClass.ORIGINAL_SIZE         0x2B
; Count controlled by [Maximums]

; SmudgeClass                              0x0065DA78
%assign SmudgeClass.Count                  0x0065DA84
%assign SmudgeClass.Array                  0x0065DAAC
%assign SmudgeClass.ORIGINAL_SIZE          0x2B
; Count controlled by [Maximums]

; TeamClass                                0x0065DAC4
%assign TeamClass.Count                    0x0065DAD0
%assign TeamClass.Array                    0x0065DAF8
%assign TeamClass.ORIGINAL_SIZE            0x5D
; Count controlled by [Maximums]

; TeamTypeClass                            0x0065DB10
%assign TeamTypeClass.Count                0x0065DB1C
%assign TeamTypeClass.Array                0x0065DB44
%assign TeamTypeClass.ORIGINAL_SIZE        0xD1
; Count controlled by [Maximums]

; TemplateClass                            0x0065DB5C
%assign TemplateClass.Count                0x0065DB68
%assign TemplateClass.Array                0x0065DB90
%assign TemplateClass.ORIGINAL_SIZE        0x2B
; Count controlled by [Maximums]

; TerrainClass                             0x0065DBA8
%assign TerrainClass.Count                 0x0065DBB4
%assign TerrainClass.Array                 0x0065DBDC
%assign TerrainClass.ORIGINAL_SIZE         0x40
; Count controlled by [Maximums]

; TriggerClass                             0x0065DBF4
%assign TriggerClass.Count                 0x0065DC00
%assign TriggerClass.Array                 0x0065DC28
%assign TriggerClass.ORIGINAL_SIZE         0x2D
; Count controlled by [Maximums]

; UnitClass                                0x0065DC40
%assign UnitClass.Count                    0x0065DC4C
%assign UnitClass.Array                    0x0065DC74
%assign UnitClass.ORIGINAL_SIZE            0x17A
; Count controlled by [Maximums]

; VesselClass                              0x0065DC8C
%assign VesselClass.Count                  0x0065DC98
%assign VesselClass.Array                  0x0065DCC0
%assign VesselClass.ORIGINAL_SIZE          0x178
; Count controlled by [Maximums]

; TriggerTypeClass                         0x0065DCD8
%assign TriggerTypeClass.Count             0x0065DCE4
%assign TriggerTypeClass.Array             0x0065DD0C
%assign TriggerTypeClass.ORIGINAL_SIZE     0x59
; Count controlled by [Maximums]

; HouseTypeClass                           0x0065DD24
%assign HouseTypeClass.Count               0x0065DD30
%assign HouseTypeClass.Array               0x0065DD58
%assign HouseTypeClass.ORIGINAL_COUNT      0x14
%assign HouseTypeClass.NEW_COUNT           0x20
%assign HouseTypeClass.NEW_COUNT_PLUS_ONE  0x21 ; for that one SETD function
%assign HouseTypeClass.ORIGINAL_SIZE       0x13A
%assign HouseTypeClass.NEW_SIZE            0x14A

; BuildingTypeClass                        0x0065DD70
%assign BuildingTypeClass.Count            0x0065DD7C
%assign BuildingTypeClass.Array            0x0065DDA4
%assign BuildingTypeClass.ORIGINAL_COUNT   0x57
%assign BuildingTypeClass.ORIGINAL_SIZE    0x207
%assign BuildingTypeClass.NEW_SIZE         0x2CC

; AircraftTypeClass                        0x0065DDBC
%assign AircraftTypeClass.Count            0x0065DDC8
%assign AircraftTypeClass.Array            0x0065DDF0
%assign AircraftTypeClass.ORIGINAL_COUNT   0x7
%assign AircraftTypeClass.ORIGINAL_SIZE    0x19D
%assign AircraftTypeClass.NEW_SIZE         0x289

; InfantryTypeClass                        0x0065DE08
%assign InfantryTypeClass.Count            0x0065DE14
%assign InfantryTypeClass.Array            0x0065DE3C
%assign InfantryTypeClass.ORIGINAL_COUNT   0x1A
%assign InfantryTypeClass.ORIGINAL_SIZE    0x1A2
%assign InfantryTypeClass.NEW_SIZE         0x3B0

; BulletTypeClass                          0x0065DE54
%assign BulletTypeClass.Count              0x0065DE60
%assign BulletTypeClass.Array              0x0065DE88
%assign BulletTypeClass.ORIGINAL_COUNT     0x12
%assign BulletTypeClass.ORIGINAL_SIZE      0x146
%assign BulletTypeClass.NEW_SIZE           0x146 ; size change not yet implemented

; AnimTypeClass                            0x0065DEA0
%assign AnimTypeClass.Count                0x0065DEAC
%assign AnimTypeClass.Array                0x0065DED4
%assign AnimTypesHeap.ORIGINAL_COUNT       0x50
%assign AnimTypeClass.ORIGINAL_SIZE        0x162
%assign AnimTypeClass.NEW_SIZE             0x180

; UnitTypeClass                            0x0065DEEC
%assign UnitTypeClass.Count                0x0065DEF8
%assign UnitTypeClass.Array                0x0065DF20
%assign UnitTypeClass.ORIGINAL_COUNT       0x16
%assign UnitTypeClass.ORIGINAL_SIZE        0x19E
%assign UnitTypeClass.NEW_SIZE             0x316

; VesselTypeClass                          0x0065DF38
%assign VesselTypeClass.Count              0x0065DF44
%assign VesselTypeClass.Array              0x0065DF6C
%assign VesselTypeClass.ORIGINAL_COUNT     0x7
%assign VesselTypeClass.ORIGINAL_SIZE      0x19E
%assign VesselTypeClass.NEW_SIZE           0x30E

; TemplateTypeClass

; TerrainTypeClass

; OverlayTypeClass

; SmudgeTypeClass


; SoundEffects
%assign SoundEffects.ORIGINAL_COUNT        165

; WarheadTypeClass in WARHEAD.CPP
%assign WarheadTypeClass.Count             0x0069160C
%assign WarheadTypeClass.Array             0x00691634
%assign WarheadTypeClass.ORIGINAL_SIZE     0x22
%assign WarheadTypeClass.NEW_SIZE          0x22 ; size change not implemented

; WeaponTypeClass in WEAPOM.CPP
%assign WeaponTypeClass.Array              0x00691680
%assign WeaponTypeClass.Count              0x00691658