;Read INI settings
@HOOK 0x00453FFB _BuildingTypeClass__Read_INI_Extended

%define        Offset_IsSimpleDamage            0x192
%define        Offset_IsRegulated               0x192
%define        Offset_FactoryType               0x19B    ; BYTE, AIRCRAFT_TYPE=2, BUILDING_TYPE=6, INFANTRY_TYPE=14, UNIT_TYPE=29, VESSEL_TYPE=31
%define        Offset_ExitCoordX                0x19C    ; WORD
%define        Offset_ExitCoordY                0x19E    ; WORD
%define        Offset_ExitList                  0x1A0    ; INT
%define        Offset_BSize                     0x1B2    ; BYTE, 0-8, BSIZE_11, BSIZE_21, BSIZE_12, BSIZE_22, BSIZE_23, BSIZE_32, BSIZE_33, BSIZE_42, BSIZE_55 
%define        Offset_Anim_Construct_Start      0x1B3    ; INT
%define        Offset_Anim_Construct_Count      0x1B7    ; INT
%define        Offset_Anim_Construct_Rate       0x1BB    ; INT
%define        Offset_Anim_Idle_Start           0x1BF    ; INT
%define        Offset_Anim_Idle_Count           0x1C3    ; INT
%define        Offset_Anim_Idle_Rate            0x1C7    ; INT
%define        Offset_Anim_Active_Start         0x1CB    ; INT
%define        Offset_Anim_Active_Count         0x1CF    ; INT
%define        Offset_Anim_Active_Rate          0x1D3    ; INT
%define        Offset_Anim_Full_Start           0x1D7    ; INT
%define        Offset_Anim_Full_Count           0x1DB    ; INT
%define        Offset_Anim_Full_Rate            0x1DF    ; INT
%define        Offset_Anim_Aux1_Start           0x1E3    ; INT
%define        Offset_Anim_Aux1_Count           0x1E7    ; INT
%define        Offset_Anim_Aux1_Rate            0x1EB    ; INT
%define        Offset_Anim_Aux2_Start           0x1EF    ; INT
%define        Offset_Anim_Aux2_Count           0x1F3    ; INT
%define        Offset_Anim_Aux2_Rate            0x1F7    ; INT
%define        Offset_OccupyList                0x1FB    ; INT
%define        Offset_OverlapList               0x1FF    ; INT


str_IsSimpleDamage            db"IsSimpleDamage",0
str_IsRegulated               db"ConstantAnimation",0
str_FactoryType               db"FactoryType",0
str_ExitCoordX                db"ExitCoordX",0
str_ExitCoordY                db"ExitCoordY",0
str_ExitList                  db"ExitList",0
str_BSize                     db"BSize",0
str_Anim_Construct_Start      db"Anim_Construct_Start",0
str_Anim_Construct_Count      db"Anim_Construct_Count",0
str_Anim_Construct_Rate       db"Anim_Construct_Rate",0
str_Anim_Idle_Start           db"Anim_Idle_Start",0
str_Anim_Idle_Count           db"Anim_Idle_Count",0
str_Anim_Idle_Rate            db"Anim_Idle_Rate",0
str_Anim_Active_Start         db"Anim_Active_Start",0
str_Anim_Active_Count         db"Anim_Active_Count",0
str_Anim_Active_Rate          db"Anim_Active_Rate",0
str_Anim_Full_Start           db"Anim_Full_Start",0
str_Anim_Full_Count           db"Anim_Full_Count",0
str_Anim_Full_Rate            db"Anim_Full_Rate",0
str_Anim_Aux1_Start           db"Anim_Aux1_Start",0
str_Anim_Aux1_Count           db"Anim_Aux1_Count",0
str_Anim_Aux1_Rate            db"Anim_Aux1_Rate",0
str_Anim_Aux2_Start           db"Anim_Aux2_Start",0
str_Anim_Aux2_Count           db"Anim_Aux2_Count",0
str_Anim_Aux2_Rate            db"Anim_Aux2_Rate",0
str_OccupyList                db"OccupyList",0
str_OverlapList               db"OverlapList",0

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
    mov  eax,0x005FEA5C ;ExitPyle
    jmp .Retn

.Check_ExitSub:
    cmp  eax,1
    jnz .Check_ExitWeap
    mov  eax,0x005FEA78 ;ExitSub
    jmp .Retn

.Check_ExitWeap:
    cmp  eax,2
    jnz .DefaultNull
    mov  eax,0x005FEA82 ;ExitWeap
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

