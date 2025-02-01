;----------------------------------------------------------------
; src/features/hires/netdialog.asm
;
; Apply hi-res features to internet game dialog, which is accessible from the multiplayer selection menu
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

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


;@HACK 0x00507C0C,_hires_Network_Join_Fill_ColorBoxes
;    mov  ebx,edi
;    imul ebx,5
;    add  ebx,1
;    add  ebx,0x1A4
;    add  ebx,[Hires.DeltaTop]
;    jmp  0x00507C13
;@ENDHACK


;@HACK 0x00507BB1,_hires_Network_Join_ColorBoxes
;    mov  edx,[ebp-0x80] ; top
;;    add        edx,[Hires.DeltaTop]
;    mov  eax,[edi+ebp-0x264] ; left
;    add  eax,[Hires.DeltaLeft]
;    jmp  0x00507BBB
;@ENDHACK


;@HACK 0x00507BD2,_hires_Network_Join_ColorBoxes2
;    mov  edx,[ebp-0x80] ; top
;;    add        edx,[Hires.DeltaTop]
;    mov  eax,[edi+ebp-0x264] ; left
;    add  eax,[Hires.DeltaLeft]
;    jmp  0x00507BDC
;@ENDHACK


;@HACK 0x00507DEF,_hires_Network_Join_DrawBox
;    mov  edx,[ebp-0x148] ; top
;    add  edx,[Hires.DeltaTop]
;    mov  eax,[ebp-0x14C] ; left
;    add  eax,[Hires.DeltaLeft]
;    jmp  0x00507DFB
;@ENDHACK


;@HACK 0x00507E10,_hires_Network_Join_DrawBox2
;    mov  edx,[ebp-0x128] ; top
;    add  edx,[Hires.DeltaTop]
;    mov  eax,[ebp-0x12C] ; left
;    add  eax,[Hires.DeltaLeft]
;    jmp  0x00507E1C
;@ENDHACK


;@HACK 0x0050721F,_hires_Network_Join_ChatBox
;    mov  eax,0x73
;    add  eax,[Hires.DeltaTop]
;    push eax
;    mov  eax,0x14
;    add  eax,[Hires.DeltaLeft]
;    push eax
;    mov  eax,[ebp-0x128]
;    jmp  0x00507229
;@ENDHACK


;@HACK 0x00506C73,_hires_Network_Channel
;    mov  ecx,0x43 ; top
;    add  ecx,[Hires.DeltaTop]
;    push 0x4E
;    mov  ebx,0x1E ; left
;    add  ebx,[Hires.DeltaLeft]
;    mov  edx,0x66
;    push 0x136
;    jmp  0x00506C89
;@ENDHACK


;@HACK 0x00506C28,_hires_Network_Country_DropList
;    push eax
;    push 0x50
;    push 0x78
;    mov  ecx,0x1F
;    add  ecx,[Hires.DeltaTop]
;    push ecx
;;    push    0x1F
;    jmp  0x00506C34
;@ENDHACK


;@HACK 0x00506BDC,_hires_Network_Name_EditBox
;    mov  eax,0x1F
;    add  eax,[Hires.DeltaTop]
;    push eax
;    mov  eax,0x00601694
;    xor  dh,dh
;    mov  edx,0x5A
;    add  edx,[Hires.DeltaLeft]
;    push edx
;    mov  [ebp-0x100],eax
;    mov  byte[0x0067F2D6],dh
;    push 0x16
;    jmp  0x00506BF5
;@ENDHACK


;@HACK 0x00506CBC,_hires_Network_Color_List
;    push 0x16
;    mov  ecx,0x42
;    add  ecx,[Hires.DeltaTop]
;    push ecx
;    mov  ecx,0x43
;    jmp  0x00506CC5
;@ENDHACK


;@HACK 0x00506CEE,_hires_Network_Join_Button
;    mov  ebx,0xC0
;    mov  edx,0x42
;    add  edx,[Hires.DeltaLeft]
;    push edx
;    mov  edx,0x68
;    jmp  0x00506CFA
;@ENDHACK


;@HACK 0x0050692B,_hires_NetworkJoinMenu
;    mov  ecx,[Hires.DeltaTop]
;    mov  dword[ebp-0x1D4],ecx
;    mov  ecx,[Hires.DeltaLeft]
;    mov  dword[ebp-0x1D0],ecx
;    xor  ecx,ecx
;    jmp  0x0050693D
;@ENDHACK


@HACK 0x004BE377,0x004BE388,_NewMissions_Handle_Hires_Buttons_A
    mov  edx,0x13C
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ecx,0x116
    mov  ebx,0x17
    mov  edx,0x50
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x004BE388
@ENDHACK


@HACK 0x004BE39E,0x004BE3B2,_NewMissions_Handle_Hires_Buttons_B
    mov  edx,0x13C
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ecx,0x116
    mov  ebx,0x13
    mov  edx,0x203
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x004BE3B2
@ENDHACK


