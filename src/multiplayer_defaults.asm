%define BuildLevel                                    0x006016C8
%define UnitCount                                    0x0067F2CE
%define UnitCountNoBases                            0x00604CE0
%define Players                                        0x0067F2D2
%define SelectedMapIndex                            0x0067F2B6
%define ListClass_Set_Selected_Index                0x004FCC40
%define CheckListClass__Check_Item                    0x004A24D4
%define BasesOrNoBases                                0x0067F2BA
%define OreRegenerates                                0x0067F2C2
%define    Crates                                        0x0067F2C6
%define Special                                        0x00669908

extern CCFileClass__CCFileClass
extern CCFileClass__Is_Available
extern CCINIClass__Load

[section .data]
FirstLoad:            db 1
FirstLoad2:            db 1
FirstLoadLAN:        db 1
FirstLoadPlayers:    db 1
FirstLoadPlayers2:    db 1
ConfigMapIndex:        dd 1
bases:                db 1
crates:                db 1
oreregenerates:        db 1
shroudregrows:        db 1
ctf:                db 1
; sizes not actually verified
FileClass_this_  TIMES 128 db 0
INIClass_this_   TIMES 64 db 0


[section .rdata]
redalert_ini   db"REDALERT.INI",0
multiplayer_defaults_str db"MultiplayerDefaults",0
money_str db"Money",0
shroudregrows_str db"ShroudRegrows",0
capturetheflag_str db"CaptureTheFlag",0
crates_str db"Crates",0
bases_str db"Bases",0
oreregenerates_str db"OreRegenerates",0
unitcount_str db"UnitCount",0
techlevel_str db"TechLevel",0
aidifficulty_str db"AIDifficulty",0
aiplayers_str db"AIPlayers",0
mapindex_str db"MapIndex",0


[section .text]
; args: <section>,<key>,<default>
%macro this__INI_Get_Bool 3
    call_INIClass__Get_Bool INIClass_this_,{%1},{%2},{%3}
%endmacro

; args: <section>,<key>,<default>
%macro this__INI_Get_Int 3
    call_INIClass__Get_Int INIClass_this_,{%1},{%2},{%3}
%endmacro

@LJMP 0x00535CE6,_RulesClass_Multiplayer_Defaults
@LJMP 0x005136CE,_Skirmish_Players_Slider3
@LJMP 0x00513608,_Skirmish_UnitCount_Slider
@LJMP 0x005138A0,_Skirmish_Selected_Map_Index
@LJMP 0x00513163,_Skirmish_Set_AI_Difficulty
@LJMP 0x00513480,_Skirmish_Unit_Count_Change
@LJMP 0x00513554,_Skirmish_Check_Lists
@LJMP 0x00513534,_Skirmish_Add_CTF_Check_List
@LJMP 0x00514AA8,_Skirmish_Check_CTF_Check_List

@LJMP 0x0050BCDD,_LAN_Check_Lists
;@LJMP 0x0050C1AE,_LAN_Players_Slider3
@LJMP 0x0050CA4D,_LAN_UnitCount_Slider
@LJMP 0x0050BC36,_LAN_Unit_Count_Change
@LJMP 0x0050BF87,_LAN_Selected_Map_Index
@LJMP 0x005135AC,_Skirmish_Check_CTF_Check_Item
;@LJMP 0x00514854,_Skirmish_Check_CTF_Check_Item2 ; Doesn't work
;@LJMP 0x0051491E,_Skirmish_Check_CTF_Check_Item3 ; Doesn't work

_Skirmish_Check_CTF_Check_Item3:
    jmp  0x0051485D

_Skirmish_Check_CTF_Check_Item2:
    jmp  0x00514928

_LAN_Selected_Map_Index:
    lea  eax,[ebp-0x684]
    mov  edx,[SelectedMapIndex]

    call ListClass_Set_Selected_Index

    jmp  0x0050BF8D

_LAN_Unit_Count_Change:
    jmp  0x0050BC3B

_LAN_UnitCount_Slider:
    mov  edx,[UnitCount]
    lea  eax,[ebp-0x34C]
    jmp  0x0050CA55

_LAN_Players_Slider3:
    push eax
    cmp  byte[FirstLoadPlayers2],1
    jne  .Not_First_Load_Players

    mov  dword[FirstLoadPlayers2],0
    this__INI_Get_Int multiplayer_defaults_str,aiplayers_str,1
    mov  dword[Players],eax

