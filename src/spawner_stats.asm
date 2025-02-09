
cextern HouseClass__Flag_To_Die
cextern HouseClass__As_Pointer
cextern Globals___Session_Type

cextern str_dmp_Stats

cextern Globals___SaveGameVersion



@SJMP 0x004D3C95,0x004D3C9E ; _HouseClass__HouseClass_Enable_Unit_Trackers_Spawner
@SJMP 0x004D3E52,0x004D3E5F ; _HouseClass__Deconstructor_Delete_Unit_Trackers_Spawner
@SJMP 0x0045AF9F,0x0045AFA8 ; _BuildingClass__Captured_Increment_Unit_Total
@SJMP 0x004A0B00,0x004A0B09 ; _CellClass__Goodie_Check_Track_Crates_Spawner
@SJMP 0x0052B8F0,0x0052B916 ; _Execute_DoList_No_Special_End_Game_Statistics_Logic_For_Two_Players_Game

@SJMP 0x005B654A,0x005B6557 ; jump over pWOLobject == NULL check
@SJMP 0x005B6574,0x005B659C ; jump over SDFX WOL code
@SJMP 0x005B6636,0x005B666C ; jump over WOL code
@SJMP 0x005B6850,0x005B6862 ; jump into WOL code for addresses and ping stuff (might cause crashes in online mode)
@SJMP 0x005B6AD2,0x005B6AF0 ; jump over some WOL specific ping code
@SJMP 0x005B78DD,0x005B7925 ; jump to exit before WOL packet sending

@SJMP 0x00566BB5,0x00566BBE ; jump over SessionClass == 4 check for UnitTrackerClass::Increment_Unit_Total
@SJMP 0x00566B44,0x00566B4D ; jump over SessionClass == 4 check for UnitTrackerClass::Increment_Unit_Total
@SJMP 0x00566AD4,0x00566ADD ; jump over SessionClass == 4 check for UnitTrackerClass::Increment_Unit_Total
@SJMP 0x00566A65,0x00566A6E ; jump over SessionClass == 4 check for UnitTrackerClass::Increment_Unit_Total
@SJMP 0x005669A3,0x005669AC ; jump over SessionClass == 4 check for UnitTrackerClass::Increment_Unit_Total


cextern CCFileClass__CCFileClass
cextern CCFileClass__Write
cextern CCFileClass__Close
cextern CCFileClass__Open

; PlanetWestwoodStartTime & PlanetWestwoodGameID are global int32 variables that probably need to be filled in by spawner code

%define Stats_PacketClass_This    -0x6C

[section .data] 
Ally_Field db"ALY"
Ally_Field_Player db 0x3F
Ally_Field_Null db 0
IsDead_Field db"DED"
IsDead_Field_Player db 0x3F
IsDead_Field_Null db 0
IsSpectator_Field db"SPC"
IsSpectator_Field_Player db 0x3F
IsSpectator_Field_Null db 0
SpawnLocation_Field db"SPA"
SpawnLocation_Field_Player db 0x3F
SpawnLocation_Field_Null db 0
ConnectionLost_Field db"CON"
ConnectionLost_Field_Player db 0x3F
ConnectionLost_Field_Null db 0
Resigned_Field db"RSG"
Resigned_Field_Player db 0x3F
Resigned_Field_Null db 0
Statistics_Packet_Sent: db    0


@HACK 0x004BD1FF,0x004BD204,_EventClass__Execute_Set_HouseClass_Resign_On_DESTRUCT_Event
    or   byte[eax+HouseClass.Offset.Resigned],4 ; offset 3
    call HouseClass__Flag_To_Die
    jmp  0x004BD204
@ENDHACK


@HACK 0x00506676,0x0050667C,_Destroy_Connection_Add_HouseClass_Connection_Lost_Info
    cmp  edx,0
    jz   .Ret
    or   byte[eax+HouseClass.Offset.ConnectionLost],2 ; offset 2 for connection lost
.Ret:
    test byte[eax+HouseClass.Offset.IsHuman],2
    jz   0x00506837
    jmp  0x0050667C
@ENDHACK


@HACK 0x005B7754,0x005B7759,_Send_Statistics_Packet_New_Per_Player_Fields
    mov  byte al,[ebp-0x48]
    add  al,0x31
    mov  byte[Ally_Field_Player],al
    mov  eax,0x10
    mov  ebx,[esi+HouseClass.Offset.Allies] ; Alliances bit field
    call 0x005BBF80 ; operator new(uint)
    test eax,eax
    jz   .Ally_Field_Operator_New_Failed
    mov  edx,Ally_Field
    call 0x005B8878 ; FieldClass::FieldClass(char *,ulong)