_BuildingTypeClass__Read_INI_Extended:
    push esi
    push edi
    push eax
    ;mov esi, edi
    ;mov edi, RulesINI

    BuildingTypeClass.ID 

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsSimpleDamage], 5
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsSimpleDamage, ecx
    Set_Bit_Byte [esi+Offset_IsSimpleDamage], 5, al

    lea  edx, [esi+5]
    Get_Bit BYTE [esi+Offset_IsRegulated], 7
    xor  ecx, ecx
    mov  cl, al
    call_INIClass__Get_Bool edi, edx, str_IsRegulated, ecx
    Set_Bit_Byte [esi+Offset_IsRegulated], 7, al

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  BYTE cl, [esi+Offset_FactoryType]
    call_INIClass__Get_Int edi, edx, str_FactoryType, ecx
    mov  BYTE  [esi+Offset_FactoryType], al

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  WORD cx, [esi+Offset_ExitCoordX]
    call_INIClass__Get_Int edi, edx, str_ExitCoordX, ecx
    mov  WORD [esi+Offset_ExitCoordX], ax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  WORD cx, [esi+Offset_ExitCoordY]
    call_INIClass__Get_Int edi, edx, str_ExitCoordY, ecx
    mov  WORD [esi+Offset_ExitCoordY], ax

    ; Select ExitList
    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_ExitList]
    call_INIClass__Get_Int edi, edx, str_ExitList, ecx
    call _SelectExitList
    mov  [esi+Offset_ExitList], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  BYTE cl, [esi+Offset_BSize]
    call_INIClass__Get_Int edi, edx, str_BSize, ecx
    mov  BYTE  [esi+Offset_BSize], al

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Construct_Start]
    call_INIClass__Get_Int edi, edx, str_Anim_Construct_Start, ecx
    mov  [esi+Offset_Anim_Construct_Start], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Construct_Count]
    call_INIClass__Get_Int edi, edx, str_Anim_Construct_Count, ecx
    mov  [esi+Offset_Anim_Construct_Count], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Construct_Rate]
    call_INIClass__Get_Int edi, edx, str_Anim_Construct_Rate, ecx
    mov  [esi+Offset_Anim_Construct_Rate], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Idle_Start]
    call_INIClass__Get_Int edi, edx, str_Anim_Idle_Start, ecx
    mov  [esi+Offset_Anim_Idle_Start], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Idle_Count]
    call_INIClass__Get_Int edi, edx, str_Anim_Idle_Count, ecx
    mov  [esi+Offset_Anim_Idle_Count], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Idle_Rate]
    call_INIClass__Get_Int edi, edx, str_Anim_Idle_Rate, ecx
    mov  [esi+Offset_Anim_Idle_Rate], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Active_Start]
    call_INIClass__Get_Int edi, edx, str_Anim_Active_Start, ecx
    mov  [esi+Offset_Anim_Active_Start], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Active_Count]
    call_INIClass__Get_Int edi, edx, str_Anim_Active_Count, ecx
    mov  [esi+Offset_Anim_Active_Count], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Active_Rate]
    call_INIClass__Get_Int edi, edx, str_Anim_Active_Rate, ecx
    mov  [esi+Offset_Anim_Active_Rate], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Full_Start]
    call_INIClass__Get_Int edi, edx, str_Anim_Full_Start, ecx
    mov  [esi+Offset_Anim_Full_Start], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Full_Count]
    call_INIClass__Get_Int edi, edx, str_Anim_Full_Count, ecx
    mov  [esi+Offset_Anim_Full_Count], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Full_Rate]
    call_INIClass__Get_Int edi, edx, str_Anim_Full_Rate, ecx
    mov  [esi+Offset_Anim_Full_Rate], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Aux1_Start]
    call_INIClass__Get_Int edi, edx, str_Anim_Aux1_Start, ecx
    mov  [esi+Offset_Anim_Aux1_Start], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Aux1_Count]
    call_INIClass__Get_Int edi, edx, str_Anim_Aux1_Count, ecx
    mov  [esi+Offset_Anim_Aux1_Count], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Aux1_Rate]
    call_INIClass__Get_Int edi, edx, str_Anim_Aux1_Rate, ecx
    mov  [esi+Offset_Anim_Aux1_Rate], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Aux2_Start]
    call_INIClass__Get_Int edi, edx, str_Anim_Aux2_Start, ecx
    mov  [esi+Offset_Anim_Aux2_Start], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Aux2_Count]
    call_INIClass__Get_Int edi, edx, str_Anim_Aux2_Count, ecx
    mov  [esi+Offset_Anim_Aux2_Count], eax

    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_Anim_Aux2_Rate]
    call_INIClass__Get_Int edi, edx, str_Anim_Aux2_Rate, ecx
    mov  [esi+Offset_Anim_Aux2_Rate], eax

    ; Select OccupyList
    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_OccupyList]
    call_INIClass__Get_Int edi, edx, str_OccupyList, ecx
    call _SelectOccupyList
    mov  [esi+Offset_OccupyList], eax

    ; Select OverLapList
    lea  edx, [esi+5]
    xor  ecx, ecx
    mov  ecx, [esi+Offset_OverlapList]
    call_INIClass__Get_Int edi, edx, str_OverlapList, ecx
    call _SelectOccupyList
    mov  [esi+Offset_OverlapList], eax

    pop eax
    pop  edi
    pop  esi


.Ret:
    lea  esp, [ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x00454001
