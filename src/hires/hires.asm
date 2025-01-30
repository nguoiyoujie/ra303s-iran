;----------------------------------------------------------------
; src/hires/hires.asm
;
; Bulk code for enabling custom resolutions
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
;
; Copyright (c) 2012 Toni Spets <toni.spets@iki.fi>
;
; Permission to use, copy, modify, and distribute this software for any
; purpose with or without fee is hereby granted, provided that the above
; copyright notice and this permission notice appear in all copies.
;
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;

; derived from ra95-hires

;@LJMP  0x004B03AA,_DisplayClass_Click_Cell_Calc_Redraw_GScreen

@LJMP  0x004ABBDF,_Shake_The_Screen_Height2
@LJMP  0x004AB8A8,_Shake_The_Screen_Height1

;@LJMP  0x00507DFB,_hires_Net_Join_MessageBox
@LJMP  0x00507887,_hires_Net_Join_Playing_As_Text_Print
@LJMP  0x00508074,_hires_Net_Join_AI_Players_Text_Print
@LJMP  0x00508016,_hires_Net_Join_Credits_Text_Print
@LJMP  0x00507F97,_hires_Net_Join_Tech_Level_Text_Print
@LJMP  0x00507F33,_hires_Net_Join_Unit_Count_Text_Print
@LJMP  0x00508565,_hires_Net_Join_Color_Box_Select_Thingy3
@LJMP  0x00508525,_hires_Net_Join_Color_Box_Select_Thingy2
@LJMP  0x0050854B,_hires_Net_Join_Color_Box_Select_Thingy
@LJMP  0x00507BDC,_hires_Net_Join_Color_Draw_Boxes2
@LJMP  0x00507BBB,_hires_Net_Join_Color_Draw_Boxes
@LJMP  0x00507B48,_hires_Net_Join_Color_Draw_Colored_Rectangles
@LJMP  0x005077C2,_hires_Net_Join_Color_Text_Print
@LJMP  0x0050779F,_hires_Net_Join_Side_Text_Print
@LJMP  0x0050777C,_hires_Net_Join_Name_Text_Print
@LJMP  0x0050774B,_hires_Net_Join_Players_Text_Print
@LJMP  0x00507728,_hires_Net_Join_Games_Text_Print
@LJMP  0x00506E0C,_hires_Net_Join_Static_Button
@LJMP  0x00506DA9,_hires_Net_Join_Credits_Slider
@LJMP  0x00506CE4,_hires_Net_Join_Join_Button
@LJMP  0x00506C32,_hires_Net_Join_Country_Box
@LJMP  0x00506BDC,_hires_Net_Join_Name_Box
@LJMP  0x00506931,_hires_Net_Join_Dialog

@LJMP  0x0050C33D,_hires_Net_New_AI_Players_Text_Print
@LJMP  0x0050C31D,_hires_Net_New_Credits_Text_Print
@LJMP  0x0050C2FD,_hires_Net_New_Tech_Level_Text_Print
@LJMP  0x0050C2DD,_hires_Net_New_Unit_Count_Text_Print
@LJMP  0x0050C2C0,_hires_Net_New_Scenario_Text_Print
@LJMP  0x0050C2A3,_hires_Net_New_Players_Text_Print
@LJMP  0x0050B97D,_hires_Net_New_Dialog_OK_Button
@LJMP  0x0050B8A9,_hires_Net_New_Dialog2
@LJMP  0x0050B70D,_hires_Net_New_Dialog


@LJMP  0x005523C6,_Set_Screen_Height_480_NOP
@LJMP  0x005525D7,_Set_Screen_Height_400_NOP
@LJMP  0x005525E6,_No_Black_Bars_In_640x480
;@LJMP  0x00552974,_hires_ini

@LJMP  0x004BE377,_NewMissions_Handle_Hires_Buttons_A
@LJMP  0x004BE39E,_NewMissions_Handle_Hires_Buttons_B
;@LJMP  0x0050692B,_hires_NetworkJoinMenu
;@LJMP  0x00506CEE,_hires_Network_Join_Button
;@LJMP  0x00506CBC,_hires_Network_Color_List
;@LJMP  0x00506BDC,_hires_Network_Name_EditBox
;@LJMP  0x00506C28,_hires_Network_Country_DropList
;@LJMP  0x00506C73,_hires_Network_Channel
;@LJMP  0x0050721F,_hires_Network_Join_ChatBox
;@LJMP  0x00507DEF,_hires_Network_Join_DrawBox
;@LJMP  0x00507E10,_hires_Network_Join_DrawBox2
;@LJMP  0x00507BB1,_hires_Network_Join_ColorBoxes
;@LJMP  0x00507BD2,_hires_Network_Join_ColorBoxes2
;@LJMP  0x00507C0C,_hires_Network_Join_Fill_ColorBoxes
@LJMP  0x0050253A,_hires_MainMenu_AntMissions_Select
@LJMP  0x005024AF,_hires_MainMenu_Credits_Select
@LJMP  0x005B30D0,_hires_Deinterlace_Videos
@LJMP  0x005E548D,_hires_Deinterlace_Videos_Fix_Bottom_Line

;@LJMP  0x005B2FE6,_hires_Deinterlace_Videos_Always_Deinterlace
;@LJMP  0x005B3023,_hires_Deinterlace_Videos2
;@LJMP  0x004A8C6A,_hires_Videos
;@LJMP  0x004A8AC6,_hires_Videos2
;@LJMP  0x0050223E,_Blacken_Screen_Border_Menu
;@LJMP  0x0050228E,_Blacken_Screen_Border_Menu2
;@LJMP  0x0054DFF5,_StripClass_Add



; These are per strip,there's a left and right strip in the sidebar
%define CAMEO_ITEMS    30
%define CAMEOS_SIZE    1560 ; memory size of all cameos in byte

%define ScreenWidth     0x006016B0
%define ScreenHeight    0x006016B4
%define MainWindow      0x006B1498

%define Set_Video_Mode  0x005C9D60

%define _Buffer_Fill_Rect 0x005C23F0
%define _Buffer_Clear 0x005C4DE0

%define GraphicsViewPortClass_HidPage 0x006807CC
%define GraphicBufferClass_VisiblePage 0x0068065C
%define GraphicsViewPortClass_SeenBuff 0x006807A4
%define DefaultSelectButtons 0x0068A2C4


[section .data] 
Hires.WidthTiles        dd 0x14
Hires.CellSize          dd 0x100
Hires.Pseudo480Height   dd 0
Hires.AdjustedWidth     dd 0
Hires.DeltaWidth        dd 0
Hires.DeltaHeight       dd 0
Hires.DeltaTop          dd 0
Hires.DeltaLeft         dd 0
Hires.StripOffsetLeft   dd 0 
Hires.StripOffsetRight  dd 0
Hires.ExtSidebarButtons TIMES 824 dd 0
Hires.ScoreBackground   db 0


[section .rdata] 
str_blackbackgroundpcx  db"BLACKBACKGROUND.PCX",0


%macro hires_Clear 0
    push 0xC
    push GraphicsViewPortClass_HidPage
    call _Buffer_Clear
    add  esp,8
%endmacro

%macro hires_Clear_2 0
    push 0
    push GraphicBufferClass_VisiblePage
;    push GraphicBufferClass_SeenBuffer
    call _Buffer_Clear
    add  esp,8
%endmacro


@HACK 0x00552974,0x00552979,_Read_Setup_Options__Read_Hires_Ini
    push ebx
    push edx
