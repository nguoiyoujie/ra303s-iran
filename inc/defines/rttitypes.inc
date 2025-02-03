;----------------------------------------------------------------
; inc/defines/rttitypes.inc
;
; RTTIType Definitions
;   RTTIType represents the general Run-time type information (RTTI) of an object.
;   Describes the behavior of an ObjectType or ObjectClass
;
;----------------------------------------------------------------

%ifndef DEFINE_RTTITYPES
%define DEFINE_RTTITYPES 

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

cextern str.RTTIType.None        
cextern str.RTTIType.Aircraft    
cextern str.RTTIType.AircraftType
cextern str.RTTIType.Anim        
cextern str.RTTIType.AnimType    
cextern str.RTTIType.Building    
cextern str.RTTIType.BuildingType
cextern str.RTTIType.Bullet      
cextern str.RTTIType.BulletType  
cextern str.RTTIType.Cell        
cextern str.RTTIType.Factory     
cextern str.RTTIType.House       
cextern str.RTTIType.HouseType   
cextern str.RTTIType.Infantry    
cextern str.RTTIType.InfantryType
cextern str.RTTIType.Overlay     
cextern str.RTTIType.OverlayType 
cextern str.RTTIType.Smudge      
cextern str.RTTIType.SmudgeType  
cextern str.RTTIType.Special     
cextern str.RTTIType.Team        
cextern str.RTTIType.TeamType    
cextern str.RTTIType.Template    
cextern str.RTTIType.TemplateType
cextern str.RTTIType.Terrain     
cextern str.RTTIType.TerrainType 
cextern str.RTTIType.Trigger     
cextern str.RTTIType.TriggerType 
cextern str.RTTIType.Unit        
cextern str.RTTIType.UnitType    
cextern str.RTTIType.Vessel      
cextern str.RTTIType.VesselType  

%endif 
