;----------------------------------------------------------------
; src/features/load_more_mix_files.asm
;
; Allow additional mix files to be loaded. This includes 
;   spawn1.MIX
;   betateslatank.MIX
;   betadestroyer.MIX
;   betagunboat.MIX
;   betasubmarine.MIX
;   betacruiser.MIX
;   dosinterfacemod.MIX
;   campaign.MIX
;   aftermath.MIX
;   counterstrike.MIX
;   smallinfantry.MIX
;   oos-fix.MIX
;   movies-tlf.MIX
;   germanlanguagepack.MIX
;   germancensoredlanguagepack.MIX
;   germanuncensoredlanguagepack.MIX
;   frenchlanguagepack.MIX
;   spanishlanguagepack.MIX
;   russianlanguagepack.MIX
;   expand3.MIX
;   expand4.MIX
;   expand5.MIX
;   expand6.MIX
;   expand7.MIX
;   expand8.MIX
;   expand9.MIX
;   movies-1.MIX
;   movies-2.MIX
;   movies-3.MIX
;   movies-4.MIX
;   movies-5.MIX
;   movies-6.MIX
;   movies-7.MIX
;   movies-8.MIX
;   movies-9.MIX
;   movies-10.MIX
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

; Loads without caching in memory
; args: <mix file name string>
%macro Load_Mix_File 1
mov     edx,%1
mov     ecx,0x006017D0
mov     eax,0x24
call    0x005BBF80
test    eax,eax
mov     ebx,Globals___FastKey
call    MixFileClass_CCFileClass_Retrieve
%endmacro


; args: <mix file name string>
%macro Load_Mix_File_Cached 1
mov     edx,%1
mov     ecx,0x006017D0
mov     eax,0x24
call    0x005BBF80
test    eax,eax
mov     ebx,Globals___FastKey
call    MixFileClass_CCFileClass_Retrieve
mov     eax,%1
xor     edx,edx
call    MixFileClass_CCFileClass_Cache
%endmacro


@HACK 0x004F7F26,0x004F7F2B,_Init_Bootstrap_Mixfiles__Postload_Mixes ; Called AFTER REDALERT.MIX is loaded
    Save_Registers
    call MixFileClass_CCFileClass_Retrieve

    cmp  byte[RedAlert.Options.UseDOSInterfaceMod],0
    jz   .Load_Beta_Cruiser

    Load_Mix_File_Cached str_mix_DOSInterfaceMod

.Load_Beta_Cruiser:

    cmp  byte[RedAlert.Options.UseBetaCruiser],0
    jz   .Load_Beta_Gunboat

    Load_Mix_File_Cached str_mix_BetaCruiser

.Load_Beta_Gunboat:

    cmp  byte[RedAlert.Options.UseBetaGunboat],0
    jz   .Load_Beta_Submarine

    Load_Mix_File_Cached str_mix_BetaGunboat

.Load_Beta_Submarine:

    cmp  byte[RedAlert.Options.UseBetaSubmarine],0
    jz   .Load_Destroyer_Mix

    Load_Mix_File_Cached str_mix_BetaSubmarine

.Load_Destroyer_Mix:

    cmp  byte[RedAlert.Options.UseBetaDestroyer],0
    jz   .Load_Beta_Tesla_Tank_Mix

    Load_Mix_File_Cached str_mix_BetaDestroyer

.Load_Beta_Tesla_Tank_Mix:

    cmp  byte[RedAlert.Options.UseBetaTeslaTank],0
    jz   .Load_Smallinfantry_MIX

    Load_Mix_File_Cached str_mix_BetaTeslaTank

.Load_Smallinfantry_MIX:
    cmp  byte[RedAlert.Options.UseSmallInfantry],0
    jz   .Load_Spawn1_MIX

    Load_Mix_File_Cached str_mix_SmallInfantry

