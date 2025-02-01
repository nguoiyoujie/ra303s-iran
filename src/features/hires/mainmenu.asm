;----------------------------------------------------------------
; src/features/hires/mainmenu.asm
;
; Apply hi-res features to the main menu, as well as clickable features on the main menu
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------


; title screen
@HACK 0x005B3DAA,0x005B3DAF,_Load_Title_Screen_Clear_Background
    mov  eax,1
    hires_Clear
    jmp  0x005B3DAF
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


@HACK 0x005B3DBF,0x005B3DC7,_hires_MainMenu
    mov  ebx,[Hires.DeltaTop]
    mov  eax,[Hires.DeltaLeft]
    cmp  byte[Hires.ScoreBackground],1
    je   .Display_Top_Left
    cmp  edx,0x190
    je   .Jump_Background_Skip
.Display_Top_Left:
    xor  ebx,ebx
    xor  eax,eax
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


@HACK 0x005024AF,0x005024C5,_hires_MainMenu_Credits_Select
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
@ENDHACK


@HACK 0x0050253A,0x0050254D,_hires_MainMenu_AntMissions_Select
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
@ENDHACK