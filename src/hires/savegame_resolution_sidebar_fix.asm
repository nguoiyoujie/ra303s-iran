;----------------------------------------------------------------
; src/hires/savegame_resolution_sidebar_fix.asm
;
; Fix the sidebar being incorrectly positioned after loading a save game
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

%define stripbariconswidthoffset        0x0060174C
%define selectbuttons                    0x0068A2C4
%define downbuttons                        0x0068A254
%define upbuttons                        0x0068A1E4

@HACK 0x00538748,0x0053874D,_Load_Game_Init_IO
;    call    SidebarClass__One_Time
;    mov        eax,Globals___Map
    call SidebarClass__Init_IO
;    mov        dword[stripbariconswidthoffset],0x50
    mov  eax,Globals___Map
    push eax
    push ebx
    push edx
    push ecx
    push esi
    ;RadarClass stuff
    mov  eax,Globals___Map
    mov  edx,eax
    mov  dword[eax+0xC98],0xA0
    mov  dword[eax+0xC9C],0x8C
    mov  ebx,[0x006807A8]
    mov  eax,[eax+0xC98]
    mov  dword[edx+0xC90],0xE
    mov  dword[edx+0xCA8],0x80
    mov  dword[edx+0xCAC],0x80
    mov  dword[edx+0xC8C],6
    mov  dword[edx+0xC94],7
    mov  dword[edx+0xCA0],0x92
    mov  dword[edx+0xCA4],0x82
    sub  ebx,eax
    mov  eax,edx
    mov  [edx+0xC88],ebx
    mov  eax,[edx+0xC88]
    mov  [0x006878F0],eax
    mov  eax,[edx+0xC90]
    mov  [0x006878F4],eax
    mov  eax,[edx+0xC98]
    mov  [0x006878F8],eax
    mov  eax,[edx+0xC9C]
    mov  [0x006878FC],eax

    ;PowerClass stuff
;    mov        eax,Globals___Map
;    mov     edx,0x1E0       ; modified by hifi hires patch
;    add        edx,[Hires.DeltaWidth]
;    mov     ebx,0xB4
;    mov     ecx,0xF
;    mov     esi,0xDC
;    mov     [0x006877CC],edx
;    mov     [0x006877D0],ebx
;    mov     [0x006877D4],ecx
;    mov     [0x006877D8],esi

    ;Sidebar stuff
    mov  eax,Globals___Map
    mov  ebx,eax

;    mov     edx,0x1F0       ; modified by hifi's hires patch
;    add        edx,[Hires.DeltaWidth]
;    mov     ecx,0xA0
;    mov     esi,0xC0
;    mov     edi,0xB4
;    mov     [0x0060174C],edx
;    mov     [0x00601754],ecx
;    mov     [0x00601758],esi
;    mov     [0x00601750],edi

    ;Left sidebar strip stuff
    mov  eax,Globals___Map
    mov  ebx,eax
    mov  ecx,0x1F0
    mov  edx,0x236
    add  ecx,[Hires.DeltaWidth]
    add  edx,[Hires.DeltaWidth]
    mov  dword[ebx+0x1053],0xB4 ; left strip offset top
    mov  dword[ebx+0x132F],0xB4 ; right strip offset top
    mov  dword[ebx+0x104F],ecx ; left strip offset left
    mov  dword[ebx+0x132B],edx ; right strip offset left
    xor  ebx,ebx
    xor  eax,eax
.Loop:
    inc  ebx
    mov  [ExtendedSelectButtons+12+eax],ecx
    add  eax,52
    cmp  ebx,CAMEO_ITEMS
    jle  .Loop
    sub  eax,52
.Loop2:
    inc  ebx
    mov  [ExtendedSelectButtons+12+eax],edx
    add  eax,52
    cmp  ebx,CAMEO_ITEMS*2
    jle  .Loop2
    mov  [selectbuttons+12],ecx
    mov  [selectbuttons+52+12],ecx
    mov  [selectbuttons+104+12],ecx
    mov  [selectbuttons+156+12],ecx
    mov  [selectbuttons+208+12],edx
    mov  [selectbuttons+260+12],edx
    mov  [selectbuttons+312+12],edx
    mov  [selectbuttons+364+12],edx
    mov  ecx,532
    add  ecx,[Hires.DeltaWidth]
    mov  [downbuttons+12],ecx
    mov  ecx,602
    add  ecx,[Hires.DeltaWidth]
    mov  [downbuttons+12+56],ecx
    mov  ecx,500
    add  ecx,[Hires.DeltaWidth]
    mov  [upbuttons+12],ecx
    mov  ecx,570
    add  ecx,[Hires.DeltaWidth]
    mov  [upbuttons+12+56],ecx
    pop  eax
    pop  ebx
    pop  edx
    pop  ecx
    pop  esi
    jmp  0x0053874D
@ENDHACK
