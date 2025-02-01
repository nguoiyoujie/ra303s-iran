;----------------------------------------------------------------
; src/features/hires/gamesidebar.asm
;
; Apply hi-res features to the in-game sidebar, from which you have the minimap and construction options
; This code manages only the repositioning of existing elements.
; For the creation of additional cameo rows, see gamesidebar_extension.asm 
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------


@SET 0x0054F380,{ retn } ; _SidebarClass__SBCadgetClass_Action_Skip

; scrolling sidebar
@HACK 0x00547118,0x0054711D,_ScrollClass__AI_ScrollingWidth_Adjustment1
    push ecx
    mov  ecx,0x21C
	add  ecx,[Hires.DeltaWidth]
    cmp  eax,ecx
    pop  ecx
    jmp  0x0054711D
@ENDHACK


@HACK 0x00547127,0x00547134,_ScrollClass__AI_ScrollingWidth_Adjustment2
    push ecx
    mov  ecx,0x280
	add  ecx,[Hires.DeltaWidth]
    cmp  esi,ecx
    pop  ecx
    jl   0x00547134
    mov  esi,0x280
	add  esi,[Hires.DeltaWidth]
    jmp  0x00547134
@ENDHACK


@HACK 0x0054713B,0x00547141,_ScrollClass__AI_ScrollingWidth_Adjustment3
    push ecx
    mov  ecx,0x21C
	add  ecx,[Hires.DeltaWidth]
    cmp  esi,ecx
    pop  ecx
    jmp  0x00547141
@ENDHACK


@HACK 0x00547143,0x00547148,_ScrollClass__AI_ScrollingLeft_Adjustment1
    mov  edx,0x140
	add  edx,[Hires.DeltaLeft]
    jmp  0x00547148
@ENDHACK


@HACK 0x00547176,0x0054717B,_ScrollClass__AI_ScrollingHeight_Adjustment1
    push ecx
    mov  ecx,0x12C
	add  ecx,[Hires.DeltaHeight]
    cmp  eax,ecx
    pop  ecx
    jmp  0x0054717B
@ENDHACK


@HACK 0x00547185,0x0054719E,_ScrollClass__AI_ScrollingHeight_Adjustment2
    push eax
    mov  eax,0x190
    add  eax,[Hires.DeltaHeight]
    cmp  ecx,eax
    pop  eax
    jl   .Jmp
.NoJmp:
    mov  ecx,0x190
	add  ecx,[Hires.DeltaHeight]
.Jmp:
    mov  eax,0x140
	add  eax,[Hires.DeltaLeft]
    mov  ebx,edx
    mov  edx,0xC8
    add  edx,[Hires.DeltaTop]
    jmp  0x0054719E
@ENDHACK


; power bar
; See extended_sidebar.asm for height extensions
@HACK 0x00527735,0x0052773A,_PowerClass__Draw_It_Background_Width_Adjustment1
    mov  ebx,0x1E0
    add  ebx,[Hires.DeltaWidth]
    jmp  0x0052773A
@ENDHACK


@HACK 0x0052775B,0x00527760,_PowerClass__Draw_It_Background_Width_Adjustment2
    mov  ebx,0x1E0
    add  ebx,[Hires.DeltaWidth]
    jmp  0x00527760
@ENDHACK


@HACK 0x005275D8,0x005275DD,_PowerClass__One_Time_Position_Adjustment
    mov  edx,0x1E0
    add  edx,[Hires.DeltaWidth]
    jmp  0x005275DD
@ENDHACK


; side bar
; See extended_sidebar.asm for height extensions
@HACK 0x0054D7CA,0x0054D7CF,_SidebarClass__Draw_It_Background_Width_Adjustment1
    mov  ebx,0x1E0
    add  ebx,[Hires.DeltaWidth]
    jmp  0x0054D7CF
@ENDHACK


@HACK 0x0054D7F0,0x0054D7F5,_SidebarClass__Draw_It_Background_Width_Adjustment2
    mov  ebx,0x1E0
    add  ebx,[Hires.DeltaWidth]
    jmp  0x0054D7F5
@ENDHACK


@HACK 0x0054D815,0x0054D81A,_SidebarClass__Draw_It_Background_Width_Adjustment3
    mov  ebx,0x1E0
    add  ebx,[Hires.DeltaWidth]
    jmp  0x0054D81A
@ENDHACK


@HACK 0x0054D165,0x0054D16A,_SidebarClass__Init_IO_Repair_Button_Adjustment
    mov  esi,0x1F2
    add  esi,[Hires.DeltaWidth]
    jmp  0x0054D16A
@ENDHACK


@HACK 0x0054D1D9,0x0054D1DE,_SidebarClass__Init_IO_Sell_Button_Adjustment
    mov  edx,0x21F
    add  edx,[Hires.DeltaWidth]
    jmp  0x0054D1DE
@ENDHACK


@HACK 0x0054D237,0x0054D23C,_SidebarClass__Init_IO_Map_Button_Adjustment
    mov  edi,0x24C
    add  edi,[Hires.DeltaWidth]
    jmp  0x0054D23C
@ENDHACK


@HACK 0x0054D08B,0x0054D090,_SidebarClass__One_Time_Adjustment
    mov  edx,0x1F0
    add  edx,[Hires.DeltaWidth]
    jmp  0x0054D090
@ENDHACK


@HACK 0x005278A3,0x005278B2,_PowerClass__Draw_It_Power_Indicator_Adjustment1
    mov  eax,0x1EA
    add  eax,[Hires.DeltaWidth]
    mov  dword[ebp-0x24],edx
    mov  ebx,edx
    mov  edx,0x1EB
    add  edx,[Hires.DeltaWidth]
    jmp  0x005278B2
@ENDHACK


@HACK 0x00527A4C,0x00527A56,_PowerClass__Draw_It_Power_Indicator_Adjustment2
    mov  eax,0x1EC
    add  eax,[Hires.DeltaWidth]
    mov  edx,0x1ED
    add  edx,[Hires.DeltaWidth]
    jmp  0x00527A56
@ENDHACK


@HACK 0x00527C0E,0x00527C13,_PowerClass__Draw_It_Drain_Indicator_Adjustment2
    mov  ebx,0x1E2
    add  ebx,[Hires.DeltaWidth]
    jmp  0x00527C13
@ENDHACK


@HACK 0x0054D009,0x0054D033,_hires_StripClass
    mov  dword[ebx+0x104F],0x1F0 ; left strip offset left
    mov  dword[ebx+0x1053],0xB4 ; left strip offset top
    mov  dword[ebx+0x132F],0xB4 ; right strip offset top
    mov  dword[ebx+0x132B],0x236 ; right strip offset left
    lea  eax,[ebx+0x104F]
    mov  [Hires.StripOffsetLeft],eax
    lea  eax,[ebx+0x132B]
    mov  [Hires.StripOffsetRight],eax
    mov  eax,ebx
    jmp  0x0054D033
@ENDHACK