.Width:
    call_INIClass__Get_Int ebp-0x54,str_Options,str_Width,640
    test eax,eax
    je   .Height
    mov  dword[ScreenWidth],eax
.Height:
    call_INIClass__Get_Int ebp-0x54,str_Options,str_Height,400
    test eax,eax
    je   .Calc
    mov  dword[ScreenHeight],eax
.Calc:
    ; adjust width
    mov  eax,[ScreenWidth]
    sub  eax,160
    mov  ebx,24
    xor  edx,edx
    div  ebx
    ; width of the game area,in tiles,1 tile = 24px
    mov  byte[Hires.WidthTiles],AL
    xor  edx,edx
    mov  ebx,24
    mul  ebx
    add  eax,160
    mov  [Hires.AdjustedWidth],eax
    ; adjusted width in eax
    mov  edx,[Hires.AdjustedWidth]
    mov  ebx,[ScreenHeight]
    sub  edx,640
    sub  ebx,400
    mov  [Hires.DeltaWidth],edx
    mov  [Hires.DeltaHeight],ebx
    ; adjust top and left
    mov  eax,[ScreenHeight]
    shr  eax,1
    sub  eax,200
    mov  [Hires.DeltaTop],eax
    mov  eax,[ScreenWidth]
    shr  eax,1
    sub  eax,320
    mov  [Hires.DeltaLeft],eax
    mov  edx,[Hires.AdjustedWidth]
    mov  ebx,[ScreenHeight]

    ; side bar strip offset
    mov  edx,[Hires.DeltaWidth]
    mov  ebx,[Hires.StripOffsetLeft]
    add  [ebx],edx
    mov  ebx,[Hires.StripOffsetRight]
    add  [ebx],edx
.Ret:
    pop  edx
    pop  ebx
    jmp  0x00552979
@ENDHACK


; main menu dialog
@HACK 0x004F43BE,0x004F43C8,_Init_Game__Hires_Menu_Adjustment
    add  dword[Hires.DeltaTop],0xF0
    push dword[Hires.DeltaTop]
    sub  dword[Hires.DeltaTop],0xF0
    add  dword[Hires.DeltaLeft],0x140
    push dword[Hires.DeltaLeft]
    sub  dword[Hires.DeltaLeft],0x140
    jmp  0x004F43C8
@ENDHACK


@HACK 0x00501D62,0x00501D6C,_Main_Menu__Hires_Menu_Version_Text_Adjustment
    mov  edx,0x130
    add  edx,[Hires.DeltaLeft]
    mov  ebx,0xC8
    add  ebx,[Hires.DeltaTop]
    jmp  0x00501D6C
@ENDHACK


@HACK 0x00501DB8,0x00501DC2,_Main_Menu__Hires_Menu_Button_Adjustment
    mov  edx,0xCC
    add  edx,[Hires.DeltaLeft]
    mov  esi,0xAE
    add  esi,[Hires.DeltaTop]
    jmp  0x00501DC2
@ENDHACK


; select difficulty dialog
@HACK 0x005517CA,0x005517DE,_Fetch_Difficulty__OK_Button_Adjustment
    mov  ecx,0xF4
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x116
    mov  ebx,0x1D6
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ebx,0x17
    jmp  0x005517DE
@ENDHACK


@HACK 0x00551889,0x00551893,_Fetch_Difficulty__Dialog_Adjustment
    mov  edx,0x78
    add  edx,[Hires.DeltaTop]
    mov  eax,0x46
    add  eax,[Hires.DeltaLeft]
    jmp  0x00551893
@ENDHACK


@HACK 0x005517EF,0x005517F9,_Fetch_Difficulty__Slider_Adjustment
    mov  ecx,0xDE
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x6E
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005517F9
@ENDHACK


; load game dialog
@HACK 0x004FCECF,0x004FCED9,_LoadOptionsClass__Dialog_Adjustment
    mov  ecx,0x46
    add  ecx,[Hires.DeltaLeft]
    mov  esi,0x2C
    add  esi,[Hires.DeltaTop]
    mov  edi,0x140
    add  edi,[Hires.DeltaLeft]; _LoadOptionsClass__Descript_Adjustment_Left
    jmp  0x004FCEDE
@ENDHACK


@HACK 0x004FCEFA,0x004FCF0E,_LoadOptionsClass__List_Adjustment
    mov  ebx,0x66
    add  ebx,[Hires.DeltaLeft]
    mov  ecx,0x5E
    add  ecx,[Hires.DeltaTop]
    mov  eax,0x116 ; _LoadOptionsClass__Descript_Adjustment_Top
    add  eax,[Hires.DeltaTop]
    mov  edi,0x14E ; _LoadOptionsClass__Button_Adjustment_Left_2
    add  edi,[Hires.DeltaLeft]
    jmp  0x004FCF0E
@ENDHACK


@HACK 0x004FCF30,0x004FCF3A,_LoadOptionsClass__Button_Adjustment
    mov  ebx,0xE2
    add  ebx,[Hires.DeltaLeft]
    mov  ecx,0x13C
    add  ecx,[Hires.DeltaTop]
    jmp  0x004FCF3A
@ENDHACK


; select multiplayer dialog
@HACK 0x0050347C,0x00503486,_Select__MPLayer_Game__Dialog_Adjustment
    mov  ecx,0xA6
    add  ecx,[Hires.DeltaTop]
    mov  esi,0x82
    add  esi,[Hires.DeltaLeft]
    jmp  0x00503486
@ENDHACK


@HACK 0x005034F4,0x005034F9,_Select__MPLayer_Game__ModemSerial_Button_Adjustment_Top
    add  dword[Hires.DeltaTop],0xD0
    push dword[Hires.DeltaTop]
    sub  dword[Hires.DeltaTop],0xD0
    jmp  0x005034F9
@ENDHACK


@HACK 0x00503501,0x00503506,_Select__MPLayer_Game__ModemSerial_Button_Adjustment_Left
    add  dword[Hires.DeltaLeft],0xF0
    push dword[Hires.DeltaLeft]
    sub  dword[Hires.DeltaLeft],0xF0
    jmp  0x00503506
@ENDHACK


@HACK 0x0050351C,0x00503530,_Select__MPLayer_Game__Skirmish_Button_Adjustment
    mov  ecx,0xE6
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0xF0
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,0x1E2
    jmp  0x00503530
@ENDHACK


@HACK 0x00503549,0x0050355D,_Select__MPLayer_Game__Network_Button_Adjustment
    mov  ecx,0xFC
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0xF0
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,0xBC
    jmp  0x0050355D
@ENDHACK

   
@HACK 0x00503576,0x0050358A,_Select__MPLayer_Game__Internet_Button_Adjustment
    mov  ecx,0x112
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0xF0
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,0x00605CD0 ; str_Internet
    jmp  0x0050358A
@ENDHACK


@HACK 0x005034C8,0x005034CD,_Select__MPLayer_Game__Cancel_Button_Adjustment_Top
    mov  esi,0x132
    add  esi,[Hires.DeltaTop]
    jmp  0x005034CD
@ENDHACK


@HACK 0x0050349C,0x005034A1,_Select__MPLayer_Game__Cancel_Button_Adjustment_Left
    mov  ebx,0x104
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005034A1
@ENDHACK


; skirmish dialog
@HACK 0x00512901,0x0051290B,_Com_Scenario_Dialog__Dialog_Adjustment1
    mov  edi,0x5A
    add  edi,[Hires.DeltaLeft]
    mov  eax,0x1D
    add  eax,[Hires.DeltaTop]
    jmp  0x0051290B
