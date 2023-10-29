;Read INI settings
@HOOK 0x004C73ED _TFixedIHeapClass__fn_init_New_BuildingTypes_Heap_Size
@HOOK 0x004D0953 _TFixedIHeapClass__BuildingTypeClass__Save_New_Size
@HOOK 0x004D0A36 _TFixedIHeapClass__BuildingTypeClass__Load_New_Size
@HOOK 0x004D0A51 _TFixedIHeapClass__BuildingTypeClass__Load_Clear_Memory
@HOOK 0x00453FFB _BuildingTypeClass__Read_INI_Extended

%define        Old_BuildingTypeClass_Size        0x207
%define        New_BuildingTypeClass_Size        0x307

; OccupyList, OverlapList
d_Occupy_1                    dw 0,0x7FFF                                                 ;00, GUN,SILO
d_Occupy_0_1                  dw 0x80,0x7FFF                                              ;01, GAP,TESLA
d_Occupy_1_1                  dw 0,0x80,0x7FFF                                            ;02,
d_Occupy_01                   dw 0,1,0x7FFF                                               ;03, 
d_Occupy_11                   dw 0,1,0x7FFF                                               ;04, SAM
d_Occupy_111                  dw 0,1,2,0x7FFF                                             ;05, 
d_Occupy_00_11                dw 0x80,0x81,0x7FFF                                         ;06, 
d_Occupy_01_01                dw 1,0x81,0x7FFF                                            ;07, 
d_Occupy_01_11                dw 1,0x80,0x81,0x7FFF                                       ;08, 
d_Occupy_10_11                dw 0,0x80,0x81,0x7FFF                                       ;09, C&C NUKE
d_Occupy_11_01                dw 0,1,0x81,0x7FFF                                          ;10,
d_Occupy_11_11                dw 0,1,0x80,0x81,0x7FFF                                     ;11, POWR
d_Occupy_111_111              dw 0,1,2,0x80,0x81,0x82,0x7FFF                              ;12, AFLD
d_Occupy_1111_1111            dw 0,1,2,3,0x80,0x81,0x82,0x83,0x7FFF                       ;13, C&C AFLD
d_Occupy_000_111_111          dw 0x80,0x81,0x82,0x100,0x101,0x102,0x7FFF                  ;14, APWR
d_Occupy_010_111_100          dw 1,0x80,0x81,0x82,0x100,0x7FFF                            ;15, REFN
d_Occupy_010_111_001          dw 1,0x80,0x81,0x82,0x102,0x7FFF                            ;16, C&C REFN
d_Occupy_101_000_011          dw 0,2,0x101,0x102,0x7FFF                                   ;17, REFN Overlap
d_Occupy_101_000_110          dw 0,2,0x100,0x101,0x7FFF                                   ;18, C&C REFN Overlap
d_Occupy_010_111_010          dw 1,0x80,0x81,0x82,0x101,0x7FFF                            ;19, FIX
d_Occupy_101_000_101          dw 0,2,0x100,0x102,0x7FFF                                   ;20, FIX Overlap
d_Occupy_111_111_111          dw 0,1,2,0x80,0x81,0x82,0x100,0x101,0x102,0x7FFF            ;21, YARD
d_Occupy_S11                  dw 0xFF80,0xFF81,0x7FFF                                     ;22, SAM Overlap special (2 cells above)
d_Occupy_S111                 dw 0xFF80,0xFF81,0xFF82,0x7FFF                              ;23, Overlap special (3 cells above)
d_Occupy_S11_00_10_11         dw 0,1,0x100,0x180,0x181,0x7FFF                             ;24, C&C HAND Overlap special (2 cells above, and 2 cells on 3rd row)
d_Occupy_S111_000_000_111     dw 0xFF80,0xFF81,0xFF82,0x100,0x101,0x102,0x7FFF            ;25, Overlap special (3 cells above, and 3 cells on 3rd row)
d_Occupy_000_111_011          dw 0x80,0x81,0x82,0x101,0x102,0x7FFF                        ;26, Special (C&C WEAP)
d_Occupy_111_000_100          dw 0,1,2,0x100,0x7FFF                                       ;27, Overlap special (C&C WEAP)
d_Occupy_00_11_01             dw 0x80,0x81,0x101,0x7FFF                                   ;28, C&C HAND
d_Occupy_S11_00_00_11         dw 0,1,0x180,0x181,0x7FFF                                   ;29, 
d_Occupy_00_11_11             dw 0x80,0x81,0x100,0x101,0x7FFF                             ;30, 


