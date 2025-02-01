
extern Scenario___Start_Scenario


@SJMP 0x00538764,0x00538771

@HACK 0x005011FE,0x00501203,_Map_Selection_Selected_Mission_Name
    cmp  byte[NextCampaignMissionBuf],0
    jz   .Ret
    cmp  byte al,'A'
    jnz  .Not_A
    push MapSelectABuf
    jmp  .Start_String_Copy
.Not_A:
    cmp  byte al,'B'
    jnz  .Not_B
    push MapSelectBBuf
    jmp  .Start_String_Copy
.Not_B:
    cmp  byte al,'C'
    jnz  .Not_C
    push MapSelectCBuf
    jmp  .Start_String_Copy
.Start_String_Copy:
    push NextCampaignMissionBuf
    call _strcpy
.Not_C:
.Ret:
    mov  byte[0x00684F3A],al
    jmp  0x00501203
@ENDHACK


@HACK 0x00500C62,0x00500C67,_Map_Selection_Selection_Animation
    push 0
    lea  eax,[ebp-0x78]
    cmp  dword[MapSelectionAnimationBuf],0
    jz   .Ret
    lea  eax,[MapSelectionAnimationBuf]
.Ret:
    jmp  0x00500C67
@ENDHACK


@HACK 0x0053B23C,0x0053B241,_Campaign_Do_Win_Next_mission_In_Campaign
    cmp  byte[NextCampaignMissionBuf],0
    jz   .Ret
    ; Copy next campaign mission filename to ScenarioName global char array
    push NextCampaignMissionBuf
    push eax
    call _strcpy
    mov  eax,NextCampaignMissionBuf
.Ret:
    call Scenario___Start_Scenario
    jmp  0x0053B241
@ENDHACK


@HACK 0x0053B520,_Do_Win_Next_Mission_In_Campaign
    cmp  byte[NextCampaignMissionBuf],0
    jz   .Ret
    ; Copy next campaign mission filename to ScenarioName global char array
    push NextCampaignMissionBuf
    push eax
    call _strcpy
    mov  eax,NextCampaignMissionBuf
.Ret:
    call Scenario___Start_Scenario
    jmp  0x0053B525
@ENDHACK


@HACK 0x00501DDB,0x00501DE0,_Custom_Missions_Enable_Expansion_Missions_Button
    call 0x004BE090 ;  Expansion_CS_Present(void)
    cmp  eax,1
    jz   .Return_True
    call 0x004BE09C ;  Expansion_AM_Present(void)
    cmp  eax,1
    jz   .Return_True
    xor  eax,eax
    jmp  0x00501DE0
.Return_True:
    mov  eax,1
    jmp  0x00501DE0
@ENDHACK


@HACK 0x00501DB3,0x00501DB8,_Custom_Missions_Enable_Custom_Missions_Button
    mov  eax,1
    jmp  0x00501DB8
@ENDHACK


@HACK 0x00501E3F,0x00501E44,_Custom_Missions_Expansion_Missions_Button_Name
    push edx
    push eax
    Extract_Conquer_Eng_String 119
    mov  ebx,eax
    pop  eax
    pop  edx
    jmp  0x00501E44
@ENDHACK


@HACK 0x004BE7DE,0x004BE7E3,_Custom_Missions_Expansion_Missions_Dialog_Name
    push edx
    Extract_Conquer_Eng_String 119
    pop  edx
    jmp  0x004BE7E3
@ENDHACK


@HACK 0x004BE7C8,0x004BE7CD,_Custom_Missions_Custom_Missions_Dialog_Name
    push edx
    Extract_Conquer_Eng_String 120
    pop  edx
    jmp  0x004BE7CD
@ENDHACK


@HACK 0x00501E0E,0x00501E13,_Custom_Missions_Custom_Missions_Button_Name
    push edx
    push eax
    Extract_Conquer_Eng_String 120
    mov  ebx,eax
    pop  eax
    pop  edx
    jmp  0x00501E13
@ENDHACK


@HACK 0x004BE468,0x004BE46E,_Custom_Missions_Load_Mission_Name
    cmp  dword[ebp-0x24],0 ; Expansion type
    jz   .Do_Normal_Read
    Save_Registers
    mov  esi,dword[MissionCounter]
    inc  dword[MissionCounter]
    push esi             ; Format
    push str_sprintf_format3 ; %d
    lea  esi,[sprintf_buffer3]
    push esi             ; Dest
    call _sprintf
    add  esp,0xC
    Restore_Registers
    mov  esi,sprintf_buffer3
    jmp  0x004BE46E
.Do_Normal_Read:
    mov  esi,dword[esi+0x601400]
    jmp  0x004BE46E
@ENDHACK


@HACK 0x004BE491,0x004BE497,_Custom_Missions_Load_Mission_Name2
    cmp  dword[ebp-0x24],0 ; Expansion type
    jz   .Do_Normal_Read
    mov  esi,sprintf_buffer3
    jmp  0x004BE497
.Do_Normal_Read:
    mov  esi,dword[esi+0x601400]
    jmp  0x004BE497
@ENDHACK


@HACK 0x004BE929,0x004BE92F,_Custom_Missions_Hook_Function_End
    mov  dword[MissionCounter],0
    pop  edi
    pop  esi
    pop  edx
    pop  ecx
    pop  ebx
    pop  ebp
    retn
@ENDHACK


@HACK 0x004BE548,0x004BE54D,_Custom_Missions_Amount_To_Read
    cmp  dword[ebp-0x24],0 ; Expansion type
    jz   .Not_Custom_Missions_Dialog
    cmp  edi,0x999
    jge  0x004BE552
    jmp  0x004BE54D
.Not_Custom_Missions_Dialog:
    xor  ebx,ebx
    call 0x004BE090 ;  Expansion_CS_Present(void)
    cmp  eax,1
    jz   .CS_Present
    mov  ebx,0x24
.CS_Present:
    mov  eax,ebx
    cmp  edi,eax
    jge  0x004BE552
    jmp  0x004BE54D
@ENDHACK


@HACK 0x004BE732,0x004BE738,_Custom_Missions_Amount_To_Read2
    mov  [ebp-0x30],ecx
    cmp  dword[ebp-0x24],0 ; Expansion type
    jz   .Not_Custom_Missions_Dialog
    cmp  ecx,0x900
    jmp  0x004BE738
.Not_Custom_Missions_Dialog:
    mov  ebx,0x36
    call 0x004BE09C ;  Expansion_AM_Present(void)
    cmp  eax,1
    jz   .AM_Present
    mov  ebx,0x24
.AM_Present:
    mov  eax,ebx
    cmp  ecx,eax
    jmp  0x004BE738
@ENDHACK


@HACK 0x004BE132,0x004BE138,_Custom_Missions_Dont_Prepend_Side
    push str_s_format      ; "%s"
    jmp  0x004BE138
@ENDHACK


@HACK 0x004BE147,0x004BE14E,_Custom_Missions_Dont_Prepend_Side2
    mov  ax,[edi+0x2C]
    add  esp,0xC
    jmp  0x004BE14E
@ENDHACK

