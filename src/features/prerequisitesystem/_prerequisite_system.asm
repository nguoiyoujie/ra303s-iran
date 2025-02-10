;----------------------------------------------------------------
; src/features/prerequisitesystem/_prerequisite_system.asm
;
; Implements PrerequisiteTypes, which allows for some basic grouping of several building types to fulfill prerequisites.
; Extensive changes, affecting counting, map events, AI and superweapons
; 
; 
; This function is enabled by default and is not controllable.
; Compatibility warnings:
;   Adv. Power Plant no longer fulfill prerequisites that require Power Plant.
;   Soviet/Allied Tech Center will also no longer fulfill prerequisites that require the other.
;----------------------------------------------------------------

; /include
%include "libc.inc"
%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/datatypes.inc"
%include "types/common.inc"

%include "defines/rttitypes.inc"
%include "defines/housetypes.inc"

%include "types/INIClass.inc"
%include "types/ini.inc"
%include "types/AbstractTypeClass.inc"
%include "types/TechnoTypeClass.inc"
%include "types/BuildingTypeClass.inc"
%include "types/HouseClass.inc"
%include "types/AbstractClass.inc"
%include "types/ObjectClass.inc"
%include "types/TechnoClass.inc"
%include "types/AircraftClass.inc"
%include "types/BuildingClass.inc"
%include "types/InfantryClass.inc"
%include "types/UnitClass.inc"
%include "types/VesselClass.inc"

;%include "types/HouseTypeClass.inc"

; subsections
%include "src/features/prerequisitesystem/prerequisite_groups.asm"
%include "src/features/prerequisitesystem/building_group_unhardcodes.asm"
%include "src/features/prerequisitesystem/find_building.asm"
%include "src/features/prerequisitesystem/house_trackers.asm"
%include "src/features/prerequisitesystem/house_new_quantity_tracking_offsets.asm"
%include "src/features/prerequisitesystem/radar.asm"
