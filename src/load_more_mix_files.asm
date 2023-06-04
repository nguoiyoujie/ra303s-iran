@HOOK 0x004F7E13 _load_more_mix_files ; Called before other MIX files are loaded
@HOOK 0x004F7F26 _Conditionally_Load_Small_Infantry_MIX ; Called AFTER REDALERT.MIX is loaded

%define MixFileClass_CCFileClass_Retrieve 0x005B8F30
%define MixFileClass_CCFileClass_Cache 0x005B93F0
%define PKey__FastKey 0x00665F68



; args: <mix file name string>
;%macro Load_Mix_File 1
;mov        eax, %1
;mov     edx, eax
;mov     ecx, eax
;mov     eax, 24h
;call    0x005BBF80
;test    eax, eax
;mov     ebx, MixFileRelated
;call    Mix_File_Load_Related_Function
;%endmacro

; Loads without caching in memory
; args: <mix file name string>
%macro Load_Mix_File 1
mov     edx, %1
mov     ecx, 0x006017D0
mov     eax, 24h
call    0x005BBF80
test    eax, eax
mov     ebx, PKey__FastKey
call    MixFileClass_CCFileClass_Retrieve
%endmacro


; args: <mix file name string>
%macro Load_Mix_File_Cached 1
mov     edx, %1
mov     ecx, 0x006017D0
mov     eax, 24h
call    0x005BBF80
test    eax, eax
mov     ebx, PKey__FastKey
call    MixFileClass_CCFileClass_Retrieve
mov     eax, %1
xor     edx, edx
call    MixFileClass_CCFileClass_Cache
%endmacro

_Conditionally_Load_Small_Infantry_MIX:
    Save_Registers

    call MixFileClass_CCFileClass_Retrieve

    cmp  byte [UseDOSInterfaceMod], 0
    jz   .Load_Beta_Cruiser

    Load_Mix_File_Cached str_mix_DOSInterfaceMod

.Load_Beta_Cruiser:

    cmp  byte [UseBetaCruiser], 0
    jz   .Load_Beta_Gunboat

    Load_Mix_File_Cached str_mix_BetaCruiser

.Load_Beta_Gunboat:

    cmp  byte [UseBetaGunboat], 0
    jz   .Load_Beta_Submarine

    Load_Mix_File_Cached str_mix_BetaGunboat

.Load_Beta_Submarine:

    cmp  byte [UseBetaSubmarine], 0
    jz   .Load_Destroyer_Mix

    Load_Mix_File_Cached str_mix_BetaSubmarine

.Load_Destroyer_Mix:

    cmp  byte [UseBetaDestroyer], 0
    jz   .Load_Beta_Tesla_Tank_Mix

    Load_Mix_File_Cached str_mix_BetaDestroyer

.Load_Beta_Tesla_Tank_Mix:

    cmp  byte [UseBetaTeslaTank], 0
    jz   .Load_Smallinfantry_MIX

    Load_Mix_File_Cached str_mix_BetaTeslaTank

.Load_Smallinfantry_MIX:
    cmp  byte [UseSmallInfantry], 0
    jz   .Load_Spawn1_MIX

    Load_Mix_File_Cached str_mix_SmallInfantry

.Load_Spawn1_MIX:

    Save_Registers

    call GetCommandLineA
    mov  edx, str_arg_Spawn
    call _stristr
    test eax,eax

    Restore_Registers
    jz   .Ret

    ; SPAWN1.MIX
    Load_Mix_File_Cached str_mix_Spawn1

.Ret:
    Restore_Registers
    jmp  0x004F7F2B

_load_more_mix_files:
    ; The load order is important, files loaded first can't have their file content overwritten by files loaded later

    ; LANGUAGE PACKS STUFF
    call_CCINIClass__Load str_ini_RedAlert, CCFileClass_RedAlert, CCINIClass_RedAlert

    call_INIClass__Get_Int CCINIClass_RedAlert, str_Options, str_GameLanguage, 1
    mov  [GameLanguage], eax

    cmp  dword [GameLanguage], 1
    jz   .Jump_Over

    cmp  dword [GameLanguage], 2
    jnz  .No_German
    Load_Mix_File_Cached str_mix_GermanLanguagePack

.No_German:
    cmp  dword [GameLanguage], 3
    jnz  .No_German_Censored
    Load_Mix_File_Cached str_mix_GermanCensoredLanguagePack

.No_German_Censored:
    cmp  dword [GameLanguage], 4
    jnz  .No_German_Uncensored
    Load_Mix_File_Cached str_mix_GermanUncensoredLanguagePack
.No_German_Uncensored:
    cmp  dword [GameLanguage], 5
    jnz  .No_French
    Load_Mix_File_Cached str_mix_FrenchLanguagePack

.No_French:
    cmp  dword [GameLanguage], 6
    jnz  .No_Spanish
    Load_Mix_File_Cached str_mix_SpanishLanguagePack
.No_Spanish:
    cmp  dword [GameLanguage], 7
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

    mov  edx, 0FFFFFFFEh
    mov  ecx, [0x006017D0]
    mov  [0x006017D0], edx
    mov  edx, 0x005EBE41
    lea  eax, [ebp-0CCh]
    jmp  0x004F7E18
