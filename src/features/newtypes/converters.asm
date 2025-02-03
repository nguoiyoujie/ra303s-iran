;----------------------------------------------------------------
; src/features/newtypes/converters.asm
;
; Common read functions. Generally only used when reading from INI.
; TO-DO: It is likely these functions already exist on the original code. Use those if possible.
;
;----------------------------------------------------------------

%include "types/AircraftTypeClass.inc"
%include "types/BuildingTypeClass.inc"
%include "types/HouseTypeClass.inc"
%include "types/UnitTypeClass.inc"
%include "types/WarheadTypeClass.inc"
%include "defines/playercolortypes.inc"


[section .text]
_GetAircraftTypeIDFromString:
    ;select by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
    AircraftTypeClass.FromID(eax,ebx)
    ;in case the ID was invalid...
    test ebx,ebx
    jz   .Retn ; just return 0
    mov  ebx,dword[ebx+1]; index
	;AbstractTypeClass.ID ebx,ebx
    mov  eax,ebx
.Retn:
    pop ebx
    retn


_GetBuildingTypeIDFromString:
    ;select BuildingType by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
    BuildingTypeClass.FromID(eax,ebx)
    ;in case the ID was invalid...
    test ebx,ebx
    jz   .Retn ; just return 0
    mov  ebx,dword[ebx+1]; index
	;AbstractTypeClass.ID ebx,ebx
    mov  eax,ebx
.Retn:
    pop ebx
    retn


_GetHouseTypeIDFromString:
    ;select HouseType by performing string compare on eax
    push ebx
    cmp  eax,0
    jle  .Retn ; just return 0
    HouseTypeClass.FromID(eax,ebx)
    ;in case the ID was invalid...
    test ebx,ebx
    jz   .Retn ; just return 0
    mov  ebx,dword[ebx+1]; index
    mov  eax,ebx
.Retn:
    pop ebx
    retn


_GetHouseTypeIDFromIntOrString:
    ;select HouseType by performing string compare on eax
    push ebx
    push edx
    cmp  eax,0
    jle  .Retn ; just return 0
    ; check that it is zero string value
    mov  ebx,eax
    mov  edx,str_Zero
    call _strcmpi
    test eax,eax
    jz   .Retn ; match
.IntegerCheck:
    ; check if it is a positive integer value
    mov  eax,ebx
    call 0x005BC8B7 ; _atoi
    test eax,eax
    jz   .StringCheck
    cmp  eax,[HouseTypeClass.Count]
    jbe  .Retn
.StringCheck:
    mov  eax,ebx
    HouseTypeClass.FromID(eax,ebx)
    ;in case the ID was invalid...
    test ebx,ebx
    jz   .Retn ; just return 0
    mov  ebx,dword[ebx+1]; index
    mov  eax,ebx
.Retn:
    pop  edx
    pop  ebx
    retn


_GetPlayerColorTypeFromIntOrString:
    ;select HouseType by performing string compare on eax
    push ebx
    push edx
    push edi
    cmp  eax,0
    jle  .Retn ; just return 0
    ; check that it is zero string value
    mov  ebx,eax
    mov  edx,str_Zero
    call _strcmpi
    test eax,eax
    jz   .Retn ; match
.IntegerCheck:
    ; check if it is a positive integer value
    mov  eax,ebx
    call 0x005BC8B7 ; _atoi
    test eax,eax
    jz   .StringCheck
    cmp  eax,PlayerColorType.MAX
    jbe  .Retn
.StringCheck:
    mov  eax,ebx
    xor  edi,edi
.Repeat:
    mov  edx,[strlist.PlayerColorTypes+edi*4]
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
    pop  edi
    pop  edx
    pop  ebx
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
    mov  ebx,dword[ebx+1]; index
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
    mov  ebx,dword[ebx]; index
    mov  eax,ebx
.Retn:
    pop ebx
    retn
  
