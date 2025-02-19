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
cextern Globals___OriginalPalette
cextern Globals___WhitePalette
cextern CustomPaletteBuffer
cextern Globals___HidPage

[section .data]
Temp.ComColor db 0

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



@HACK 0x00513FBB,0x00513FCB,_Com_Scenario_Dialog_MoreSkimishColors
    inc  esi
    cmp  esi,8
    jne  .Continue
.Begin_Custom_Remap:
    lea  ecx,[ColorRemaps.ExtendedColors.White]
    sub  ecx,0x00666A1E ; original ColorRemaps
.Continue:
    mov  [ebp-0x44],ecx
    mov  [ebp-0x3C],esi
    cmp  esi,PlayerColorType.MAX+1
    jge  0x00514163
    jmp  0x00513FCB
@ENDHACK


@HACK 0x00513FCB,0x00513FFC,_Com_Scenario_Dialog_MoreSkimishColors2
    and  edi,0x1F
    mov  ebx,[edi+ebp-0x260]
    mov  eax,[ebp-0x1A4]
    mov  ecx,eax
    add  eax,ebx
    inc  ebx
    dec  eax
    mov  [ebp-0x84],eax
    mov  esi,[ebp-0x3C]
    shr  esi,3
    mov  eax,ecx
    imul eax,esi
    mov  ecx,eax
    add  eax,[ebp-0x1E0]
    mov  [ebp-0x7C],eax
    mov  eax,[ebp-0x84]
    mov  [ebp-0x78],eax
    mov  eax,ecx
    add  eax,[ebp-0x40]
    mov  [ebp-0x74],eax
    jmp  0x00513FFC
@ENDHACK


@HACK 0x00513F76,0x00513F7C,_Com_Scenario_Dialog_MoreSkimishColors_BoxY1
    mov  eax,[ebp-0x3C]
    shr  eax,3
    imul eax,ebx
    mov  edx,[ebp-0x19C]
    add  edx,eax
    jmp  0x00513F7C
@ENDHACK


@HACK 0x00513F9A,0x00513FA0,_Com_Scenario_Dialog_MoreSkimishColors_BoxY2
    mov  eax,[ebp-0x3C]
    shr  eax,3
    imul eax,ebx
    mov  edx,[ebp-0x19C]
    add  edx,eax
    jmp  0x00513FA0
@ENDHACK


@HACK 0x00513A0D,0x00513A12,_Com_Scenario_Dialog_MoreSkimishColors_HitTestY
    push ecx
    mov  ecx,(PlayerColorType.MAX+8)/8
    imul edx,ecx
    add  eax,edx
    mov  [ebp-0x68],eax
    pop  ecx
    jmp  0x00513A12
@ENDHACK


@HACK 0x00514553,0x0051455A,_Com_Scenario_Dialog_MoreSkimishColors_HitTestY2
    push edx
    sub  eax,ecx
    xor  edx,edx
    idiv ebx
    mov  ecx,eax
    pop  edx
    shl  ecx,3
    mov  eax,edx
    sar  edx,0x1F
    idiv ebx
    add  eax,ecx
    cmp  eax,PlayerColorType.MAX
    jg   0x00514461
    jmp  0x0051455A
@ENDHACK


@HACK 0x00514581,0x0051458A,_Com_Scenario_Dialog_MoreSkimishColors_CustomRemap
    movzx eax,al
    cmp  eax,7
    jg   .Custom_Remap
    imul eax,0x11A
    jmp  0x0051458A
.Custom_Remap:
    sub  eax,8
    imul eax,0x11A
    add  eax,ColorRemaps.ExtendedColors.White
    jmp  0x0051458F
@ENDHACK


@HACK 0x00505CFD,0x00505D0F,_MessageListClass__Set_Edit_Color_UseCustomRemaps
    movzx edx,dl
    cmp  edx,7
    jg   .Custom_Remap
    imul edx,edx,0x11A
    add  edx,0x00666908
    jmp  .Ret
.Custom_Remap:
    sub  edx,8
    imul edx,edx,0x11A
    add  edx,ColorRemaps.ExtendedColors.White
.Ret:
    mov  eax,[eax+0x24]
    jmp  0x00505D0F
@ENDHACK


@HACK 0x004F82D1,0x004F82D6,_Bootstrap__Set_OriginalPalette
    mov  edx,eax
    mov  eax,Globals___OriginalPalette
    call 0x005C38B3 ; memmove_
    mov  edx,eax
    mov  eax,CustomPaletteBuffer
    call 0x005C38B3 ; memmove_
    mov  eax,Globals___WhitePalette
    jmp  0x004F82D6
@ENDHACK


;@HACK 0x00513936,0x0051393B,Blank_Out_Title_Page
    ;hires_Clear
;    mov  eax,[Globals___HidPage+0x1C] ; ds:GraphicBufferClass__Something
;    call GraphicBufferClass__Lock ; GraphicBufferClass::Lock(void)
;    test eax,eax
;    jz   .Skip
;    push 0xC
;    push Globals___HidPage
;    call _Buffer_Clear
;    add  esp,8
;.Skip:
;    mov  eax,[Globals___HidPage+0x1C]
;    call GraphicBufferClass__Unlock

;    call _Blit_HidPage_To_SeenPage
;    jmp  0x0051393B
;@ENDHACK

;@SET 0x0051392F,{mov eax,0} ; no Load_Title_Page
;@SET 0x004F6092,{mov ebx,Globals___OriginalPalette}
@SET 0x0051393B,{mov eax,CustomPaletteBuffer} ; GamePalette

;@SET 0x004f609c,{mov eax,0x005eff4b}

;16-bit video mode
;@SET 0x00552383,{mov ecx,16}
;@SET 0x0055239E,{mov ecx,16}
;@SET 0x005523CE,{mov ecx,16}

;@SET 0x005CA12F,{mov eax,0x400} ; 4 palette worth

[section .text]
_Blit_HidPage_To_SeenPage:
    push ebp
    mov  ebp,esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov  edx,Globals___HidPage
    jmp  0x004F60AE
