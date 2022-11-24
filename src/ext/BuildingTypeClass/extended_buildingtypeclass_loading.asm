;Read INI settings
@HOOK 0x00453FFB _BuildingTypeClass__Read_INI_Extended

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
d_Occupy_11_01                dw 0,1,0x81,0x7FFF                                          ;10, C&C HAND
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
d_Occupy_S11_00_00_11         dw 0xFF80,0xFF81,0x100,0x101,0x7FFF                         ;24, C&C HAND Overlap special (2 cells above, and 2 cells on 3rd row)
d_Occupy_S111_000_000_111     dw 0xFF80,0xFF81,0xFF82,0x100,0x101,0x102,0x7FFF            ;25, Overlap special (3 cells above, and 3 cells on 3rd row)

%define d_ExitPyle            0x005FEA5C      ;01
%define d_ExitSub             0x005FEA78      ;02
%define d_ExitWeap            0x005FEA82      ;03

_BuildingTypeClass__Read_INI_Extended:
    push esi
    push edi
    push eax

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

    pop eax
    pop  edi
    pop  esi

.Ret:
    lea  esp, [ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x00454001



_SelectFactoryType:
    ;select FactoryType by performing string compare on eax
    push edx
    push ebx ; hold eax value for multiple checks

.CheckNotAString:
    cmp  eax, 0xFF ; hack to evade residual RTTI values, since they are invalid strings
    jle  .Retn ; just return 0
    mov  ebx,eax

.CheckAircraftType:
    mov  edx,str.RTTIType.AircraftType
    call _strcmpi
    test eax, eax
    jnz  .CheckBuildingType
    mov  al, RTTIType.AircraftType
    jmp  .Retn

.CheckBuildingType:
    mov  edx, str.RTTIType.BuildingType
    mov  eax, ebx
    call _strcmpi
    jnz  .CheckInfantryType
    mov  al, RTTIType.BuildingType
    jmp  .Retn

.CheckInfantryType:
    mov  edx, str.RTTIType.InfantryType
    mov  eax, ebx
    call _strcmpi
    jnz  .CheckUnitType
    mov  al, RTTIType.InfantryType
    jmp  .Retn

.CheckUnitType:
    mov  edx, str.RTTIType.UnitType
    mov  eax, ebx
    call _strcmpi
    jnz  .CheckVesselType
    mov  al, RTTIType.UnitType
    jmp  .Retn

.CheckVesselType:
    mov  edx, str.RTTIType.VesselType
    mov  eax, ebx
    call _strcmpi
    jnz  .DefaultNull
    mov  al, RTTIType.VesselType
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
    jnz .DefaultNull
    mov  eax,d_ExitWeap
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
    mov  eax,d_Occupy_S11_00_00_11
    jmp .Retn

.Check_Occupy_S111_000_000_111:
    cmp  eax,25
    jnz .DefaultNull
    mov  eax,d_Occupy_S111_000_000_111
    jmp .Retn

.DefaultNull:
    xor  eax,eax             ;Occupy_NULL

.Retn:
    retn

