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
cextern TargetClass__TargetClass_Target
cextern TargetClass__TargetClass_AbstractClass
cextern EventClass__EventClass

cextern RedAlert.WinHotKeys.KeySidebarToggle
cextern RedAlert.WinHotKeys.KeyMapSnapshot
cextern RedAlert.WinHotKeys.KeyDeploy


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
ResignKeyPressed: db 0

;@SET 0x004a59ee,{mov ebx,0xF}

@HACK 0x004A5753,0x004A5760,_Keyboard_Process_Home_Key_Overwrite
    cmp  word ax,[RedAlert.WinHotKeys.KeySidebarToggle]
    je   .Toggle_Sidebar
    cmp  word ax,[RedAlert.WinHotKeys.KeyMapSnapshot]
    je   .Map_Snapshot
    cmp  word ax,[Globals___Options_KeyResign]
    je   .Resign_Key

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
    call GraphicBufferClass__Lock ; GraphicBufferClass::Lock(void)
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
    call GraphicViewPortClass__Attach

.EAX_One:
    mov  eax,1

.Clear_Buffer:
    push 0
    push 0x006807CC; offset GraphicViewPortClass HidPage
    call 0x005C4DE0 ; _Buffer_Clear
    add  esp,8

.Unlock_Graphics_Buffer:
    mov  eax,[0x006807E8] ; ds:GraphicBufferClass__Something
    call GraphicBufferClass__Unlock ; GraphicBufferClass::Unlock(void)
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
    mov  byte[ResignKeyPressed],1
    call 0x00528DCC ; Queue_Options(void)
    pop  eax
    jmp  .Out

.Map_Snapshot:
    call Create_Map_Snapshot
    jmp  .Out
@ENDHACK


@HACK 0x004A595E,0x004A5964,_Keyboard_Process_D_Key_Overwrite
    je   0x004A5964
    cmp  word ax,[RedAlert.WinHotKeys.KeyDeploy]
    je   .Event_Deploy
.Out:
    jmp  0x004A5A48
.Event_Deploy:
    mov  eax,[0x00667808] ; CurrentObject
    test eax,eax
    jz   .Out
    xor  edi,edi
    mov  [ebp-0x20],edi
    mov  [ebp-0x54],edi
    jmp  .Deploy.Loop
.Deploy.Repeat:
    mov  ecx,[ebp-0x54]
    mov  esi,[ebp-0x20]
    add  ecx,4
    inc  esi
    mov  [ebp-0x54],ecx
    mov  [ebp-0x20],esi
.Deploy.Loop:
    mov  edx,[ebp-0x20]
    cmp  edx,[0x00667808]
    jge  .Deploy.Skip
    mov  ecx,[ebp-0x54]
    mov  ebx,[0x006677F8]
    add  ebx,ecx
    mov  ebx,[ebx]
    test ebx,ebx ; tech != NULL
    jz   .Deploy.Repeat
    mov  ecx,[ebx+0x11]
    mov  eax,ebx
    mov  edx,ebx
    call [ecx+0x24] ; tech->What_Action(tech)
    cmp  eax,4 ; ACTION_SELF
    jne  .Deploy.Repeat

    lea  eax,[ebp-0x44]
    xor  edx,edx
    mov  [ebp-0x40],eax
    call TargetClass__TargetClass_Target
    mov  esi,[ebp-0x40]
    lea  eax,[ebp-0x48]
    push esi
    xor  edx,edx
    mov  [ebp-0x3C],eax
    call TargetClass__TargetClass_Target
    lea  eax,[ebp-0x4C]
    mov  edx,ebx
    mov  ecx,[ebp-0x3C]
    call TargetClass__TargetClass_AbstractClass
    mov  ebx,MissionType.MISSION_UNLOAD
    mov  edx,eax
    lea  eax,[ebp-0x94]
    call EventClass__EventClass
    cmp  dword[0x0066AB5C],0x40
    jge  .Deploy.Repeat
    mov  edx,[0x0066AB64]
    imul edi,edx,0x14
    mov  esi,eax
    add  edi,0x0066AB68
    movsd
    movsd
    movsd
    movsd
    movsd
    lea  eax,[edx+1]
    mov  ebx,[0x0066AB5C]
    and  eax,0x3F
    inc  ebx
    mov  [0x0066AB64],eax
    mov  [0x0066AB5C],ebx
    jmp  .Deploy.Repeat
.Deploy.Skip:
    jmp  0x004A5A40
@ENDHACK


@HACK 0x004C9F46,0x004C9F4E,_RedrawOptionsMenu_Add_Surrender_Dialog_Flag_Check
    cmp  byte[ResignKeyPressed],0
    jnz  0x004CA9C9
.Out:
    test eax,eax
    jle  0x004CA15E
    jmp  0x004C9F4E
@ENDHACK


@HACK 0x004CAA29,0x004CAA2E,_RedrawOptionsMenu_Add_Surrender_Dialog_Flag_Check2
    cmp  byte[ResignKeyPressed],0
    jz   0x004CA7A5
    mov  byte[ResignKeyPressed],0
    lea  esp,[ebp-0x14]
    pop  edi
    pop  esi
    pop  edx
    pop  ecx
    pop  ebx
    pop  ebp
    retn
@ENDHACK


@SJMP 0x00565926,0x00565930 ; TechnoClass__What_Action(), skip the 1 object check?


@HACK 0x004B3272,0x004B3279,_DisplayClass__TacticalClass__Action_CheckHoverOverUnit
    push edi
    mov  edi,[0x006677F8]
    mov  edx,esi
    mov  ebx,[0x00667808]
.Repeat:
    mov  eax,[edi]
    cmp  eax,edx
    je   .Done
.Next:
    add  edi,4
    dec  ebx
    test ebx,ebx
    jnz  .Repeat
.NotFound:
    mov  eax,[0x006677F8]
    mov  eax,[eax]
.Done:
    pop  edi
    jmp  0x004B3279
@ENDHACK


@HACK 0x004B415C,0x004B4161,_DisplayClass__Mouse_Left_Release_CheckHoverOverUnit
    test edi,edi
    jnz  .MainLoop
    ; check for selected object = target object. If so, check if What_Action is ACTION_SELF.
    ; if so, perform only that action for that one object only, and skip the rest.
    ; This prevents other selected units from 'approaching' the unit when you selected multiple objects and want to deploy one object
    mov  ebx,[ebp+8]
    test ebx,ebx
    jz   .Done
.Repeat:
    mov  eax,[0x00667808]
    cmp  edi,eax
    jge  .Done
    mov  eax,[0x006677F8]
    mov  ecx,[esi+eax]
    cmp  ecx,ebx
    je   .Found
.Next:
    add  esi,4
    inc  edi
    jmp  .Repeat
.Found:
    mov  eax,[ecx+0x11]
    mov  edx,[ebp+0x8]
    mov  ebx,eax
    mov  [ebp-0x30],eax
    mov  eax,ecx
    call [ebx+0x24] ; tech->What_Action(tech)
    cmp  eax,4 ; ACTION_SELF
    jne  .Done ; go back to mainloop
    movzx edx,al
    mov  eax,ecx
    mov  ecx,[ebp-0x30]
    mov  ebx,[ebp+0x8]
    call [ecx+0xA4] ; tech->Active_Click_With(action,tech)
    jmp  0x004B419A ; exit
.Done:
    xor  edi,edi
    xor  esi,esi
.MainLoop:
    mov  eax,[0x00667808]
    jmp  0x004B4161
@ENDHACK
