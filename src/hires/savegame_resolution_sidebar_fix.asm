;----------------------------------------------------------------
; src/hires/savegame_resolution_sidebar_fix.asm
;
; Fix the sidebar being incorrectly positioned after loading a save game
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HOOK 0x00538748 _Load_Game_Init_IO


%define    stripbariconswidthoffset        0x0060174C
%define selectbuttons                    0x0068A2C4
%define downbuttons                        0x0068A254
%define upbuttons                        0x0068A1E4

_Load_Game_Init_IO:
;    call    SidebarClass__One_Time
;    mov        eax, Globals___Map
    call SidebarClass__Init_IO
;    mov        dword [stripbariconswidthoffset], 50h
    mov  eax, Globals___Map

    push eax
    push ebx
    push edx
    push ecx
    push esi

    ;RadarClass stuff
    mov  eax, Globals___Map
    mov  edx, eax
    mov  dword [eax+0C98h], 0A0h
    mov  dword [eax+0C9Ch], 8Ch
    mov  ebx, [0x006807A8]
    mov  eax, [eax+0C98h]
    mov  dword [edx+0C90h], 0Eh
    mov  dword [edx+0CA8h], 80h
    mov  dword [edx+0CACh], 80h
    mov  dword [edx+0C8Ch], 6
    mov  dword [edx+0C94h], 7
    mov  dword [edx+0CA0h], 92h
    mov  dword [edx+0CA4h], 82h
    sub  ebx, eax
    mov  eax, edx
    mov  [edx+0C88h], ebx
    mov  eax, [edx+0C88h]
    mov  [0x006878F0], eax
    mov  eax, [edx+0C90h]
    mov  [0x006878F4], eax
    mov  eax, [edx+0C98h]
    mov  [0x006878F8], eax
    mov  eax, [edx+0C9Ch]
    mov  [0x006878FC], eax

    ;PowerClass stuff
;    mov        eax, Globals___Map
;    mov     edx, 1E0h       ; modified by hifi hires patch
;    add        edx, [diff_width]
;    mov     ebx, 0B4h
;    mov     ecx, 0Fh
;    mov     esi, 0DCh
;    mov     [0x006877CC], edx
;    mov     [0x006877D0], ebx
;    mov     [0x006877D4], ecx
;    mov     [0x006877D8], esi

    ;Sidebar stuff
    mov  eax, Globals___Map
    mov  ebx, eax

;    mov     edx, 1F0h       ; modified by hifi's hires patch
;    add        edx, [diff_width]

;    mov     ecx, 0A0h
;    mov     esi, 0C0h
;    mov     edi, 0B4h

;    mov     [0x0060174C], edx
;    mov     [0x00601754], ecx
;    mov     [0x00601758], esi
;    mov     [0x00601750], edi

    ;Left sidebar strip stuff
    mov  eax, Globals___Map
    mov  ebx, eax

    mov  ecx, 0x1F0
    mov  edx, 0x236
    add  ecx, [diff_width]
    add  edx, [diff_width]


    mov  dword [ebx+0x1053], 0x0B4 ; left strip offset top
    mov  dword [ebx+0x132F], 0x0B4 ; right strip offset top

    mov  dword [ebx+0x104F], ecx ; left strip offset left
    mov  dword [ebx+0x132B], edx ; right strip offset left

    mov  ebx, 0
    mov  eax, 0

.Loop:
    inc  ebx
    mov  [ExtendedSelectButtons+12+eax], ecx
    add  eax, 52
    cmp  ebx, CAMEO_ITEMS
    jle  .Loop

    sub  eax, 52

.Loop2:
    inc  ebx
    mov  [ExtendedSelectButtons+12+eax], edx
    add  eax, 52
    cmp  ebx, CAMEO_ITEMS*2
    jle  .Loop2

    mov  [selectbuttons+12], ecx
    mov  [selectbuttons+52+12], ecx
    mov  [selectbuttons+104+12], ecx
    mov  [selectbuttons+156+12], ecx
    mov  [selectbuttons+208+12], edx
    mov  [selectbuttons+260+12], edx
    mov  [selectbuttons+312+12], edx
    mov  [selectbuttons+364+12], edx

    mov  ecx, 532
    add  ecx, [diff_width]
    mov  [downbuttons+12], ecx

    mov  ecx, 602
    add  ecx, [diff_width]
    mov  [downbuttons+12+56], ecx

    mov  ecx, 500
    add  ecx, [diff_width]
    mov  [upbuttons+12], ecx

    mov  ecx, 570
    add  ecx, [diff_width]
    mov  [upbuttons+12+56], ecx

    pop  eax
    pop  ebx
    pop  edx
    pop  ecx
    pop  esi

    jmp  0x0053874D
