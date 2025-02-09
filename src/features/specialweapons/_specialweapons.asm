;----------------------------------------------------------------
; src/features/specialweapons/_specialweapons.asm
;
; Move superweapon / specials information to a holding position, for future work to extend them.
; Allow buildingtypes to specify their specials.
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

; /include
%include "libc.inc"
%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/datatypes.inc"

%include "defines/specialtypes.inc"
%include "types/common.inc"

%include "types/INIClass.inc"
%include "types/ini.inc"
%include "types/AbstractTypeClass.inc"
%include "types/TechnoTypeClass.inc"
%include "types/BuildingTypeClass.inc"
%include "types/HouseClass.inc"

cextern HouseClass__Find_Building
cextern Globals___Map_IsTargettingMode

%define        SpecialChrono2        0xFE

; subsections
%include "src/features/specialweapons/gps.asm"
%include "src/features/specialweapons/chronosphere.asm"
%include "src/features/specialweapons/nuke.asm"
%include "src/features/specialweapons/ironcurtain.asm"
%include "src/features/specialweapons/spyplane.asm"
%include "src/features/specialweapons/paradrop.asm"
%include "src/features/specialweapons/parabomb.asm"