@ENDHACK


@HACK 0x00512939,0x00512948,_Com_Scenario_Dialog__Dialog_Adjustment2
    mov  edi,0x104
    add  edi,[Hires.DeltaLeft]
    mov  esi,0x12
    mov  eax,0x1A4
    add  eax,[Hires.DeltaLeft]
    jmp  0x00512948
@ENDHACK


@HACK 0x0051296A,0x0051296F,_Com_Scenario_Dialog__Dialog_Adjustment3
    mov  edi,0x1E
    add  edi,[Hires.DeltaLeft]
    jmp  0x0051296F
@ENDHACK


; sound controls dialog
@HACK 0x005502A8,0x005502AD,_SoundControlsClass__Dialog_Adjustment_Top
    mov  ecx,0x36
    add  ecx,[Hires.DeltaTop]
    jmp  0x005502AD
@ENDHACK


@HACK 0x00550303,0x00550308,_SoundControlsClass__SongList_Adjustment_Top
    mov  ecx,0xA2
    add  ecx,[Hires.DeltaTop]
    jmp  0x00550308
@ENDHACK


@HACK 0x005502E3,0x005502E8,_SoundControlsClass__SongList_Adjustment_Left
    mov  ebx,0x3E
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005502E8
@ENDHACK


@HACK 0x00550330,0x00550345,_SoundControlsClass__OK_Button_Adjustment
    mov  eax,0x136
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0x1B6
    add  edx,[Hires.DeltaLeft]
    push edx
    lea  eax,[ebp-0x1EC]
    mov  edx,0x261
    jmp  0x00550345
@ENDHACK


@HACK 0x00550355,0x00550364,_SoundControlsClass__Stop_Button_Adjustment
    mov  ecx,0x136
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  eax,0x005F0A52 ; str: "BTN-ST.SHP"
    mov  ecx,0x3E
    add  ecx,[Hires.DeltaLeft]
    jmp  0x00550364
@ENDHACK


@HACK 0x0055037B,0x0055038A,_SoundControlsClass__Play_Button_Adjustment
    mov  ecx,0x136
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  eax,0x005F0A5D ; str: "BTN-PL.SHP"
    mov  ecx,0x62
    add  ecx,[Hires.DeltaLeft]
    jmp  0x0055038A
@ENDHACK


@HACK 0x005503B4,0x005503C6,_SoundControlsClass__Shuffle_Button_Adjustment
    mov  ecx,0x136
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  edi,0x1C
    add  edi,[Hires.DeltaLeft]
    mov  dword[ebp-0x54],esi
    mov  ecx,0xDE
    add  ecx,[Hires.DeltaLeft]
    push ecx
    jmp  0x005503C6
@ENDHACK


@HACK 0x005503E6,0x005503FA,_SoundControlsClass__Repeat_Button_Adjustment
    mov  ecx,0x136
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ebx,0x164
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ecx,0x116
    mov  ebx,0x99
    jmp  0x005503FA
@ENDHACK


@HACK 0x0055040E,0x00550418,_SoundControlsClass__MusicVol_Slider_Adjustment
    mov  ecx,0x6E
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x142
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00550418
@ENDHACK


@HACK 0x00550431,0x0055043B,_SoundControlsClass__SoundVol_Slider_Adjustment
    mov  ecx,0x86
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x142
    add  ebx,[Hires.DeltaLeft]
    jmp  0x0055043B
@ENDHACK


@HACK 0x00550459,0x0055045E,_SoundControlsClass__Gadget_Adjustment_Top
    mov  ebx,0x36
    add  ebx,[Hires.DeltaTop]
    jmp  0x0055045E
@ENDHACK


; surrender dialog
@HACK 0x00503F04,0x00503F11,_Surrender_Dialog__Dialog_Adjustment
    mov  eax,0x50
    add  eax,[Hires.DeltaLeft]
    mov  dword[ebp-0x20],edx
    mov  edx,0x89
    add  edx,[Hires.DeltaTop]
    jmp  0x00503F11
@ENDHACK


@HACK 0x00503E3B,0x00503E4F,_Surrender_Dialog__OK_Button_Adjustment
    mov  ecx,0xE1
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ebx,0xDC
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ecx,0x116
    mov  ebx,0x17
    jmp  0x00503E4F
@ENDHACK


@HACK 0x00503E65,0x00503E79,_Surrender_Dialog__Cancel_Button_Adjustment
    mov  ecx,0xE1
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ebx,0x14A
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ecx,0x116
    mov  ebx,0x13
    jmp  0x00503E79
@ENDHACK


@HACK 0x00503F39,0x00503F43,_Surrender_Dialog__Caption_Adjustment
    mov  ebx,0xB1
    add  ebx,[Hires.DeltaTop]
    push ebx
    mov  ebx,0x140
    add  ebx,[Hires.DeltaLeft]
    push ebx
    jmp  0x00503F43
@ENDHACK


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


; Buffers
@HACK 0x00552628,0x0055262D,_InitDDraw__Buffer1_Height_Adjustment
    mov  edx,0x190
    add  edx,[Hires.DeltaHeight]
    push edx
    jmp  0x0055262D
@ENDHACK


@HACK 0x00552637,0x0055263C,_InitDDraw__Buffer1_Width_Adjustment
    mov  ecx,0x280
    add  ecx,[Hires.DeltaWidth]
    push ecx
    jmp  0x0055263C
@ENDHACK


@HACK 0x00552645,0x0055264A,_InitDDraw__Buffer2_Height_Adjustment
    mov  edx,0x190
    add  edx,[Hires.DeltaHeight]
    push edx
    jmp  0x0055264A
@ENDHACK


@HACK 0x00552654,0x00552659,_InitDDraw__Buffer2_Width_Adjustment
    mov  ecx,0x280
    add  ecx,[Hires.DeltaWidth]
    push ecx
    jmp  0x00552659
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


; Top bar Tabs
@HACK 0x00553757,0x0055375C,_TabClass__Draw_Credits_Tab_Credits_Width_Adjustment
    mov  ebx,0x1E0
    add  ebx,[Hires.DeltaWidth]
    jmp  0x0055375C
@ENDHACK


@HACK 0x00553839,0x0055383E,_TabClass__Draw_Credits_Tab_Timer_Width_Adjustment
    mov  ebx,0x140
    add  ebx,[Hires.DeltaWidth]
    jmp  0x0055383E
@ENDHACK


@HACK 0x004ACEC5,0x004ACECA,_CreditClass__Graphic_Logic_Caption_Width_Adjustment1
    add  dword[Hires.DeltaWidth],0x190
    push dword[Hires.DeltaWidth]
    sub  dword[Hires.DeltaWidth],0x190
    jmp  0x004ACECA
@ENDHACK


@HACK 0x004ACEE4,0x004ACEE9,_CreditClass__Graphic_Logic_Caption_Width_Adjustment2
    add  dword[Hires.DeltaWidth],0x190
    push dword[Hires.DeltaWidth]
    sub  dword[Hires.DeltaWidth],0x190
    jmp  0x004ACEE9
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


; new missions
@HACK 0x004BE7A4,0x004BE7AE,_Expansion_Dialog__Dialog_Adjustment
    mov  edx,0x22
    add  edx,[Hires.DeltaTop]
    mov  eax,0x28
    add  eax,[Hires.DeltaLeft]
    jmp  0x004BE7AE
@ENDHACK


