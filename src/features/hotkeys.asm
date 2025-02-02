;----------------------------------------------------------------
; src/features/hotkeys.asm
;
; Enabled hotkeys.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

cextern GScreenClass__Flag_To_Redraw
cextern Globals___Options_KeyResign
cextern Globals___Map
cextern Globals___Session_Type


@SJMP 0x0054D916,0x0054D91B ; _Patch_Out_Erroneous_Sidebar_Activate_CALL
@SJMP 0x004A6206,0x004A6221 ; _UnhardCode_Keyboard_Key0
@SJMP 0x004A61D3,0x004A61EE ; _UnhardCode_Keyboard_Key9
@SJMP 0x004A61A0,0x004A61BB ; _UnhardCode_Keyboard_Key8
@SJMP 0x004A616D,0x004A6188 ; _UnhardCode_Keyboard_Key7
@SJMP 0x004A613A,0x004A6155 ; _UnhardCode_Keyboard_Key6
@SJMP 0x004A6107,0x004A6122 ; _UnhardCode_Keyboard_Key5
@SJMP 0x004A60D4,0x004A60EF ; _UnhardCode_Keyboard_Key4
@SJMP 0x004A60A1,0x004A60BC ; _UnhardCode_Keyboard_Key3
@SJMP 0x004A606E,0x004A6089 ; _UnhardCode_Keyboard_Key2
@SJMP 0x004A603E,0x004A6056 ; _UnhardCode_Keyboard_Key1

[section .data] 
ResignKeyPressed: dd 0


@HACK 0x004A5753,0x004A5760,_Keyboard_Process_Home_Key_Overwrite
    cmp  word ax,[RedAlert.WinHotKeys.KeySidebarToggle]
    jz   .Toggle_Sidebar
    cmp  word ax,[RedAlert.WinHotKeys.KeyMapSnapshot]
    jz   .Map_Snapshot
    cmp  word ax,[Globals___Options_KeyResign]
    jz   .Resign_Key

.Out:
    cmp  ax,[0x006681B4] ; KeyNext
    jnz  0x004A57DF
    jmp  0x004A5760

.Toggle_Sidebar:
    push eax

.Lock_Graphics_Buffer:
;    mov eax,0 ; Crash
    mov  eax,Globals___Map
    mov  edx,0xFFFFFFFF
    call 0x0054DA70 ;  SidebarClass::Activate(int)

    mov  eax,[0x006807E8] ; ds:GraphicBufferClass__Something
    call 0x005C101A ; GraphicBufferClass::Lock(void)
    test eax,eax
    jz   .Clear_Buffer
    mov  edx,[0x006807E8] ;  ds:GraphicBufferClass__Something
    cmp  edx,0x006807CC ; offset GraphicViewPortClass HidPage
    jz   .EAX_One
    mov  ebx,[0x006807D4]
    push ebx             ; __int32
    mov  ecx,[0x006807D0]
    mov  eax,0x006807CC ; offset GraphicViewPortClass HidPage
    push ecx             ; __int32
    mov  ebx,[0x006807DC]
    mov  ecx,[0x006807E0]
    call 0x005C094F ; GraphicViewPortClass::Attach(GraphicBufferClass *,int,int,int,int)

.EAX_One:
    mov  eax,1

.Clear_Buffer:
    push 0
    push 0x006807CC; offset GraphicViewPortClass HidPage
    call 0x005C4DE0 ; _Buffer_Clear
    add  esp,8

.Unlock_Graphics_Buffer:
    mov  eax,[0x006807E8] ; ds:GraphicBufferClass__Something
    call 0x005C1191 ; GraphicBufferClass::Unlock(void)
    test eax,eax
    jz   .Redraw_Screen
    mov  eax,[0x006807E8] ; ds:GraphicBufferClass__Something
    cmp  eax,0x006807CC ; offset GraphicViewPortClass HidPage
    jz   .Redraw_Screen
    cmp  dword[0x006807EC],0
    jz   .Redraw_Screen
    mov  ebx,[eax+0x24]
    test ebx,ebx
    jnz  .Redraw_Screen
    mov  [0x006807CC],ebx

.Redraw_Screen:
    mov  edx,1
    mov  eax,Globals___Map
    call GScreenClass__Flag_To_Redraw
    mov  eax,Globals___Map
    call 0x004CB110 ; GScreenClass::Render()
    pop  eax
    jmp  .Out

.Resign_Key:
    push eax
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jz   .Out
    mov  dword[ResignKeyPressed],1
    call 0x00528DCC ; Queue_Options(void)
    pop  eax
    jmp  .Out

.Map_Snapshot:
    call Create_Map_Snapshot
    jmp  .Out
@ENDHACK


@HACK 0x004C9F46,0x004C9F4E,_RedrawOptionsMenu_Add_Surrender_Dialog_Flag_Check
    cmp  dword[ResignKeyPressed],0
    jnz  0x004CA9C9
.Out:
    test eax,eax
    jle  0x004CA15E
    jmp  0x004C9F4E
@ENDHACK


@HACK 0x004CAA29,0x004CAA2E,_RedrawOptionsMenu_Add_Surrender_Dialog_Flag_Check2
    cmp  dword[ResignKeyPressed],0
    jz   0x004CA7A5
    mov  dword[ResignKeyPressed],0
    lea  esp,[ebp-0x14]
    pop  edi
    pop  esi
    pop  edx
    pop  ecx
    pop  ebx
    pop  ebp
    retn
@ENDHACK
