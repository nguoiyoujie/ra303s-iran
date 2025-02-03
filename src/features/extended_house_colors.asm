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

cextern ColorRemaps.ExtendedColors

%assign ColorRemaps.White.Offset                               0
%assign ColorRemaps.Black.Offset                               REMAPCONTROLTYPE_SIZE
%assign ColorRemaps.FlamingBlue.Offset                         REMAPCONTROLTYPE_SIZE * 2
%assign ColorRemaps.TrueGrey.Offset                            REMAPCONTROLTYPE_SIZE * 3
%assign ColorRemaps.DirtyGreen.Offset                          REMAPCONTROLTYPE_SIZE * 4

%macro Initialize_Remap_Table 1
    xor  eax,eax

  %%Loop_Initialize_Remap_Table:
    mov  byte[ColorRemaps.ExtendedColors+2+%1+eax],al
    inc  eax
    cmp  byte al,0                          ;loop 256 times
    jnz  %%Loop_Initialize_Remap_Table
    mov  eax,258

  %%Loop_Initialize_Black_Part:
    mov  byte[ColorRemaps.ExtendedColors+%1+eax],0
    inc  eax
    cmp  eax,268
    jnz  %%Loop_Initialize_Black_Part
%endmacro


@HACK 0x0052EBC3,0x0052EBCB,_RadarClass__Render_Infantry2
    xor  ecx,ecx
    cmp  eax,7
    jg   .Custom_Remap
    imul eax,0x11A
    jmp  0x0052EBCB
.Custom_Remap:
    sub  eax,8
    imul eax,0x11A
    add  eax,ColorRemaps.ExtendedColors
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
    add  eax,ColorRemaps.ExtendedColors
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
    add  eax,ColorRemaps.ExtendedColors
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
    add  eax,ColorRemaps.ExtendedColors
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
    add  eax,ColorRemaps.ExtendedColors
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
    add  eax,ColorRemaps.ExtendedColors
    add  eax,2
    mov  esp,ebp
    pop  ebp
    retn
@ENDHACK


[section .text]
; called from loading.asm/_Init_Game_Hook_Load
_InitializeExtendedColors:

;   WHITE
    Initialize_Remap_Table ColorRemaps.White.Offset
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+0x0],0xF
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+0x1],0xF ; Name in radar logo color bits, this is for a yellow name
    ; Remap colours for name in the name list on the radar
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+268],0xF
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+269],0xE
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+270],0xF
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+271],0xE
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+272],0xF
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+273],0xE
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+274],0xF
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+275],0xE
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+276],0xF
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+277],0xE
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+278],0xF
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+279],0xE
    ; Remap colour on radar map
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+280],0x4F
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+281],0x4F
    ; Remap colours on units, from lighest shade to darkest
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+82],0xF ; 15
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+83],0xF ; 15
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+84],0x80 ; 128
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+85],0x80 ; 128
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+86],0x80 ; 128
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+87],0x84 ; 132
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+88],0x84 ; 132
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+89],0x85 ; 133
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+90],0x88 ; 136
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+91],0x89 ; 137
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+92],0x8A ; 138
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+93],0x8A ; 138
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+94],0x8B ; 139
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+95],0x8B ; 139
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+96],0x8D ; 141
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.White.Offset+97],0x8F ; 143

;   BLACK
    Initialize_Remap_Table ColorRemaps.Black.Offset
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+0x0],0xF
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+0x1],0xF ; Name in radar logo color bits, this is for a yellow name
    ; Remap colours for name in the name list on the radar
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+268],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+269],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+270],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+271],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+272],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+273],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+274],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+275],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+276],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+277],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+278],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+279],0x12
    ; Remap colour on radar map
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+280],0x12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+281],0x12
    ; Remap colours on units, from lighest shade to darkest
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+82],0x8A ; 138
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+83],0x8B ; 139
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+84],0x8C ; 140
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+85],0x8C ; 140
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+86],0x8D ; 141
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+87],0x8D ; 141
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+88],0x8E ; 142
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+89],0x8E ; 142
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+90],0x8F ; 143
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+91],0x8F ; 143
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+92],0x13 ; 19
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+93],0x12 ; 18
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+94],0x11 ; 17
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+95],0x11 ; 17
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+96],0xC ; 12
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset+97],0xC ; 12

;   FLAMING BLUE
    Initialize_Remap_Table ColorRemaps.FlamingBlue.Offset
    ; Remap colours for name in the name list on the radar
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+268],0xC0
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+269],0xC1
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+270],0xC2
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+271],0xC3
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+272],0xC4
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+273],0xC5
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+274],0xC7
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+275],0xC6
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+276],0xC5
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+277],0xC2
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+278],0xC2
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+279],0xA0
    ; Remap colour on radar map
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+280],0xA0
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+281],0xC4
    ; Remap colours on units, from lighest shade to darkest
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+82],0xA0
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+83],0xA1
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+84],0xC0
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+85],0xC1
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+86],0xC2
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+87],0xC3
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+88],0xC4
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+89],0xC5
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+90],0xC6
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+91],0xC6
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+92],0xC7
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+93],0xC7
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+94],0xAD
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+95],0xAE
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+96],0xAF
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.FlamingBlue.Offset+97],0xAF

    ; added by lovalmidas
;   TRUEGREY
    Initialize_Remap_Table ColorRemaps.TrueGrey.Offset
    ; Remap colours for name in the name list on the radar
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+268],0x84
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+269],0x85
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+270],0x86
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+271],0x87
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+272],0x88
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+273],0x89
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+274],0x8B
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+275],0x8A
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+276],0x88
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+277],0x86
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+278],0x86
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+279],0x84
    ; Remap colour on radar map
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+280],0x86
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+281],0x89
    ; Remap colours on units, from lighest shade to darkest
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+82],0x84
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+83],0x85
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+84],0x86
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+85],0x87
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+86],0x88
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+87],0x89
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+88],0x8A
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+89],0x8A
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+90],0x8B
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+91],0x8C
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+92],0x8D
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+93],0x8D
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+94],0x8E
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+95],0x8E
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+96],0x8F
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.TrueGrey.Offset+97],0x8F

;   DIRTYGREEN
    Initialize_Remap_Table ColorRemaps.DirtyGreen.Offset
    ; Remap colours for name in the name list on the radar
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+268],0xFE
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+269],0xFD
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+270],0xFC
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+271],0xFB
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+272],0xFA
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+273],0xF9
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+274],0xF7
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+275],0xF8
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+276],0xFA
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+277],0xFB
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+278],0xFC
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+279],0xFE
    ; Remap colour on radar map
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+280],0xFB
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+281],0xFE
    ; Remap colours on units, from lighest shade to darkest
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+82],0xFE
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+83],0xFD
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+84],0xFE
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+85],0xFD
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+86],0xFC
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+87],0xFB
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+88],0xFA
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+89],0xF9
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+90],0xF8
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+91],0xF7
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+92],0xF6
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+93],0xF5
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+94],0xF4
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+95],0xF3
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+96],0xF2
    mov  byte[ColorRemaps.ExtendedColors+ColorRemaps.DirtyGreen.Offset+97],0xF1
    retn



