
cextern Audio___Sound_Effect_At_Coord
cextern Coord___Coord_Cell
cextern HouseClass__As_Pointer
cextern BuildingTypeClass__Create_And_Place
cextern BuildingTypeClass__As_Reference
cextern BulletClass__BulletClass
cextern BulletClass__new
cextern MapClass__In_Radar
cextern _Create_Group
cextern ScenarioClass__Do_BW_Fade
cextern SidebarClass__Add
cextern SidebarClass__StripClass__Flag_To_Redraw
cextern Vortex___ChronalVortex
cextern ChronalVortexClass__Appear
cextern GScreenClass__Flag_To_Redraw
cextern Globals___Rule_MaxIQ
cextern Globals___Rule_IronCurtainDuration
cextern Globals___Scen
cextern Globals___Frame
cextern Globals___Map
cextern Globals___Map_Array
cextern Globals___ScenarioInit
cextern Globals___PlayerPtr
cextern Capture.OverrideIsCapturable

cextern Map.Basic.ChronoReinforceTanks
cextern BuildingClass.Count
cextern BuildingClass.Array


%macro TAction__Operator__Epilogue 0
    mov  eax,[ebp+-0x30]
    lea  esp,[ebp-8]
    pop  edi
    pop  esi
    pop  ebp
    retn 4
%endmacro

%define TActionClass_This   -0x24
%define HouseClass_Owner    -0x28

; TAction offset 0x0 = Trigger ID (byte)
; Taction offset 0x1 = Trigger Parameter 1 (dword)
; Taction offset 0x5 = Trigger Parameter 2 (dword)
; Taction offset 0x9 = Trigger Parameter 3 (dword)

[section .data] 
temp_unk8 dd 0
temp_unkC dd 0
temp_unk10 dd 0
NukeCellTarget dd  0
Nuke_unk34 dd 0
Nuke_unk18 dd 0
Nuke_unk44 dd 0
Nuke_unk1C dd 0
HouseClass_Which_Captures dd 0
Capture_Attached_unk6C dd 0
Capture_Attached_unk68 dd 0
Capture_Attached_unk34 dd 0
Capture_Attached_unk38 dd 0
Capture_Attached_unk3C dd 0
What_Heap1 dd 0
What_Heap2 dd 0
IronCurtain_unk20 db 0
IronCurtain_unk1F dd 0
IronCurtain_unk1B dd 0
IronCurtain_Frames dd 0
MissionToSet dd 0
ChronoShiftDest dd 0


@HACK 0x0055F9E3,0x0055F9EC,_TeamClass__TMission_Spy_Chrono_Tank_Check
    cmp  dword[Map.Basic.ChronoReinforceTanks],1
    jz   .Ret
    cmp  edx,0x11
    jnz  0x0055FA5E
.Ret:
    jmp  0x0055F9EC
@ENDHACK


@HACK 0x0055E1EE,0x0055E1F3,_TeamClass__Coordinate_Attack_Chrono_Tank_Check
    cmp  dword[Map.Basic.ChronoReinforceTanks],1
    jz   .Ret
    cmp  eax,0x11
    jnz  0x0055E1FB
.Ret:
    jmp  0x0055E1F3
@ENDHACK


@HACK 0x0055E396,0x0055E39F,_TeamClass__Coordinate_Attack_Chrono_Tank_Check2
    cmp  dword[Map.Basic.ChronoReinforceTanks],1
    jz   .Ret
    cmp  eax,0x11
    jnz  0x0055E431
.Ret:
    jmp  0x0055E39F
@ENDHACK


[section .text] 
Create_Chronal_Vortex:
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+1] ; Parameter 1, waypoint to focus on
    xor  eax,eax
    lea  edx,[edx*2]
    mov  ax,[0x006678F7+edx] ; Get cell location associated with waypoint
;    sub     eax,0x40A
    mov  word[temp_unk8],ax
    mov  eax,[temp_unk8]
    and  eax,0x7F
    mov  byte[temp_unk10+1],al
    mov  byte[temp_unk10],0x80
    mov  eax,[temp_unk8]
    shl  eax,0x12
    mov  dl,0x80
    shr  eax,0x19
    mov  byte[temp_unk10+2],dl
    mov  byte[temp_unk10+3],al
    mov  eax,[temp_unk10]
    xor  dh,dh
    mov  [temp_unkC],eax
    mov  byte[temp_unkC],dh
    mov  byte[temp_unkC+2],dh
    mov  edx,[temp_unkC]
    mov  eax,Vortex___ChronalVortex
    call ChronalVortexClass__Appear
    retn


House_Make_Enemy:
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+5] ; Parameter 2, what color to set to
    mov  dword eax,[eax+1] ; Parameter 1, HouseType to set color for
    call HouseClass__As_Pointer
    mov  esi,eax
    mov  eax,1
    mov  cl,dl
    mov  edx,[esi+HouseClass.Offset.Allies]
    shl  eax,cl
    not  eax
    and  edx,eax
    mov  al,[esi+HouseClass.Offset.Enemy]
    mov  [esi+HouseClass.Offset.Allies],edx ; Switch alliance bit for HouseType_Arg
    retn


House_Make_Ally:
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+5] ; Parameter 2, what color to set to
    mov  dword eax,[eax+1] ; Parameter 1, HouseType to set color for
    call HouseClass__As_Pointer
    mov  esi,eax
    mov  eax,1
    mov  cl,dl
    mov  edx,[esi+HouseClass.Offset.Allies]
    shl  eax,cl
    or   edx,eax
    mov  al,[esi+HouseClass.Offset.Enemy]
    mov  [esi+HouseClass.Offset.Allies],edx ; Switch alliance bit for HouseType_Arg
    retn


Set_House_IQ:
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+5] ; Parameter 2, turn on/off control
    mov  dword eax,[eax+1] ; Parameter 1, HouseType to take control over
    call HouseClass__As_Pointer
    mov  esi,eax
    mov  eax,edx
    mov  ebx,[Globals___Rule_MaxIQ] ; ds:nRulesClass_IQ_MaxIQLevels
    cmp  eax,ebx
    jle  .Dont_Clamp_Max_IQ
    mov  edx,1
.Dont_Clamp_Max_IQ:
    mov  [esi+HouseClass.Offset.ControlIQ],edx
    mov  [esi+HouseClass.Offset.IQ],edx
.Ret:
    retn


Set_House_Build_Level:
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+5] ; Parameter 2, what color to set to
    mov  dword eax,[eax+1] ; Parameter 1, HouseType to set color for
    call HouseClass__As_Pointer
    mov  [eax+HouseClass.Offset.TechLevel],edx
    retn