@HACK 0x004BE3DC,0x004BE3EB,_Expansion_Dialog__List_Adjustment
    mov  ecx,0x40
    add  ecx,[Hires.DeltaTop]
    push 0xF7
    mov  ebx,0x4B
    add  ebx,[Hires.DeltaLeft]
    jmp  0x004BE3EB
@ENDHACK


@HACK 0x004BE7BE,0x004BE7C8,_Expansion_Dialog__Counterstrike_Caption_Adjustment
    mov  ebx,0x22
    add  ebx,[Hires.DeltaTop]
    mov  edx,0x28
    add  edx,[Hires.DeltaLeft]
    jmp  0x004BE7C8
@ENDHACK


@HACK 0x004BE7D4,0x004BE7DE,_Expansion_Dialog__Aftermath_Caption_Adjustment
    mov  ebx,0x22
    add  ebx,[Hires.DeltaTop]
    mov  edx,0x28
    add  edx,[Hires.DeltaLeft]
    jmp  0x004BE7DE
@ENDHACK


; screen shake
@HACK 0x004AB8A3,0x004AB8A8,_Shake_The_Screen__Adjustment1
    mov  ecx,0x280
    add  ecx,[Hires.DeltaWidth]
    jmp  0x004AB8A8
@ENDHACK


@HACK 0x004AB8C8,0x004AB8CD,_Shake_The_Screen__Adjustment2
    mov  eax,0x280
    add  eax,[Hires.DeltaWidth]
    push eax
    jmp  0x004AB8CD
@ENDHACK


@HACK 0x004ABBFA,0x004ABBFF,_Shake_The_Screen__Adjustment3
    mov  eax,0x280
    add  eax,[Hires.DeltaWidth]
    jmp  0x004ABBFF
@ENDHACK


@HACK 0x004ABC1C,0x004ABC21,_Shake_The_Screen__Adjustment4
    mov  ecx,0x280
    add  ecx,[Hires.DeltaWidth]
    push ecx
    jmp  0x004ABC21
@ENDHACK


; Mission Failed!
@HACK 0x0053B32D,0x0053B33A,_Do_Lose__Text_Adjustment
    mov  ebx,0xB4
    add  ebx,[Hires.DeltaTop]
    push ebx
    push edx
    push 0x10  
    jmp  0x0053B33A
@ENDHACK


; Mission Accomplished!
@HACK 0x0053AD3E,0x0053AD4D,_Do_Win__Text_Adjustment
    mov  edx,0xB4
    add  edx,[Hires.DeltaTop]
    push edx
    push ebx
    mov  ebx,edx
    push 0xF
    xor  edx,edx
    jmp  0x0053AD4D
@ENDHACK


; This Game is a Draw!
@HACK 0x0053B61D,0x0053B62D,_Do_Draw__Text_Adjustment
    mov  ebx,0xB4
    add  ebx,[Hires.DeltaTop]
    push ebx
    push edx
    Extract_Conquer_Eng_String 118
    push eax
    ;push 0x0060707C ; str "The Game is a Draw"
    jmp  0x0053B62D
@ENDHACK


; net dialog
@HACK 0x0050B6F5,0x0050B6FF,_Net_New_Dialog__Dialog_Adjustment
    mov  eax,0xF8
    add  eax,[Hires.DeltaLeft]
    mov  esi,0x11E
    add  esi,[Hires.DeltaLeft]
    jmp  0x0050B6FF
@ENDHACK


@HACK 0x0050B744,0x0050B749,_Net_New_Dialog__MessageBox_Adjustment1
    mov  esi,0x1E
    add  esi,[Hires.DeltaLeft]
    jmp  0x0050B749
@ENDHACK


@HACK 0x0050B79A,0x0050B79F,_Net_New_Dialog__MessageBox_Adjustment2
    mov  edi,0xD2
    add  edi,[Hires.DeltaLeft]
    jmp  0x0050B79F
@ENDHACK


@HACK 0x0050B82C,0x0050B831,_Net_New_Dialog__MessageBox_Adjustment3
    mov  ecx,0x15A
    add  ecx,[Hires.DeltaTop]
    jmp  0x0050B831
@ENDHACK


@HACK 0x00506ABB,0x00506AC0,_Net_New_Dialog__MessageBox_Adjustment4
    mov  ebx,0xEC
    add  ebx,[Hires.DeltaTop]
    jmp  0x0050B831
@ENDHACK


@HACK 0x0050B73F,0x0050B744,_Net_New_Dialog__Controls_Adjustment1
    mov  edi,0xA1
    add  edi,[Hires.DeltaTop] ; Credits
    jmp  0x0050B744
@ENDHACK


@HACK 0x0050B78B,0x0050B795,_Net_New_Dialog__Controls_Adjustment2
    mov  edx,0x87
    add  edx,[Hires.DeltaTop] ; Unit count 
    mov  ecx,0x94
    add  ecx,[Hires.DeltaTop] ; Tech level
    jmp  0x0050B795
@ENDHACK


@HACK 0x0050B7CD,0x0050B7D2,_Net_New_Dialog__Controls_Adjustment3
    mov  edx,0xAE
    add  edx,[Hires.DeltaTop] ; AI players
    jmp  0x0050B7D2
@ENDHACK


@HACK 0x0050B84C,0x0050B856,_Net_New_Dialog__Controls_Adjustment4
    mov  ecx,0x1D
    add  ecx,[Hires.DeltaTop] ; Playercountry box
    mov  ebx,0x1E
    add  ebx,[Hires.DeltaLeft]
    jmp  0x0050B856
@ENDHACK


@HACK 0x0050B885,0x0050B88F,_Net_New_Dialog__MapList_Adjustment
    mov  ecx,0x1D
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x11E
    add  ebx,[Hires.DeltaLeft]
    jmp  0x0050B88F
@ENDHACK


@HACK 0x0050B8C9,0x0050B8D3,_Net_New_Dialog__UnitCount_Slider_Adjustment
    mov  ecx,0x87
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xC2
    add  ebx,[Hires.DeltaLeft]
    jmp  0x0050B8D3
@ENDHACK


@HACK 0x0050B8E7,0x0050B8F1,_Net_New_Dialog__TechLevel_Slider_Adjustment
    mov  ecx,0x94
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xC2
    add  ebx,[Hires.DeltaLeft]
    jmp  0x0050B8F1
@ENDHACK


@HACK 0x0050B905,0x0050B90F,_Net_New_Dialog__Credits_Slider_Adjustment
    mov  ecx,0xA1
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xC2
    add  ebx,[Hires.DeltaLeft]
    jmp  0x0050B90F
@ENDHACK


@HACK 0x0050B923,0x0050B92D,_Net_New_Dialog__AIPlayers_Slider_Adjustment
    mov  ecx,0xAE
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xC2
    add  ebx,[Hires.DeltaLeft]
    jmp  0x0050B92D
@ENDHACK


@HACK 0x0050B959,0x0050B963,_Net_New_Dialog__GameOptions_Box_Adjustment
    mov  ecx,0x7B
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x156
    add  ebx,[Hires.DeltaLeft]
    jmp  0x0050B963
@ENDHACK


@HACK 0x0050B9A3,0x0050B9B7,_Net_New_Dialog__Load_Button_Adjustment
    mov  ecx,0x16E
    add  ecx,[Hires.DeltaTop]
    mov  ecx,0x116
    mov  ebx,0x1E3
    add  ebx,[Hires.DeltaLeft]
    mov  ebx,0x26
    jmp  0x0050B9B7
