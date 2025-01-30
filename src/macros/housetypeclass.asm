;----------------------------------------------------------------
; src/macros/housetypeclass.asm
;
; Macros to access HouseTypeClass offsets
;
;----------------------------------------------------------------

; define house type class field definitions
; abstract type
; AbstractTypeClass__Coord_Fixup()   0x021 
%define HouseTypeClass.Offset.House              0x025    ; byte (HousesType)
%define HouseTypeClass.Offset.Suffix             0x026    ; many bytes
;%define HouseTypeClass.Offset.Lemon              0x025    ; INT
%define HouseTypeClass.Offset.RemapColor         0x12A    ; byte (PlayerColorType)
%define HouseTypeClass.Offset.Prefix             0x12B    ; byte

%define HouseTypeClass.Offset.FirepowerBias      0x12C    ; word (Fixed)
%define HouseTypeClass.Offset.GroundspeedBias    0x12E    ; word (Fixed)
%define HouseTypeClass.Offset.AirspeedBias       0x130    ; word (Fixed)
%define HouseTypeClass.Offset.ArmorBias          0x132    ; word (Fixed)
%define HouseTypeClass.Offset.ROFBias            0x134    ; word (Fixed)
%define HouseTypeClass.Offset.CostBias           0x136    ; word (Fixed)
%define HouseTypeClass.Offset.BuildSpeedBias     0x138    ; word (Fixed)
;0x13A (original)
%define HouseTypeClass.Offset.HeliUnit           0x13A    ; byte
%define HouseTypeClass.Offset.MCVUnit            0x13B    ; byte
;0x13B

; INI String controls ; this is for multiplayer storage
str.HouseTypeClass.HeliUnit                      db"HeliUnit",0             ;new ini feature
str.HouseTypeClass.MCVUnit                       db"MCVUnit",0              ;new ini feature

%define HouseTypeClass.FromIndex(d_index,reg_output)                        AbstractTypeClass.FromIndex            d_index, HouseTypeClass.Count, HouseTypeClass.Array, reg_output
%define HouseTypeClass.FromID(d_index,reg_output)                           AbstractTypeClass.FromID               d_index, HouseTypeClass.Count, HouseTypeClass.Array, reg_output

;;;;;;;;;;;;;;; Offsets ;;;;;;;;;;;;;;;

%define HouseTypeClass.HeliUnit.Get(ptr_type,reg_output)                    ObjectTypeClass.GetByte                ptr_type, HouseTypeClass.Offset.HeliUnit, reg_output
%define HouseTypeClass.HeliUnit.Set(ptr_type,value)                         ObjectTypeClass.SetByte                ptr_type, HouseTypeClass.Offset.HeliUnit, value
%define HouseTypeClass.HeliUnit.Read(ptr_type,ptr_rules,function)           ObjectTypeClass.ReadStringToByteExt    ptr_type, ptr_rules, HouseTypeClass.Offset.HeliUnit, str.HouseTypeClass.HeliUnit, function

%define HouseTypeClass.MCVUnit.Get(ptr_type,reg_output)                     ObjectTypeClass.GetByte                ptr_type, HouseTypeClass.Offset.MCVUnit, reg_output
%define HouseTypeClass.MCVUnit.Set(ptr_type,value)                          ObjectTypeClass.SetByte                ptr_type, HouseTypeClass.Offset.MCVUnit, value
%define HouseTypeClass.MCVUnit.Read(ptr_type,ptr_rules,function)            ObjectTypeClass.ReadStringToByteExt    ptr_type, ptr_rules, HouseTypeClass.Offset.MCVUnit, str.HouseTypeClass.MCVUnit, function


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
	;ObjectTypeClass.ID ebx,ebx
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
	;ObjectTypeClass.ID ebx,ebx
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