Set_House_Secondary_Color_Scheme:
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+5] ; Parameter 2, what color to set to
    mov  dword eax,[eax+1] ; Parameter 1, HouseType to set color for
    call HouseClass__As_Pointer
    HouseClass.SecondaryColorScheme.Set(eax,dl)
    mov  [eax+HouseClass.Offset.SecondaryColorScheme],dl
    retn


Set_House_Primary_Color_Scheme:
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+5] ; Parameter 2, what color to set to
    mov  dword eax,[eax+1] ; Parameter 1, HouseType to set color for
    call HouseClass__As_Pointer
    mov  [eax+HouseClass.Offset.RemapColor],dl
    retn


Set_Player_Control:
    mov  esi,[ebp+HouseClass_Owner]
    cmp  esi,[Globals___PlayerPtr]
    jnz  .Ret
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+5] ; Parameter 2, turn on/off control
    mov  dword eax,[eax+1] ; Parameter 1, HouseType to take control over
    push edx
    call HouseClass__As_Pointer
    mov  esi,eax
    mov  dl,[esi+HouseClass.Offset.IsHuman]
    and  dl,0xFB
    pop  eax
    and  eax,1
    mov  [esi+HouseClass.Offset.IsHuman],dl
    shl  eax,HouseClass.Bit.IsHuman
    mov  ecx,[esi+HouseClass.Offset.IsHuman]
    or   ecx,eax
    mov  [esi+HouseClass.Offset.IsHuman],ecx
.Ret:
    retn


Set_View_Port_Location:
    Save_Registers
    mov  esi,[ebp+HouseClass_Owner]
    cmp  esi,[Globals___PlayerPtr]
    jnz  .Ret
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+1] ; Parameter 1, waypoint to focus on
    xor  eax,eax
    lea  edx,[edx*2]
    mov  ax,[0x06678F7+edx] ; Get cell location associated with waypoint
;    sub     eax,0x40A
    mov  word[temp_unk8],ax
    mov  eax,[temp_unk8]
    and  eax,0x7F
    mov  byte[temp_unk10+1],al
    mov  byte[temp_unk10],0x80
    mov  eax,[temp_unk8]
    shl  eax,0x12
    mov  dl,0x80
    shr  eax,0x19
    mov  byte[temp_unk10+2],dl
    mov  byte[temp_unk10+3],al
    mov  eax,[temp_unk10]
    xor  dh,dh
    mov  [temp_unkC],eax
    mov  byte[temp_unkC],dh
    mov  byte[temp_unkC+2],dh
    xor  ecx,ecx
    mov  word cx,[temp_unkC+2]
    xor  esi,esi
    mov  word si,[temp_unkC]
    xor  edx,edx
    mov  dx,[0x00668E9E] ; __GScreen_PosX
    mov  eax,edx
    sar  edx,0x1F
    sub  eax,edx
    sar  eax,1
    sub  esi,eax
    mov  eax,[0x00668258] ; DisplayClass offset +0x8
    mov  dh,al
    xor  dl,dl
    and  edx,0xFFFF
    cmp  esi,edx
    jge  .loc_jmp_Adjust_mid
    mov  ah,al
    xor  esi,esi
    xor  al,al
    mov  si,ax
.loc_jmp_Adjust_mid:
    xor  edx,edx
    mov  dx,[0x00668EA0] ; __GScreen_PosY
    mov  eax,edx
    sar  edx,0x1F
    sub  eax,edx
    sar  eax,1
    sub  ecx,eax
    mov  eax,[0x00668258] ; DisplayClass offset +0x8
    mov  dh,al
    xor  dl,dl
    and  edx,0xFFFF
    cmp  ecx,edx
    jge  .loc_jmp_Adjust_mid2
    mov  ah,al
    xor  ecx,ecx
    xor  al,al
    mov  cx,ax
.loc_jmp_Adjust_mid2:
    mov  word[temp_unkC+2],cx
    xor  esi,esi
    mov  word[temp_unkC],si
    inc  dword[Globals___ScenarioInit] ; to snap immediately
    mov  edx,[temp_unkC]
    mov  eax,Globals___Map
    call 0x004D2BC0; HelpClass::Set_Tactical_Position(ulong)
    dec  dword[Globals___ScenarioInit]
    ; force template refresh
    mov  edx,1
    mov  eax,Globals___Map ; MouseClass Map
    call GScreenClass__Flag_To_Redraw
.Ret:
    Restore_Registers
    retn


Add_To_Sidebar_Action:
    mov  esi,[ebp+HouseClass_Owner]
    cmp  esi,[Globals___PlayerPtr]
    jnz  .Ret
    mov  eax,[ebp+TActionClass_This]
;    mov        dword edx,[eax+1] ; Paramater 1,RTTIType
    mov  dword ebx,[eax+1] ; Parameter 1,Object ID
    mov  eax,Globals___Map
    call SidebarClass__Add
    mov  eax,0x0066928E ; offset __LEFT_STRIP
    call SidebarClass__StripClass__Flag_To_Redraw
    mov  eax,0x0066956A ; offset __RIGHT_STRIP
    call SidebarClass__StripClass__Flag_To_Redraw
.Ret:
    retn


Give_Credits_Action:
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+5] ; Parameter 2, amount of credits
    mov  dword eax,[eax+1] ; Paramater 1, HouseType
    call HouseClass__As_Pointer
    add  [eax+HouseClass.Offset.Credits],edx
    retn


Nuke_Strike_On_Waypoint:
    mov  eax,[ebp+TActionClass_This]
    mov  dword edx,[eax+1] ; Parameter 1, waypoint to focus on
    xor  eax,eax
    lea  edx,[edx*2]
    mov  ax,[0x06678F7+edx] ; Get cell location associated with waypoint
    mov  word[NukeCellTarget],ax
    mov  eax,0x4B
    call BulletClass__new
    mov  esi,eax
    test eax,eax
    jz   .Past_Creating_BulletClass
    push 0x64
    push 7               ; warhead type?
    xor  eax,eax
    mov  word ax,[NukeCellTarget]
    mov  edx,0x11        ; ; Bullet type
    push 0xC8
    xor  ecx,ecx
    call 0x005558E8 ; As_Target(short)
    mov  ebx,eax
    mov  eax,esi
    call BulletClass__BulletClass
.Past_Creating_BulletClass:
    mov  esi,eax
    test eax,eax
    jz   .jt_SpecialWeaponAI_Out
    mov  eax,[NukeCellTarget]
    mov  word[Nuke_unk1C],ax
    mov  eax,[Nuke_unk1C]
    shl  eax,0x12
    shr  eax,0x19
    sub  eax,0xF
    cmp  eax,1
    jge  .Dont_Set_EAX
    mov  eax,1