@ENDHACK


@HACK 0x0050B9CD,0x0050B9E0,_Net_New_Dialog__Cancel_Button_Adjustment
    mov  ecx,0x16E
    add  ecx,[Hires.DeltaTop]
    mov  ecx,0x116
    mov  ebx,0x10E
    add  ebx,[Hires.DeltaLeft]
    mov  ebx,0x13
    jmp  0x0050B9E0
@ENDHACK


@HACK 0x0050B9F4,0x0050B9FE,_Net_New_Dialog__UnitCount_Text_Adjustment
    mov  ecx,0x87
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0xF8
    add  ecx,[Hires.DeltaLeft]
    push ecx
    jmp  0x0050B9FE
@ENDHACK


@HACK 0x0050BA19,0x0050BA2D,_Net_New_Dialog__TechLevel_Text_Adjustment
    mov  ecx,0x94
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x16
    mov  ebx,0xF8
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ebx,0x005EC30A
    jmp  0x0050BA2D
@ENDHACK


@HACK 0x0050BA3E,0x0050BA52,_Net_New_Dialog__Credits_Text_Adjustment
    mov  ecx,0xA1
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x16
    mov  ebx,0xF8
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ebx,0x005EC30F
    jmp  0x0050BA52
@ENDHACK


@HACK 0x0050BA63,0x0050BA77,_Net_New_Dialog__AIPlayers_Text_Adjustment
    mov  ecx,0xAE
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x16
    mov  ebx,0xF8
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ebx,0x005EC319
    jmp  0x0050BA77
@ENDHACK


@HACK 0x00506C73,0x00506C7F,_Net_Join_Dialog__GameChannels_Box_Adjustment
    mov  ecx,0x43
    add  ecx,[Hires.DeltaTop]
    push 0x4E
    mov  ebx,0x1E
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00506C7F
@ENDHACK


@HACK 0x00506CC0,0x00506CCA,_Net_Join_Dialog__PlayerList_Box_Adjustment
    mov  ecx,0x43
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x176
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00506CCA
@ENDHACK


@HACK 0x00506D33,0x00506D47,_Net_Join_Dialog__New_Button_Adjustment
    mov  ecx,0x16E
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,0x1ED
    add  ebx,[Hires.DeltaTop]
    mov  ebx,0xBF
    jmp  0x00506D47
@ENDHACK


@HACK 0x00506D0A,0x00506D1E,_Net_Join_Dialog_Cancel_Button_Adjustment
    mov  ecx,0x16E
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,0x10E
    add  ebx,[Hires.DeltaTop]
    mov  ebx,0x13
    jmp  0x00506D1E
@ENDHACK


@HACK 0x00506D59,0x00506D63,_Net_Join_Dialog__UnitCount_Slider_Adjustment
    mov  ecx,0x9F
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xB9
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00506D63
@ENDHACK


@HACK 0x00506D77,0x00506D81,_Net_Join_Dialog__TechLevel_Slider_Adjustment
    mov  ecx,0xAC
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xB9
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00506D81
@ENDHACK


@HACK 0x00506DB0,0x00506DBA,_Net_Join_Dialog__AIPlayers_Slider_Adjustment
    mov  ecx,0xC6
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xB9
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00506DBA
@ENDHACK


@HACK 0x00506DE6,0x00506DF0,_Net_Join_Dialog__GameOptions_Box_Adjustment
    mov  ecx,0x9B
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0x176
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00506DF0
@ENDHACK


@HACK 0x00506E2B,0x00506E3F,_Net_Join_Dialog__UnitCount_Text_Adjustment
    mov  ecx,0x9F
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x16
    mov  ebx,0xEF
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ebx,0x005EC26A
    jmp  0x00506E3F
@ENDHACK


@HACK 0x00506E50,0x00506E64,_Net_Join_Dialog__TechLevel_Text_Adjustment
    mov  ecx,0xAC
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x16
    mov  ebx,0xEF
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ebx,0x005EC270
    jmp  0x00506E64
@ENDHACK


@HACK 0x00506E75,0x00506E89,_Net_Join_Dialog__Credits_Text_Adjustment
    mov  ecx,0xB9
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x16
    mov  ebx,0xEF
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ebx,0x005EC276
    jmp  0x00506E89
@ENDHACK


@HACK 0x00506EA4,0x00506EB9,_Net_Join_Dialog__AIPlayers_Text_Adjustment
    mov  ebx,0xC6
    add  ebx,[Hires.DeltaTop]
    push ebx
    mov  ebx,0x005EC281
    mov  eax,0xEF
    add  eax,[Hires.DeltaLeft]
    push eax
    lea  eax,[ebp-0x30C]
    jmp  0x00506EB9
@ENDHACK


@HACK 0x005069B3,0x005069B8,_Net_Join_Dialog__MessageBox_Adjustment1
    mov  esi,0x9E
    add  esi,[Hires.DeltaTop]
    jmp  0x005069B8
@ENDHACK


@HACK 0x00506A97,0x00506A9C,_Net_Join_Dialog__MessageBox_Adjustment2
    mov  ecx,0x1E
    add  ecx,[Hires.DeltaLeft]
    jmp  0x00506A9C
@ENDHACK


@HACK 0x00506AC8,0x00506ACD,_Net_Join_Dialog__MessageBox_Adjustment3
    mov  eax,0x15A
    add  eax,[Hires.DeltaTop]
    jmp  0x00506ACD
@ENDHACK


@SET 0x0054F380,{ retn } ; _SidebarClass__SBCadgetClass_Action_Skip


@HACK 0x0050E7F1,0x0050E7F9,_hires_Reconnect_Dialog_Fill_Rect
    mov  edx,[ebp-0x30]
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,[ebp-0x28]
    add  ebx,[Hires.DeltaLeft]
    push ebx
    jmp  0x0050E7F9
@ENDHACK


@HACK 0x0050E7E9,0x0050E7F1,_hires_Reconnect_Dialog_Fill_Rect2
    mov  ecx,[ebp-0x24]  ; Top
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  eax,[ebp-0x34]  ; Left
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E7F1
@ENDHACK


@HACK 0x0050E4FD,0x0050E508,_hires_Reconnect_Dialog_Dialog_Box
    mov  edx,[0x006851A0] ; top
    add  edx,[Hires.DeltaTop]
    mov  eax,[0x0068519C] ; left
    add  eax,[Hires.DeltaLeft]
    jmp  0x0050E508
@ENDHACK


@HACK 0x0050E5D2,0x0050E5D8,_hires_Reconnect_Dialog_Text_Print1
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E5D8
@ENDHACK


@HACK 0x0050E554,0x0050E55A,_hires_Reconnect_Dialog_Text_Print2
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E55A
@ENDHACK


@HACK 0x0050E526,0x0050E52C,_hires_Reconnect_Dialog_Text_Print3
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E52C
@ENDHACK


@HACK 0x0050E5A0,0x0050E5A6,_hires_Reconnect_Dialog_Text_Print4
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E5A6
@ENDHACK


@HACK 0x0050E845,0x0050E84B,_hires_Reconnect_Dialog_Text_Print5
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x140
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x0050E84B
@ENDHACK


@HACK 0x005D1801,0x005D1807,_Receive_Remote_File_Caption
    mov  ebx,0x6e
    add  ebx,[Hires.DeltaTop]
    mov  edx,0x50
    add  edx,[Hires.DeltaLeft]
    xor  eax,eax
    jmp  0x005D1807
