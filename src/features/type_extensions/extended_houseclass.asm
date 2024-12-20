@HOOK 0x004C7175 _TFixedHeapClass_fn_init_HouseClass
@HOOK 0x004C8365 _TFixedHeapClass__HouseClass__Constructor_HouseClass

;@HOOK 0x004DDE8D _HouseClass__Read_INI_HouseClass_HouseTypes_1
;@HOOK 0x004DDE9A _HouseClass__Read_INI_HouseClass_HouseTypes_2
@HOOK 0x004DDD1D _HouseClass__Read_INI_HouseClass_Size


; moving Globals::HouseTriggers[x] to Houses.HouseTriggers
; SET and SETD doesn't work???? Revert to using JMP
@HOOK 0x004C7966 _Replace_HouseTriggers_4C7966 ; wish I can simply patch over the address
@HOOK 0x004D3C12 _Replace_HouseTriggers_4D3C12 ; HouseClass::HouseClass
@HOOK 0x004D4113 _Replace_HouseTriggers_4D4113 ; HouseClass::Init
@HOOK 0x004D4CDE _Replace_HouseTriggers_4D4CDE ; HouseClass::AI
@HOOK 0x004D4D16 _Replace_HouseTriggers_4D4D16 ; HouseClass::AI
@HOOK 0x004D5D33 _Replace_HouseTriggers_4D5D33 ; HouseClass::Attacked
@HOOK 0x004D5D74 _Replace_HouseTriggers_4D5D74 ; HouseClass::Attacked
@HOOK 0x004D7E0E _Replace_HouseTriggers_4D7E0E ; HouseClass::Detach
@HOOK 0x00537880 _Replace_HouseTriggers_537880 ; Put_All
@HOOK 0x005378E3 _Replace_HouseTriggers_5378E3 ; Put_All
@HOOK 0x0053855D _Replace_HouseTriggers_53855D ; Put_All
@HOOK 0x0053A745 _Replace_HouseTriggers_53A745 ; Fill_in_Data
@HOOK 0x0053AB84 _Replace_HouseTriggers_53AB84 ; Clear_Scenario
;@SETD 0x005F99C0 Houses.HouseTriggers ; help

_Replace_HouseTriggers_4C7966:
    mov dword[0x005F99C0],Houses.HouseTriggers
    mov eax,Houses.HouseTriggers
    ;mov dword[edx+8],ecx
    ;mov eax,0x0067F074
    ;mov edx,0x14
    ;mov edi,0x2a
    ;call 0x005BCCF4
    ;mov dword[0x005F99C0],Houses.HouseTriggers
    ;mov ebx,0x005F9274
    ;mov eax,Houses.HouseTriggers
    ;mov edx,HouseType.Count
    ;mov edi,0x2a
    jmp 0x004C796B ; 0x004C7978

_Replace_HouseTriggers_4D3C12:
    add eax,Houses.HouseTriggers
    jmp 0x004D3C17

_Replace_HouseTriggers_4D4113:
    add eax,Houses.HouseTriggers
    jmp 0x004D4118

_Replace_HouseTriggers_4D4CDE:
    add eax,Houses.HouseTriggers
    jmp 0x004D4CE3

_Replace_HouseTriggers_4D4D16:
    add eax,Houses.HouseTriggers
    jmp 0x004D4D1B

_Replace_HouseTriggers_4D5D33:
    add eax,Houses.HouseTriggers
    jmp 0x004D5D38

_Replace_HouseTriggers_4D5D74:
    add eax,Houses.HouseTriggers
    jmp 0x004D5D79

_Replace_HouseTriggers_4D7E0E:
    add eax,Houses.HouseTriggers
    jmp 0x004D7E13

_Replace_HouseTriggers_537880:
    add eax,Houses.HouseTriggers
    jmp 0x00537885

_Replace_HouseTriggers_5378E3:
    add eax,Houses.HouseTriggers
    jmp 0x005378E8

_Replace_HouseTriggers_53855D:
    mov edi,Houses.HouseTriggers
    jmp 0x00538562

_Replace_HouseTriggers_53A745:
    add eax,Houses.HouseTriggers
    jmp 0x0053A74A

_Replace_HouseTriggers_53AB84:
    add eax,Houses.HouseTriggers
    jmp 0x0053AB89



; TO-DO: check FlasherClass::FlashCountPerPlayer[HOUSE_COUNT] as well, it is possible FlashCountPerPlayer only exists in Remastered code

