@LJMP 0x004F4B83, _Load_Game_Menu_Queue_Song_Call_Patch_Out
@LJMP 0x00538EF0, _Load_Game_Queue_Song
@LJMP 0x0056C15A, _ThemeClass_Track_Length
@LJMP 0x0056C439, _ThemClass_Scan
@LJMP 0x0056C40C, _ThemeClass_Scan_Jump_Over
@LJMP 0x0056C115, _ThemeClass_File_Name
@LJMP 0x0056BEA4, _ThemeClass_Full_Name
@LJMP 0x0056BFC4, _ThemeClass_Next_Song_RNG
@LJMP 0x0056BFF8, _ThemeClass_Next_Song_CMP
@LJMP 0x0056BFA3, _ThemeClass_Next_Song_Cond_Jump
@LJMP 0x0055066B, _SoundControlsClass_Process
@LJMP 0x0056C240, _ThemeClass_Is_Allowed
@LJMP 0x0056BFEC, _ThemeClass_Next_Song_BL_Register_Change
@LJMP 0x0053A36F, _Start_Scenario_Queue_Theme
@LJMP 0x004C7798, _TFixedIHeapClass__fn_init_Seed_NonCriticalRandomNumber
;@LJMP 0x00550668, _SoundControlClass_Process_Jump_Over_Looping_Themes
@LJMP 0x0056C3FE, _ThemeClass__Scan_Check_If_Atleast_One_Theme_Is_Available
@LJMP 0x0056BF08, _ThemeClass__AI_Dont_Do_Anything_If_No_Songs_Available

[section .data]
SongsAvailable: dd 0
FileClass_this3  TIMES 128 db 0
INIClass_this3 TIMES 128 db 0
FileClass_redalertini  TIMES 128 db 0
CCINIClass_redalertini TIMES 128 db 0
FileClass_Arazoid    TIMES 128 db 0
sprintf_buffer   TIMES 64 db 0
sprintf_buffer2   TIMES 64 db 0
music_filenames_buffer TIMES 8192 db 0 ; 128 * 32 bytes
FileClass_THEMEAVAILABLE  TIMES 128 db 0
music_array TIMES 400h db 0


[section .rdata]
bigfoot_str db"outtakes.AUD",0
musicini_str db"MUSIC.INI",0
str_filenames db"Filenames",0
str_fullnames db"Fullnames",0
str_tracklength db"Tracklength",0
str_showallmusic db"ShowAllMusic",0
str_options2 db"Options",0
str_redalert_ini db"REDALERT.INI",0
str_arazoidaud    db"ARAZOID.AUD",0
str_araziodaud    db"ARAZIOD.AUD",0
str_sprintf_format2 db"%d",0
str_sprintf_format db"%d",0
str_twincannonremix db"Twin Cannon (Remix)",0
str_underlyingthoughts db"Underlying Thoughts",0
str_voicerhythm2 db"Voice Rhythm 2",0
str_shutit db"Shut It",0
str_chaos db"Chaos",0
str_thesecondhand db"The Second Hand",0
str_backstab db"Backstab",0
str_twincannon db"Twin Cannon",0


[section .text]
; args: <section>, <key>, <default>
%macro this3_INI_Get_Int 3
    call_INIClass__Get_Int INIClass_this3, {%1}, {%2}, {%3}
%endmacro

; args: <section>, <key>, <default>, <dst>, <dst_len>
%macro this3_INI_Get_String 5
    call_INIClass__Get_String INIClass_this3, {%1}, {%2}, {%3}, {%4}, {%5}
%endmacro

; args: <corrected song full name>, <index>
%macro Correct_Song_Index_Name 2
    cmp  dl, %2
    mov  eax, %1
    je   0x0056BEF8
%endmacro

_ThemeClass__AI_Dont_Do_Anything_If_No_Songs_Available:
    cmp  dword [SongsAvailable], 0
    jz   0x0056BF76

    cmp  word [0x006ABFDA], 0 ; ds:int SampleType
    jz   0x0056BF76
    jmp  0x0056BF12

_ThemeClass__Scan_Check_If_Atleast_One_Theme_Is_Available:
    call 0x00462A30;  CCFileClass::Is_Available(int)
    cmp  byte al, 0
    jz   .Dont_Set_Atleast_One_Available

    mov  dword [SongsAvailable], 1

