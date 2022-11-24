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
arg_mission: db "-M:",0
arg_record: db "-RECORD",0
arg_playback: db "-PLAYBACK",0

; Syntax: ra95.exe -ONETIME <difficulty> <map>
; e.g. ra95.exe -ONETIME -EASY SCG01EA.ini
arg_skiptitle: db "-NOTITLE",0 
arg_onetime: db "-ONETIME",0 
arg_easy: db "-EASY",0 
arg_easyf: db "-EASY.FINE",0 
arg_norm: db "-NORMAL",0 
arg_hardf: db "-HARD.FINE",0 
arg_hard: db "-HARD",0 

antmissionsenabled db 0
newmissionsenabled db 0
skiptitle db 0
onetimeenabled db 0
closegamestate db 0 ; 0=do not close, 1=play scenario first, 0xFF=close
presetdifficulty db 0
presetdifficultyenabled db 0
presetscenarioenabled db 0
presetscenarioname times 128 db 0


_Select_Game_AntMissions_Check:

    cmp  byte [presetscenarioenabled], 1
    jnz  .Check_AntMission
	
    mov  byte [presetscenarioenabled], 0
    mov  dword [ebp-30h], 2
    jmp  0x005025D4

.Check_AntMission:
    cmp  byte [antmissionsenabled], 1
    jne  .Jump_Back	

    mov  byte [antmissionsenabled], 0
    mov  byte [AntsEnabled], 1
    mov  dword [ebp-30h], 2
    xor  edi, edi

.Jump_Back:
    test edi, edi
    jnz  0x0050210E
    jmp  0x005025D4

_arguments:
.mission:
    push ecx
    mov  edx, arg_mission
    mov  eax,esi
	mov  ecx,eax
    call _stristr
    cmp  eax,ecx ; check if match is found at the start of the string
    pop  ecx
    jne  .lan    
	lea  eax,[eax + 3] ; -M:
    mov  byte [presetscenarioenabled], 1
    push eax
    push presetscenarioname
	call _strcpy
    jmp  .Ret

.lan:
    mov  edx, arg_lan
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .skirmish
    mov  byte [0x0067F2B4], 3
    jmp  .Ret

.skirmish:
    mov  edx, arg_skirmish
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .antmissions
    mov  byte [0x0067F2B4], 5
    jmp  .Ret

.antmissions:
    mov  edx, arg_antmissions
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .skiptitle
    mov  byte [antmissionsenabled], 1
    jmp  .Ret

.skiptitle:
    mov  edx, arg_skiptitle
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .onetime    
    mov  byte [skiptitle], 1
    jmp  .Ret
	
.onetime:
    mov  edx, arg_onetime
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .deasy    
    mov  byte [onetimeenabled], 1
    mov  byte [closegamestate], 1
    jmp  .Ret
	
.deasy:
    mov  edx, arg_easy
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .deasyf
    mov  byte [presetdifficulty], 0
    mov  byte [presetdifficultyenabled], 1
    jmp  .Ret

.deasyf:
    mov  edx, arg_easyf
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .dnorm
    mov  byte [presetdifficulty], 1
    mov  byte [presetdifficultyenabled], 1
    jmp  .Ret

.dnorm:
    mov  edx, arg_norm
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .dhardf
    mov  byte [presetdifficulty], 2
    mov  byte [presetdifficultyenabled], 1
    jmp  .Ret

.dhardf:
    mov  edx, arg_hardf
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .dhard
    mov  byte [presetdifficulty], 3
    mov  byte [presetdifficultyenabled], 1
    jmp  .Ret

.dhard:
    mov  edx, arg_hard
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .newmissions
    mov  byte [presetdifficulty], 4
    mov  byte [presetdifficultyenabled], 1
    jmp  .Ret

.newmissions:
    mov  edx, arg_newmissions
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .internet
    mov  byte [newmissionsenabled], 1
    jmp  .Ret

.internet:
    mov  edx, arg_internet
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .record
    mov  byte [0x0067F2B4], 4

.record:
    mov  edx, arg_record
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .playback
    or   byte [recording_mode], 5

.playback:
    mov  edx, arg_playback
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .Ret
    or   byte [recording_mode], 6

.Ret:
    mov  edx, arg_attract
    jmp  0x004F5B3D


_Select_Game_SkipDifficulty:
    xor  eax, eax
    mov  al, byte [presetdifficultyenabled]
    test al, al
    jnz  .SkipDialog
    mov  byte [presetdifficultyenabled], 0
    xor  eax, eax
    mov  al, byte [ebp - 0x18]
    call 0x00551728
    jmp  .Ret
.SkipDialog:
    mov  al, byte [presetdifficulty]
.Ret:
    jmp  0x004F4976

_Select_Game_SkipDifficulty2:
    xor  eax, eax
    mov  al, byte [presetdifficultyenabled]
    test al, al
    mov  byte [presetdifficultyenabled], 0
    jnz  .SkipDialog
    xor  eax, eax
    call 0x00551728
    jmp  .Ret
.SkipDialog:
    mov  al, byte [presetdifficulty]
.Ret:
    jmp  0x004F4A2A


_Select_Game_SetScenarioName:
    mov  al, byte [presetscenarioname]
    test al, al
    jz   .Ret
.SetName:
    mov  edx, presetscenarioname
    mov  eax, 0x006678E8
    call 0x0053CFB0    ; ScenarioClass::Set_Scenario_Name
    mov  byte [presetscenarioname], 0 ;invalidate the preset scenario name
	jmp  0x004F4ADC
.Ret:
    cmp  dword [AntsEnabled],0x0
    jmp  0x004F4A74


_Init_Game_SkipIntro:
    cmp  byte [skiptitle], 1
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
    call 0X004F44DC ; Select_Game
.Ret:
    jmp  0x004A5389


