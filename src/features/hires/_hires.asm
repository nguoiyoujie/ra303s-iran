;----------------------------------------------------------------
; src/features/hires/_hires.asm
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
; originally derived from ra95-hires

; /include
%include "macros/patch.inc"
%include "macros/hack.inc"
%include "macros/datatypes.inc"
%include "libc.inc"
%include "types/INIClass.inc"
%include "types/CCINIClass.inc"
%include "types/common.inc"

cextern _Buffer_Fill_Rect
cextern _Buffer_Clear
cextern Dialog___Draw_Box
cextern MapClass__In_Radar
cextern GaugeClass__GaugeClass
cextern GScreenClass__Flag_To_Redraw
cextern Globals___ScreenWidth
cextern Globals___ScreenHeight
cextern Globals___Keyboard
cextern Globals___Map
cextern Globals___VisiblePage
cextern Globals___SeenBuff
cextern Globals___HidPage
cextern DDraw___MainWindow
cextern SidebarClass__StripClass__SelectButton
cextern SidebarClass__StripClass__DownButton
cextern SidebarClass__StripClass__UpButton

cextern str_Options
cextern str_Width
cextern str_Height

cextern RedAlert.Options.VideoInterlaceMode


; These are per strip,there's a left and right strip in the sidebar
%define CAMEO_ITEMS    30
%define CAMEOS_SIZE    1560 ; memory size of all cameos in byte


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
Hires.ScoreBackground   db 0
Hires.ExtSidebarButtons TIMES 824 dd 0


%macro hires_Clear 0
    push 0xC
    push Globals___HidPage
    call _Buffer_Clear
    add  esp,8
%endmacro

%macro hires_Clear_2 0
    push 0
    push Globals___VisiblePage
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
    mov  dword[Globals___ScreenWidth],eax
.Height:
    call_INIClass__Get_Int ebp-0x54,str_Options,str_Height,400
    test eax,eax
    je   .Calc
    mov  dword[Globals___ScreenHeight],eax
.Calc:
    ; adjust width
    mov  eax,[Globals___ScreenWidth]
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
    mov  ebx,[Globals___ScreenHeight]
    sub  edx,640
    sub  ebx,400
    mov  [Hires.DeltaWidth],edx
    mov  [Hires.DeltaHeight],ebx
    ; adjust top and left
    mov  eax,[Globals___ScreenHeight]
    shr  eax,1
    sub  eax,200
    mov  [Hires.DeltaTop],eax
    mov  eax,[Globals___ScreenWidth]
    shr  eax,1
    sub  eax,320
    mov  [Hires.DeltaLeft],eax
    mov  edx,[Hires.AdjustedWidth]
    mov  ebx,[Globals___ScreenHeight]

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


@HACK 0x005525D7,0x005525ED,_Set_Screen_Height_400_NOP
    cmp  dword[Hires.Pseudo480Height],1
    je   .No_Change
    jmp  0x00552628
.No_Change:
    mov  dword[Globals___ScreenHeight],0x190
    jmp  0x005525ED
@ENDHACK


@HACK 0x005523C6,0x005523CE,_Set_Screen_Height_480_NOP
    mov  dword[Globals___ScreenHeight],ebx
    mov  dword[Hires.Pseudo480Height],1
    jmp  0x005523EE
@ENDHACK

; subsections
%include "src/features/hires/background.asm"
%include "src/features/hires/buffers.asm"
%include "src/features/hires/expansiondialog.asm"
%include "src/features/hires/fetchdifficultydialog.asm"
%include "src/features/hires/gamefield.asm"
%include "src/features/hires/gamesidebar.asm"
%include "src/features/hires/gamesidebar_extension.asm"
%include "src/features/hires/gametabs.asm"
%include "src/features/hires/loadgamedialog.asm"
%include "src/features/hires/mainmenu.asm"
%include "src/features/hires/netdialog.asm"
%include "src/features/hires/reconnectdialog.asm"
%include "src/features/hires/remotefiledialog.asm"
%include "src/features/hires/screenshake.asm"
%include "src/features/hires/selectmultiplayerdialog.asm"
%include "src/features/hires/skirmishdialog.asm"
%include "src/features/hires/soundcontrolsdialog.asm"
%include "src/features/hires/video_enhancements.asm"
; color options dialog?
%include "src/features/hires/surrenderdialog.asm"

; additional features
%include "src/features/hires/multiplayer_print_is_aftermath_game.asm"
; fixes
%include "src/features/hires/savegame_resolution_sidebar_fix.asm"
%include "src/features/hires/clamp_mouse_position.asm"