@ENDHACK


@HACK 0x005D17F3,0x005D17F9,_Receive_Remote_File_Dialog
    mov  edx,0x6e
    add  edx,[Hires.DeltaTop]
    mov  eax,0x78
    add  eax,[Hires.DeltaLeft]
    jmp  0x005D17F9
@ENDHACK


@HACK 0x005D162E,0x0005D1642,_Receive_Remote_File_Text_Button
    mov  ecx,0xFA
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ebx,0x118
    add  ebx,[Hires.DeltaLeft]
    push ebx
    mov  ecx,0x4116
    mov  ebx,0x13
    jmp  0x0005D1642
@ENDHACK


@HACK 0x005D1663,0x005D166B,_Receive_Remote_File_Gauge_Gadget
    lea  eax,[ebp-0x104]
    mov  ecx,0xC0
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xDC
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005D166B
@ENDHACK


@HACK 0x005D1827,0x005D182D,_Receive_Remote_File_Text_Print
    mov  ecx,0xA0
    add  ecx,[Hires.DeltaTop]
    mov  edx,0x140
    add  edx,[Hires.DeltaLeft]
    jmp  0x005D182D
@ENDHACK


@HACK 0x005D2182,0x005D2188,_Send_Remote_File_Text_Print
    mov  ecx,0xA0
    add  ecx,[Hires.DeltaTop]
    mov  edx,0x140
    add  edx,[Hires.DeltaLeft]
    jmp  0x005D2188
@ENDHACK


@HACK 0x005D1D25,0x005D1D2A,_Send_Remote_File_Text_Gauge_Gadget
    mov  ecx,0xC0
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xDC
    add  ebx,[Hires.DeltaLeft]
    jmp  0x005D1D2A
@ENDHACK


@HACK 0x005D1CFC,0x005D1D02,_Send_Remote_File_Text_Button
    mov  ecx,0xFA
    add  ecx,[Hires.DeltaTop]
    mov  esi,0x118
    add  esi,[Hires.DeltaLeft]
    jmp  0x005D1D02
@ENDHACK


@HACK 0x005D215C,0x005D2164,_Send_Remote_File_Caption
    mov  ebx,0x6e
    add  ebx,[Hires.DeltaTop]
    mov  edx,0x50
    add  edx,[Hires.DeltaLeft]
    xor  eax,eax
    jmp  0x005D2164
@ENDHACK


@HACK 0x005D214E,0x005D2154,_Send_Remote_File_Dialog
    mov  edx,0x6e
    add  edx,[Hires.DeltaTop]
    mov  eax,0x50
    add  eax,[Hires.DeltaLeft]
    jmp  0x005D2154
@ENDHACK


@HACK 0x0049F600,0x0049F605,_CellClass_Draw_It_Dont_Draw_Past_Map_Border
    push eax
    push edx
    mov  ax,[eax]
    movsx edx,ax
    mov  eax,Globals___Map
    call MapClass__In_Radar
    test eax,eax
    jz   .Out
    pop  edx
    pop  eax
    mov  [ebp-0xC],eax
    mov  edi,edx
    jmp  0x0049F605
.Out:
    pop  edx
    pop  eax
    jmp  0x0049FC47
@ENDHACK


@HACK 0x0053A376,0x0053A37B,_Start_Scenario_Set_Flag_To_Redraw_Screen
    mov  ecx,1
    lea  ebx,[Hires.CellSize]
    mov  edx,1h
    mov  eax,Globals___Map
    call 0x004D2B6C ; HelpClass::Scroll_Map(DirType,int &,int)
    mov  edx,1
    mov  eax,Globals___Map
    call GScreenClass__Flag_To_Redraw
    mov  eax,0x00668188 ; GameOptionsClass Options
    jmp  0x0053A37B
@ENDHACK


@HACK 0x004A9EA9,0x004A9EB1,_hires_Center_VQA640_Videos
    mov  eax,[Hires.DeltaTop]
    push eax
    mov  eax,[Hires.DeltaLeft]
    push eax
    push 0
    push 0
    jmp  0x004A9EB1
@ENDHACK


@HACK 0x005B3CD8,0x005B3CDE,_hires_ScoreScreenBackground
    cmp  eax,0x005F01EB
    je   .Is_Score_Screen
    cmp  eax,0x005F01F8
    je   .Is_Score_Screen
    jmp  .Ret
.Is_Score_Screen:
    mov  byte[Hires.ScoreBackground],1
.Ret:
    push ebp
    mov  ebp,esp
    push ecx
    push esi
    push edi
    jmp  0x005B3CDE
@ENDHACK


@HACK 0x005B3DAA,0x005B3DAF,_Load_Title_Screen_Clear_Background
    mov  eax,1
    hires_Clear
    jmp  0x005B3DAF
@ENDHACK


;@HACK 0x0053B806,0x0053B80B,_hires_DoRestartMissionClearBackground ; uses blackbackground.pcx,not needed anymore
;    push ecx
;    push ebx
;    push edx
;    push eax
;    mov  ebx,0x0066995C
;    mov  edx,GraphicsViewPortClass_HidPage
;    mov  eax,str_blackbackgroundpcx
;    call 0x005B3CD8
;    pop  eax
;    pop  edx
;    pop  ebx
;    pop  ecx
;    mov  eax,[Globals___Keyboard]
;    jmp  0x0053B80B
;@ENDHACK


;@HACK 0x0053BE6C,0x0053BE71,_hires_RestateMissionClearBackground ; uses blackbackground.pcx,not needed anymore
;    push ecx
;    push ebx
;    push edx
;    push eax
;    mov  ebx,0x0066995C
;    mov  edx,GraphicsViewPortClass_HidPage
;    mov  eax,str_blackbackgroundpcx
;    call 0x005B3CD8
;    pop  eax
;    pop  edx
;    pop  ebx
;    pop  ecx
;    mov  ebx,0x005F9348
;    jmp  0x0053BE71
;@ENDHACK


;@HACK 0x004F6090,0x004F6097,_hires_MainMenuClearBackground ; load blackbackground.pcx
;    hires_Clear
;    mov  ecx,eax
;    push ecx
;;    mov     ebx,0x0066995C
;;    mov     edx,GraphicsViewPortClass_HidPage
;;    mov     eax,str_blackbackgroundpcx
;;    call    0x005B3CD8
;    pop  eax
;    mov  ebx,0x0066995C
;    jmp  0x004F6097
;@ENDHACK


_hires_Deinterlace_Videos_Always_Deinterlace:
    mov  eax,ebx
    call 0x005B2CE0 ; Read_Interpolation_Palette(char *)
    cmp  dword[0x00691730],0
    jz   .Jump_Over_Create_Table
    call 0x005B2DD0 ; Create_Palette_Interpolation_Table(void)
.Jump_Over_Create_Table:
    mov  eax,ebx
    call 0x005B3009 ; Write_Interpolation_Palette(char *)
    jmp  0x005B300E


_hires_Deinterlace_Videos_Fix_Bottom_Line:
    jmp  0x005E5498


_hires_Deinterlace_Videos:
;    mov     eax,2 ; video mode,2 = deinterlace
    mov  eax,[RedAlert.Options.VideoInterlaceMode]
    jmp  0x005B30D5

;_hires_Deinterlace_Videos2:
;    jmp     0x005B304A


_hires_Videos:
    mov  ecx,0x100
    mov  ebx,0x100
    jmp  0x004A8C77


_hires_Videos2:
    mov  eax,0xC8
    mov  edi,0x140
    jmp  0x004A8AD0