.Ally_Field_Operator_New_Failed:
    mov  edx,eax
    lea  eax,[ebp+Stats_PacketClass_This]
    call 0x005B7A14 ; PacketClass::Add_Field(FieldClass *)
    ;ConnectionLost field
    mov  byte al,[ebp-0x48]
    add  al,0x31
    mov  byte[ConnectionLost_Field_Player],al
    mov  eax,0x10
    xor  ebx,ebx
    mov  byte bl,[esi+HouseClass.Offset.ConnectionLost]
    and  bl,0x2
    shr  bl,1
    call 0x005BBF80 ; operator new(uint)
    test eax,eax
    jz   .ConnectionLost_Field_Operator_New_Failed
    mov  edx,ConnectionLost_Field
    call 0x005B8878 ; FieldClass::FieldClass(char *,ulong)
.ConnectionLost_Field_Operator_New_Failed:
    mov  edx,eax
    lea  eax,[ebp+Stats_PacketClass_This]
    call 0x005B7A14 ; PacketClass::Add_Field(FieldClass *)
    ;Resigned field
    mov  byte al,[ebp-0x48]
    add  al,0x31
    mov  byte[Resigned_Field_Player],al
    mov  eax,0x10
    xor  ebx,ebx
    mov  byte bl,[esi+HouseClass.Offset.Resigned]
    and  bl,0x4
    shr  bl,2
    call 0x005BBF80 ; operator new(uint)
    test eax,eax
    jz   .Resigned_Field_Operator_New_Failed
    mov  edx,Resigned_Field
    call 0x005B8878 ; FieldClass::FieldClass(char *,ulong)
.Resigned_Field_Operator_New_Failed:
    mov  edx,eax
    lea  eax,[ebp+Stats_PacketClass_This]
    call 0x005B7A14 ; PacketClass::Add_Field(FieldClass *)
    ;SpawnLocation field
    mov  al,byte[ebp-0x48]
    add  al,0x31
    mov  byte[SpawnLocation_Field_Player],al
    mov  eax,0x10
    xor  ebx,ebx
    mov  bx,word[esi+HouseClass.Offset.SpawnLocation] ; SpawnLocation
    call 0x005BBF80 ; operator new(uint)
    test eax,eax
    jz   .SpawnLocation_Field_Operator_New_Failed
    mov  edx,SpawnLocation_Field
    call 0x005B8878 ; FieldClass::FieldClass(char *,ulong)
.SpawnLocation_Field_Operator_New_Failed:
    mov  edx,eax
    lea  eax,[ebp+Stats_PacketClass_This]
    call 0x005B7A14 ; PacketClass::Add_Field(FieldClass *)
    ; IsDead field
    mov  al,byte[ebp-0x48]
    add  al,0x31
    mov  byte[IsDead_Field_Player],al
    mov  eax,0x10
    xor  ebx,ebx
    test byte[esi+0x43],1 ; IsDead bit field
    setnz bl
    call 0x005BBF80 ; operator new(uint)
    test eax,eax
    jz   .IsDead_Field_Operator_New_Failed
    mov  edx,IsDead_Field
    call 0x005B8878 ; FieldClass::FieldClass(char *,ulong)
.IsDead_Field_Operator_New_Failed:
    mov  edx,eax
    lea  eax,[ebp+Stats_PacketClass_This]
    call 0x005B7A14 ; PacketClass::Add_Field(FieldClass *)
    ; IsSpectator Field
    mov  al,byte[ebp-0x48]
    add  al,0x31
    mov  byte[IsSpectator_Field_Player],al
    mov  eax,0x10
    xor  ebx,ebx
    mov  bl,byte[esi+HouseClass.Offset.IsSpectator] ; Alliances bit field
    and  bl,1
    call 0x005BBF80 ; operator new(uint)
    test eax,eax
    jz   .IsSpectator_Field_Operator_New_Failed
    mov  edx,IsSpectator_Field
    call 0x005B8878 ; FieldClass::FieldClass(char *,ulong)