%define d_ExitPyle            0x005FEA5C      ;0
%define d_ExitSub             0x005FEA78      ;1
%define d_ExitWeap            0x005FEA82      ;2

d_ExitCCHand                  dw 0x182,0x181,0x180,0x102,0x17F,0xFF,0,1,0xFFFF,2,0x82,0x7F,0x7FFF     ;3
d_ExitCCWeap                  dw 0x17F,0x180,0xFF,0x181,0x7F,0x83,0x103,0x183,0x182,0x7FFF            ;4
d_ExitCCAirstrip              dw 0xFF7F,0xFFFF,0x7F,0xFF,0xFF80,0x100,0xFF81,0x101,0xFF82,0x102,0xFF83,0x103,0xFF84,4,0x84,0x104,0x7FFF      ;5

Buffer_BuildingType           times 512 db 0 


_TFixedIHeapClass__BuildingTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,New_BuildingTypeClass_Size,Old_BuildingTypeClass_Size
.Ret:
    lea  edx,[ebp-0x14]
    mov  eax,ecx
    jmp  0x004D0A56

_TFixedIHeapClass__fn_init_New_BuildingTypes_Heap_Size:
    mov  edx,New_BuildingTypeClass_Size
    jmp  0x004C73F2

_TFixedIHeapClass__BuildingTypeClass__Load_New_Size:
    mov  ebx,New_BuildingTypeClass_Size
    jmp  0x004D0A3B

_TFixedIHeapClass__BuildingTypeClass__Save_New_Size:
    mov  ebx,New_BuildingTypeClass_Size
    jmp  0x004D0958

_BuildingTypeClass__Read_INI_Extended:
    push esi
    push edi
    push eax

    TechnoTypeClass.ExtPrerequisiteOffset.Set(esi,BuildingTypeClass.Offset.ExtendedPrerequisite)
    TechnoTypeClass.Prerequisite.Read(esi,edi,_GetPrerequisiteExtendedFromString)

    BuildingTypeClass.IsSimpleDamage.Read(esi,edi)
    BuildingTypeClass.IsRegulated.Read(esi,edi)
    BuildingTypeClass.IsJammable.Read(esi,edi)
    BuildingTypeClass.IsRadar.Read(esi,edi)
    BuildingTypeClass.FactoryType.Read(esi,edi,_SelectFactoryType)
    BuildingTypeClass.ExitCoordX.Read(esi,edi)
    BuildingTypeClass.ExitCoordY.Read(esi,edi)
    BuildingTypeClass.ExitList.Read(esi,edi,_SelectExitList)
    BuildingTypeClass.BSize.Read(esi,edi)
    BuildingTypeClass.Anim_Construct_Start.Read(esi,edi)
    BuildingTypeClass.Anim_Construct_Count.Read(esi,edi)
    BuildingTypeClass.Anim_Construct_Rate.Read(esi,edi)
    BuildingTypeClass.Anim_Idle_Start.Read(esi,edi)
    BuildingTypeClass.Anim_Idle_Count.Read(esi,edi)
    BuildingTypeClass.Anim_Idle_Rate.Read(esi,edi)
    BuildingTypeClass.Anim_Active_Start.Read(esi,edi)
    BuildingTypeClass.Anim_Active_Count.Read(esi,edi)
    BuildingTypeClass.Anim_Active_Rate.Read(esi,edi)
    BuildingTypeClass.Anim_Full_Start.Read(esi,edi)
    BuildingTypeClass.Anim_Full_Count.Read(esi,edi)
    BuildingTypeClass.Anim_Full_Rate.Read(esi,edi)
    BuildingTypeClass.Anim_Aux1_Start.Read(esi,edi)
    BuildingTypeClass.Anim_Aux1_Count.Read(esi,edi)
    BuildingTypeClass.Anim_Aux1_Rate.Read(esi,edi)
    BuildingTypeClass.Anim_Aux2_Start.Read(esi,edi)
    BuildingTypeClass.Anim_Aux2_Count.Read(esi,edi)
    BuildingTypeClass.Anim_Aux2_Rate.Read(esi,edi)
    BuildingTypeClass.OccupyList.Read(esi,edi,_SelectOccupyList)
    BuildingTypeClass.OverlapList.Read(esi,edi,_SelectOccupyList)
    BuildingTypeClass.SpecialWeapons.Read(esi,edi,_GetSpecialsFromString)
    BuildingTypeClass.WarFactoryOverlayAnim.Read(esi,edi,_GetOverlayFromString)
    BuildingTypeClass.WarFactoryOverlayFrames.Read(esi,edi)
    BuildingTypeClass.WarFactoryOverlayRate.Read(esi,edi)
    BuildingTypeClass.WarFactoryExitFacing.Read(esi,edi)
    BuildingTypeClass.WarFactoryExitTrack.Read(esi,edi)

    pop  eax
    pop  edi
    pop  esi

