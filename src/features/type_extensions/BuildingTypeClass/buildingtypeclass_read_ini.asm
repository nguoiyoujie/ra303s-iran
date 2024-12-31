;----------------------------------------------------------------
; src/features/type_extensions/BuildingTypeClass/buildingtypeclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

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
    BuildingTypeClass.CustomFoundationList.Read(esi,edi,_CustomOccupyListFromString)
    BuildingTypeClass.UndeploysInto.Read(esi,edi,_GetUnitTypeIDFromString)
    BuildingTypeClass.SpreadExplosionDamage.Read(esi,edi)
    BuildingTypeClass.SpreadExplosionWarhead.Read(esi,edi,_GetWarheadTypeIDFromString)
    BuildingTypeClass.AIBuildLimit.Read(esi,edi)
    BuildingTypeClass.AIBuildType.Read(esi,edi,_GetAIBuildTypeFromString)

    ; set global significant flag-field. This will be used for Building Destroyed checks (to exclude Insignificant=yes buildings)
    push edx
    push ecx
    push ebx
    xor  edx,edx
    ObjectTypeClass.IsInsignificant.Get(esi,dl)
    mov  ebx,[esi+AbstractTypeClass.Offset.Index]
    mov  ecx,ebx
    shr  ebx,3
    and  ecx,7
    test dl,dl
    je   .SetSignificantScan
.ClearSignificantScan:
    mov  al,1
    shl  eax,cl
    add  al,1
    neg  al
    and  byte[Houses.BSignificantScan+ebx],al
    jmp  .ExitSignificantScan
.SetSignificantScan:
    mov  al,1
    shl  eax,cl
    or   byte[Houses.BSignificantScan+ebx],al
.ExitSignificantScan:
    pop  ebx
    pop  ecx
    pop  edx

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
    test eax,eax
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
    test eax,eax
    jz  .Retn ; just return 0
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
    push edi
    test eax,eax
    je   .Retn ; just return 0
    mov  ebx,eax
    xor  edi,edi
.Repeat:
    mov  edx,[strlist.SpecialTypes+edi*4]
    test edx,edx
    jz   .DefaultNull
    call _strcmpi
    test eax,eax
    jz   .Apply
    inc  edi
    mov  eax,ebx
    jmp  .Repeat
.Apply:
    mov  eax,edi
    jmp  .Retn
.DefaultNull:
    xor  eax,eax  ; SpecialType.NONE
.Retn:
    pop edi
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
    test eax,eax
    jz   .Retn
    push 0x005E8EDE ; ".SHP"
    mov  ecx,eax
    lea  eax,[Buffer_BuildingType]
    xor  ebx,ebx
    xor  edx,edx
    call 0x005B8BEE    ; _makepath
    lea  eax,[Buffer_BuildingType]
    call MFCD__Retrieve
.Retn:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    retn