.Dont_Set_EAX:
    xor  ecx,ecx
    mov  word[Nuke_unk34],cx
    mov  edx,[NukeCellTarget]
    mov  cl,byte[Nuke_unk34]
    mov  word[Nuke_unk18],dx
    and  cl,0x80
    mov  edx,[Nuke_unk18]
    mov  byte[Nuke_unk34],cl
    and  edx,0x7F
    or   [Nuke_unk34],edx
    mov  edi,[Nuke_unk34]
    and  edi,0xC07F
    and  eax,0x7F
    mov  word[Nuke_unk34],di
    shl  eax,7
    or   [Nuke_unk34],eax
    mov  eax,[Nuke_unk34]
    mov  word[NukeCellTarget],ax
    mov  eax,[NukeCellTarget]
    and  eax,0x7F
    xor  ebx,ebx
    mov  bl,0x80
    mov  byte[Nuke_unk44+1],al
    mov  eax,[NukeCellTarget]
    mov  ch,0x80
    shl  eax,0x12
    mov  byte[Nuke_unk44],ch
    shr  eax,0x19
    mov  byte[Nuke_unk44+2],ch
    mov  byte[Nuke_unk44+3],al
    mov  edi,[esi+0x11]
    mov  edx,[Nuke_unk44]
    mov  eax,esi
    call dword[edi+0x64] ; int BulletClass::Unlimbo(unsigned long,DirType)
    test eax,eax
    jnz  .Dont_Call_Destructor
    mov  ebx,[esi+0x11]
    mov  edx,2
    mov  eax,esi
    call dword[ebx] ; BulletClass::~BulletClass(void) proc near
.Dont_Call_Destructor:
.jt_SpecialWeaponAI_Out:
    retn


Loop_Over_Object_Heap_And_Call_Captured_If_Trigger_Attached:
.Setup_Buildings_Loop:
    xor  ecx,ecx
    mov  [Capture_Attached_unk6C],ecx
    mov  [Capture_Attached_unk68],ecx
    jmp  .Buildings_Loop
.Next_Loop_Iteration:
    mov  ebx,[Capture_Attached_unk68]
    mov  ecx,[Capture_Attached_unk6C]
    add  ebx,4
    inc  ecx
    mov  [Capture_Attached_unk68],ebx
    mov  [Capture_Attached_unk6C],ecx
.Buildings_Loop:
    mov  edi,[Capture_Attached_unk6C]
    mov  edx,[What_Heap1]
    mov  edx,[edx]
    ; cmp     edi,[0x0065D8BC] ; ds:dword_0065D8BC
    cmp  edi,edx
    jge  .Ret ; RETURN
    mov  edx,[Capture_Attached_unk68]
    mov  eax,[What_Heap2]
    mov  eax,[eax]
    ; mov     eax,[0x0065D8E4] ; ds:BuildingClass_Heap_Related?
    add  eax,edx
    mov  edi,[eax]
    test edi,edi
    jz   .Next_Loop_Iteration
    lea  ebx,[edi+0x21]
    mov  edx,esi
    mov  eax,ebx
    call 0x00500A20 ; Find_Trigger_On_Object?
    test eax,eax
    jz   .Next_Loop_Iteration
    lea  eax,[Capture_Attached_unk3C]
    xor  edx,edx
    call 0x00463D70 ; CCPtr<TriggerClass>::CCPtr(TriggerClass *)
    mov  eax,[eax]
    mov  [ebx],eax
    mov  eax,[edi+0x23]
    sar  eax,0x10
    mov  [Capture_Attached_unk38],eax
    mov  ecx,2
    mov  eax,[edi+0x11]
    mov  [Capture_Attached_unk34],eax
    mov  eax,edi
    mov  edi,[Capture_Attached_unk34]
    mov  edx,[HouseClass_Which_Captures]
    mov  byte[Capture.OverrideIsCapturable],1
    ; mov        ebx,eax
    call dword[edi+0x1D4]    ; Call ::Captured()
    mov  byte[Capture.OverrideIsCapturable],0
    ; call    Iron_Curtain_Object
    lea  edx,[Capture_Attached_unk38]
    jmp  .Next_Loop_Iteration
.Ret:
    retn


Capture_Attached_Objects:
    mov  eax,[ebp+TActionClass_This]
    mov  dword eax,[eax+1] ; Parameter 1, HouseType of that captures this object
    call HouseClass__As_Pointer
    mov  [HouseClass_Which_Captures],eax
    ; Buildings
    mov  dword[What_Heap1],0x0065D8BC
    mov  dword[What_Heap2],0x0065D8E4
    call Loop_Over_Object_Heap_And_Call_Captured_If_Trigger_Attached
    ; Units
    mov  dword[What_Heap1],0x0065DC4C
    mov  dword[What_Heap2],0x0065DC74
    call Loop_Over_Object_Heap_And_Call_Captured_If_Trigger_Attached
    ; Infantry
    mov  dword[What_Heap1],0x0065D9EC
    mov  dword[What_Heap2],0x0065DA14
    call Loop_Over_Object_Heap_And_Call_Captured_If_Trigger_Attached
    ; Aircrafts
    mov  dword[What_Heap1],0x0065D824
    mov  dword[What_Heap2],0x0065D84C
    call Loop_Over_Object_Heap_And_Call_Captured_If_Trigger_Attached
    ; Ships
    mov  dword[What_Heap1],0x0065DC98
    mov  dword[What_Heap2],0x0065DCC0
    call Loop_Over_Object_Heap_And_Call_Captured_If_Trigger_Attached
.Ret:
    retn


Iron_Curtain_Object:
    Save_Registers
    cmp  dword[IronCurtain_Frames],-1
    jnz  .Dont_Use_RulesClass_Iron_Curtain_Duration
    xor  edi,edi
    mov  di,[Globals___Rule_IronCurtainDuration]
    imul edi,0x384
    lea  eax,[edi+0x80]
    lea  esi,[IronCurtain_unk20]
    mov  edi,[Globals___Frame]
    shr  eax,8
    mov  [IronCurtain_unk1F],edi
    lea  edi,[ebx+0x82]
    mov  [IronCurtain_unk1B],eax
    movsd
    movsd
    movsb