_hires_MainMenu_Credits_Select:
    mov  edx,0x30 ; left
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ecx,0x14
    add  ecx,[Hires.DeltaTop]
    mov  eax,[Globals___Keyboard]
    mov  ebx,0x12
    add  ebx,[Hires.DeltaLeft]
    mov  edx,0x9E
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x005024C5


_hires_MainMenu_AntMissions_Select:
    mov  eax,0x64 ; left
    add  eax,[Hires.DeltaTop]
    push eax
    mov  ebx,0x208
    add  ebx,[Hires.DeltaLeft]
    mov  eax,[Globals___Keyboard]
    xor  ecx,ecx
    add  ecx,[Hires.DeltaTop]
    mov  edx,0x280
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x0050254D


_hires_Network_Join_Fill_ColorBoxes:
    mov  ebx,edi
    imul ebx,5
    add  ebx,1
    add  ebx,0x1A4
    add  ebx,[Hires.DeltaTop]
    jmp  0x00507C13


_hires_Network_Join_ColorBoxes:
    mov  edx,[ebp-0x80] ; top
;    add        edx,[Hires.DeltaTop]
    mov  eax,[edi+ebp-0x264] ; left
    add  eax,[Hires.DeltaLeft]
    jmp  0x00507BBB


_hires_Network_Join_ColorBoxes2:
    mov  edx,[ebp-0x80] ; top
;    add        edx,[Hires.DeltaTop]
    mov  eax,[edi+ebp-0x264] ; left
    add  eax,[Hires.DeltaLeft]
    jmp  0x00507BDC


_hires_Network_Join_DrawBox:
    mov  edx,[ebp-0x148] ; top
    add  edx,[Hires.DeltaTop]
    mov  eax,[ebp-0x14C] ; left
    add  eax,[Hires.DeltaLeft]
    jmp  0x00507DFB


_hires_Network_Join_DrawBox2:
    mov  edx,[ebp-0x128] ; top
    add  edx,[Hires.DeltaTop]
    mov  eax,[ebp-0x12C] ; left
    add  eax,[Hires.DeltaLeft]
    jmp  0x00507E1C


_hires_Network_Join_ChatBox:
    mov  eax,0x73
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x14
    add  eax,[Hires.DeltaLeft]
    push eax
    mov  eax,[ebp-0x128]
    jmp  0x00507229


_hires_Network_Channel:
    mov  ecx,0x43 ; top
    add  ecx,[Hires.DeltaTop]
    push 0x4E
    mov  ebx,0x1E ; left
    add  ebx,[Hires.DeltaLeft]
    mov  edx,0x66
    push 0x136
    jmp  0x00506C89


_hires_Network_Country_DropList:
    push eax
    push 0x50
    push 0x78
    mov  ecx,0x1F
    add  ecx,[Hires.DeltaTop]
    push ecx
;    push    0x1F
    jmp  0x00506C34


_hires_Network_Name_EditBox:
    mov  eax,0x1F
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x00601694
    xor  dh,dh
    mov  edx,0x5A
    add  edx,[Hires.DeltaLeft]
    push edx
    mov  [ebp-0x100],eax
    mov  byte[0x0067F2D6],dh
    push 0x16
    jmp  0x00506BF5


_hires_Network_Color_List:
    push 0x16
    mov  ecx,0x42
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x43
    jmp  0x00506CC5


_hires_Network_Join_Button:
    mov  ebx,0xC0
    mov  edx,0x42
    add  edx,[Hires.DeltaLeft]
    push edx
    mov  edx,0x68
    jmp  0x00506CFA


_hires_NetworkJoinMenu:
    mov  ecx,[Hires.DeltaTop]
    mov  dword[ebp-0x1D4],ecx
    mov  ecx,[Hires.DeltaLeft]
    mov  dword[ebp-0x1D0],ecx
    xor  ecx,ecx
    jmp  0x0050693D


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


@HACK 0x005B3DBF,0x005B3DC7,_hires_MainMenu
    mov  ebx,[Hires.DeltaTop]
    mov  eax,[Hires.DeltaLeft]
    cmp  byte[Hires.ScoreBackground],1
    je   .Display_Top_Left
    cmp  edx,0x190
    je   .Jump_Background_Skip
.Display_Top_Left:
    mov  ebx,0
    mov  eax,0
.Jump_Background_Skip:
    mov  byte[Hires.ScoreBackground],0
    push ebx
    push eax
    push 0
    push 0
    jmp  0x005B3DC7
@ENDHACK


@HACK 0x005518A3,0x005518AA,_hires_NewGameText
    mov  eax,[Hires.DeltaTop]
    add  eax,0x96
    push eax
    mov  eax,[Hires.DeltaLeft]
    add  eax,0x6E
    push eax
    jmp  0x005518AA
@ENDHACK


@HACK 0x005128D4,0x005128E0,_hires_SkirmishMenu
    mov  ecx,[Hires.DeltaLeft]
    mov  dword[ebp-0x1D4],ecx
    mov  ecx,[Hires.DeltaTop]
    mov  dword[ebp-0x1D0],ecx
    xor  ecx,ecx
    jmp  0x005128E0
@ENDHACK


@HACK 0x004F479B,0x004F47A0,_hires_MainMenuClear
    hires_Clear
    mov  eax,1
    jmp  0x004F47A0
@ENDHACK


@HACK 0x004F75FB,0x004F7600,_hires_MainMenuClearPalette
    hires_Clear
    mov  eax,[0x006807E8]
    jmp  0x004F7600
@ENDHACK


_Blacken_Screen_Border_Menu:
    call Set_Video_Mode
    mov  eax,1
    jmp  0x00502243


_Blacken_Screen_Border_Menu2:
    hires_Clear_2
    mov  eax,1
    jmp  0x00502293


_NewMissions_Handle_Hires_Buttons_A:
    mov  edx,0x13C
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ecx,0x116
    mov  ebx,0x17
    mov  edx,0x50
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x004BE388


_NewMissions_Handle_Hires_Buttons_B:
    mov  edx,0x13C
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ecx,0x116
    mov  ebx,0x13
    mov  edx,0x203
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x004BE3B2


_hires_Net_New_Dialog:
    mov  ecx,[Hires.DeltaLeft]
    mov  [ebp-0xFC],ecx
    mov  ecx,[Hires.DeltaTop]
    mov  [ebp-0xF8],ecx
    jmp  0x0050B719


_hires_Net_New_Dialog2:
    mov  edx,0x75
    add  edx,[Hires.DeltaTop]
    push edx
    mov  edx,0x63
    add  edx,[Hires.DeltaLeft]
    push edx
    mov  ecx,0x116
    mov  ebx,0xD8
    jmp  0x0050B8B7


_hires_Net_New_Dialog_OK_Button:
    mov  edx,0x16e
    add  edx,[Hires.DeltaTop]
    push edx
    mov  edx,0x38
    add  edx,[Hires.DeltaLeft]
    push edx
    mov  ecx,0x116
    mov  ebx,0x17
    jmp  0x0050B98E


_hires_Net_New_Players_Text_Print:
    mov  eax,0x10
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0x9a
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x0050C2AB


_hires_Net_New_Scenario_Text_Print:
    mov  ecx,0x10
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  esi,0x1C0
    add  esi,[Hires.DeltaLeft]
    push esi
    jmp  0x0050C2C8


_hires_Net_New_Unit_Count_Text_Print:
    mov  eax,0x87
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0xBE
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x0050C2E8