_CustomOccupyListFromString:
   ;generate BuildingTypeClass.Offset.CustomOccupyList and BuildingTypeClass.Offset.CustomOverlapList, using string from eax
    push ebx
    push ecx
    push edx 
    push esi 
    push edi 
    ; check for null string
    test eax,eax
    jz   .Retn
    
    ;; Rules
    ;
    ; The cursor starts from point (0,0), and follows a set of instructions
    ; S -> advances the cursor to the 1st column of the row above. This can be used to begin the sequence at the row above the  building's top-left corner (e.g. SAM Sites)
    ; - -> advances the cursor to the right
    ; X -> marks the current location as (impassable) placement foundation, then advances the cursor to the right
    ; O -> marks the current location as overlay tile (not part of the building foundation, but part of the object's refresh area, then advances the cursor to the right
    ; | -> marks a new line. advances the cursor to the 1st column of the row below
    ; Any other character found will be terminate the sequence
    ; Note that the game applies bib foundations separately, so exclude them from this data. 
    ; 
    ; Examples:
    ;   RA1 Power Plant: XX|XX
    ;   C&C Power Plant: X|XX
    ;   RA1 Refinery: OXO|XXX|XOO
    ;   C&C Refinery: OXO|XXX|OOX
    ;   RA1 Sam Site: SOO|XX
    ;   RA1 Tesla Coil: O|X

    ; eax is the string, so it shall serve as our instruction 'pointer'
    ; esi is the type object
    ; Let bx be used as our cursor (word)
    ; ecx will be our temporary variable
    ; edx is our cursor for CustomOccupyList
    ; edi is our cursor for CustomOverlapList

    ; set bx to 0. (top-left coord)   
    xor  bx,bx
    mov  edx,esi
    add  edx,BuildingTypeClass.Offset.CustomOccupyList
    mov  edi,esi
    add  edi,BuildingTypeClass.Offset.CustomOverlapList
.GetInstruction:
    mov  cl, byte [eax]
    inc  eax ; advance eax to the next character

.CheckInstruction.S:
    cmp  cl, 'S'
    jne  .CheckInstruction.Dash
    add  bx,0xFF80  ; subtract 0x80 (row)
    and  bl,0x80    ; clear the column (0x0 - 0x7F)
    jmp  .GetInstruction

.CheckInstruction.Dash:
    cmp  cl, '-'
    jne  .CheckInstruction.Next
    inc  bx         ; add one column
    jmp  .GetInstruction

.CheckInstruction.Next:
    cmp  cl, '|'
    jne  .CheckInstruction.X
    add  bx,0x80    ; add 0x80 (row)
    and  bl,0x80    ; clear the column (0x0 - 0x7F)
    jmp  .GetInstruction

.CheckInstruction.X:
    cmp  cl, 'X'
    jne  .CheckInstruction.O
    mov  word [edx], bx
    add  edx, 2
    inc  bx         ; add one column
    jmp  .GetInstruction

.CheckInstruction.O:
    cmp  cl, 'O'
    jne  .CheckInstruction.Abort
    mov  word [edi], bx
    add  edi, 2
    inc  bx         ; add one column
    jmp  .GetInstruction

.CheckInstruction.Abort:
    ; append the terminating 0x7FFF
    mov  bx,0x7FFF
    mov  word [edx], bx
    mov  word [edi], bx

    ; replace lists
    mov  edx,esi
    add  edx,BuildingTypeClass.Offset.CustomOccupyList
    mov  ecx,esi
    add  ecx,BuildingTypeClass.Offset.CustomOverlapList   
    BuildingTypeClass.OccupyList.Set(esi,edx)
    BuildingTypeClass.OverlapList.Set(esi,ecx)

.Retn:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    retn


_GetUnitTypeIDFromString:
    ;select UnitType by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
    UnitTypeClass.FromID(eax,ebx)
    ;in case the ID was invalid...
    test ebx,ebx
    jz   .Retn ; just return 0
    mov  ebx,dword [ebx+1]; index
	;ObjectTypeClass.ID ebx,ebx
    mov  eax,ebx
.Retn:
    pop ebx
    retn

_GetWarheadTypeIDFromString:
    ;select WarheadType by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
    WarheadTypeClass.FromID(eax,ebx)
    ;in case the ID was invalid...
    test ebx,ebx
    jz   .Retn ; just return 0
    mov  ebx,dword [ebx]; index
    mov  eax,ebx
.Retn:
    pop ebx
    retn


_GetAIBuildTypeFromString:
    ;select AIBuildType by performing string compare on eax
    push edx
    push ebx ; hold eax value for multiple checks
    push edi
    test eax,eax
    jz  .Retn ; just return 0
    mov  ebx,eax
    xor  edi,edi
.Repeat:
    mov  edx,[strlist.AIBuildTypes+edi*4]
    test edx,edx
    jz   .DefaultNull
    call _strcmpi
    test eax,eax
    jz   .Apply
    inc  edi
    mov  eax,ebx
    jmp  .Repeat
.Apply:
    mov  eax,edi
    jmp  .Retn
.DefaultNull:
    xor  eax,eax  ; PrereqType.NONE
.Retn:
    pop edi
    pop ebx
    pop edx
    retn