.Past_Setting_Iron_Curtain_Duration:
    mov  edi,[ebx+0x11]
    mov  edx,2
    mov  eax,ebx
    call dword[edi+0x9C]
    mov  edx,[ebx+0x11]
    mov  eax,ebx
    mov  ecx,0xFFFFFFFF
    call dword[edx+0xC] ;  unsigned long const ObjectClass::Center_Coord(void)
    mov  ebx,1
    mov  edx,eax
    mov  eax,0x1E
    ; call    Audio___Sound_Effect_At_Coord
    Restore_Registers
    retn
.Dont_Use_RulesClass_Iron_Curtain_Duration:
    xor  edi,edi
    mov  di,[IronCurtain_Frames]
    mov  word[ebx+0x87],di
    xor  edi,edi
    mov  edi,[Globals___Frame]
    mov  word[ebx+0x82],di
    jmp  .Past_Setting_Iron_Curtain_Duration


Loop_Over_Object_Heap_And_Iron_Curtain_If_Trigger_Attached:
.Setup_Buildings_Loop:
    xor  ecx,ecx
    mov  [Capture_Attached_unk6C],ecx
    mov  [Capture_Attached_unk68],ecx
    jmp  .Buildings_Loop
.Next_Loop_Iteration:
    mov  ebx,[Capture_Attached_unk68]
    mov  ecx,[Capture_Attached_unk6C]
    add  ebx,4
    inc  ecx
    mov  [Capture_Attached_unk68],ebx
    mov  [Capture_Attached_unk6C],ecx
.Buildings_Loop:
    mov  edi,[Capture_Attached_unk6C]
    mov  edx,[What_Heap1]
    mov  edx,[edx]
    ; cmp     edi,[0x0065D8BC] ; ds:dword_0065D8BC
    cmp  edi,edx
    jge  .Ret ; RETURN
    mov  edx,[Capture_Attached_unk68]
    mov  eax,[What_Heap2]
    mov  eax,[eax]
    ; mov     eax,[0x0065D8E4] ; ds:BuildingClass_Heap_Related?
    add  eax,edx
    mov  edi,[eax]
    test edi,edi
    jz   .Next_Loop_Iteration
    lea  ebx,[edi+0x21]
    mov  edx,esi
    mov  eax,ebx
    call 0x00500A20 ; Find_Trigger_On_Object?
    test eax,eax
    jz   .Next_Loop_Iteration
    lea  eax,[Capture_Attached_unk3C]
    xor  edx,edx
    call 0x00463D70 ; CCPtr<TriggerClass>::CCPtr(TriggerClass *)
    mov  eax,[eax]
    mov  [ebx],eax
    mov  eax,[edi+0x23]
    sar  eax,0x10
    mov  [Capture_Attached_unk38],eax
    mov  ecx,2
    mov  eax,[edi+0x11]
    mov  [Capture_Attached_unk34],eax
    mov  eax,edi
    mov  edi,[Capture_Attached_unk34]
    mov  edx,[HouseClass_Which_Captures]
    mov  ebx,eax
    call Iron_Curtain_Object
    lea  edx,[Capture_Attached_unk38]
    jmp  .Next_Loop_Iteration
.Ret:
    retn


Iron_Curtain_Attached_Objects:
    mov  eax,[ebp+TActionClass_This]
    mov  dword eax,[eax+1] ; Parameter 1, Frames duration of Iron Curtain effect
    mov  dword[IronCurtain_Frames],eax
    ; Buildings
    mov  dword[What_Heap1],0x0065D8BC
    mov  dword[What_Heap2],0x0065D8E4
    call Loop_Over_Object_Heap_And_Iron_Curtain_If_Trigger_Attached
    ; Units
    mov  dword[What_Heap1],0x0065DC4C
    mov  dword[What_Heap2],0x0065DC74
    call Loop_Over_Object_Heap_And_Iron_Curtain_If_Trigger_Attached
    ; Infantry
    mov  dword[What_Heap1],0x0065D9EC
    mov  dword[What_Heap2],0x0065DA14
    call Loop_Over_Object_Heap_And_Iron_Curtain_If_Trigger_Attached
    ; Aircrafts
    mov  dword[What_Heap1],0x0065D824
    mov  dword[What_Heap2],0x0065D84C
    call Loop_Over_Object_Heap_And_Iron_Curtain_If_Trigger_Attached
    ; Ships
    mov  dword[What_Heap1],0x0065DC98
    mov  dword[What_Heap2],0x0065DCC0
    call Loop_Over_Object_Heap_And_Iron_Curtain_If_Trigger_Attached
.Ret:
    retn


Create_Building_At_Waypoint:
    mov  eax,[ebp+TActionClass_This]
    mov  dword ebx,[eax+9] ; Parameter 3, HouseType to create building for
    mov  dword ecx,[eax+5] ; Parameter 2, waypoint to create at
    mov  dword eax,[eax+1] ; Paramater 1, StructType to create
    call BuildingTypeClass__As_Reference
    xor  edx,edx
    lea  ecx,[ecx*2]
    mov  dx,[0x06678F7+ecx] ; Get cell location associated with waypoint
    call BuildingTypeClass__Create_And_Place
    retn


Loop_Over_Object_Heap_And_Set_Mission_Trigger_Attached:
.Setup_Buildings_Loop:
    xor  ecx,ecx
    mov  [Capture_Attached_unk6C],ecx
    mov  [Capture_Attached_unk68],ecx
    jmp  .Buildings_Loop
.Next_Loop_Iteration:
    mov  ebx,[Capture_Attached_unk68]
    mov  ecx,[Capture_Attached_unk6C]
    add  ebx,4
    inc  ecx
    mov  [Capture_Attached_unk68],ebx
    mov  [Capture_Attached_unk6C],ecx
.Buildings_Loop:
    mov  edi,[Capture_Attached_unk6C]
    mov  edx,[What_Heap1]
    mov  edx,[edx]
    ; cmp     edi,[0x0065D8BC] ; ds:dword_0065D8BC
    cmp  edi,edx
    jge  .Ret ; RETURN
    mov  edx,[Capture_Attached_unk68]
    mov  eax,[What_Heap2]
    mov  eax,[eax]
    ; mov     eax,[0x0065D8E4] ; ds:BuildingClass_Heap_Related?
    add  eax,edx
    mov  edi,[eax]
    test edi,edi
    jz   .Next_Loop_Iteration
    lea  ebx,[edi+0x21]
    mov  edx,esi
    mov  eax,ebx
    call 0x00500A20 ; Find_Trigger_On_Object?
    test eax,eax
    jz   .Next_Loop_Iteration
    lea  eax,[Capture_Attached_unk3C]
    xor  edx,edx
    call 0x00463D70 ; CCPtr<TriggerClass>::CCPtr(TriggerClass *)
    mov  eax,[eax]
    mov  [ebx],eax
    mov  eax,[edi+0x23]
    sar  eax,0x10
    mov  [Capture_Attached_unk38],eax
    mov  ecx,2
    mov  eax,[edi+0x11]
    mov  [Capture_Attached_unk34],eax
    mov  eax,edi ; ObjectClass *
    mov  dword edx,[MissionToSet]
    mov  edi,[Capture_Attached_unk34]
    call 0x00502798   ;   void MissionClass::Set_Mission(MissionType)
    lea  edx,[Capture_Attached_unk38]
    jmp  .Next_Loop_Iteration