@HACK 0x0050B70D,0x0050B719,_hires_Net_New_Dialog
    mov  ecx,[Hires.DeltaLeft]
    mov  [ebp-0xFC],ecx
    mov  ecx,[Hires.DeltaTop]
    mov  [ebp-0xF8],ecx
    jmp  0x0050B719
@ENDHACK


@HACK 0x0050B8A9,0x0050B8B7,_hires_Net_New_Dialog2
    mov  edx,0x75
    add  edx,[Hires.DeltaTop]
    push edx
    mov  edx,0x63
    add  edx,[Hires.DeltaLeft]
    push edx
    mov  ecx,0x116
    mov  ebx,0xD8
    jmp  0x0050B8B7
@ENDHACK


@HACK 0x0050B97D,0x0050B98E,_hires_Net_New_Dialog_OK_Button
    mov  edx,0x16E
    add  edx,[Hires.DeltaTop]
    push edx
    mov  edx,0x38
    add  edx,[Hires.DeltaLeft]
    push edx
    mov  ecx,0x116
    mov  ebx,0x17
    jmp  0x0050B98E
@ENDHACK


@HACK 0x0050C2A3,0x0050C2AB,_hires_Net_New_Players_Text_Print
    mov  eax,0x10
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0x9A
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x0050C2AB
@ENDHACK


@HACK 0x0050C2C0,0x0050C2C8,_hires_Net_New_Scenario_Text_Print
    mov  ecx,0x10
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  esi,0x1C0
    add  esi,[Hires.DeltaLeft]
    push esi
    jmp  0x0050C2C8
@ENDHACK


@HACK 0x0050C2DD,0x0050C2E8,_hires_Net_New_Unit_Count_Text_Print
    mov  eax,0x87
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0xBE
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x0050C2E8
@ENDHACK


@HACK 0x0050C2FD,0x0050C308,_hires_Net_New_Tech_Level_Text_Print
    mov  ecx,0x94
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  esi,0xBE
    add  esi,[Hires.DeltaLeft]
    push esi
    jmp  0x0050C308
@ENDHACK


@HACK 0x0050C31D,0x0050C328,_hires_Net_New_Credits_Text_Print
    mov  eax,0xA1
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0xBE
    add  edx,[Hires.DeltaLeft]
    push edx
    jmp  0x0050C328
@ENDHACK


@HACK 0x0050C33D,0x0050C348,_hires_Net_New_AI_Players_Text_Print
    mov  ecx,0xAE
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  esi,0xBE
    add  esi,[Hires.DeltaLeft]
    push esi
    jmp  0x0050C348
@ENDHACK


@HACK 0x00506931,0x0050693D,_hires_Net_Join_Dialog
    mov  ecx,[Hires.DeltaLeft]
    mov  [ebp-0x1D4],ecx
    mov  ecx,[Hires.DeltaTop]
    mov  [ebp-0x1D0],ecx
    jmp  0x0050693D
@ENDHACK


@HACK 0x00506BDC,0x00506BE7,_hires_Net_Join_Name_Box
    mov  eax,0x1F
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x5A
    add  eax,[Hires.DeltaLeft]
    push eax
    mov  eax,dword[0x601694]
    xor  dh,dh
    jmp  0x00506BE7
@ENDHACK


@HACK 0x00506C32,0x00506C39,_hires_Net_Join_Country_Box
    mov  ecx,0x1F
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x104
    add  ecx,[Hires.DeltaLeft]
    push ecx
    jmp  0x00506C39
@ENDHACK


@HACK 0x00506CE4,0x00506CF5,_hires_Net_Join_Join_Button
    mov  ecx,0x16E
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  ecx,0x42
    add  ecx,[Hires.DeltaLeft]
    push ecx
    mov  ecx,0x116
    mov  ebx,0xC0
    jmp  0x00506CF5
@ENDHACK


@HACK 0x00506DA9,0x00506DAE,_hires_Net_Join_Credits_Slider
    mov  ecx,0xB9
    add  ecx,[Hires.DeltaTop]
    mov  ebx,0xB9
    add  ebx,[Hires.DeltaLeft]
    call GaugeClass__GaugeClass
    jmp  0x00506DAE
@ENDHACK


@HACK 0x00506E0C,0x00506E1A,_hires_Net_Join_Static_Button
    mov  eax,0x1F
    add  eax,[Hires.DeltaTop]
    push eax
    mov  eax,0x20
    add  eax,[Hires.DeltaLeft]
    push eax
    mov  ecx,0x116
    mov  ebx,0x005EC269
    jmp  0x00506E1A
@ENDHACK


@HACK 0x00507728,0x00507736,_hires_Net_Join_Games_Text_Print
    mov  ebx,0x36
    add  ebx,[Hires.DeltaTop]
    push ebx
    mov  ecx,0xB9
    add  ecx,[Hires.DeltaLeft]
    push ecx
    jmp  0x00507736
@ENDHACK


