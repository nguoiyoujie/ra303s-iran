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

; Original -LAN code was in CCHyper's 3.04, love you <3

@HOOK 0x004F5B38 _arguments
@HOOK 0x005025CC _Select_Game_AntMissions_Check
@HOOK 0x004F496C _Select_Game_SkipDifficulty
@HOOK 0x004F4A23 _Select_Game_SkipDifficulty2
@HOOK 0x004F4A6D _Select_Game_SetScenarioName
@HOOK 0x004F429F _Init_Game_SkipIntro
@HOOK 0x004A537F _Main_Game_AutoExit

%define AntsEnabled        0x00665DDC
%define recording_mode        0x00680151

arg_attract: db "-ATTRACT",0
arg_lan: db "-LAN",0
arg_internet: db "-INTERNET",0
arg_skirmish: db "-SKIRMISH",0
arg_newmissions: db "-NEWMISSIONS",0
arg_antmissions: db "-ANTMISSIONS",0
arg_record: db "-RECORD",0
arg_playback: db "-PLAYBACK",0

; Syntax: ra95.exe -ONETIME <difficulty> <map>
; e.g. ra95.exe -ONETIME -EASY SCG01EA.ini
arg_onetime: db "-ONETIME",0 
arg_easy: db "-EASY",0 
arg_easyf: db "-FINE.EASY",0 
arg_norm: db "-NORMAL",0 
arg_hardf: db "-FINE.HARD",0 
arg_hard: db "-HARD",0 

; SCGxxEx.ini, SCUxxEx.ini, SCAxxEx.ini, CMUxxEx.ini
arg_missioncheck1g: db "SCG",0 
arg_missioncheck1u: db "SCU",0 
arg_missioncheck1a: db "SCA",0 
arg_missioncheck1c: db "CMU",0 
arg_missioncheck2: db "INI",0

antmissionsenabled db 0
newmissionsenabled db 0
onetimeenabled db 0
closegamestate db 0 ; 0=do not close, 1=play scenario first, 0xFF=close
onetimedifficulty db 0
presetdifficultyenabled db 0
presetscenarioname times 128 db 0


_Select_Game_AntMissions_Check:

    cmp  BYTE [onetimeenabled], 1
    jne  .Check_AntMission
	
    mov  BYTE [onetimeenabled], 0
    mov  DWORD [ebp-30h], 2
    ;xor  edi, edi
    jmp  0x005025D4

.Check_AntMission:
    cmp  BYTE [antmissionsenabled], 1
    jne  .Jump_Back

    mov  BYTE [antmissionsenabled], 0
    mov  BYTE [AntsEnabled], 1
    mov  DWORD [ebp-30h], 2
    xor  edi, edi

.Jump_Back:
    test edi, edi
    jnz  0x0050210E
    jmp  0x005025D4

_arguments:
.lan:
    MOV  EDX, arg_lan
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .skirmish
    MOV  BYTE [0x0067F2B4], 3
    JMP  .ret

.skirmish:
    MOV  EDX, arg_skirmish
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .antmissions
    MOV  BYTE [0x0067F2B4], 5
    JMP  .ret

.antmissions:
    MOV  EDX, arg_antmissions
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .onetime
    MOV  BYTE [antmissionsenabled], 1
    JMP  .ret
	
.onetime:
    MOV  EDX, arg_onetime
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .deasy    
;    MOV  BYTE [0x0067F2B4], 0
    MOV  BYTE [onetimeenabled], 1
    MOV  BYTE [closegamestate], 1
    JMP  .ret
	
.deasy:
    MOV  EDX, arg_easy
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .deasyf
    MOV  BYTE [onetimedifficulty], 0
    MOV  BYTE [presetdifficultyenabled], 1
    JMP  .ret

.deasyf:
    MOV  EDX, arg_easyf
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .dnorm
    MOV  BYTE [onetimedifficulty], 1
    MOV  BYTE [presetdifficultyenabled], 1
    JMP  .ret

.dnorm:
    MOV  EDX, arg_norm
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .dhardf
    MOV  BYTE [onetimedifficulty], 2
    MOV  BYTE [presetdifficultyenabled], 1
    JMP  .ret

.dhardf:
    MOV  EDX, arg_hardf
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .dhard
    MOV  BYTE [onetimedifficulty], 3
    MOV  BYTE [presetdifficultyenabled], 1
    JMP  .ret

.dhard:
    MOV  EDX, arg_hard
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .newmissions
    MOV  BYTE [onetimedifficulty], 4
    MOV  BYTE [presetdifficultyenabled], 1
    JMP  .ret

.newmissions:
    MOV  EDX, arg_newmissions
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .internet
    MOV  BYTE [newmissionsenabled], 1
    JMP  .ret

.internet:
    MOV  EDX, arg_internet
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .record
    MOV  BYTE [0x0067F2B4], 4

.record:
    MOV  EDX, arg_record
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .playback
    or   BYTE [recording_mode], 5

.playback:
    MOV  EDX, arg_playback
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .missioncheck
    or   BYTE [recording_mode], 6

.missioncheck:
    MOV  EDX, arg_missioncheck1g
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JNE  .missioncheck2
    MOV  EDX, arg_missioncheck1u
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JNE  .missioncheck2
    MOV  EDX, arg_missioncheck1a
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JNE  .missioncheck2
    MOV  EDX, arg_missioncheck1c
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE  .ret
.missioncheck2:
    MOV  EDX, arg_missioncheck2
    MOV  EAX,ESI
    CALL _stristr
    TEST EAX,EAX
    JE   .ret
    MOV  EAX,ESI
    push EAX
    push presetscenarioname
    call _strcpy

.ret:
    mov  EDX, arg_attract
    JMP  0x004F5B3D


_Select_Game_SkipDifficulty:
    xor  EAX, EAX
    mov  AL, byte [presetdifficultyenabled]
    test AL, AL
    jnz  .SkipDialog
    xor  EAX, EAX
    mov  AL, byte [EBP - 0x18]
    call 0x00551728
    jmp  .Ret
.SkipDialog:
    mov  AL, byte [onetimedifficulty]
.Ret:
    jmp  0x004F4976

_Select_Game_SkipDifficulty2:
    xor  EAX, EAX
    mov  AL, byte [presetdifficultyenabled]
    test AL, AL
    jnz  .SkipDialog
    xor  EAX, EAX
    call 0x00551728
    jmp  .Ret
.SkipDialog:
    mov  AL, byte [onetimedifficulty]
.Ret:
    jmp  0x004F4A2A


_Select_Game_SetScenarioName:
    mov  AL, byte [presetscenarioname]
    test AL, AL
    jz   .Ret
.SetName:
    mov  EDX, presetscenarioname
    mov  EAX, 0x006678E8
    call 0x0053CFB0    ; ScenarioClass::Set_Scenario_Name
	jmp  0x004F4ADC
.Ret:
    cmp  dword [AntsEnabled],0x0
    jmp  0x004F4A74


_Init_Game_SkipIntro:
    cmp  byte [onetimeenabled], 1
    jz   0x004F4377
    test byte [0x00669908], 0x4 
    jmp  0x004F42A6


_Main_Game_AutoExit:
    cmp  byte [closegamestate], 0
    jz   .SelectGame	
    cmp  byte [closegamestate], 1
	jz   .SetCloseNextTime
    xor  eax, eax
	jmp  .Ret
.SetCloseNextTime:
    mov  byte [closegamestate], 0xff
.SelectGame:
    mov  eax, [0x005FEDBC] 
    call 0x004f44dc ; Select_Game
.Ret:
    jmp  0x004A5389