.Not_First_Load_Players:
    pop  eax
    mov  edx,[Players]
    jmp  0x0050C1B4

_LAN_Check_Lists:
    lea  eax,[ebp-0x7AC]
    xor  ebx,ebx
    cmp  byte[FirstLoadLAN],1
    jnz  .Jump_Over_Bases
    mov  bl,byte[bases]
    mov  [BasesOrNoBases],ebx
.Jump_Over_Bases:
    mov  ebx,[BasesOrNoBases]
    mov  edx,0
    call CheckListClass__Check_Item

    lea  eax,[ebp-0x7AC]
    xor  ebx,ebx
    cmp  byte[FirstLoadLAN],1
    jnz  .Jump_Over_OreRegenerates
    mov  bl,byte[oreregenerates]
    mov  [OreRegenerates],ebx

.Jump_Over_OreRegenerates:
    mov  ebx,[OreRegenerates]
    mov  edx,1
    call CheckListClass__Check_Item

    lea  eax,[ebp-0x7AC]
    xor  ebx,ebx
    cmp  byte[FirstLoadLAN],1
    jnz  .Jump_Over_Crates
    mov  bl,byte[crates]
    mov  [Crates],ebx

.Jump_Over_Crates:
    mov  ebx,[Crates]
    mov  edx,2
    call CheckListClass__Check_Item
    mov  byte[FirstLoadLAN],0
    jmp  0x0050BD1C

_Skirmish_Check_CTF_Check_Item:
    jmp  0x005135B5

_Skirmish_Check_CTF_Check_List:
    mov  edx,4
    jmp  0x00514AB1

_Skirmish_Add_CTF_Check_List:
    mov  edx,0x12D
    jmp  0x0051353D

_Skirmish_Check_Lists:
    lea  eax,[ebp-0x97C]
    xor  ebx,ebx
    cmp  byte[FirstLoad2],1
    jnz  .Jump_Over_Bases
    mov  bl,byte[bases]
    mov  [BasesOrNoBases],ebx
.Jump_Over_Bases:
    mov  ebx,[BasesOrNoBases]
    mov  edx,0
    call CheckListClass__Check_Item

    lea  eax,[ebp-0x97C]
    xor  ebx,ebx
    cmp  byte[FirstLoad2],1
    jnz  .Jump_Over_OreRegenerates
    mov  bl,byte[oreregenerates]
    mov  [OreRegenerates],ebx

.Jump_Over_OreRegenerates:
    mov  ebx,[OreRegenerates]
    mov  edx,1
    call CheckListClass__Check_Item

    lea  eax,[ebp-0x97C]
    xor  ebx,ebx
    cmp  byte[FirstLoad2],1
    jnz  .Jump_Over_Crates
    mov  bl,byte[crates]
    mov  [Crates],ebx

.Jump_Over_Crates:
    mov  ebx,[Crates]
    mov  edx,2
    call CheckListClass__Check_Item

;    lea    eax,[ebp-0x97C]
;    push    eax
;    xor        ebx,ebx

;    and     byte[Special],0xFE
;    xor        eax,eax
;    cmp  byte[FirstLoad2],1
;    jnz        .Jump_Over_ShroudRegrows
;    mov        al,byte[shroudregrows]
;    and     eax,1
;    mov     edx,[Special]
;    or      edx,eax

;    mov     [Special],edx

;.Jump_Over_ShroudRegrows:
;    mov     ebx,[Special]
;    and     ebx,1
;    mov     edx,3
;    pop        eax
;    call    CheckListClass__Check_Item

;    lea    eax,[ebp-0x97C]
;    push    eax

;    xor        ebx,ebx
;    cmp  byte[FirstLoad2],1
;    jnz        .Jump_Over_CTF
;    mov     bh,[Special]
;    and     bh,0xF7
;    xor        eax,eax

;    mov        al,byte[ctf]
;    and     eax,1
;    mov     byte[Special],bh
;    shl     eax,3
;    or      [Special],eax

;.Jump_Over_CTF:
;    xor        ebx,ebx
;    mov     ebx,[Special]
;    shl     ebx,0x1C
;    shr     ebx,0x1F
;    mov     edx,4
;    pop        eax
;    call    CheckListClass__Check_Item