.Ret:
    retn


Set_Mission_Attached_Objects:
    mov  eax,[ebp+TActionClass_This]
    mov  dword eax,[eax+1] ; Parameter 1, mission to set objects to
    mov  dword[MissionToSet],eax
    ; Buildings
    mov  dword[What_Heap1],0x0065D8BC
    mov  dword[What_Heap2],0x0065D8E4
    call Loop_Over_Object_Heap_And_Set_Mission_Trigger_Attached
    ; Units
    mov  dword[What_Heap1],0x0065DC4C
    mov  dword[What_Heap2],0x0065DC74
    call Loop_Over_Object_Heap_And_Set_Mission_Trigger_Attached
    ; Infantry
    mov  dword[What_Heap1],0x0065D9EC
    mov  dword[What_Heap2],0x0065DA14
    call Loop_Over_Object_Heap_And_Set_Mission_Trigger_Attached
    ; Aircrafts
    mov  dword[What_Heap1],0x0065D824
    mov  dword[What_Heap2],0x0065D84C
    call Loop_Over_Object_Heap_And_Set_Mission_Trigger_Attached
    ; Ships
    mov  dword[What_Heap1],0x0065DC98
    mov  dword[What_Heap2],0x0065DCC0
    call Loop_Over_Object_Heap_And_Set_Mission_Trigger_Attached
.Ret:
    retn


Loop_Over_Object_Heap_And_Repair_Trigger_Attached:
.Setup_Buildings_Loop:
    xor  ecx,ecx
    mov  [Capture_Attached_unk6C],ecx
    mov  [Capture_Attached_unk68],ecx
    jmp  .Buildings_Loop
.Next_Loop_Iteration:
    mov  ebx,[Capture_Attached_unk68]
    mov  ecx,[Capture_Attached_unk6C]
    add  ebx,4
    inc  ecx
    mov  [Capture_Attached_unk68],ebx
    mov  [Capture_Attached_unk6C],ecx
.Buildings_Loop:
    mov  edi,[Capture_Attached_unk6C]
    mov  edx,[What_Heap1]
    mov  edx,[edx]
    ; cmp     edi,[0x0065D8BC] ; ds:dword_0065D8BC
    cmp  edi,edx
    jge  .Ret ; RETURN
    mov  edx,[Capture_Attached_unk68]
    mov  eax,[What_Heap2]
    mov  eax,[eax]
    ; mov     eax,[0x0065D8E4] ; ds:BuildingClass_Heap_Related?
    add  eax,edx
    mov  edi,[eax]
    test edi,edi
    jz   .Next_Loop_Iteration
    lea  ebx,[edi+0x21]
    mov  edx,esi
    mov  eax,ebx
    call 0x00500A20 ; Find_Trigger_On_Object?
    test eax,eax
    jz   .Next_Loop_Iteration
    lea  eax,[Capture_Attached_unk3C]
    xor  edx,edx
    call 0x00463D70 ; CCPtr<TriggerClass>::CCPtr(TriggerClass *)
    mov  eax,[eax]
    mov  [ebx],eax
    mov  eax,[edi+0x23]
    sar  eax,0x10
    mov  [Capture_Attached_unk38],eax
    mov  ecx,2
    mov  eax,[edi+0x11]
    mov  [Capture_Attached_unk34],eax
    mov  eax,edi ; ObjectClass *
    or   byte[eax+0xD6],0x10
    mov  edi,[Capture_Attached_unk34]
    lea  edx,[Capture_Attached_unk38]
    jmp  .Next_Loop_Iteration
.Ret:
    retn


Repair_Attached_Buildings:
    mov  eax,[ebp+TActionClass_This]
    ; Buildings
    mov  dword[What_Heap1],0x0065D8BC
    mov  dword[What_Heap2],0x0065D8E4
    call Loop_Over_Object_Heap_And_Repair_Trigger_Attached
    retn


Chrono_Shift_Object:
    Save_Registers
    mov  bl,[eax]
    cmp  bl,0x1E ; RTTIType == VESSEL
    jz   .Do_Chrono_Shift
    cmp  bl,  0x1C    ; RTTIType == VEHICLE
    jz   .Do_Chrono_Shift
    jmp  .Ret
.Do_Chrono_Shift:
    mov  edx,[ChronoShiftDest]
    mov  [eax+0x14E],dx
    mov  edi,eax
    call 0x004B653C ; int DriveClass::Teleport_To(short)
    mov  eax,edi
    mov  dh,[eax+0x141]
    or   dh,2
    mov  [eax+0x141],dh
    mov  eax,Globals___Scen
    call ScenarioClass__Do_BW_Fade
    mov  ecx,0xFFFFFFFF
    mov  eax,0x1B
    mov  edx,[ebx+5]
    mov  ebx,1
    call Audio___Sound_Effect_At_Coord
.Ret:
    Restore_Registers
    retn

Loop_Over_Object_Heap_And_Chrono_Shift_If_Trigger_Attached:
.Setup_Buildings_Loop:
    xor  ecx,ecx
    mov  [Capture_Attached_unk6C],ecx
    mov  [Capture_Attached_unk68],ecx
    jmp  .Buildings_Loop
