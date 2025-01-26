;----------------------------------------------------------------
; src/defines/rttitypes.asm
;
; RTTIType Definitions
;   RTTIType represents the general Run-time type information (RTTI) of an object.
;   Describes the behavior of an ObjectType or ObjectClass
;
;----------------------------------------------------------------

; RTTITypes
%assign RTTIType.None                        0
%assign RTTIType.Aircraft                    1
%assign RTTIType.AircraftType                2
%assign RTTIType.Anim                        3
%assign RTTIType.AnimType                    4
%assign RTTIType.Building                    5
%assign RTTIType.BuildingType                6
%assign RTTIType.Bullet                      7
%assign RTTIType.BulletType                  8
%assign RTTIType.Cell                        9
%assign RTTIType.Factory                     10
%assign RTTIType.House                       11
%assign RTTIType.HouseType                   12
%assign RTTIType.Infantry                    13
%assign RTTIType.InfantryType                14
%assign RTTIType.Overlay                     15
%assign RTTIType.OverlayType                 16
%assign RTTIType.Smudge                      17
%assign RTTIType.SmudgeType                  18
%assign RTTIType.Special                     19
%assign RTTIType.Team                        20
%assign RTTIType.TeamType                    21
%assign RTTIType.Template                    22
%assign RTTIType.TemplateType                23
%assign RTTIType.Terrain                     24
%assign RTTIType.TerrainType                 25
%assign RTTIType.Trigger                     26
%assign RTTIType.TriggerType                 27
%assign RTTIType.Unit                        28
%assign RTTIType.UnitType                    29
%assign RTTIType.Vessel                      30
%assign RTTIType.VesselType                  31

; FactoryType_Enums
str.RTTIType.None                            db"None",0
str.RTTIType.Aircraft                        db"Aircraft",0
str.RTTIType.AircraftType                    db"AircraftType",0
str.RTTIType.Anim                            db"Anim",0
str.RTTIType.AnimType                        db"AnimType",0
str.RTTIType.Building                        db"Building",0
str.RTTIType.BuildingType                    db"BuildingType",0
str.RTTIType.Bullet                          db"Bullet",0
str.RTTIType.BulletType                      db"BulletType",0
str.RTTIType.Cell                            db"Cell",0
str.RTTIType.Factory                         db"Factory",0
str.RTTIType.House                           db"House",0
str.RTTIType.HouseType                       db"HouseType",0
str.RTTIType.Infantry                        db"Infantry",0
str.RTTIType.InfantryType                    db"InfantryType",0
str.RTTIType.Overlay                         db"Overlay",0
str.RTTIType.OverlayType                     db"OverlayType",0
str.RTTIType.Smudge                          db"Smudge",0
str.RTTIType.SmudgeType                      db"SmudgeType",0
str.RTTIType.Special                         db"Special",0
str.RTTIType.Team                            db"Team",0
str.RTTIType.TeamType                        db"TeamType",0
str.RTTIType.Template                        db"Template",0
str.RTTIType.TemplateType                    db"TemplateType",0
str.RTTIType.Terrain                         db"Terrain",0
str.RTTIType.TerrainType                     db"TerrainType",0
str.RTTIType.Trigger                         db"Trigger",0
str.RTTIType.TriggerType                     db"TriggerType",0
str.RTTIType.Unit                            db"Unit",0
str.RTTIType.UnitType                        db"UnitType",0
str.RTTIType.Vessel                          db"Vessel",0
str.RTTIType.VesselType                      db"VesselType",0

