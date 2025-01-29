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

;----------------------------------------------------------------
; src/features/arguments.asm
;
; Lists the command-line arguments supported by this extension.
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

@LJMP 0x004F5B38, _arguments
@LJMP 0x005025CC, _Select_Game_AntMissions_Check
@LJMP 0x004F496C, _Select_Game_SkipDifficulty
@LJMP 0x004F4A23, _Select_Game_SkipDifficulty2
@LJMP 0x004F4A6D, _Select_Game_SetScenarioName
@LJMP 0x004F429F, _Init_Game_SkipIntro
@LJMP 0x004A537F, _Main_Game_AutoExit

%define recording_mode                               0x00680151

[section .data] 
antmissionsenabled                                   db 0
newmissionsenabled                                   db 0
skiptitle                                            db 0
onetimeenabled                                       db 0
closegamestate                                       db 0 ; 0=do not close, 1=play scenario first, 0xFF=close
presetdifficulty                                     db 0
presetdifficultyenabled                              db 0
presetscenarioenabled                                db 0
presetscenarioname                                   times 128 db 0


[section .text] 
_Select_Game_AntMissions_Check:

    cmp  byte [presetscenarioenabled],1
    jnz  .Check_AntMission
	
    mov  byte [presetscenarioenabled],0
    mov  dword [ebp-30h],2
    jmp  0x005025D4

.Check_AntMission:
    cmp  byte [antmissionsenabled],1
    jne  .Jump_Back	

    mov  byte [antmissionsenabled],0
    mov  byte [Globals___AntsEnabled],1
    mov  dword [ebp-30h],2
    xor  edi,edi

.Jump_Back:
    test edi,edi
    jnz  0x0050210E
    jmp  0x005025D4

_arguments:
.mission:
    push ecx
    mov  edx,str_arg_MissionPrefix
    mov  eax,esi
	mov  ecx,eax
    call _stristr
    cmp  eax,ecx ; check if match is found at the start of the string
    pop  ecx
    jne  .lan    
	lea  eax,[eax + 3] ; -M:
    mov  byte [presetscenarioenabled],1
    push eax
    push presetscenarioname
	call _strcpy
    jmp  .Ret

.lan:
    mov  edx,str_arg_LAN
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .skirmish
    mov  byte [Globals___Session_Type],GameType.GAME_IPX
    jmp  .Ret

.skirmish:
    mov  edx,str_arg_Skirmish
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .antmissions
    mov  byte [Globals___Session_Type],GameType.GAME_SKIRMISH
    jmp  .Ret

.antmissions:
    mov  edx,str_arg_AntMissions
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .skiptitle
    mov  byte [antmissionsenabled],1
    jmp  .Ret

.skiptitle:
    mov  edx,str_arg_Skiptitle
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .onetime    
    mov  byte [skiptitle],1
    jmp  .Ret
	
.onetime:
    mov  edx,str_arg_Onetime
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .deasy    
    mov  byte [onetimeenabled],1
    mov  byte [closegamestate],1
    jmp  .Ret
	
.deasy:
    mov  edx,str_arg_Easy
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .deasyf
    mov  byte [presetdifficulty],0
    mov  byte [presetdifficultyenabled],1
    jmp  .Ret

.deasyf:
    mov  edx,str_arg_EasyF
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .dnorm
    mov  byte [presetdifficulty],1
    mov  byte [presetdifficultyenabled],1
    jmp  .Ret

.dnorm:
    mov  edx,str_arg_Norm
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .dhardf
    mov  byte [presetdifficulty],2
    mov  byte [presetdifficultyenabled],1
    jmp  .Ret

.dhardf:
    mov  edx,str_arg_HardF
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .dhard
    mov  byte [presetdifficulty],3
    mov  byte [presetdifficultyenabled],1
    jmp  .Ret

.dhard:
    mov  edx,str_arg_Hard
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .newmissions
    mov  byte [presetdifficulty],4
    mov  byte [presetdifficultyenabled],1
    jmp  .Ret

.newmissions:
    mov  edx,str_arg_NewMissions
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .internet
    mov  byte [newmissionsenabled],1
    jmp  .Ret

.internet:
    mov  edx,str_arg_Internet
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .record
    mov  byte [Globals___Session_Type],GameType.GAME_INTERNET

.record:
    mov  edx,str_arg_Record
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .playback
    or   byte [recording_mode],5

.playback:
    mov  edx,str_arg_Playback
    mov  eax,esi
    call _stristr
    test eax,eax
    je   .Ret
    or   byte [recording_mode],6

.Ret:
    mov  edx,str_arg_Attract
    jmp  0x004F5B3D


_Select_Game_SkipDifficulty:
    xor  eax,eax
    mov  al,byte [presetdifficultyenabled]
    test al,al
    jnz  .SkipDialog
    mov  byte [presetdifficultyenabled],0
    xor  eax,eax
    mov  al,byte [ebp - 0x18]
    call 0x00551728
    jmp  .Ret
.SkipDialog:
    mov  al,byte [presetdifficulty]
.Ret:
    jmp  0x004F4976

_Select_Game_SkipDifficulty2:
    xor  eax,eax
    mov  al,byte [presetdifficultyenabled]
    test al,al
    mov  byte [presetdifficultyenabled],0
    jnz  .SkipDialog
    xor  eax,eax
    call 0x00551728
    jmp  .Ret
.SkipDialog:
    mov  al,byte [presetdifficulty]
.Ret:
    jmp  0x004F4A2A


_Select_Game_SetScenarioName:
    mov  al,byte [presetscenarioname]
    test al,al
    jz   .Ret
.SetName:
    mov  edx,presetscenarioname
    mov  eax,Globals___Scen
    call ScenarioClass__Set_Scenario_Name
    mov  byte [presetscenarioname],0 ;invalidate the preset scenario name
	jmp  0x004F4ADC
.Ret:
    cmp  dword [Globals___AntsEnabled],0
    jmp  0x004F4A74


_Init_Game_SkipIntro:
    cmp  byte [skiptitle],1
    jz   0x004F4377
    test byte [0x00669908],0x4 
    jmp  0x004F42A6


_Main_Game_AutoExit:
    cmp  byte [closegamestate],0
    jz   .SelectGame	
    cmp  byte [closegamestate],1
	jz   .SetCloseNextTime
    xor  eax,eax
	jmp  .Ret
.SetCloseNextTime:
    mov  byte [closegamestate],0xff
.SelectGame:
    mov  eax,[0x005FEDBC] 
    call Init___Select_Game

.Ret:
    jmp  0x004A5389


