;----------------------------------------------------------------
; src/features/newtypes/_new_types.asm
;
; Implements the ability to create and customize the various types in the game.
; Handles three major roles:
;   1. The extension of memory space for type storage
;   2. Reading from INI or other means to initialze new variables within the memory space.
;   3. The ability to initialize new instances of object types. In particular, TechnoTypes.
;
; As far as possible, only declarations and reading is done in this section.
; Usage logic should be moved out to main section.
; 
; This function is enabled by default and is not configurable.
;
;----------------------------------------------------------------

; /include
%include "const.inc"
%include "libc.inc"
%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/datatypes.inc"
%include "types/INIClass.inc"
%include "types/CCINIClass.inc"
%include "types/common.inc"

%include "types/ini.inc"

; definitions ; added by lovalmidas
%include "defines/gametypes.inc"
%include "defines/rttitypes.inc"
%include "defines/missiontypes.inc"
%include "defines/technotypes.inc"
%include "defines/housetypes.inc"
%include "defines/playercolortypes.inc"
%include "defines/armortypes.inc"
%include "defines/prereqtypes.inc"
%include "defines/specialtypes.inc"
%include "defines/tracktypes.inc"
%include "defines/aibuildtypes.inc"

%include "src/macros/common.asm"

; type classes
%include "types/AbstractTypeClass.inc"
%include "types/ObjectTypeClass.inc"
%include "types/TechnoTypeClass.inc"
%include "types/AircraftTypeClass.inc"
%include "types/BuildingTypeClass.inc"
%include "types/HouseClass.inc"
%include "types/HouseTypeClass.inc"
%include "types/InfantryTypeClass.inc"
%include "types/UnitTypeClass.inc"
%include "types/VesselTypeClass.inc"
%include "types/WarheadTypeClass.inc"
%include "types/WeaponTypeClass.inc"

cextern AircraftClass.ORIGINAL_SIZE
cextern AnimClass.ORIGINAL_SIZE
cextern BuildingClass.ORIGINAL_SIZE
cextern BulletClass.ORIGINAL_SIZE
cextern FactoryClass.ORIGINAL_SIZE
cextern HouseClass.ORIGINAL_SIZE
cextern HouseClass.NEW_SIZE
cextern InfantryClass.ORIGINAL_SIZE
cextern OverlayClass.ORIGINAL_SIZE
cextern SmudgeClass.ORIGINAL_SIZE
cextern TeamClass.ORIGINAL_SIZE
cextern TeamTypeClass.ORIGINAL_SIZE
cextern TemplateClass.ORIGINAL_SIZE
cextern TerrainClass.ORIGINAL_SIZE
cextern TriggerClass.ORIGINAL_SIZE
cextern VesselClass.ORIGINAL_SIZE
cextern TriggerTypeClass.ORIGINAL_SIZE
cextern AnimClass.ORIGINAL_SIZE
cextern AnimClass.ORIGINAL_SIZE
cextern AnimClass.ORIGINAL_SIZE
cextern AnimClass.ORIGINAL_SIZE
cextern AnimClass.ORIGINAL_SIZE
cextern AnimClass.ORIGINAL_SIZE
cextern AnimClass.ORIGINAL_SIZE
cextern HouseTypeClass.ORIGINAL_COUNT      
cextern HouseTypeClass.NEW_COUNT  
cextern HouseTypeClass.NEW_COUNT_PLUS_ONE
cextern HouseTypeClass.ORIGINAL_SIZE       
cextern HouseTypeClass.NEW_SIZE   
cextern BuildingTypeClass.ORIGINAL_COUNT   
cextern BuildingTypeClass.ORIGINAL_SIZE    
cextern BuildingTypeClass.NEW_SIZE
cextern AircraftTypeClass.ORIGINAL_COUNT   
cextern AircraftTypeClass.ORIGINAL_SIZE    
cextern AircraftTypeClass.NEW_SIZE
cextern InfantryTypeClass.ORIGINAL_COUNT   
cextern InfantryTypeClass.ORIGINAL_SIZE    
cextern InfantryTypeClass.NEW_SIZE
cextern BulletTypeClass.ORIGINAL_COUNT     
cextern BulletTypeClass.ORIGINAL_SIZE      
cextern BulletTypeClass.NEW_SIZE 
cextern AnimTypesHeap.ORIGINAL_COUNT       
cextern AnimTypeClass.ORIGINAL_SIZE        
cextern AnimTypeClass.NEW_SIZE    
cextern UnitTypeClass.ORIGINAL_COUNT       
cextern UnitTypeClass.ORIGINAL_SIZE        
cextern UnitTypeClass.NEW_SIZE    
cextern VesselTypeClass.ORIGINAL_COUNT     
cextern VesselTypeClass.ORIGINAL_SIZE      
cextern VesselTypeClass.NEW_SIZE  
cextern SoundEffects.ORIGINAL_COUNT  
cextern WarheadTypeClass.ORIGINAL_SIZE  
cextern WarheadTypeClass.NEW_SIZE  

