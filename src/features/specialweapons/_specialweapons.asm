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


@HACK 0x004DD108,0x004DD144,_HouseClass__Recalc_Attributes_Reset
;ecx is 0
    mov  dword[eax+HouseClass.Offset.BScan],ecx
    mov  dword[eax+HouseClass.Offset.ActiveBScan],ecx
    mov  dword[eax+HouseClass.Offset.UScan],ecx
    mov  dword[eax+HouseClass.Offset.ActiveUScan],ecx
    mov  dword[eax+HouseClass.Offset.IScan],ecx
    mov  dword[eax+HouseClass.Offset.ActiveIScan],ecx
    mov  dword[eax+HouseClass.Offset.AScan],ecx
    mov  dword[eax+HouseClass.Offset.ActiveAScan],ecx
    mov  dword[eax+HouseClass.Offset.VScan],ecx
    mov  dword[eax+HouseClass.Offset.ActiveVScan],ecx
    mov  dword[eax+HouseClass.Offset.BPreGroupScan],ecx
    ;push eax
    HouseClass.SpecialScan.Set(eax,ecx)
    HouseClass.Radar.Set(eax,cl)
    lea  eax,[eax+HouseClass.Offset.NewBScan]
    push edx
    mov  edx,8
.RepeatZero:
    mov  dword[eax],ecx
    dec  edx
    add  eax,4
    cmp  edx,0
    jg   .RepeatZero
    pop  edx
    jmp  0x004DD144
@ENDHACK


; subsections
%include "src/features/specialweapons/gps.asm"
%include "src/features/specialweapons/chronosphere.asm"
%include "src/features/specialweapons/nuke.asm"
%include "src/features/specialweapons/ironcurtain.asm"
%include "src/features/specialweapons/spyplane.asm"
%include "src/features/specialweapons/paradrop.asm"
%include "src/features/specialweapons/parabomb.asm"