.Next_Loop_Iteration:
    mov  ebx,[Capture_Attached_unk68]
    mov  ecx,[Capture_Attached_unk6C]
    add  ebx,4
    inc  ecx
    mov  [Capture_Attached_unk68],ebx
    mov  [Capture_Attached_unk6C],ecx
    .Buildings_Loop:
    mov  edi,[Capture_Attached_unk6C]
    mov  edx,[What_Heap1]
    mov  edx,[edx]
    ; cmp     edi,[0x0065D8BC] ; ds:dword_0065D8BC
    cmp  edi,edx
    jge  .Ret ; RETURN
    mov  edx,[Capture_Attached_unk68]
    mov  eax,[What_Heap2]
    mov  eax,[eax]
    ; mov     eax,[0x0065D8E4] ; ds:BuildingClass_Heap_Related?
    add  eax,edx
    mov  edi,[eax]
    test edi,edi
    jz   .Next_Loop_Iteration
    lea  ebx,[edi+0x21]
    mov  edx,esi
    mov  eax,ebx
    call 0x00500A20 ; Find_Trigger_On_Object?
    test eax,eax
    jz   .Next_Loop_Iteration
    lea  eax,[Capture_Attached_unk3C]
    xor  edx,edx
    call 0x00463D70 ; CCPtr<TriggerClass>::CCPtr(TriggerClass *)
    mov  eax,[eax]
    mov  [ebx],eax
    mov  eax,[edi+0x23]
    sar  eax,0x10
    mov  [Capture_Attached_unk38],eax
    mov  ecx,2
    mov  eax,[edi+0x11]
    mov  [Capture_Attached_unk34],eax
    mov  eax,edi
    mov  edi,[Capture_Attached_unk34]
    mov  edx,[HouseClass_Which_Captures]
    mov  ebx,eax
    call Chrono_Shift_Object
    lea  edx,[Capture_Attached_unk38]
    jmp  .Next_Loop_Iteration
.Ret:
    retn


Chrono_Shift_Attached_Objects:
    mov  eax,[ebp+TActionClass_This]
    mov  ecx,[eax+1] ; Parameter 1, waypoint to chronoshift to
    xor  edx,edx
    lea  ecx,[ecx*2]
    mov  dx,[0x06678F7+ecx] ; Get cell location associated with waypoint
    mov  dword[ChronoShiftDest],edx
    ; Units
    mov  dword[What_Heap1],0x0065DC4C
    mov  dword[What_Heap2],0x0065DC74
    call Loop_Over_Object_Heap_And_Chrono_Shift_If_Trigger_Attached
    ; Ships
    mov  dword[What_Heap1],0x0065DC98
    mov  dword[What_Heap2],0x0065DCC0
    call Loop_Over_Object_Heap_And_Chrono_Shift_If_Trigger_Attached
    retn


Chrono_Shift_Trigger_Object:
    test edi,edi
    jz   .Ret
    mov  eax,[ebp+TActionClass_This]
    mov  ecx,[eax+1] ; Parameter 1, waypoint to chronoshift to
    xor  edx,edx
    lea  ecx,[ecx*2]
    mov  dx,[0x006678F7+ecx] ; Get cell location associated with waypoint
    mov  dword[ChronoShiftDest],edx
    mov  eax,edi
    call Chrono_Shift_Object
    mov  eax,edi
.Ret:
    retn


Iron_Curtain_Trigger_Object:
    test edi,edi
    jz   .Ret
    mov  eax,[ebp+TActionClass_This]
    mov  dword eax,[eax+1] ; Parameter 1, Frames duration of Iron Curtain effect
    mov  dword[IronCurtain_Frames],eax
    mov  eax,edi
    call Iron_Curtain_Object
    mov  eax,edi
.Ret:
    retn

; Requires remake_shroud_mapedges.asm and resizable_map.asm to work seamlessly
Set_Map_Dimensions:
    Save_Registers
    mov  eax,[ebp+TActionClass_This]
    mov  ecx,dword[eax+9] ; Parameter 3, Height
    and  ecx,127
    push ecx
    mov  ecx,dword[eax+5] ; Parameter 2, Width
    and  ecx,127
    mov  edx,dword[eax+1] ; Paramater 1, Top left Cell (X128 * Y)
    mov  ebx,edx
    sar  ebx,7
    and  edx,127
    and  ebx,127
    mov  eax,Globals___Map
    mov  edi,dword[eax+4]
    call dword[edi+0x5C]
	; iterate over all buildings to update IsLocked. Buildings that are within the play field have IsLocked set
    mov  dword[What_Heap1],BuildingClass.Count
    mov  dword[What_Heap2],BuildingClass.Array
    call Loop_Over_Object_Heap_And_Update_IsLocked
    ; force radar refresh. Use a trick by toggling zoom mode twice.
    mov  eax,dword[Globals___Map+0xC4A] ; TacticalCoord
    call Coord___Coord_Cell
    mov  edx,eax
	mov  eax,Globals___Map ; global RadarClass
    call 0x0052F294 ; RadarClass::Zoom_Mode
    mov  eax,dword[Globals___Map+0xC4A] ; TacticalCoord
    call Coord___Coord_Cell
    mov  edx,eax
	mov  eax,Globals___Map ; global RadarClass
    call 0x0052F294 ; RadarClass::Zoom_Mode
    ; force set position, in case the map is shrunk, we want to snap the map to the boundaries
    mov  eax,Globals___Map
    mov  edx,dword[Globals___Map+0xC4A] ; TacticalCoord
    call 0x004D2BC0; HelpClass::Set_Tactical_Position(ulong)
    ; force template refresh
    mov  edx,1
    mov  eax,Globals___Map ; MouseClass Map
    call GScreenClass__Flag_To_Redraw
    ; force zone refresh
    mov  edx,0xFF
    mov  eax,Globals___Map ; MouseClass Map
    call 0x004FF690 ; MapClass::Zone_Reset
    ; the old map bounds may have IsVisible set, that needs to be reverted to redraw the shroud creep at the map edge during DisplayClass::Redraw_Shadow
    ; Explicitly recalculate IsMapped on all cells based on IsVisible of neighbouring cells
    mov  edx,-1
.Next_Iter:
    inc  edx
    cmp  edx,0x4000
    jge  .Done_Iter
    xor  edi,edi
    push edx
    ; start check of neighbours
.CheckVisibleW:
    dec  edx
    cmp  edx,0x4000
    jae  .CheckVisibleNW
    mov  al,dl
    and  al,0x7F
    cmp  al,0x7F
    jz   .CheckVisibleNW
    call GetCellIsVisible
    test al,al
    jnz  .CheckVisibleFound
.CheckVisibleNW:
    sub  edx,0x80
    cmp  edx,0x4000
    jae  .CheckVisibleN
    mov  al,dl
    and  al,0x7F
    cmp  al,0x7F
    jz   .CheckVisibleN
    call GetCellIsVisible
    test al,al
    jnz  .CheckVisibleFound
.CheckVisibleN:
    inc  edx
    cmp  edx,0x4000
    jae  .CheckVisibleNE
    call GetCellIsVisible
    test al,al
    jnz  .CheckVisibleFound
.CheckVisibleNE:
    inc  edx
    cmp  edx,0x4000
    jae  .CheckVisibleE
    test edx,0x7F
    jz   .CheckVisibleE
    call GetCellIsVisible
    test al,al
    jnz  .CheckVisibleFound