_hires_Net_New_Tech_Level_Text_Print:
    mov  ecx,0x94
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  esi,0xBE
    add  esi,[Hires.DeltaLeft]
    push esi
    jmp  0x0050C308


_hires_Net_New_Credits_Text_Print:
    mov  eax,0xA1
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0xBE
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x0050C328


_hires_Net_New_AI_Players_Text_Print:
    mov  ecx,0xAE
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  esi,0xBE
    add  esi,[Hires.DeltaLeft]
    push esi
    jmp  0x0050C348


_hires_Net_Join_Dialog:
    mov  ecx,[Hires.DeltaLeft]
    mov  [ebp-0x1d4],ecx
    mov  ecx,[Hires.DeltaTop]
    mov  [ebp-0x1d0],ecx
    jmp  0x0050693D


_hires_Net_Join_Name_Box:
    mov  eax,0x1f
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x5a
    add  eax,[Hires.DeltaLeft]
    push eax
    mov  eax,dword[0x601694]
    xor  dh,dh
    jmp  0x00506BE7


_hires_Net_Join_Country_Box:
    mov  ecx,0x1F
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x104
    add  ecx,[Hires.DeltaLeft]
    push ecx
    jmp  0x00506C39


_hires_Net_Join_Join_Button:
    mov  ecx,0x16E
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x42
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,0xC0
    jmp  0x00506CF5


_hires_Net_Join_Credits_Slider:
    mov  ecx,0xB9
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xB9
    add  ebx,[Hires.DeltaLeft]
    call GaugeClass__GaugeClass
    jmp  0x00506DAE


_hires_Net_Join_Static_Button:
    mov  eax,0x1f
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x20
    add  eax,[Hires.DeltaLeft]
    push eax
    mov  ecx,0x116
    mov  ebx,0x005EC269
    jmp  0x00506E1A


_hires_Net_Join_Games_Text_Print:
    mov  ebx,0x36
    add  ebx,[Hires.DeltaTop]
    push ebx
    mov  ecx,0xB9
    add  ecx,[Hires.DeltaLeft]
    push ecx
    jmp  0x00507736

_hires_Net_Join_Players_Text_Print:
    mov  edi,0x36
    add  edi,[Hires.DeltaTop]
    push edi
    mov  eax,0x1EC
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x00507759


_hires_Net_Join_Name_Text_Print:
    mov  esi,0x12
    add  esi,[Hires.DeltaTop]
    push esi
    mov  edi,0xa0
    add  edi,[Hires.DeltaLeft]
    push edi
    jmp  0x0050778A


_hires_Net_Join_Side_Text_Print:
    mov  edx,0x12
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,0x140
    add  ebx,[Hires.DeltaLeft]
    push ebx
    jmp  0x005077AD


_hires_Net_Join_Color_Text_Print:
    mov  esi,0x12
    add  esi,[Hires.DeltaTop]
    push esi
    mov  edi,0x1f0
    add  edi,[Hires.DeltaLeft]
    push edi
    jmp  0x005077D0


_hires_Net_Join_Color_Draw_Colored_Rectangles:
    mov  ecx,[ebp-0xAC] ; top
    add  ecx,[Hires.DeltaTop]
    push ecx             ; __int16
    mov  eax,[ebp-0xB0] ; left
    add  eax,[Hires.DeltaLeft]
    push eax             ; __int16
    mov  edx,[ebp-0xB4] ; height
    add  edx,[Hires.DeltaTop]
    push edx             ; __int16
    mov  ebx,[ebp-0xB8] ; width
    add  ebx,[Hires.DeltaLeft]
    push ebx             ; __int16
    jmp  0x00507B64


_hires_Net_Join_Color_Draw_Boxes:
    add  edx,[Hires.DeltaTop]
    add  eax,[Hires.DeltaLeft]
    call Dialog___Draw_Box
    jmp  0x00507BC0


_hires_Net_Join_Color_Draw_Boxes2:
    add  edx,[Hires.DeltaTop]
    add  eax,[Hires.DeltaLeft]
    call Dialog___Draw_Box
    jmp  0x00507BE1


_hires_Net_Join_Color_Box_Select_Thingy:
    mov  edi,[ebp-0x80]
    add  edi,[Hires.DeltaTop]
    mov  eax,[edx+4]
    cmp  eax,edi
    jle  0x00508193
    mov  ecx,[ebp-0x84]
    add  ecx,[Hires.DeltaTop]
    cmp  eax,ecx
    jmp  0x0050855F


_hires_Net_Join_Color_Box_Select_Thingy2:
    mov  ebx,[ebp-0x264]
    add  ebx,[Hires.DeltaLeft]
    cmp  ebx,[edx]
    jge  0x00508193
    mov  eax,[ebp-0x248]
    mov  ecx,[ebp-0x1A8]
    add  eax,[Hires.DeltaLeft]
    jmp  0x0050853F


_hires_Net_Join_Color_Box_Select_Thingy3:
    mov  ecx,[ebp-0x264]
    add  ecx,[Hires.DeltaLeft]
    jmp  0x0050856B


_hires_Net_Join_MessageBox:
; 00507DFB
;edx = 00000102 eax = 6E
;    cmp        eax,
    add  edx,[Hires.DeltaTop]
    call Dialog___Draw_Box
    jmp  0x00507E00

_hires_Net_Join_Unit_Count_Text_Print:
; ecx = 0000009F,esi = 000000B5
    mov  ecx,0x9F
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  esi,0xB5
    add  esi,[Hires.DeltaLeft]
    jmp  0x00507F40

; edx= 000000AC,ebx = 000000B5
_hires_Net_Join_Tech_Level_Text_Print:
    mov  edx,0xAC
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,0xB5
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00507FA4

; eax = 000000B9,edx = B5
_hires_Net_Join_Credits_Text_Print:
    mov  eax,0xB9
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0xB5
    add  edx,[Hires.DeltaLeft]
    jmp  0x00508023

; esi = 000000C6,edi = b5
_hires_Net_Join_AI_Players_Text_Print:
    mov  esi,0xC6
    add  esi,[Hires.DeltaTop]
    push esi
    mov  edi,0xB5
    add  edi,[Hires.DeltaLeft]
    jmp  0x00508081

_hires_Net_Join_Playing_As_Text_Print:
; edx = 00000010,ebx = 00000140
    mov  edx,0x10
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,0x140
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00507894

_Shake_The_Screen_Height2:
    mov  eax,[ScreenHeight]
    sub  eax,2
    jmp  0x004ABBE4

_Shake_The_Screen_Height1:
    mov  eax,[ScreenHeight]
    sub  eax,2
    jmp  0x004AB8AD

_Set_Screen_Height_400_NOP:
    cmp  dword[Hires.Pseudo480Height],1
    je   .No_Change

    jmp  0x00552628

.No_Change:
    mov  dword[ScreenHeight],0x190
    jmp  0x005525ED

_No_Black_Bars_In_640x480:
    cmp  dword[Hires.Pseudo480Height],1
    je   .No_Change
    jmp  0x00552628

.No_Change:
    jmp  0x005525ED

_Set_Screen_Height_480_NOP:
    mov  dword[ScreenHeight],ebx
    mov  dword[Hires.Pseudo480Height],1
    jmp  0x005523EE


@HACK 0x0054DB14,0x0054DB19,_Set_Game_Area_Width
    mov ecx,[Hires.WidthTiles]
    jmp  0x0054DB19
@ENDHACK
