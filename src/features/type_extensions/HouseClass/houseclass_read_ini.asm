;----------------------------------------------------------------
; src/features/type_extensions/HouseClass/houseclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

@HOOK 0x004DDD31 _HouseClass__Read_INI
@HOOK 0x004DDE56 _HouseClass__Read_INI_Optional_House_Neutral_Ally
@HOOK 0x004DDE80 _HouseClass__Read_INI_Optional_House_Neutral_Ally_Patch_Out_Double
@HOOK 0x00540F20 _ScoreClass__Presentation_Proper_Country_Check

allyneutral db 1


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
    mov  [esi+HouseClass.Offset.RemapColor],al

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
    mov  [esi+HouseClass.Offset.RemapColor],al

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
    mov  [ecx+HouseClass.Offset.InstantCapture],al

    Restore_Registers
    Save_Registers
    mov  ecx,0   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_NoBuildingCrew  ; key
    call INIClass__Get_Bool
    mov  ecx,[ebp-0x24] ; HouseClass this pointer
    mov  [ecx+HouseClass.Offset.NoBuildingCrew],al

    Restore_Registers
    Save_Registers
    mov  ecx,0xFF   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_SecondaryColorScheme ; key
    call INIClass__Get_Int
    mov  ecx,[ebp-0x24] ; HouseClass this pointer
    mov  [ecx+HouseClass.Offset.SecondaryColorScheme],al

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


_HouseClass__Read_INI_Optional_House_Neutral_Ally:
    mov  edx,0Ah
    mov  eax,esi
    cmp  byte [allyneutral],0
    jz   .Ret
    call HouseClass__Make_Ally
.Ret:
    mov  byte [allyneutral],1
    jmp  0x004DDE62


_HouseClass__Read_INI_Optional_House_Neutral_Ally_Patch_Out_Double:
    cmp  edx,0x0A ; Neutral house
    jz   .Ret
    call HouseClass__Make_Ally
.Ret:
    jmp  0x004DDE85


_ScoreClass__Presentation_Proper_Country_Check:
    mov  byte dl,[eax+0x41]
    mov  edi,eax
    jmp  0x00540F25
