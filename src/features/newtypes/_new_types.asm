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
%include "types/BulletTypeClass.inc"

; subsections
%include "src/features/newtypes/converters.asm"

;extended classses
%include "src/features/newtypes/savegame_support.asm" ; this needs to go first before other extended classes

;extended classses - loading / heap size
%include "src/features/newtypes/AircraftClass/aircraftclass_heap_size.asm"
%include "src/features/newtypes/AircraftTypeClass/aircrafttypeclass_heap_size.asm"
%include "src/features/newtypes/AnimTypeClass/animtypeclass_heap_size.asm"
%include "src/features/newtypes/BuildingClass/buildingclass_heap_size.asm"
%include "src/features/newtypes/BuildingTypeClass/buildingtypeclass_heap_size.asm"
%include "src/features/newtypes/BulletTypeClass/bullettypeclass_heap_size.asm"
%include "src/features/newtypes/InfantryClass/infantryclass_heap_size.asm"
%include "src/features/newtypes/InfantryTypeClass/infantrytypeclass_heap_size.asm"
%include "src/features/newtypes/UnitClass/unitclass_heap_size.asm"
%include "src/features/newtypes/UnitTypeClass/unittypeclass_heap_size.asm"
%include "src/features/newtypes/VesselClass/vesselclass_heap_size.asm"
%include "src/features/newtypes/VesselTypeClass/vesseltypeclass_heap_size.asm"
%include "src/features/newtypes/WarheadTypeClass/warheadtypeclass_heap_size.asm"
%include "src/features/newtypes/WeaponTypeClass/weapontypeclass_heap_size.asm"
%include "src/features/newtypes/WarheadTypeClass/extended_warheadtypeclass_loading.asm"
%include "src/features/newtypes/WeaponTypeClass/extended_weapontypeclass_loading.asm"
%include "src/features/newtypes/HouseTypeClass/housetypeclass_heap_size.asm"
%include "src/features/newtypes/HouseClass/houseclass_heap_size.asm"

%include "src/features/newtypes/CellClass/mapclass_array_cellclass_heap_size.asm"

;extended classses - read ini
%include "src/features/newtypes/AircraftTypeClass/aircrafttypeclass_read_ini.asm"
%include "src/features/newtypes/BuildingTypeClass/buildingtypeclass_read_ini.asm"
%include "src/features/newtypes/BulletTypeClass/bullettypeclass_read_ini.asm"
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