.Ret:
    lea  esp,[ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x00454001



_SelectFactoryType:
    ;select FactoryType by performing string compare on eax
    push edx
    push ebx ; hold eax value for multiple checks

.CheckNotAString:
    cmp  eax,0xFF ; hack to evade residual RTTI values, since they are invalid strings
    jle  .Retn ; just return 0
    mov  ebx,eax

.Check.AircraftType:
    mov  edx,str.RTTIType.AircraftType
    call _strcmpi
    test eax,eax
    jnz  .Check.BuildingType
    mov  al,RTTIType.AircraftType
    jmp  .Retn

.Check.BuildingType:
    mov  edx,str.RTTIType.BuildingType
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.InfantryType
    mov  al,RTTIType.BuildingType
    jmp  .Retn

.Check.InfantryType:
    mov  edx,str.RTTIType.InfantryType
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.UnitType
    mov  al,RTTIType.InfantryType
    jmp  .Retn

.Check.UnitType:
    mov  edx,str.RTTIType.UnitType
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.VesselType
    mov  al,RTTIType.UnitType
    jmp  .Retn

.Check.VesselType:
    mov  edx,str.RTTIType.VesselType
    mov  eax,ebx
    call _strcmpi
    jnz  .DefaultNull
    mov  al,RTTIType.VesselType
    jmp  .Retn

.DefaultNull:
    xor  eax,eax  ; RTTIType.None

.Retn:
    pop ebx
    pop edx
    retn



_SelectExitList:
    ;select exitlist based on eax
    cmp  eax,-1
    jnz .Check_IsAddress
    xor  eax,eax             ;Occupy_NULL
    jmp .Retn

.Check_IsAddress:
    cmp  eax,0xFFFFF ; eax is a real address, means it isn't overriden by rules
    jge .Retn

.Check_ExitPyle:
    cmp  eax,0
    jnz .Check_ExitSub
    mov  eax,d_ExitPyle
    jmp .Retn

.Check_ExitSub:
    cmp  eax,1
    jnz .Check_ExitWeap
    mov  eax,d_ExitSub
    jmp .Retn

.Check_ExitWeap:
    cmp  eax,2
    jnz .Check_ExitCCHand
    mov  eax,d_ExitWeap
    jmp .Retn
    
.Check_ExitCCHand:
    cmp  eax,3
    jnz .Check_ExitCCWeap
    mov  eax,d_ExitCCHand
    jmp .Retn

.Check_ExitCCWeap:
    cmp  eax,4
    jnz .Check_ExitCCAirstrip
    mov  eax,d_ExitCCWeap
    jmp .Retn

.Check_ExitCCAirstrip:
    cmp  eax,5
    jnz .DefaultNull
    mov  eax,d_ExitCCAirstrip
    jmp .Retn

.DefaultNull:
    xor  eax,eax          ;NULL

.Retn:
    retn



_SelectOccupyList:
    ;select occupylist based on eax
    cmp  eax,-1
    jnz .Check_IsAddress
    xor  eax,eax             ;Occupy_NULL
    jmp .Retn

.Check_IsAddress:
    cmp  eax,0xFFFFF ; eax is a real address, means it isn't overriden by rules
    jge .Retn

.Check_Occupy_1:
    cmp  eax,0
    jnz .Check_Occupy_0_1
    mov  eax,d_Occupy_1
    jmp .Retn

.Check_Occupy_0_1:
    cmp  eax,1
    jnz .Check_Occupy_1_1
    mov  eax,d_Occupy_0_1
    jmp .Retn

.Check_Occupy_1_1:
    cmp  eax,2
    jnz .Check_Occupy_01
    mov  eax,d_Occupy_1_1
    jmp .Retn

.Check_Occupy_01:
    cmp  eax,3
    jnz .Check_Occupy_11
    mov  eax,d_Occupy_01
    jmp .Retn

.Check_Occupy_11:
    cmp  eax,4
    jnz .Check_Occupy_111
    mov  eax,d_Occupy_11
    jmp .Retn

.Check_Occupy_111:
    cmp  eax,5
    jnz .Check_Occupy_00_11
    mov  eax,d_Occupy_111
    jmp .Retn

.Check_Occupy_00_11:
    cmp  eax,6
    jnz .Check_Occupy_01_01
    mov  eax,d_Occupy_00_11
    jmp .Retn

.Check_Occupy_01_01:
    cmp  eax,7
    jnz .Check_Occupy_01_11
    mov  eax,d_Occupy_01_01
    jmp .Retn

.Check_Occupy_01_11:
    cmp  eax,8
    jnz .Check_Occupy_10_11
    mov  eax,d_Occupy_01_11
    jmp .Retn

.Check_Occupy_10_11:
    cmp  eax,9
    jnz .Check_Occupy_11_01
    mov  eax,d_Occupy_10_11
    jmp .Retn

.Check_Occupy_11_01:
    cmp  eax,10
    jnz .Check_Occupy_11_11
    mov  eax,d_Occupy_11_01
    jmp .Retn

.Check_Occupy_11_11:
    cmp  eax,11
    jnz .Check_Occupy_111_111
    mov  eax,d_Occupy_11_11
    jmp .Retn

.Check_Occupy_111_111:
    cmp  eax,12
    jnz .Check_Occupy_1111_1111
    mov  eax,d_Occupy_111_111
    jmp .Retn

.Check_Occupy_1111_1111:
    cmp  eax,13
    jnz .Check_Occupy_000_111_111
    mov  eax,d_Occupy_1111_1111
    jmp .Retn

.Check_Occupy_000_111_111:
    cmp  eax,14
    jnz .Check_Occupy_010_111_100
    mov  eax,d_Occupy_000_111_111
    jmp .Retn

.Check_Occupy_010_111_100:
    cmp  eax,15
    jnz .Check_Occupy_010_111_001
    mov  eax,d_Occupy_010_111_100
    jmp .Retn

.Check_Occupy_010_111_001:
    cmp  eax,16
    jnz .Check_Occupy_101_000_011
    mov  eax,d_Occupy_010_111_001
    jmp .Retn

.Check_Occupy_101_000_011:
    cmp  eax,17
    jnz .Check_Occupy_101_000_110
    mov  eax,d_Occupy_101_000_011
    jmp .Retn

.Check_Occupy_101_000_110:
    cmp  eax,18
    jnz .Check_Occupy_010_111_010
    mov  eax,d_Occupy_101_000_110
    jmp .Retn

.Check_Occupy_010_111_010:
    cmp  eax,19
    jnz .Check_Occupy_101_000_101
    mov  eax,d_Occupy_010_111_010
    jmp .Retn

.Check_Occupy_101_000_101:
    cmp  eax,20
    jnz .Check_Occupy_111_111_111
    mov  eax,d_Occupy_101_000_101
    jmp .Retn

.Check_Occupy_111_111_111:
    cmp  eax,21
    jnz .Check_Occupy_S11
    mov  eax,d_Occupy_111_111_111
    jmp .Retn

.Check_Occupy_S11:
    cmp  eax,22
    jnz .Check_Occupy_S111
    mov  eax,d_Occupy_S11
    jmp .Retn

.Check_Occupy_S111:
    cmp  eax,23
    jnz .Check_Occupy_S11_00_00_11
    mov  eax,d_Occupy_S111
    jmp .Retn

.Check_Occupy_S11_00_00_11:
    cmp  eax,24
    jnz .Check_Occupy_S111_000_000_111
    mov  eax,d_Occupy_S11_00_10_11
    jmp .Retn

.Check_Occupy_S111_000_000_111:
    cmp  eax,25
    jnz .Check_Occupy_000_111_011
    mov  eax,d_Occupy_S111_000_000_111
    jmp .Retn

.Check_Occupy_000_111_011:
    cmp  eax,26
    jnz .Check_Occupy_111_000_100
    mov  eax,d_Occupy_000_111_011
    jmp .Retn

.Check_Occupy_111_000_100:
    cmp  eax,27
    jnz .Check.Occupy_00_11_01
    mov  eax,d_Occupy_111_000_100
    jmp .Retn

.Check.Occupy_00_11_01:
    cmp  eax,28
    jnz .Check.Occupy_S11_00_00_11
    mov  eax,d_Occupy_00_11_01
    jmp .Retn

.Check.Occupy_S11_00_00_11:
    cmp  eax,29
    jnz .Check.Occupy_00_11_11
    mov  eax,d_Occupy_S11_00_00_11
    jmp .Retn

.Check.Occupy_00_11_11:
    cmp  eax,30
    jnz .DefaultNull
    mov  eax,d_Occupy_00_11_11
    jmp .Retn
    
.DefaultNull:
    xor  eax,eax             ;Occupy_NULL

.Retn:
    retn


_GetSpecialsFromString:
    push edi
    push edx
    push ecx
    push ebx
     xor  edi,edi
    cmp  eax,0
    je  .Retn ; just return 0
    mov  ebx,eax

.Read_Next:
   ; the string is a comma-delimited set
    mov  edx,str_Comma
    mov  eax,ebx
    push eax
    call _stristr
    test eax,eax
    je  .Read_Last    
    mov  byte [eax],0
    lea  eax,[eax + 1]
    mov  ebx,eax
    pop  eax
    call _SelectSpecialTypeFromString
    test eax,eax
    je   .Retn
    mov  cl,al
     xor  eax,eax
    mov  eax,1   
    shl  eax,cl
    or   edi,eax
    jmp  .Read_Next

.Read_Last:
    pop  eax
    call _SelectSpecialTypeFromString
    test eax,eax
    je   .Retn
    mov  cl,al
     xor  eax,eax
    mov  eax,1   
    shl  eax,cl
    or   edi,eax
    
.Retn:
    mov eax,edi
    pop ebx
    pop ecx
    pop edx
    pop edi
    retn
    

_SelectSpecialTypeFromString:
    ;select SpecialType by performing string compare on eax
    push edx
    push ebx ; hold eax value for multiple checks
    cmp  eax,0
    je  .Retn ; just return 0
    mov  ebx,eax

.Check.SONAR_PULSE:
    mov  edx,str.SpecialType.SONAR_PULSE
    call _strcmpi
    test eax,eax
    jnz  .Check.NUCLEAR_BOMB
    mov  al,SpecialType.SONAR_PULSE
    jmp  .Retn

.Check.NUCLEAR_BOMB:
    mov  edx,str.SpecialType.NUCLEAR_BOMB
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.CHRONOSPHERE
    mov  al,SpecialType.NUCLEAR_BOMB
    jmp  .Retn

.Check.CHRONOSPHERE:
    mov  edx,str.SpecialType.CHRONOSPHERE
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.PARA_BOMB
    mov  al,SpecialType.CHRONOSPHERE
    jmp  .Retn

.Check.PARA_BOMB:
    mov  edx,str.SpecialType.PARA_BOMB
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.PARA_INFANTRY
    mov  al,SpecialType.PARA_BOMB
    jmp  .Retn

.Check.PARA_INFANTRY:
    mov  edx,str.SpecialType.PARA_INFANTRY
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.SPY_MISSION
    mov  al,SpecialType.PARA_INFANTRY
    jmp  .Retn

.Check.SPY_MISSION:
    mov  edx,str.SpecialType.SPY_MISSION
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.IRON_CURTAIN
    mov  al,SpecialType.SPY_MISSION
    jmp  .Retn

.Check.IRON_CURTAIN:
    mov  edx,str.SpecialType.IRON_CURTAIN
    mov  eax,ebx
    call _strcmpi
    jnz  .Check.GPS
    mov  al,SpecialType.IRON_CURTAIN
    jmp  .Retn

.Check.GPS:
    mov  edx,str.SpecialType.GPS
    mov  eax,ebx
    call _strcmpi
    jnz  .DefaultNull
    mov  al,SpecialType.GPS
    jmp  .Retn

.DefaultNull:
    xor  eax,eax

.Retn:
    pop ebx
    pop edx
    retn


_GetOverlayFromString:
   ;create overlay animation with string from eax
    push ebx
    push ecx
    push edx 
    push esi 
    push edi 
    cmp  eax,0
    je   .Retn
    push 0x005E8EDE ; ".SHP"
    mov  ecx,eax
    lea  eax,[Buffer_BuildingType]
    xor  ebx,ebx
    xor  edx,edx
    call 0x005B8BEE    ; _makepath
    lea  eax,[Buffer_BuildingType]
    call 0x005B9330    ; MFCD::Retrieve

.Retn:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    retn