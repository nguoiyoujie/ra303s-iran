;----------------------------------------------------------------
; src/features/hires/gamesidebar_extension.asm
;
; Bulk code for extending the sidebar in custom resolutions
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
; modify call at 0x0054D823 to use custom sidebar graphics and draw it multiple times below each other

;@LJMP 0x005277A6,_PowerClass_Draw_It_hires3

; These are per strip, there's a left and right strip in the sidebar
; 208 / 52 = 4 items
; 30 cameo icons times 48 is 1440 pixels plus 181 (start of icon drawing plus 27 (buttons)
; gives about 1650 vertical height to support
; Height of up and down buttons is 27 pixels
; Drawing of icons starts at height 181, every extra icon is 48 extra pixels
;[23:58:21] <iran> so
;[23:58:42] <iran> IngameHeight-181-27 / 48 for total amount of possible icons

extern Conquer___CC_Draw_Shape
extern MFCD__Retrieve
extern SidebarClass__StripClass__Flag_To_Redraw
extern SidebarClass__StripClass__Add
extern GScreenClass__Flag_To_Redraw
extern Globals___Map

%define StripBarAreaVerticalSize 0x00601758

[section .data]
CameoItems dd 0 ; Cameo icons to draw the per strip
CurrentStripIndex dd 0 ; variable used for strip.shp drawing
CurrentStripFrame dd 0 ; variable used for strip.shp frame
CurrentStripDrawPosition dd 0 ; variable for strip.shp drawing height position
CurrentPowerBarDrawPosition dd 0 ; variable used for pwrbar.shp no power bar drawing height position
CurrentPowerBarDrawPosition2 dd 0 ; variable used for pwrbar.shp with power bar drawing height position
PowerBarBottomPos dd 0 ; variable used for
PowerTileShape dd 0
Side4Shape dd 0
Strip2Shape dd 0


[section .rdata]
powerext_str db"POWEREXT.SHP",0
side4na_str db"SIDE4NA.SHP",0
side4us_str db"SIDE4US.SHP",0
strip2na_str db"STRIP2NA.SHP",0
strip2us_str db"STRIP2US.SHP",0


@HACK 0x00527771,0x00527776,_PowerClass_Draw_it_hires11
    mov  ebx,0x18E
    add  ebx,[Hires.DeltaHeight]
    sub  ebx,47
    jmp  0x00527776
@ENDHACK


@HACK 0x00527C19,0x00527C23,_PowerClass_Draw_it_hires10
    mov  eax,[0x006877B8] ; ds:void *PowerClass::PowerShape
    cmp  dword[ebp-0x2C],0
    je   .No_Draw
.Draw:
    call Conquer___CC_Draw_Shape
.No_Draw:
    jmp  0x00527C23
@ENDHACK


@HACK 0x0052789B,0x005278A0,_PowerClass_Draw_it_hires9
    mov  dword edx,[PowerBarBottomPos]
    jmp  0x005278A0
@ENDHACK


@HACK 0x00527863,0x0052786A,_PowerClass_Draw_it_hires8
    push ebx
    push edx
    imul eax,100
    mov  ebx,130
    cdq  ; sign-extend eax into edx
    idiv ebx
    mov  dword ebx,[PowerBarBottomPos]
    sub  ebx,220
    imul eax,ebx
    mov  ebx,100
    cdq  ; sign-extend eax into edx
    idiv ebx
    pop  edx
    pop  ebx
    add  eax,edx
    mov  edx,eax
    shl  eax,4
    jmp  0x0052786A
@ENDHACK


@HACK 0x00527885,0x0052788C,_PowerClass_Draw_it_hires7
    push ebx
    push edx
    imul eax,100
    mov  ebx,130
    cdq  ; sign-extend eax into edx
    idiv ebx
    mov  dword ebx,[PowerBarBottomPos]
    sub  ebx,220
    imul eax,ebx
    mov  ebx,100
    cdq  ; sign-extend eax into edx
    idiv ebx
    pop  edx
    pop  ebx
    add  eax,esi
    mov  edx,eax
    shl  edx,4
    jmp  0x0052788C
@ENDHACK


;@HACK 0x00527A67,_PowerClass_Draw_it_hires6
;    mov  ecx,[0x0060BA70] ; ds:int HardwareFills
;    add  eax,[Hires.DeltaHeight]
;    mov  [ebp-0x34],eax
;    jmp  0x00527A70
;@ENDHACK


@HACK 0x005278B7,0x005278BC,_PowerClass_Draw_it_hires5
    mov  dword eax,[PowerBarBottomPos]
    jmp  0x005278BC
@ENDHACK


;@HACK 0x00527C19,_PowerClass_Draw_it_hires4
;    mov  eax,[0x006877B8] ; ds:void *PowerClass::PowerShape
;    add  ecx,[Hires.DeltaHeight]
;    jmp  0x00527C1E
;@ENDHACK


@HACK 0x0054D353,0x0054D359,_SidebarClass_Reload_Sidebar_hires
    ; Load side specific graphics
    mov  eax,[edx+0x3E]
    sar  eax,0x18
    push eax

    cmp  dword eax,2
    jz   .Load_Soviet_Sidebar
    cmp  dword eax,4
    jz   .Load_Soviet_Sidebar
    cmp  dword eax,9
    jz   .Load_Soviet_Sidebar

.Load_Allied_Sidebar:
    mov  eax,side4na_str
    call MFCD__Retrieve 
    mov  [Side4Shape],eax
    mov  eax,strip2na_str
    call MFCD__Retrieve 
    mov  [Strip2Shape],eax
    pop  eax
    jmp  0x0054D359

.Load_Soviet_Sidebar:
    mov  eax,side4us_str
    call MFCD__Retrieve 
    mov  [Side4Shape],eax
    mov  eax,strip2us_str
    call MFCD__Retrieve 
    mov  [Strip2Shape],eax
    pop  eax
    jmp  0x0054D359
@ENDHACK


@HACK 0x0052761D,0x00527622,_PowerClass_One_Time
    mov  [0x006877BC],eax ; ds:void *PowerClass::PowerBarShape
    mov  eax,powerext_str
    call MFCD__Retrieve 
    mov  [PowerTileShape],eax
    jmp  0x00527622
@ENDHACK


@HACK 0x00527743,0x00527748,_PowerClass_Draw_It_hires2
    ; Draw the whole powerbar graphics with power bar till bottom of screen
    call Conquer___CC_Draw_Shape
    mov  ecx,288
    mov  [CurrentPowerBarDrawPosition2],ecx
.Loop:
    push 0x100            ; zoom?
    push 0               ; Rotation
    push 0               ; __int32
    mov  edx,[ebp-0x28]
    push edx             ; __int32
    push esi             ; __int32
    mov  ecx,dword[CurrentPowerBarDrawPosition2]
    mov  ebx,0x1E0
    add  ebx,[Hires.DeltaWidth]
    push 0               ; __int32
    mov  eax,[PowerTileShape]
;    mov     eax,[0x006877BC]
    xor  edx,edx
    call Conquer___CC_Draw_Shape
    mov  dword ecx,[CurrentPowerBarDrawPosition2]
    add  dword[CurrentPowerBarDrawPosition2],48
    mov  dword ebx,[CameoItems]
    imul ebx,48
    add  ebx,181
    sub  ebx,48
    cmp  ecx,ebx
    jl   .Loop
    mov  dword[CurrentPowerBarDrawPosition2],0
    jmp  0x00527748
@ENDHACK


@HACK 0x0054EC67,_StripClass_Recalc_hires
    ; Fix graphical glitching when selling conyard and other situations
    mov  eax,Globals___Map
    call GScreenClass__Flag_To_Redraw
    pop  edi
    pop  esi
    pop  edx
    pop  ecx
    pop  ebx
    pop  ebp
    retn
@ENDHACK


@HACK 0x00527756,_PowerClass_Draw_It_hires
    mov  dword ecx,[CameoItems]
    imul ecx,48
    add  ecx,27
    add  ecx,181
    sub  ecx,112
    jmp  0x0052775B
@ENDHACK


@HACK 0x0054D803,_SidebarClass_Draw_It
    mov  dword[CurrentStripDrawPosition],276
.Loop:
    push 0x100            ; __int32
    push 0               ; Rotation
    push 0               ; __int32
    push 0               ; __int32
    push 0x10             ; __int32
    mov  dword ecx,[CurrentStripDrawPosition]
    mov  ebx,0x1E0
    add  ebx,[Hires.DeltaWidth]
    push 0               ; __int32
    mov  eax,[Side4Shape]
    mov  edx,edi
    call Conquer___CC_Draw_Shape
    add  dword[CurrentStripDrawPosition],48
    mov  dword ecx,[CurrentStripDrawPosition]
    mov  dword ebx,[Globals___ScreenHeight]
    sub  ebx,75
    cmp  ecx,ebx
    jle  .Loop
    mov  dword[CurrentStripDrawPosition],0
    jmp  0x0054D828
@ENDHACK


@HACK 0x00538FD1,_Load_Game_hires
    ; Fix up button vertical position and visible icon area size when loading save games
    push ebx
    mov  eax,[CameoItems]
    mov  edx,48
    imul eax,edx
    mov  dword[StripBarAreaVerticalSize],eax
    mov  dword ebx,[CameoItems]
    imul ebx,48
    add  ebx,180
    mov  [SidebarClass__StripClass__DownButton+16],ebx ; Up and down buttons height
    mov  [SidebarClass__StripClass__DownButton+16+56],ebx
    mov  [SidebarClass__StripClass__UpButton+16],ebx
    mov  [SidebarClass__StripClass__UpButton+16+56],ebx
    ;Scroll up cameo list to top for right sidebar if it would be glitched
    mov  eax,Globals___Map
    lea  eax,[eax+0x131A]
    mov  edx,[eax+0x25] ; Current cameo item in sidebar
    mov  ebx,[eax+0x35] ; Max cameo item in sidebar
    add  edx,[CameoItems]
    cmp  edx,ebx
    jle  .No_Cameo_list_Right_Strip_Reset
;    mov        ebx,[eax+0x35]
;    sub        ebx,[CameoItems]
;    mov        dword[eax+0x25],ebx ; Set it to the legit max scroll
    mov  dword[eax+0x25],0 ; Reset it
.No_Cameo_list_Right_Strip_Reset:
    ;Scroll up cameo list to top for left sidebar if it would be glitched
    mov  eax,Globals___Map
    lea  eax,[eax+0x103E]
    mov  edx,[eax+0x25] ; Current cameo item in sidebar
    mov  ebx,[eax+0x35] ; Max cameo item in sidebar
    add  edx,[CameoItems]
    cmp  edx,ebx
    jle  .No_Cameo_list_Left_Strip_Reset
;    mov        ebx,[eax+0x35]
;    sub        ebx,[CameoItems]
;    mov        dword[eax+0x25],ebx ; Set it to the legit max scroll
    mov  dword[eax+0x25],0 ; Reset it
.No_Cameo_list_Left_Strip_Reset:
    pop  ebx
    mov  eax,ebx
    lea  esp,[ebp-0x14]
    jmp  0x00538FD6
@ENDHACK


@HACK 0x0054D644,_SidebarClass_Add_hires
    ; Fix graphical glitching when new icons are added to sidebar
    mov  edx,esi
    call SidebarClass__StripClass__Add
    push eax
    mov  esi,Globals___Map
    lea  eax,[esi+0x103E]
    call SidebarClass__StripClass__Flag_To_Redraw
    mov  esi,Globals___Map
    lea  eax,[esi+0x131A]
    call SidebarClass__StripClass__Flag_To_Redraw
    pop  eax
    jmp  0x0054D64B
@ENDHACK


@HACK 0x0054E74F,_StripClass_Draw_It_hires3
    ; Draw strip.shp background over each cameo
    call Conquer___CC_Draw_Shape
    mov  dword[CurrentStripIndex],372
.Loop:
    push 0x100
    push 0
    push 0
    push 0
    mov  eax,[Strip2Shape]
;    mov     eax,[0x0068A464]; ds:void *SidebarClass::StripClass::LogoShapes
    push 0x10             ; __int32
    mov  ecx,[CurrentStripIndex]
    mov  ebx,[esi+0x11]
    push 0               ; __int32
    mov  edx,[esi+0x19]
    add  ebx,4
    call Conquer___CC_Draw_Shape
    add  dword[CurrentStripIndex],48
    mov  dword ecx,[CurrentStripIndex]
    mov  dword ebx,[Globals___ScreenHeight]
    sub  ebx,75
    cmp  ecx,ebx
    jle  .Loop
    mov  dword[CurrentStripIndex],0
    jmp  0x0054E754
@ENDHACK


@HACK 0x0054E2AD,_StripClass_Scroll_hires
    add  edx,[CameoItems]
    cmp  edx,ebx
    jmp  0x0054E2B2
@ENDHACK


@HACK 0x0054E000,_StripClass_Init_IO_Up_Down_Buttons_hires
    ; Fix up up and down buttons vertical height
    mov  dword ebx,[CameoItems]
    imul ebx,48
    add  ebx,181
    mov  [SidebarClass__StripClass__DownButton+16],ebx ; Up and down buttons height
    mov  [SidebarClass__StripClass__DownButton+16+56],ebx
    mov  [SidebarClass__StripClass__UpButton+16],ebx
    mov  [SidebarClass__StripClass__UpButton+16+56],ebx
    pop  edi
    pop  esi
    pop  ecx
    pop  ebx
    pop  ebp
    retn
@ENDHACK


@HACK 0x0054E425,0x0054E42B,_StripClass_AI_hires
    add  eax,[CameoItems]
    cmp  eax,[edx+0x35]
    jmp  0x0054E42B
@ENDHACK


@HACK 0x0054E142,0x0054E14E,_StripClass_Activate_hires
    imul eax,[ecx+0x19],CAMEOS_SIZE
    add  eax,Hires.ExtSidebarButtons
    jmp  0x0054E14E
@ENDHACK


@HACK 0x0054E156,0x0054E163,_StripClass_Activate_hires2
    imul edx,[ecx+0x19],CAMEOS_SIZE
    add  edx,Hires.ExtSidebarButtons
    jmp  0x0054E163
@ENDHACK


@HACK 0x0054E172,0x0054E178,_StripClass_Activate_hires3
    mov  edx,[CameoItems]
    imul edx,edx,52
    cmp  ebx,edx
    jmp  0x0054E178
@ENDHACK


@HACK 0x0054CF47,0x0054CF51,_SidebarClass_fn_init_hires
    ; Initialize extended invisible select buttons
    mov  edx,CAMEO_ITEMS*2 ; amount of total items to init
    mov  eax,Hires.ExtSidebarButtons
    mov  [0x00604D68],eax
    jmp  0x0054CF51
@ENDHACK


@HACK 0x0054DFAE,0x0054DFBA,_StripClass_Init_IO_hires
    imul eax,[ecx+0x19],CAMEOS_SIZE
    add  eax,Hires.ExtSidebarButtons
    jmp  0x0054DFBA
@ENDHACK


@HACK 0x0054DFF8,0x0054DFFD,_StripClass_Init_IO_hires2
    cmp  esi,[CameoItems] ; items check
    jl   0x0054DFAE
    jmp  0x0054DFFD
@ENDHACK


@HACK 0x0054E1CC,0x0054E1D9,_StripClass_Deactivate_hires
    imul edx,[ecx+0x19],CAMEOS_SIZE
    add  edx,Hires.ExtSidebarButtons
    jmp  0x0054E1D9
@ENDHACK


@HACK 0x0054E1E8,0x0054E1EE,_StripClass_Deactivate_hires2
    cmp  ebx,CAMEOS_SIZE
    jmp  0x0054E1EE
@ENDHACK


@HACK 0x0054E9C2,0x0054E9C7,_StripClass_Draw_It_hires
    add  eax,[CameoItems]
    cmp  eax,edx
    jmp  0x0054E9C7
@ENDHACK


;@HACK 0x004A6BA4,_StripClass_Draw_It_hires2
;;    add     eax,CAMEO_ITEMS*2; items to draw
;    mov  dword edi,[CameoItems]
;    imul edi,2
;    add  eax,edi ; items to draw
;    cmp  eax,ecx
;    jmp  0x004A6BA9
;@ENDHACK


@HACK 0x0054D0B1,0x0054D0B7,_SidebarClass_One_TIme_Icon_Area_Size_hires
    ; Calculate CameoItems and set StripBarAreaVerticalSize
    push ecx
    push edx
    push ebx
    push eax
    push esi
    push edi
    mov  eax,[Globals___ScreenHeight]
    sub  eax,180
    sub  eax,27
    cdq  ; sign-extend eax into edx
    mov  ebx,48
    idiv ebx
    ; If CameoItems would be higher than the max cameo items hardcoded to support
    ; set CameoItems to CAMEO_ITEMS instead of the value we calculated
    cmp  eax,CAMEO_ITEMS
    jl   .Dont_Set_Max_Cameos
    mov  eax,CAMEO_ITEMS
.Dont_Set_Max_Cameos:
    mov  dword[CameoItems],eax
    mov  eax,[CameoItems]
    mov  edx,48
    imul eax,edx
    mov  dword[StripBarAreaVerticalSize],eax
    mov  dword ecx,[CameoItems]
    imul ecx,48
    add  ecx,27
    add  ecx,181
    sub  ecx,42
    mov  dword[PowerBarBottomPos],ecx
    pop  edi
    pop  esi
    pop  eax
    pop  ebx
    pop  edx
    pop  ecx
    jmp  0x0054D0B7
@ENDHACK