.Dont_Set_Atleast_One_Available:
    jmp  0x0056C403

_TFixedIHeapClass__fn_init_Seed_NonCriticalRandomNumber:
    xor  eax, eax
    call 0x005CEDA1 ; time_
    call 0x005CEDFE ; srand_
    call 0x005CEDDA ; rand_
    mov  edx, eax
    mov  eax, Globals___NonCriticalRandomNumber
    jmp  0x004C779D


_Load_Game_Menu_Queue_Song_Call_Patch_Out:
    jmp  0x004F4B88

_Load_Game_Queue_Song:
    cmp  byte [RedAlert.Options.RandomStartingSong], 0
    jz   .Ret

.Select_Random_Song:
    mov  eax, INIClass_this3
    mov  edx, str_filenames
    call INIClass__Entry_Count
    mov  ebx, 26h
    add  ebx, eax
    mov  eax, Globals___NonCriticalRandomNumber
    xor  edx, edx
    call RandomClass_Random
    mov  edx, eax
    mov  eax, 0x00668248 ; ThemeClass Theme
    call 0x0056C240 ; ThemeClass::Is_Allowed(ThemeType)
    test al, al
    jz   .Select_Random_Song

.Ret:
    mov  eax, 0x00668248 ; ThemeClass Theme
    call 0x0056C090 ; ThemeClass::Play_Song(ThemeType)
    jmp  0x00538EF5

_Start_Scenario_Queue_Theme:
    xor  edx, edx
    cmp  byte [RedAlert.Options.RandomStartingSong], 0
    jz   .Ret
    cmp  dword [SongsAvailable], 0
    jz   .Ret

.Select_Random_Song:
    mov  eax, INIClass_this3
    mov  edx, str_filenames
    call INIClass__Entry_Count
    mov  ebx, 26h
    add  ebx, eax
    mov  eax, Globals___NonCriticalRandomNumber
    xor  edx, edx
    call RandomClass_Random
    mov  edx, eax
    mov  eax, 0x00668248 ; ThemeClass Theme
    call 0x0056C240 ; ThemeClass::Is_Allowed(ThemeType)
    test al, al
    jz   .Select_Random_Song

.Ret:
    mov  eax, 0x00668248 ; ThemeClass Theme
    call 0x0056C020 ; ThemeClass::Queue_Song(ThemeType)
    jmp  0x0053A376

_SoundControlClass_Process_Jump_Over_Looping_Themes:
    sar  edx, 18h
    cmp  edx, 13h
    jz   0x00550662
    cmp  edx, 14h
    jz   0x00550662
    cmp  edx, 15h
    jz   0x00550662
    cmp  edx, 16h
    jz   0x00550662

    cmp  edx, 27h
    jge  0x00550727
    jmp  0x00550674

_ThemeClass_Next_Song_BL_Register_Change:
    mov  [ebp-0CH], dl
    jmp  0x0056C013


_ThemeClass_Is_Allowed:
    Save_Registers

    mov  eax, edx
    call 0x0056C110 ; char * ThemeClass::Theme_File_Name(ThemeType)

    mov  edx, eax
    mov  eax, FileClass_THEMEAVAILABLE
    call CCFileClass__CCFileClass

    ; check ini exists
    mov  eax, FileClass_THEMEAVAILABLE
    xor  edx, edx
    call CCFileClass__Is_Available
    test eax,eax
    je   .Ret_False_File_Not_Available

    Restore_Registers

    cmp  dl, 13h
    jz   .Ret_False2
    cmp  dl, 14h
    jz   .Ret_False2
    cmp  dl, 15h
    jz   .Ret_False2
    cmp  dl, 16h
    jz   .Ret_False2

    push edx
    push edx

    mov  eax, [FileClass_redalertini]
    test eax, eax
    jnz  .Done_INIClass_Loading

    mov  edx, str_redalert_ini
    mov  eax, FileClass_redalertini
    call CCFileClass__CCFileClass

    ; check ini exists
    mov  eax, FileClass_redalertini
    xor  edx, edx
    call CCFileClass__Is_Available
;    test eax,eax
;    je .exit_error

    ; initialize CCINIClass
    mov  eax, CCINIClass_redalertini
    call CCINIClass__CCINIClass

    ; load FileClass to CCINIClass
    mov  edx, FileClass_redalertini
    mov  eax, CCINIClass_redalertini
    call CCINIClass__Load