.IsSpectator_Field_Operator_New_Failed:
    mov  edx,eax
    lea  eax,[ebp+Stats_PacketClass_This]
    call 0x005B7A14 ; PacketClass::Add_Field(FieldClass *)
.Ret:
    mov  al,byte[ebp-0x48]
    add  al,0x31
    jmp  0x005B7759
@ENDHACK


@HACK 0x00566C09,0x00566C0F,_TechnoClass__Record_The_Kill_Vessels_Killed_Fix
    mov  eax,[eax+HouseClass.Offset.DestroyedVessels] ; preeviously mistakenly logged into units
    jmp  0x00566C0F
@ENDHACK


@HACK 0x005B6544,0x005B654A,_Send_Statistics_Packet_Send_Only_Once
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL ; if single player dont send statistics
    jz   .Early_Ret
    cmp  dword[Globals___SaveGameVersion],0 ; if we loaded from savegame dont send statistics
    jnz  .Early_Ret
    cmp  byte[spawner_is_active],0
    jz   .Normal_Code
    cmp  byte[Statistics_Packet_Sent],0
    jz   .First_Time
.Early_Ret:
    sub  esp,0x5DC
    jmp  0x005B7940
.First_Time:
    mov  byte[Statistics_Packet_Sent],1
    jmp  .Normal_Code
.Normal_Code:
    sub  esp,0x5DC
    jmp  0x005B654A
@ENDHACK


;@HACK 0x005B712F,_Send_Statistics_Packet_Skip_Clear_Unit_Total
;    xor  ecx,ecx
;    xor  ebx,ebx
;    jmp  0x005B716A
;@ENDHACK


; consider expanding to support 256 items
@HACK 0x005B756B,0x005B7587,_Send_Statistics_Packet_Fix_VSLx_Info
    lea  eax,[esi+HouseClass.Offset.NewVQuantity]
    mov  ecx,7
    call Dword_Swap_Memory
    lea  ebx,[esi+HouseClass.Offset.NewVQuantity]
    mov  ecx,0x1C
    mov  eax,0x10
    jmp  0x005B7587
@ENDHACK


@HACK 0x005B74FD,0x005B7519,_Send_Statistics_Packet_Fix_PLLx_Info
    lea  eax,[esi+HouseClass.Offset.NewAQuantity]
    mov  ecx,7
    call Dword_Swap_Memory
    lea  ebx,[esi+HouseClass.Offset.NewAQuantity]
    mov  ecx,0x1C
    mov  eax,0x10
    jmp  0x005B7519
@ENDHACK


@HACK 0x005B74C8,0x005B74E0,_Send_Statistics_Packet_Fix_UNLx_Info
    lea  eax,[esi+HouseClass.Offset.NewUQuantity]
    mov  ecx,0x16
    call Dword_Swap_Memory
    lea  ebx,[esi+HouseClass.Offset.NewUQuantity]
    mov  ecx,88
    mov  eax,0x10
    jmp  0x005B74E0
@ENDHACK


@HACK 0x005B7493,0x005B74AB,_Send_Statistics_Packet_Fix_INLx_Info
    lea  eax,[esi+HouseClass.Offset.NewIQuantity]
    mov  ecx,26
    call Dword_Swap_Memory
    lea  ebx,[esi+HouseClass.Offset.NewIQuantity]
    mov  ecx,0x68
    mov  eax,0x10
    jmp  0x005B74AB
@ENDHACK


@HACK 0x005B7536,0x005B754E,_Send_Statistics_Packet_FIX_BLLx_Info
    lea  eax,[esi+HouseClass.Offset.NewBQuantity]
    mov  ecx,87
    call Dword_Swap_Memory
    lea  ebx,[esi+HouseClass.Offset.NewBQuantity]
    mov  ecx,0x15C
    mov  eax,0x10
    jmp  0x005B754E
@ENDHACK


@HACK 0x005B65EB,0x005B65F6,_Send_Statistics_Packet_Fix_NUMP_Human_Player_Count
    mov  ebx,[HumanPlayers]
    jmp  0x005B65F6
@ENDHACK


@HACK 0x005B7103,0x005B7109,_Send_Statistics_Packet_Fix_VSLx_Byte_Order
    mov  eax,[esi+0x1AF]
    call 0x00581D20 ; UnitTrackerClass::To_PC_Format(void)
    mov  eax,[esi+0x1A3]
    jmp  0x005B7109
@ENDHACK