;    mov        byte[FirstLoad2],0
;    jmp        0x005135D1
    mov  byte[FirstLoad2],0
    jmp  0x00513593

_Skirmish_Unit_Count_Change:
    jmp  0x00513485


_Skirmish_Players_Slider3:
    cmp  byte[FirstLoadPlayers],1
    jne  .Not_First_Load_Players

    mov  dword[FirstLoadPlayers],0
    this__INI_Get_Int multiplayer_defaults_str,aiplayers_str,1
    mov  dword[Players],eax

.Not_First_Load_Players:
    mov  edx,[Players]
    lea  eax,[ebp-0x574]
    jmp  0x005136D6

_Skirmish_UnitCount_Slider:
    mov  edx,[UnitCount]
    lea  eax,[ebp-0x4C0]
    jmp  0x00513610

_Skirmish_Selected_Map_Index:

    cmp  byte[FirstLoad],1
    jne  Not_First_Load

    mov  byte[FirstLoad],0

Not_First_Load:
    lea  eax,[ebp-0x854]
    mov  edx,[SelectedMapIndex]

    call ListClass_Set_Selected_Index

    xor  eax,eax
    jmp  0x005138A6

_Skirmish_Set_AI_Difficulty:

    this__INI_Get_Int multiplayer_defaults_str,aidifficulty_str,1
    mov  edx,eax
    jmp  0x00513168

_RulesClass_Multiplayer_Defaults:
    push eax
    push ebx
    push edx
    push ecx
    push esi
    push edi

;        mov esi,eax

    ; initialize FileClass
    mov  edx,redalert_ini
    mov  eax,FileClass_this_
    call CCFileClass__CCFileClass

    ; check ini exists
    mov  eax,FileClass_this_
    xor  edx,edx
    call CCFileClass__Is_Available
;    test eax,eax
;    je .exit_error

    ; initialize CCINIClass
    mov  eax,INIClass_this_
    call CCINIClass__CCINIClass

    ; load FileClass to CCINIClass
    mov  edx,FileClass_this_
    mov  eax,INIClass_this_
    call CCINIClass__Load


    this__INI_Get_Int multiplayer_defaults_str,unitcount_str,0
    mov  dword[UnitCount],eax
    this__INI_Get_Int multiplayer_defaults_str,techlevel_str,10
    mov  dword[BuildLevel],eax

    this__INI_Get_Int multiplayer_defaults_str,money_str,10000
    mov  dword[esi+0xB5],eax ; Money
    mov  dword[esi+0xB9],10000 ; MaxMoney, used as the max on the Credits slider
    ; modifying MaxMoney causes network desync

    this__INI_Get_Bool multiplayer_defaults_str,shroudregrows_str,0 ; ShadowGrow
    mov  byte[shroudregrows],al

    this__INI_Get_Bool multiplayer_defaults_str,bases_str,1 ; Bases
    mov  byte[bases],al

    this__INI_Get_Bool multiplayer_defaults_str,oreregenerates_str,1 ; Ore Grows
    mov  byte[oreregenerates],al

    this__INI_Get_Bool multiplayer_defaults_str,crates_str,0 ; Crates
    mov  byte[crates],al

    this__INI_Get_Bool multiplayer_defaults_str,capturetheflag_str,0 ; CaptureTheFlag
    mov  byte[ctf],al

    this__INI_Get_Bool multiplayer_defaults_str,shroudregrows_str,0 ; ShadowGrow
;        mov        eax,0
    and  [esi+0xBD],dword 0xFE
    and  eax,1
    mov  edx,[esi+0xBD]
    or   edx,eax

    mov  ecx,edx
    mov  [esi+0xBD],edx

    this__INI_Get_Bool multiplayer_defaults_str,capturetheflag_str,0 ; CaptureTheFlag
    mov  cl,[esi+0xBD]
    and  cl,0xDF
    and  eax,1
    mov  [esi+0xBD],cl
    shl  eax,5
    mov  ebx,[esi+0xBD]
    or   ebx,eax
    mov  eax,1
    mov  [esi+0xBD],ebx

    pop  edi
    pop  esi
    pop  ecx
    pop  edx
    pop  ebx
    pop  eax

    mov  eax,1 ; return value
    lea  esp,[ebp-0x10]
    pop  edi
    pop  esi
    pop  ecx
    pop  ebx
    pop  ebp
    jmp  0x00535CEE