cextern BuildingClass.Count  
cextern BuildingClass.Array  
cextern AnimTypeClass.Count  
cextern BulletTypeClass.Count  


; subsections
%include "src/features/newtypes/converters.asm"


;extended classses
%include "src/features/newtypes/savegame_support.asm" ; this needs to go first before other extended classes

;extended classses - loading / heap size
%include "src/features/newtypes/AircraftTypeClass/aircrafttypeclass_heap_size.asm"
%include "src/features/newtypes/AnimTypeClass/animtypeclass_heap_size.asm"
%include "src/features/newtypes/BuildingTypeClass/buildingtypeclass_heap_size.asm"
%include "src/features/newtypes/InfantryTypeClass/infantrytypeclass_heap_size.asm"
%include "src/features/newtypes/UnitTypeClass/unittypeclass_heap_size.asm"
%include "src/features/newtypes/VesselTypeClass/vesseltypeclass_heap_size.asm"
%include "src/features/newtypes/WarheadTypeClass/extended_warheadtypeclass_loading.asm"
%include "src/features/newtypes/WeaponTypeClass/extended_weapontypeclass_loading.asm"
%include "src/features/newtypes/HouseTypeClass/housetypeclass_heap_size.asm"
%include "src/features/newtypes/HouseClass/houseclass_heap_size.asm"

%include "src/features/newtypes/CellClass/mapclass_array_cellclass_heap_size.asm"

;extended classses - read ini
%include "src/features/newtypes/AircraftTypeClass/aircrafttypeclass_read_ini.asm"
%include "src/features/newtypes/BuildingTypeClass/buildingtypeclass_read_ini.asm"
%include "src/features/newtypes/InfantryTypeClass/infantrytypeclass_read_ini.asm"
%include "src/features/newtypes/TechnoTypeClass/technotypeclass_read_ini.asm"
%include "src/features/newtypes/UnitTypeClass/unittypeclass_read_ini.asm"
%include "src/features/newtypes/VesselTypeClass/vesseltypeclass_read_ini.asm"
%include "src/features/newtypes/HouseTypeClass/housetypeclass_read_ini.asm"
%include "src/features/newtypes/HouseClass/houseclass_read_ini.asm"

;%include "src/features/newtypes/extended_houseclass.asm"
;%include "src/features/newtypes/extended_housetypeclass.asm"
%include "src/features/newtypes/extended_buildingclass.asm"
%include "src/features/newtypes/extended_technoclass.asm"
%include "src/features/newtypes/extended_footclass.asm"

;extended classses - new types
%include "src/features/newtypes/AircraftTypeClass/aircrafttypeclass_new_types.asm"
%include "src/features/newtypes/AnimTypeClass/animtypeclass_new_types.asm"
%include "src/features/newtypes/BuildingTypeClass/buildingtypeclass_new_types.asm"
%include "src/features/newtypes/BulletTypeClass/bullettypeclass_new_types.asm"
%include "src/features/newtypes/InfantryTypeClass/infantrytypeclass_new_types.asm"
%include "src/features/newtypes/UnitTypeClass/unittypeclass_new_types.asm"
%include "src/features/newtypes/VesselTypeClass/vesseltypeclass_new_types.asm"
%include "src/features/newtypes/HouseTypeClass/housetypeclass_new_types.asm"
%include "src/features/newtypes/HouseClass/houseclass_new_types.asm"

%include "src/features/newtypes/WarheadTypeClass/warheadtypeclass_unhardcode.asm"
%include "src/features/newtypes/WeaponTypeClass/weapontypeclass_unhardcode.asm"
%include "src/features/newtypes/SoundEffectName/soundeffectslist_unhardcode.asm"