@CLEAR 0x004C796F HouseType.Count 0x004C7970 ; init
@CLEAR 0x004F77B0 HouseType.Count+1 0x004F77B1 ; static void Init_Heaps(void)
@CLEAR 0x004633A5 HouseType.Count 0x004633A6 ; CCINIClass::Put_Owners, was 0x14
@CLEAR 0x004A0298 HouseType.Count 0x004A0299 ;void CellClass::Adjust_Threat(HousesType house, int threat_value), was 0x14
;@CLEAR 0x004AB65E HouseType.Count-1 0x004AB65F ; Conquer::Owner_From_Name, was 0x13; hooked by features/coop.asm
;@CLEAR ??? 0x20 ??? ; Conquer::Shake_The_Screen, seems to exist only in Remastered
@CLEAR 0x004CD0FE HouseType.Count 0x004CD0FF ; HouseTypeClass::From_Name, was 0x14
@CLEAR 0x004D4128 HouseType.Count 0x004D4129 ; void HouseClass::Init(void), was 0x14
@CLEAR 0x004D7E73 HouseType.Count 0x004D7E74 ; bool HouseClass::Does_Enemy_Building_Exist(StructType btype), was 0x14
@CLEAR 0x004D866B HouseType.Count 0x004D866C ; void HouseClass::Tally_Score(void), was 0x14
@CLEAR 0x004D880A HouseType.Count 0x004D880B ; void HouseClass::Tally_Score(void), was 0x14
@CLEAR 0x004D9814 HouseType.Count 0x004D9815 ; int HouseClass::Expert_AI(void), was 0x14
@CLEAR 0x004DA334 HouseType.Count 0x004DA335 ; int HouseClass::AI_Building(void), was 0x14
@CLEAR 0x004DB0EE HouseType.Count 0x004DB0EF ; int HouseClass::AI_Building(void), was 0x14
@CLEAR 0x004DDE8F HouseType.Count 0x004DDE90 ; void HouseClass::Read_INI(CCINIClass & ini), was 0x14
@CLEAR 0x004DDE9C HouseType.Count 0x004DDE9D ; void HouseClass::Read_INI(CCINIClass & ini), was 0x14
@CLEAR 0x004DDEF4 HouseType.Count 0x004DDEF5 ; void HouseClass::Write_INI(CCINIClass & ini), was 0x14
@CLEAR 0x004DE61E HouseType.Count 0x004DE61F ; bool HouseClass::Is_Allowed_To_Ally(HousesType house) const, was 0x14
@CLEAR 0x004DE688 HouseType.Count 0x004DE689 ; void HouseClass::Computer_Paranoid(void)
@CLEAR 0x004DE6E2 HouseType.Count 0x004DE6E3 ; void HouseClass::Computer_Paranoid(void)
@CLEAR 0x004FE1F4 HouseType.Count 0x004FE1F5 ; void LogicClass::AI(void), was 0x14
@CLEAR 0x004FE220 HouseType.Count 0x004FE221 ; void LogicClass::AI(void), was 0x14
@CLEAR 0x004FFECE HouseType.Count 0x004FFECF ; bool MapClass::Base_Region(CELL cell, HousesType & house, ZoneType & zone), was 0x14
@CLEAR 0x005321C3 HouseType.Count 0x005321C4 ; bool RadarClass::Spy_Next_House(void)
;@CLEAR 0x00532859 HouseType.Count 0x0053285A ; void RadarClass::Draw_Names(void) ; extend UnitsKilled / BuildingsKilled first
@CLEAR 0x00537522 HouseType.Count 0x00537523 ; bool RulesClass::Objects(CCINIClass & ini)
@CLEAR 0x005378AE HouseType.Count 0x005378AF ; static void Put_All(Pipe & pipe, int save_net)
@CLEAR 0x00538556 HouseType.Count 0x00538557 ; bool Load_Game(const char *file_name)
@CLEAR 0x0053AA2F HouseType.Count 0x0053AA30 ; void Fill_In_Data(void)
@CLEAR 0x0053AB99 HouseType.Count 0x0053AB9A ; void Clear_Scenario(void)



@HOOK 0x004CED13 _TFixedHeapClass__HouseClass__Save_HouseClass
@HOOK 0x004CEDF5 _TFixedHeapClass__HouseClass__Load_HouseClass
@HOOK 0x004CEE10 _TFixedHeapClass__HouseClass__Load_Clear_Memory_For_Old_Savegames
@HOOK 0x004DDD31 _HouseClass__Read_INI
@HOOK 0x00540F20 _ScoreClass__Presentation_Proper_Country_Check
@HOOK 0x004DDE56 _HouseClass__Read_INI_Optional_House_Neutral_Ally
@HOOK 0x004DDE80 _HouseClass__Read_INI_Optional_House_Neutral_Ally_Patch_Out_Double

allyneutral db 1

%define    EXT_Resigned                0x17BC
%define    EXT_ConnectionLost            0x17B8
%define EXT_SpawnLocation            0x17B4
%define EXT_IsSpectator                0x17B0
%define EXT_SecondaryColorScheme    0x1802
; Use offset +0x1800 for bool BuildingsGetInstantlyCpatured
; Use offset +0x1801 for bool NoBuildingCrew
; Use offset +0x1802 for byte SecondaryColorScheme
; Use Offset +0x1803 to +0x1873 for infantry left
; Use Offset +0x1873 to +0x18E3 for tanks left
; Use Offset +0x1903 to +0x1973 for planes left
; Use Offset +0x1973 to +0x19E3 for vessels left
; Use Offset +0x1A00 to +0x1B60 for buildings left