@HACK 0x0050774B,_hires_Net_Join_Players_Text_Print
    mov  edi,0x36
    add  edi,[Hires.DeltaTop]
    push edi
    mov  eax,0x1EC
    add  eax,[Hires.DeltaLeft]
    push eax
    jmp  0x00507759
@ENDHACK


@HACK 0x0050777C,_hires_Net_Join_Name_Text_Print
    mov  esi,0x12
    add  esi,[Hires.DeltaTop]
    push esi
    mov  edi,0xA0
    add  edi,[Hires.DeltaLeft]
    push edi
    jmp  0x0050778A
@ENDHACK


@HACK 0x0050779F,_hires_Net_Join_Side_Text_Print
    mov  edx,0x12
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,0x140
    add  ebx,[Hires.DeltaLeft]
    push ebx
    jmp  0x005077AD
@ENDHACK


@HACK 0x005077C2,_hires_Net_Join_Color_Text_Print
    mov  esi,0x12
    add  esi,[Hires.DeltaTop]
    push esi
    mov  edi,0x1F0
    add  edi,[Hires.DeltaLeft]
    push edi
    jmp  0x005077D0
@ENDHACK


@HACK 0x00507B48,0x00507B64,_hires_Net_Join_Color_Draw_Colored_Rectangles
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
@ENDHACK


@HACK 0x00507BBB,0x00507BC0,_hires_Net_Join_Color_Draw_Boxes
    add  edx,[Hires.DeltaTop]
    add  eax,[Hires.DeltaLeft]
    call Dialog___Draw_Box
    jmp  0x00507BC0
@ENDHACK


@HACK 0x00507BDC,0x00507BE1,_hires_Net_Join_Color_Draw_Boxes2
    add  edx,[Hires.DeltaTop]
    add  eax,[Hires.DeltaLeft]
    call Dialog___Draw_Box
    jmp  0x00507BE1
@ENDHACK


@HACK 0x0050854B,0x0050855F,_hires_Net_Join_Color_Box_Select_Thingy
    mov  edi,[ebp-0x80]
    add  edi,[Hires.DeltaTop]
    mov  eax,[edx+4]
    cmp  eax,edi
    jle  0x00508193
    mov  ecx,[ebp-0x84]
    add  ecx,[Hires.DeltaTop]
    cmp  eax,ecx
    jmp  0x0050855F
@ENDHACK


@HACK 0x00508525,0x0050853F,_hires_Net_Join_Color_Box_Select_Thingy2
    mov  ebx,[ebp-0x264]
    add  ebx,[Hires.DeltaLeft]
    cmp  ebx,[edx]
    jge  0x00508193
    mov  eax,[ebp-0x248]
    mov  ecx,[ebp-0x1A8]
    add  eax,[Hires.DeltaLeft]
    jmp  0x0050853F
@ENDHACK


@HACK 0x00508565,0x0050856B,_hires_Net_Join_Color_Box_Select_Thingy3
    mov  ecx,[ebp-0x264]
    add  ecx,[Hires.DeltaLeft]
    jmp  0x0050856B
@ENDHACK


;@HACK 0x00507DFB,0x00507E00,_hires_Net_Join_MessageBox
;;    cmp        eax,
;    add  edx,[Hires.DeltaTop]
;    call Dialog___Draw_Box
;    jmp  0x00507E00
;@ENDHACK


@HACK 0x00507F33,0x00507F40,_hires_Net_Join_Unit_Count_Text_Print
    ; ecx = 0000009F,esi = 000000B5
    mov  ecx,0x9F
    add  ecx,[Hires.DeltaTop]
    push ecx
    mov  esi,0xB5
    add  esi,[Hires.DeltaLeft]
    jmp  0x00507F40
@ENDHACK


@HACK 0x00507F97,0x00507FA4,_hires_Net_Join_Tech_Level_Text_Print
    ; edx= 000000AC,ebx = 000000B5
    mov  edx,0xAC
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,0xB5
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00507FA4
@ENDHACK


@HACK 0x00508016,0x00508023,_hires_Net_Join_Credits_Text_Print
    ; eax = 000000B9,edx = B5
    mov  eax,0xB9
    add  eax,[Hires.DeltaTop]
    push eax
    mov  edx,0xB5
    add  edx,[Hires.DeltaLeft]
    jmp  0x00508023
@ENDHACK


@HACK 0x00508074,0x00508081,_hires_Net_Join_AI_Players_Text_Print
    ; esi = 000000C6,edi = b5
    mov  esi,0xC6
    add  esi,[Hires.DeltaTop]
    push esi
    mov  edi,0xB5
    add  edi,[Hires.DeltaLeft]
    jmp  0x00508081
@ENDHACK


@HACK 0x00507887,0x00507894,_hires_Net_Join_Playing_As_Text_Print
    ; edx = 00000010,ebx = 00000140
    mov  edx,0x10
    add  edx,[Hires.DeltaTop]
    push edx
    mov  ebx,0x140
    add  ebx,[Hires.DeltaLeft]
    jmp  0x00507894
@ENDHACK