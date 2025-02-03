;----------------------------------------------------------------
; src/features/loading/_loading.asm
;
; Implements modifications to the reading of files. This includes:
;     - Mix files
;     - Assets (images, music, sounds)
;     - Rules INI
;     - Spawn INI
;     - Map INI
;     - Savegames
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

; subsections
%include "src/features/loading/ini_load_longer_lines.asm"
%include "src/features/loading/ini_redalert.asm"
%include "src/features/loading/ini_spawn.asm"
%include "src/features/loading/ini_rules.asm"
%include "src/features/loading/ini_map.asm"

%include "src/features/loading/ini_ai.asm"
%include "src/features/loading/mix_files.asm"

%include "src/features/loading/movies.asm"
%include "src/features/loading/load_both_movies.asm"
%include "src/features/loading/music.asm"
%include "src/features/loading/pkt_files.asm"
%include "src/features/loading/savegame.asm"