_TFixedHeapClass__HouseClass__Load_Clear_Memory_For_Old_Savegames:
    Clear_Extended_Class_Memory_For_Old_Saves esi,HouseClass.NEW_SIZE,HouseClass.ORIGINAL_SIZE

    mov  byte [esi+EXT_SecondaryColorScheme],0xFF

.Ret:
    mov  ebx,0x005F6538
    jmp  0x004CEE15

_TFixedHeapClass_fn_init_HouseClass:
    mov  edx,HouseClass.NEW_SIZE
    jmp  0x004C717A

_TFixedHeapClass__HouseClass__Constructor_HouseClass:
    mov  edx,HouseClass.NEW_SIZE
    jmp  0x004C836A

;_HouseClass__Read_INI_HouseClass_HouseTypes_1:
;    cmp  bl,HouseType.Count
;    jl   0x004DDE67
;    jmp  0x004DDE92

;_HouseClass__Read_INI_HouseClass_HouseTypes_2:
;    cmp  cl,HouseType.Count
;    jl   0x004DDD0F
;    jmp  0x004DDEA3

_HouseClass__Read_INI_HouseClass_Size:
    mov  edx,HouseClass.NEW_SIZE
    jmp  0x004DDD22

_TFixedHeapClass__HouseClass__Save_HouseClass:
    mov  ebx,HouseClass.NEW_SIZE
    jmp  0x004CED18

_TFixedHeapClass__HouseClass__Load_HouseClass:
    cmp  dword [SaveGameVersion],New_Savegame_Version
    jnz  .Old_Savegame

    mov  ebx,HouseClass.NEW_SIZE
    jmp  0x004CEDFA

.Old_Savegame:
    mov  ebx,HouseClass.ORIGINAL_SIZE
    jmp  0x004CEDFA

_HouseClass__Read_INI_Optional_House_Neutral_Ally_Patch_Out_Double:
    cmp  edx,0x0A ; Neutral house
    jz   .Ret

    call HouseClass__Make_Ally

.Ret:
    jmp  0x004DDE85

_HouseClass__Read_INI_Optional_House_Neutral_Ally:
    mov  edx,0Ah
    mov  eax,esi

    cmp  byte [allyneutral],0
    jz   .Ret

    call HouseClass__Make_Ally

.Ret:
    mov  byte [allyneutral],1
    jmp  0x004DDE62

_ScoreClass__Presentation_Proper_Country_Check:
    mov  byte dl,[eax+0x41]
    mov  edi,eax
    jmp  0x00540F25

_HouseClass__Read_INI:
    call 0x004D33E4 ; HouseClass::HouseClass(HousesType)
    mov  [ebp-0x24],eax

    Save_Registers

    mov  esi,[ebp-0x24] ; HouseClass_This

    mov  ecx,0xFF   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_Colour  ; key
    call INIClass__Get_Int

    cmp  byte al,0xFF
    jz   .No_Custom_Colour

    mov  [esi+0x178F],al

.No_Custom_Colour:

    Restore_Registers

    Save_Registers

    mov  esi,[ebp-0x24] ; HouseClass_This

    mov  ecx,0xFF   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_Color  ; key
    call INIClass__Get_Int

    cmp  byte al,0xFF
    jz   .No_Custom_Color

    mov  [esi+0x178F],al

.No_Custom_Color:

    Restore_Registers

    Save_Registers

    mov  esi,[ebp-0x24] ; HouseClass_This

    mov  ecx,0xFF   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_Country ; key
    call INIClass__Get_Int

    cmp  byte al,0xFF
    jz   .No_Custom_Country

    mov  [esi+0x41],al


.No_Custom_Country:

    Restore_Registers

    Save_Registers

    mov  ecx,0   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_BuildingsGetInstantlyCaptured  ; key
    call INIClass__Get_Bool
    mov  ecx,[ebp-0x24] ; HouseClass this pointer
    mov  [ecx+0x1800],al

    Restore_Registers

    Save_Registers

    mov  ecx,0   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_NoBuildingCrew  ; key
    call INIClass__Get_Bool
    mov  ecx,[ebp-0x24] ; HouseClass this pointer
    mov  [ecx+0x1801],al

    Restore_Registers

    Save_Registers

    mov  ecx,0xFF   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_SecondaryColorScheme ; key
    call INIClass__Get_Int
    mov  ecx,[ebp-0x24] ; HouseClass this pointer
    mov  [ecx+0x1802],al

    Restore_Registers

    Save_Registers

    mov  ecx,1   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_AllyTheNeutralHouse  ; key
    call INIClass__Get_Int

    mov  byte [allyneutral],al

    Restore_Registers
    jmp  0x004DDD36