.Done_INIClass_Loading:
    call_INIClass__Get_Bool CCINIClass_redalertini, str_options2, str_showallmusic, 1
    pop  edx
    cmp  eax, 0
    je   .Ret_Original_Function

    pop  edx
    mov  eax, 1
    retn
.Ret_False:
    pop  edx
    mov  eax, 0
    retn

.Ret_False2:
    mov  eax, 0
    retn

.Ret_False_File_Not_Available:
    Restore_Registers
    mov  eax, 0
    retn

.Ret_Original_Function:
    pop  edx

    push ebp
    mov  ebp, esp
    push ebx
    push ecx
    push esi
    push edi

    jmp  0x0056C247

_ThemeClass_Next_Song_Cond_Jump:
    sar  eax, 18h
    shl  eax, 5

    cmp  dl, 26h
    jge  0x0056BFB2

    jmp  0x0056BFA9

_ThemeClass_Next_Song_CMP:
    mov  [ebp-0Ch], al

    push ebx
    push eax
    push edx

    mov  eax, INIClass_this3
    mov  edx, str_filenames
    call INIClass__Entry_Count

    mov  ebx, 26h
    add  ebx, eax

    pop  edx
    pop  eax

    cmp  al, bl
    pop  ebx
    jle  0x0056C002

    jmp  0x0056BFFD

_ThemeClass_Next_Song_RNG:

    mov  eax, INIClass_this3
    mov  edx, str_filenames
    call INIClass__Entry_Count

    mov  ebx, 26h
    add  ebx, eax

    jmp  0x0056BFC9

_SoundControlsClass_Process:
;    cmp        edx, 13h
;    jz        0x00550662
;    cmp        edx, 14h
;    jz        0x00550662
;    cmp        edx, 15h
;    jz        0x00550662
;    cmp        edx, 16h
;    jz        0x00550662

    push edx
;    push    ebx

    mov  eax, INIClass_this3
    mov  edx, str_filenames
    call INIClass__Entry_Count
;    add        ebx, eax

    mov  ebx, 27h
    add  ebx, eax
    pop  edx
    cmp  edx, ebx

    jge  0x00550727
    jmp  0x00550674

_ThemeClass_Full_Name:
;    Correct_Song_Index_Name str_twincannon, 17
;    Correct_Song_Index_Name str_thesecondhand, 23
;    Correct_Song_Index_Name str_backstab, 25
;    Correct_Song_Index_Name str_chaos, 26
;    Correct_Song_Index_Name str_shutit, 27
;    Correct_Song_Index_Name str_twincannonremix, 28
;    Correct_Song_Index_Name str_underlyingthoughts, 29
;    Correct_Song_Index_Name str_voicerhythm2, 30

;    cmp     dl, 26h
;    jge        Return_Custom_Name

    cmp  dl, 27h
    jge  Return_Custom_Name

    jmp  0x0056BEA9

Return_Custom_Name:
;    mov eax, bigfoot_str

    push edx
    push ebx
    push ecx
    push esi
    push edi

    push edx ; save value of index

    mov  eax, [FileClass_this3]
    test eax, eax
    jnz  .Done_INIClass_Loading

    mov  edx, musicini_str
    mov  eax, FileClass_this3
    call CCFileClass__CCFileClass

    ; check ini exists
    mov  eax, FileClass_this3
    xor  edx, edx
    call CCFileClass__Is_Available
    test eax,eax
;    je File_Not_Available ; on file not available

    ; initialize CCINIClass
    mov  eax, INIClass_this3
    call CCINIClass__CCINIClass

    ; load FileClass to CCINIClass
    mov  edx, FileClass_this3
    mov  eax, INIClass_this3
    call CCINIClass__Load

.Done_INIClass_Loading:
;    cmp dword [mission_index_counter], 3 ; hard-coded max to read inis
;    jz    Ret_Empty_String2

    pop  esi ; pop saved value of index into esi
    sub  esi, 26h    ; substract so we get 1 for the first index..
    push esi

    push esi             ; Format
    push str_sprintf_format ; %d
    lea  esi, [sprintf_buffer]
    push esi             ; Dest

    call _sprintf
    add  esp, 0Ch