.Load_Spawn1_MIX:

    Save_Registers

    call GetCommandLineA
    mov  edx,str_arg_Spawn
    call _stristr
    test eax,eax

    Restore_Registers
    jz   .Ret

    ; SPAWN1.MIX
    Load_Mix_File_Cached str_mix_Spawn1

.Ret:
    Restore_Registers
    jmp  0x004F7F2B
@ENDHACK


@HACK 0x004F7E13,0x004F7E18,_Init_Bootstrap_Mixfiles__Preload_Mixes ; Called before other MIX files are loaded
    ; The load order is important, files loaded first can't have their file content overwritten by files loaded later

    ; LANGUAGE PACKS STUFF
    call_CCINIClass__Load str_ini_RedAlert, CCFileClass_RedAlert, CCINIClass_RedAlert

    call_INIClass__Get_Int CCINIClass_RedAlert, str_Options, str_GameLanguage, 1
    mov  [RedAlert.Options.GameLanguage],eax

    cmp  dword[RedAlert.Options.GameLanguage],1
    jz   .Jump_Over

    cmp  dword[RedAlert.Options.GameLanguage],2
    jnz  .No_German
    Load_Mix_File_Cached str_mix_GermanLanguagePack

.No_German:
    cmp  dword[RedAlert.Options.GameLanguage],3
    jnz  .No_German_Censored
    Load_Mix_File_Cached str_mix_GermanCensoredLanguagePack

.No_German_Censored:
    cmp  dword[RedAlert.Options.GameLanguage],4
    jnz  .No_German_Uncensored
    Load_Mix_File_Cached str_mix_GermanUncensoredLanguagePack
.No_German_Uncensored:
    cmp  dword[RedAlert.Options.GameLanguage],5
    jnz  .No_French
    Load_Mix_File_Cached str_mix_FrenchLanguagePack

.No_French:
    cmp  dword[RedAlert.Options.GameLanguage],6
    jnz  .No_Spanish
    Load_Mix_File_Cached str_mix_SpanishLanguagePack
.No_Spanish:
    cmp  dword[RedAlert.Options.GameLanguage],7
    jnz  .No_Russian
    Load_Mix_File_Cached str_mix_RussianLanguagePack
.No_Russian:

.Jump_Over:

    ; SMALL INFANTRY
;    Load_Mix_File_Cached    str_mix_SmallInfantry

    ; OTHER
    Load_Mix_File_Cached str_mix_Campaign
    Load_Mix_File_Cached str_mix_Aftermath
    Load_Mix_File_Cached str_mix_Counterstrike
    Load_Mix_File str_mix_MoviesTLF
    Load_Mix_File_Cached str_mix_OOSFix

    ; EXTRA MOVIES-xx.MIX
    Load_Mix_File str_mix_Movies_10
    Load_Mix_File str_mix_Movies_9
    Load_Mix_File str_mix_Movies_8
    Load_Mix_File str_mix_Movies_7
    Load_Mix_File str_mix_Movies_6
    Load_Mix_File str_mix_Movies_5
    Load_Mix_File str_mix_Movies_4
    Load_Mix_File str_mix_Movies_3
    Load_Mix_File str_mix_Movies_2
    Load_Mix_File str_mix_Movies_1


    ; EXTRA EXPANDxx.MIX
    Load_Mix_File_Cached str_mix_Expand9
    Load_Mix_File_Cached str_mix_Expand8
    Load_Mix_File_Cached str_mix_Expand7
    Load_Mix_File_Cached str_mix_Expand6
    Load_Mix_File_Cached str_mix_Expand5
    Load_Mix_File_Cached str_mix_Expand4
    Load_Mix_File_Cached str_mix_Expand3

    mov  edx,0xFFFFFFFE
    mov  ecx,[0x006017D0]
    mov  [0x006017D0],edx
    mov  edx,0x005EBE41
    lea  eax,[ebp-0xCC]
    jmp  0x004F7E18
@ENDHACK