@HACK 0x005B6F3B,0x005B6F46,_Send_Statistics_Packet_Fix_Color_Info
    mov  byte dl,[eax+0x25]
    xor  eax,eax
    mov  al,dl
    call HouseClass__As_Pointer
    mov  byte dl,[eax+HouseClass.Offset.RemapColor]
    mov  eax,0x10
    jmp  0x005B6F46
@ENDHACK


; Prevent crash when playing in singleplayer
@HACK 0x00581CA4,0x00581CAF,_UnitTrackerClass__Decrement_Unit_Total_Skip_Singleplayer
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jz   .Early_Return
    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .Hack_For_Old_Skirmish_Savegames
.Normal_Code:
    push ebp
    mov  ebp,esp
    mov  eax,[eax]
    dec  dword[eax+edx*4]
    mov  esp,ebp
    pop  ebp
.Early_Return:
    jmp  0x00581CAF ; jmp to retn instruction at tend of function
.Hack_For_Old_Skirmish_Savegames:
    cmp  byte[spawner_is_active],0
    jz   .Early_Return
    cmp  dword[Globals___SaveGameVersion],0
    jnz  .Early_Return
    jmp  .Normal_Code
@ENDHACK


; Prevent crash when playing in singleplayer
@HACK 0x00581C98,0x00581CA3,_UnitTrackerClass__Increment_Unit_Total_Skip_Singleplayer
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jz   .Early_Return
    cmp  byte[Globals___Session_Type],GameType.GAME_SKIRMISH
    jz   .Hack_For_Old_Skirmish_Savegames
.Normal_Code:
    push ebp
    mov  ebp,esp
    mov  eax,[eax]
    inc  dword[eax+edx*4]
    mov  esp,ebp
    pop  ebp
.Early_Return:
    jmp  0x00581CA3 ; jmp to retn instruction at tend of function
.Hack_For_Old_Skirmish_Savegames:
    cmp  byte[spawner_is_active],0
    jz   .Early_Return
    cmp  dword[Globals___SaveGameVersion],0
    jnz  .Early_Return
    jmp  .Normal_Code
@ENDHACK


@HACK 0x005B787D,0x005B7887,_Send_Statistics_Packet_Dump_Statistics
    Save_Registers
    ; char* buffer with all the statistics is in eax
    mov  edx,0x006ABC14 ; offset int Send_Statistics_Packet(void)::.0::packet_size
    call Write_Stats_File
.Ret:
    Restore_Registers
    mov  ebx,eax
    mov  edx,esi
    mov  [ebp-0xEC],esi
    jmp  0x005B7887
@ENDHACK


@HACK 0x004A558F,0x004A5596,_Main_Game__Main_Loop_End_Spawner
    cmp  byte[spawner_is_active],1
    jz   0x004A55A1
    cmp  dword[0x006ABBB8],0 ; GameStatisticsPacketSent
    jmp  0x004A5596
@ENDHACK


[section .text]
Write_Stats_File:

    push ebp
    mov  ebp,esp

%define stats_buf     ebp-4
%define stats_length  ebp-4-4
%define stats_file    ebp-4-4-100
    sub  esp,4+4+100

    lea  ebx,[stats_buf]
    mov  [ebx],eax
    lea  ebx,[stats_length]
    mov  [ebx],edx

    lea  eax,[stats_file]
    mov  edx,str_dmp_Stats
    call CCFileClass__CCFileClass

    mov  edx,3
    lea  eax,[stats_file]
    call CCFileClass__Open
    test eax,eax
    je   .exit

    mov  ebx,[stats_length]
    mov  ebx,[ebx]
    mov  edx,[stats_buf]

    lea  eax,[stats_file]
    call CCFileClass__Write

    lea  eax,[stats_file]
    call CCFileClass__Close
.exit:
    mov  eax,1
    mov  esp,ebp
    pop  ebp
    retn


; eax = memory address to start swapping,ecx = count
Dword_Swap_Memory:
    Save_Registers
    mov  esi,eax
    xor  ebx,ebx
    xor  edi,edi
.Loop:
    lea  eax,[esi]
    mov  eax,[ebx+eax]
    push ecx
    push eax             ; hostlong
    call 0x005E5A30 ; htonl(x)
    pop  ecx
    lea  edx,[esi]
    mov  [edx+ebx],eax
    inc  edi
    add  ebx,4
    cmp  edi,ecx
    jl   .Loop
    Restore_Registers
    retn