;    mov esi, dword newmissions_array
    pop  esi ; pop saved value of index-minus 25h (index 1 into ini) into esi
    sub  esi, 1 ;need to substract 1 for 0-based indexing for the filenames_buffer
    push esi ; push again for later use
    imul esi, 32
    lea  esi, [music_filenames_buffer+esi]

    this3_INI_Get_String str_fullnames, sprintf_buffer, str_EmptyString, esi, 32

    pop  esi ; get our 0-based indexed index
    imul esi, 32
    lea  eax, [music_filenames_buffer+esi]
;    lea eax, [bigfoot_str]

    pop  edi
    pop  esi
    pop  ecx
    pop  ebx
    pop  edx

    jmp  0x0056BEF8

_ThemeClass_Scan_Jump_Over:
    jmp  0x0056C412

_ThemeClass_Track_Length:
    cmp  eax, 27h
    jnb  .Return_Custom_Length
    jmp  0x0056C15F

.Return_Custom_Length:
    push edx
    push ebx
    push ecx
    push esi
    push edi

    sub  eax, 26h    ; substract so we get 1 for the first index..

    push eax             ; Format
    push str_sprintf_format ; %d
    lea  esi, [sprintf_buffer]
    push esi             ; Dest

    call _sprintf
    add  esp, 0Ch

    this3_INI_Get_Int str_tracklength, sprintf_buffer, 0

    pop  edi
    pop  esi
    pop  ecx
    pop  ebx
    pop  edx

    mov  esp, ebp
    pop  ebp
    retn

_ThemClass_Scan:
    mov  [ebp-0Ch], dl
    cmp  dl, 100 ; Amount of indexes to scan for?
    jmp  0x0056C43F

_ThemeClass_File_Name:
    push edx
    test al, al
    jl   0x0056C144

    cmp  al, 18h
    je   .Arazoid_Fix

    cmp  al, 27h
    jge  Return_Custom_String
;    cmp     al, 27h
;    jge     0x0056C144
    jmp  0x0056C11E

.Arazoid_Fix:
    mov  edx, str_arazoidaud
    mov  eax, FileClass_Arazoid
    call CCFileClass__CCFileClass

    mov  eax, FileClass_Arazoid
    xor  edx, edx
    call CCFileClass__Is_Available
    test eax,eax
    jnz  .Arazoid

    mov  eax, str_araziodaud
    jmp  .Ret_Arazoid_Fix

.Arazoid:
    mov  eax, str_arazoidaud
    jmp  .Ret_Arazoid_Fix

.Ret_Arazoid_Fix:
    lea  esp, [ebp-0Ch]
    pop  edx
    pop  ecx
    pop  ebx
    pop  ebp
    retn

Return_Custom_String:

    push eax ; save value of index

    mov  eax, [FileClass_this3]
    test eax, eax
    jnz  .Done_INIClass_Loading

    mov  edx, musicini_str
    mov  eax, FileClass_this3
    call CCFileClass__CCFileClass

    ; check ini exists
    mov  eax, FileClass_this3
    xor  edx, edx
    call CCFileClass__Is_Available
    test eax,eax
;    je File_Not_Available ; on file not available

    ; initialize CCINIClass
    mov  eax, INIClass_this3
    call CCINIClass__CCINIClass

    ; load FileClass to CCINIClass
    mov  edx, FileClass_this3
    mov  eax, INIClass_this3
    call CCINIClass__Load

.Done_INIClass_Loading:
;    cmp dword [mission_index_counter], 3 ; hard-coded max to read inis
;    jz    Ret_Empty_String2

    pop  esi ; pop saved value of index into esi
    sub  esi, 26h    ; substract so we get 1 for the first index..
    push esi

    push esi             ; Format
    push str_sprintf_format ; %d
    lea  esi, [sprintf_buffer]
    push esi             ; Dest

    call _sprintf
    add  esp, 0Ch

;    mov esi, dword newmissions_array
    pop  esi ; pop saved value of index-minus 25h (index 1 into ini) into esi
    sub  esi, 1 ;need to substract 1 for 0-based indexing for the filenames_buffer
    push esi
    imul esi, 32
    lea  esi, [music_filenames_buffer+esi]

    this3_INI_Get_String str_filenames, sprintf_buffer, str_EmptyString, esi, 32

    pop  esi ; get our 0-based indexed index
    imul esi, 32
    lea  eax, [music_filenames_buffer+esi]
;    mov eax, bigfoot_str
    jmp  0x0056C149

File_Not_Available:
    int  3