.CheckVisibleE:
    add  edx,0x80
    cmp  edx,0x4000
    jae  .CheckVisibleSE
    test edx,0x7F
    jz   .CheckVisibleSE
    call GetCellIsVisible
    test al,al
    jnz  .CheckVisibleFound
.CheckVisibleSE:
    add  edx,0x80
    cmp  edx,0x4000
    jge  .CheckVisibleS
    test edx,0x7F
    jz   .CheckVisibleS
    call GetCellIsVisible
    test al,al
    jnz  .CheckVisibleFound
.CheckVisibleS:
    dec  edx
    cmp  edx,0x4000
    jae  .CheckVisibleSW
    call GetCellIsVisible
    test al,al
    jnz  .CheckVisibleFound
.CheckVisibleSW:
    dec  edx
    cmp  edx,0x4000
    jae  .CheckDone
    mov  al,dl
    and  al,0x7F
    cmp  al,0x7F
    jz   .CheckDone
    call GetCellIsVisible
    test al,al
    jz  .CheckDone
.CheckVisibleFound:
    mov  edi,1
.CheckDone:
    pop  edx ; restore cell
    mov  ebx,edx
    lea  ecx,[ebx*8+0]
    sub  ecx,ebx
    shl  ecx,2
    add  ecx,ebx
    mov  eax,dword[Globals___Map_Array]
    add  ecx,ecx
    add  eax,ecx ; Globals___Map_Array0x3a (CellClass size) * cell
    xor  ecx,ecx
    mov  cl,byte[eax+2h]
    cmp  edi,1
    je   .SetMapped
.ClearMapped:
    and  cl,~0x4 ; clear IsMapped
    jmp  .MappedDone
.SetMapped:
    or   cl,0x4 ; set IsMapped
.MappedDone:
    ;xor  cl,0x8 ; toggle IsVisible
    ;and  cl,~0x8 ; clear IsVisible
    mov  byte[eax+2h],cl 
    jmp  .Next_Iter
.Done_Iter:
    ; force full refresh (includes shroud refresh)
    mov  edx,1
    mov  eax,Globals___Map ; MouseClass Map
    call GScreenClass__Flag_To_Redraw
    ;call 0x0052DA14 ; RadarClass::Draw_It
.Ret:
    Restore_Registers
    retn


GetCellIsVisible:
    ; edx is the cell
    mov  ebx,edx
    lea  ecx,[ebx*8+0]
    sub  ecx,ebx
    shl  ecx,2
    add  ecx,ebx
    mov  eax,dword[Globals___Map_Array]
    add  ecx,ecx
    add  eax,ecx ; Globals___Map_Array0x3a (CellClass size) * cell
    xor  ecx,ecx
    mov  cl,byte[eax+2h]
    and  cl,0x8 ; get IsVisible
    sar  cl,2
    mov  eax,ecx ; if IsVisible, al is 1, otherwise 0
    ret


Loop_Over_Object_Heap_And_Update_IsLocked:
.Setup_Buildings_Loop:
    xor  ecx,ecx
    mov  [Capture_Attached_unk6C],ecx
    mov  [Capture_Attached_unk68],ecx
    jmp  .Buildings_Loop
.Next_Loop_Iteration:
    mov  ebx,[Capture_Attached_unk68]
    mov  ecx,[Capture_Attached_unk6C]
    add  ebx,4
    inc  ecx
    mov  [Capture_Attached_unk68],ebx
    mov  [Capture_Attached_unk6C],ecx
.Buildings_Loop:
    mov  edi,[Capture_Attached_unk6C]
    mov  edx,[What_Heap1]
    mov  edx,[edx]
    cmp  edi,edx
    jge  .Ret ; RETURN
    mov  edx,[Capture_Attached_unk68]
    mov  eax,[What_Heap2]
    mov  eax,[eax]
    add  eax,edx
    mov  edi,[eax]
    test edi,edi
    jz   .Next_Loop_Iteration
    mov  eax,[edi+5h]
    call Coord___Coord_Cell
    mov  edx,eax
	mov  eax,Globals___Map ; global RadarClass
    call MapClass__In_Radar
    test eax,eax
    jnz  .Set_IsLocked
.Reset_IsLocked:
    xor  eax,eax
    mov  al,byte[edi+0x71]
    and  al,0xFF - 0x20
    mov  byte[edi+0x71],al 
    jmp  .Next_Loop_Iteration
.Set_IsLocked:
    xor  eax,eax
    mov  al,byte[edi+0x71]
    or   al,0x20
    mov  byte[edi+0x71],al   
    jmp  .Next_Loop_Iteration
.Ret:
    retn


; Magic spawn Reinforcements
; clone Do_Reinforcements, but always use the waypoint cell as spawn point
Do_Magic_Reinforcements:
    mov  edx,[ebp+TActionClass_This]
    mov  eax,[0x00601804]
    inc  edx
    mov  esi,[eax+4]
    mov  edx,[edx]
    imul edx,esi
    mov  eax,[eax+0x10]
    add  eax,edx
.Setup_Stack:
    push ebp
    mov  ebp,esp
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub  esp,0x34
    mov  dword[ebp-0x30],eax ; Parameter 1: Team
    test eax,eax
    jz   .No_Team
    cmp  dword[eax+0xA5],0 ; TeamType.ClassCount, 0 means the team is empty
    jnz  .Team
.No_Team:
    xor  eax,eax
    jmp  .End_Stack
.Team:
    cmp  dword[eax+0x3D],0 
    jnz  .Create_Group
.Create_Attack_Script:
    mov  dword[eax+0x3D],1 ; set MissionCount = 1
    mov  dword[eax+0x41],1 ; TMISSION_ATT_WAYPT
    mov  edx,dword[ebp-0x30] 
    mov  eax,dword[eax+0x35] ; Team->Origin
    mov  dword[edx+0x42],eax ; set MissionList[0].Data.Value to origin 
.Create_Group:
    mov  dword[ebp-0x30],eax ; Team
    call _Create_Group
    mov  ebx,eax
    mov  esi,eax
    test eax,eax ; check if _Create_Group produced at least one object
    jz  .End_Stack
; skip infantry only check
; assign cell (edx)    
    mov  ebx,dword[ebp-0x30] ; Team
    mov  ebx,dword[ebx+0x35] ; Team->Origin
    xor  edi,edi
    lea  ebx,[ebx*2]
    mov  di,[0x006678F7+ebx] ; Waypoint[]
; jump back to Do_Reinforcements routine, the rest of the logic is identical. ret will be executed there
    jmp  0x00533336
