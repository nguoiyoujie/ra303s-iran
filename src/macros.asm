%define    RulesINI                                    0x00666688
%define    RuleINI                                        0x00666688
%define FileClass__FileClass                        0x004627D4
%define FileClass__Is_Available                     0x00462A30
%define SessionClass__Session                        0x0067F2B4
%define ScenarioNumber                                0x006679D3

%define Array_WarheadTypeClass             0x00691634
%define Array_BulletTypeClass              0x0065DE88
%define Array_WeaponTypeClass              0x00691680
%define Array_UnitTypeClass                0x0065DF20
%define Array_InfantryTypeClass            0x0065DE3C
%define Array_VesselTypeClass              0x0065DF6C
%define Array_AircraftTypeClass            0x0065DDF0
%define Array_BuildingTypeClass            0x0065DDA4

%define Count_WarheadTypeClass             0x0069160C
%define Count_BulletTypeClass              0x0065DE60
%define Count_WeaponTypeClass              0x00691658
%define Count_UnitTypeClass                0x0065DEF8
%define Count_InfantryTypeClass            0x0065DE14
%define Count_VesselTypeClass              0x0065DF44
%define Count_AircraftTypeClass            0x0065DDC8
%define Count_BuildingTypeClass            0x0065DD7C

%macro Save_Registers 0
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
%endmacro

%macro Restore_Registers 0
    pop  edi
    pop  esi
    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
%endmacro

%macro Extract_Conquer_Eng_String 1
    mov  edx, %1
    mov  eax, [0x0066991C] ; ds:char *SystemStrings
    call 0x005C5070  ; Extract_String(void *,int)
%endmacro

; args <RULES.INI Section Name to get entry count for>
%macro    Get_RULES_INI_Section_Entry_Count 1
    push edx
    mov  edx, %1
    mov  eax, RulesINI
    call INIClass__Entry_Count
    pop  edx
%endmacro

Loop_Entry_Buffer: TIMES 256 DB 0

Loop_Over_RULES_INI_Section_Entries_:
    Save_Registers
;    ==== loop setup
    push edx        ; section name
    push eax    ; function to call
    Get_RULES_INI_Section_Entry_Count edx
    mov  esi, eax ; loop max
    mov  edi, 0 ; Loop variable
;    ==== start looping
.Loop:
    cmp  edi, esi
    jge  .Out

    mov  ebx, edi
    mov  edx, [esp+4] ; Section name
    mov  eax, RulesINI
    call INIClass__Get_Entry

    mov  edx, [esp+4] ; Section name
    call_INIClass__Get_String RulesINI, edx , eax, 0xFF, Loop_Entry_Buffer, 256

    ; call function pointer with the value of the entry
    mov  edx, Loop_Entry_Buffer
    mov  ebx, edi
    mov  eax, esp ; function pointer
    call [eax]

    inc  edi
    jmp  .Loop

.Out:
    pop  eax
    pop  edx
    Restore_Registers
    retn

; args <RULES.INI Section Name to loop entries over>, <function to call (with entry name in EDX)
%macro    Loop_Over_RULES_INI_Section_Entries 2
    push edx
    push eax
    mov  edx, %1
    mov  eax, %2
    call Loop_Over_RULES_INI_Section_Entries_
    pop  eax
    pop  edx
%endmacro

; args <What to turn bit on, <what bit to turn on>
%macro Turn_On_Bit    2
    mov  al,    1
    shl  al, BYTE %2-1
    or   BYTE %1, al
%endmacro Set_Bit 3

; args <What to check bit on>, <what bit to check>
%macro Get_Bit 2
    mov  al, 1
    shl  al, BYTE %2-1
    test BYTE %1, al
    setnz al
%endmacro

;number &= ~(1 << x);
; args <What to clear bit on>, <what bit to clear>
%macro Clear_Bit 2
    mov  al, 1
    shl  al, BYTE %2-1
    add  al, 1
    neg  al
    and  BYTE %1, al
%endmacro

; args <What to clear bit on>, <what bit>, <turn on or off>, <identifier for branch>
%macro Set_Bit_Byte    3
    cmp  BYTE %3, 0
    jz   %%turn_off

    Turn_On_Bit    %1, %2
    jmp  %%done

  %%turn_off:
    Clear_Bit %1, %2

  %%done:
%endmacro


; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_WarheadTypeClass    1
    push edx
    mov  edx, [Count_WarheadTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_WarheadTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop edx
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_BulletTypeClass    1
    push edx
    mov  edx, [Count_BulletTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_BulletTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop edx
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_WeaponTypeClass    1
    push edx
    mov  edx, [Count_WeaponTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_WeaponTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop edx
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_UnitTypeClass    1
    push edx
    mov  edx, [Count_UnitTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_UnitTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop edx
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_InfantryTypeClass    1
    push edx
    mov  edx, [Count_InfantryTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_InfantryTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop edx
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_VesselTypeClass    1
    push edx
    mov  edx, [Count_VesselTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_VesselTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop edx
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_AircraftTypeClass    1
    push edx
    mov  edx, [Count_AircraftTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_AircraftTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop edx
%endmacro

; args <Internal ID of type class>
; returns the type class pointer as EAX
%macro Get_BuildingTypeClass    1
    push edx
    mov  edx, [Count_BuildingTypeClass] 
    cmp  %1, edx
    jge  %%invalid_type

    mov  edx, [Array_BuildingTypeClass] 
    shl  %1, 2
    add  edx, %1
    mov  eax, [edx] 
    jmp  %%done

  %%invalid_type:
    mov  eax, 0
  %%done:
    pop edx
%endmacro




