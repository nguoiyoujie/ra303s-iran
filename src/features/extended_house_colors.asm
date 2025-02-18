;----------------------------------------------------------------
; src/features/extended_house_colors.asm
;
; Increases the remap colors available by generating new combinations from the palette 
; These are hardcoded values, assuming the original temperat.pal is used
; 
; The colors can be referenced using [<HouseType>] > SecondaryColorScheme, Colour or Color
; 
; No compatibility issues is expected as these customizations was not a feature of the unmodified game. 
; Care should be taken that the color index is not exceeded
;
;----------------------------------------------------------------

cextern ColorRemaps.ExtendedColors.White

@HACK 0x0052EBC3,0x0052EBCB,_RadarClass__Render_Infantry2
    xor  ecx,ecx
    cmp  eax,7
    jg   .Custom_Remap
    imul eax,0x11A
    jmp  0x0052EBCB
.Custom_Remap:
    sub  eax,8
    imul eax,0x11A
    add  eax,ColorRemaps.ExtendedColors.White
    add  eax,0x119
    mov  byte cl,[eax]
    jmp  0x0052EBD1
@ENDHACK


@HACK 0x0052EAB1,0x0052EABC,_RadarClass__Render_Infantry
    xor  ecx,ecx
    mov  esi,[ebp-0x30]
    cmp  eax,7
    jg   .Custom_Remap
    imul eax,0x11A
    jmp  0x0052EABC
.Custom_Remap:
    sub  eax,8
    imul eax,0x11A
    add  eax,ColorRemaps.ExtendedColors.White
    add  eax,0x119
    mov  byte cl,[eax]
    jmp  0x0052EAC2
@ENDHACK


@HACK 0x0049EF65,_CellClass__Cell_Color
    cmp  eax,7
    jg   .Custom_Remap
    imul eax,0x11A
    jmp  0x0049EF6B
.Custom_Remap:
    sub  eax,8
    imul eax,0x11A
    add  eax,ColorRemaps.ExtendedColors.White
    add  eax,0x119
    mov  al,[eax]
    jmp  0x0049EF71
@ENDHACK


@HACK 0x00532767,0x0053276D,_RadarClass__Draw_Names_Custom_Remaps
    cmp  eax,7
    jg   .Custom_Remap
    imul eax,0x11A
    jmp  0x0053276D
.Custom_Remap:
    sub  eax,8
    imul eax,0x11A
    add  eax,ColorRemaps.ExtendedColors.White
    mov  edx,eax
    jmp  0x00532774
@ENDHACK


@HACK 0x0052E4E7,0x0052E4ED,_RadarClass__Draw_It_Custom_Remaps
    cmp  eax,7
    jg   .Custom_Remap
    imul eax,0x11A
    jmp  0x0052E4ED
.Custom_Remap:
    sub  eax,8
    imul eax,0x11A
    add  eax,ColorRemaps.ExtendedColors.White
    push 0x136
    push 0
    jmp  0x0052E4F9
@ENDHACK


@HACK 0x004D654B,0x004D6551,_HouseClass__Remap_Table_Return_Custom_Remaps
    cmp  eax,7
    jg   .Return_Custom_Remap
    imul eax,0x11A
    jmp  0x004D6551
.Return_Custom_Remap:
    sub  eax,8
    imul eax,0x11A
    add  eax,ColorRemaps.ExtendedColors.White
    add  eax,2
    mov  esp,ebp
    pop  ebp
    retn
@ENDHACK