.End_Stack:
    lea  esp,[ebp-0x14]
    pop  edi    
    pop  esi
    pop  edx
    pop  ecx
    pop  ebx
    pop  ebp
    ret


@HACK 0x00554125,0x0055412D,_TActionClass__operator__New_Trigger_Actions
    ; TO-DO use an array instead of a cmp chain
    ; Iran's add-ons
    cmp  al,40
    jz   .New_Give_Credits_Action
    cmp  al,41
    jz   .New_Add_Vehicle_To_Sidebar_Action
    cmp  al,42
    jz   .New_Add_Infantry_To_Sidebar_Action
    cmp  al,43
    jz   .New_Add_Building_To_Sidebar_Action
    cmp  al,44
    jz   .New_Add_Aircraft_To_Sidebar_Action
    cmp  al,45
    jz   .New_Add_Vessel_To_Sidebar_Action
    cmp  al,50
    jz   .New_Set_View_Port_Location
    cmp  al,51
    jz   .New_Set_Player_Control
    cmp  al,52
    jz   .New_Set_House_Primary_Color_Scheme
    cmp  al,53
    jz   .New_Set_House_Secondary_Color_Scheme
    cmp  al,54
    jz   .New_Set_House_Build_Level
    cmp  al,55
    jz   .New_Set_House_IQ
    cmp  al,56
    jz   .New_House_Make_Ally
    cmp  al,57
    jz   .New_House_Make_Enemy
    cmp  al,58
    jz   .New_Create_Chronal_Vortex
    cmp  al,59
    jz   .New_Nuke_Strike_On_Waypoint
    cmp  al,60
    jz   .New_Capture_Attached_Objects
    cmp  al,61
    jz   .New_Iron_Curtain_Attached_Objects
    cmp  al,62
    jz   .New_Create_Building_At_Waypoint
    cmp  al,63
    jz   .New_Set_Mission_Attached_Objects
    cmp  al,64
    jz   .New_Repair_Attached_Buildings
    cmp  al,65
    jz   .New_Chrono_Shift_Attached_Objects
    cmp  al,66
    jz   .New_Chrono_Shift_Trigger_Object
    cmp  al,67
    jz   .New_Iron_Curtain_Trigger_Object
    ; Lovalmidas add-ons
    cmp  al,68
    jz   .New_Set_Map_Dimensions
    cmp  al,80 ; follow RA2 format
    jz   .New_Do_Magic_Reinforcements

    cmp  al,0x24    ; Check to see if action ID is less than 37
    ja   0x0055418A ; NO_ACTION
    jmp  0x0055412D

.New_Give_Credits_Action:
    call Give_Credits_Action
    TAction__Operator__Epilogue

.New_Add_Vehicle_To_Sidebar_Action:
    mov  edx,0x1D ; RTTIType == VEHICLETYPE
    call Add_To_Sidebar_Action
    TAction__Operator__Epilogue

.New_Set_View_Port_Location:
    call Set_View_Port_Location
    TAction__Operator__Epilogue

.New_Set_Player_Control:
    call Set_Player_Control
    TAction__Operator__Epilogue

.New_Set_House_Primary_Color_Scheme:
    call Set_House_Primary_Color_Scheme
    TAction__Operator__Epilogue

.New_Set_House_Secondary_Color_Scheme:
    call Set_House_Secondary_Color_Scheme
    TAction__Operator__Epilogue

.New_Set_House_Build_Level:
    call Set_House_Build_Level
    TAction__Operator__Epilogue

.New_Set_House_IQ:
    call Set_House_IQ
    TAction__Operator__Epilogue

.New_House_Make_Ally:
    call House_Make_Ally
    TAction__Operator__Epilogue

.New_House_Make_Enemy:
    call House_Make_Enemy
    TAction__Operator__Epilogue

.New_Create_Chronal_Vortex:
    call Create_Chronal_Vortex
    TAction__Operator__Epilogue

.New_Nuke_Strike_On_Waypoint:
    call Nuke_Strike_On_Waypoint
    TAction__Operator__Epilogue

.New_Capture_Attached_Objects:
    call Capture_Attached_Objects
    TAction__Operator__Epilogue

.New_Iron_Curtain_Attached_Objects:
    call Iron_Curtain_Attached_Objects
    TAction__Operator__Epilogue

.New_Create_Building_At_Waypoint:
    call Create_Building_At_Waypoint
    TAction__Operator__Epilogue

.New_Set_Mission_Attached_Objects:
    call Set_Mission_Attached_Objects
    TAction__Operator__Epilogue

.New_Repair_Attached_Buildings:
    call Repair_Attached_Buildings
    TAction__Operator__Epilogue

.New_Chrono_Shift_Attached_Objects:
    call Chrono_Shift_Attached_Objects
    TAction__Operator__Epilogue

.New_Chrono_Shift_Trigger_Object:
    call Chrono_Shift_Trigger_Object
    TAction__Operator__Epilogue

.New_Iron_Curtain_Trigger_Object:
    call Iron_Curtain_Trigger_Object
    TAction__Operator__Epilogue

.New_Add_Infantry_To_Sidebar_Action:
    mov  edx,0xE ; RTTIType == INFANTRYTYPE
    call Add_To_Sidebar_Action
    TAction__Operator__Epilogue

.New_Add_Building_To_Sidebar_Action:
    mov  edx,0x6 ; RTTIType == BUILDINGTYPE
    call Add_To_Sidebar_Action
    TAction__Operator__Epilogue

.New_Add_Aircraft_To_Sidebar_Action:
    mov  edx,0x2 ; RTTIType == AIRCRAFTTYPE
    call Add_To_Sidebar_Action
    TAction__Operator__Epilogue

.New_Add_Vessel_To_Sidebar_Action:
    mov  edx,0x1F ; RTTIType == VESSELTYPE
    call Add_To_Sidebar_Action
    TAction__Operator__Epilogue

.New_Set_Map_Dimensions:
    call Set_Map_Dimensions
    TAction__Operator__Epilogue

.New_Do_Magic_Reinforcements:
    call Do_Magic_Reinforcements
    TAction__Operator__Epilogue
@ENDHACK


@HACK 0x00554171,0x00554176,_TActionClass__operator__TAction_Text_Trigger_Override_Color
    mov  eax,[ebp+TActionClass_This]
    mov  eax,dword[eax+5] ; Parameter 2, Color 
    cmp  al,0xFF  ; PCOLOR_NONE
    je	 .Default
    cmp  al,13 ; with added colors ; was 11  ; PCOLOR_COUNT
    jl   0x00554176
.Default:
    mov  eax,3 ; default: PCOLOR_GREEN
    jmp  0x00554176
@ENDHACK

