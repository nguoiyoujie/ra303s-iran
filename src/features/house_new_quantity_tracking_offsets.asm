;----------------------------------------------------------------
; src/features/house_new_quantity_tracking_offsets.asm
;
; Move object quantity tracking to new offsets to allow for the full use of 256 types per technotype class
; 
; This function is enabled by default and is not controllable.
; A good deal of testing is needed to check for compatibility issues, as many things are tied to the affected values
;----------------------------------------------------------------

@LJMP 0x004DCC8F, _HouseClass__Tracking_Add_New_Building_Tracking
@LJMP 0x004DCCF8, _HouseClass__Tracking_Add_New_Planes_Tracking
@LJMP 0x004DCDD2, _HouseClass__Tracking_Add_New_Vehicle_Tracking
@LJMP 0x004DCD5B, _HouseClass__Tracking_Add_New_Infantry_Tracking
@LJMP 0x004DCE40, _HouseClass__Tracking_Add_New_Vessels_Tracking
@LJMP 0x004DCB58, _HouseClass__Tracking_Remove_New_Building_Tracking
@LJMP 0x004DCB79, _HouseClass__Tracking_Remove_New_Planes_Tracking
@LJMP 0x004DCBA7, _HouseClass__Tracking_Remove_New_Infantry_Tracking
@LJMP 0x004DCBD1, _HouseClass__Tracking_Remove_New_Vehicle_Tracking
@LJMP 0x004DCBFB, _HouseClass__Tracking_Remove_New_Vessels_Tracking

;Temp
; CellClass::GoodieCheck
;@SET 0x004A077E, {mov ebx,[ecx+ebx*4+HouseClass.Offset.NewUQuantity]}
@LJMP 0x004A08AA, _CellClass__GoodieCheck_Replace_Quantity

; HouseClass::Get_Quantity
@SET 0x004DDBC2, {mov eax,[eax+edx*4+HouseClass.Offset.NewAQuantity]}
@SET 0x004DDCEE, {mov eax,[eax+edx*4+HouseClass.Offset.NewBQuantity]}

; HouseClass::Find_Building
@SET 0x004D8F4B, {cmp dword[ecx+eax*4+HouseClass.Offset.NewBQuantity],0}

; HouseClass::AI
; this check for force sub surfacing is rather wasteful. Maybe try to use a bitmask? 
@SET 0x004D4AF3, {cmp dword[eax+HouseClass.Offset.NewVQuantity],0} ; SUB
@SET 0x004D4B05, {lea edx,[esi+0x400]}
@SET 0x004D4B0B, {mov edi,[esi+HouseClass.Offset.NewBQuantity]}
@LJMP 0x004D4B22, _HouseClass__AI_Replace_UQuantity
@SET 0x004D4B28, {mov ebx,[esi+HouseClass.Offset.NewUQuantity]}
@LJMP 0x004D4B3F, _HouseClass__AI_Replace_IQuantity
@SET 0x004D4B45, {mov ecx,[esi+HouseClass.Offset.NewIQuantity]}
@LJMP 0x004D4B5C, _HouseClass__AI_Replace_AQuantity
@CLEAR 0x004D4B61, 0x90, 0x004D4B62
@SET 0x004D4B62, {mov edi,[esi+HouseClass.Offset.NewAQuantity]}
@SET 0x004D4B82, {add eax,[edx+HouseClass.Offset.NewVQuantity]}
@LJMP 0x004D4B89, _HouseClass__AI_Replace_VCount
@SET 0x004D4B95, {add eax,[edx+HouseClass.Offset.NewVQuantity]}

@LJMP 0x004D496F, _HouseClass__AI_Replace_AAPowerCheck

_HouseClass__Tracking_Remove_New_Building_Tracking:
    shr  eax, 18h
    dec  dword [ebx+eax*4+HouseClass.Offset.NewBQuantity]
    ;dec  dword [ebx+eax*4+HouseClass.Offset.BQuantity]
    jmp  0x004DCC27

_HouseClass__Tracking_Remove_New_Planes_Tracking:
    shr  eax, 18h
    dec  dword [ebx+eax*4+HouseClass.Offset.NewAQuantity]
    ;dec  dword [ebx+eax*4+HouseClass.Offset.AQuantity]
    jmp  0x004DCC27

_HouseClass__Tracking_Remove_New_Infantry_Tracking:
    shr  eax, 18h
    dec  dword [ebx+eax*4+HouseClass.Offset.NewIQuantity]
    ;dec  dword [ebx+eax*4+HouseClass.Offset.IQuantity]
    jmp  0x004DCC27

_HouseClass__Tracking_Remove_New_Vessels_Tracking:
    shr  eax, 18h
    dec  dword [ebx+eax*4+HouseClass.Offset.NewVQuantity]
    ;dec  dword [ebx+eax*4+HouseClass.Offset.VQuantity]
    jmp  0x004DCC27


_HouseClass__Tracking_Remove_New_Vehicle_Tracking:
    shr  eax, 18h
    dec  dword [ebx+eax*4+HouseClass.Offset.NewUQuantity]
    ;dec  dword [ebx+eax*4+HouseClass.Offset.UQuantity]
    jmp  0x004DCC27


_HouseClass__Tracking_Add_New_Building_Tracking:
    inc  dword[esi+HouseClass.Offset.NewBQuantity]
    mov  byte[esi+HouseClass.Offset.BuildStructure],-1 ; I just built something. Recheck my build order.
    ;inc  dword [esi+HouseClass.Offset.BQuantity]
    jmp  0x004DCC95

_HouseClass__Tracking_Add_New_Planes_Tracking:
    inc  dword [esi+HouseClass.Offset.NewAQuantity]
    mov  byte[esi+HouseClass.Offset.BuildAircraft],-1 ; I just built something. Recheck my limits.
    ;inc  dword [esi+HouseClass.Offset.AQuantity]
    jmp  0x004DCCFE

_HouseClass__Tracking_Add_New_Infantry_Tracking:
    movzx eax, cl
    inc  dword [ebx+eax*4+HouseClass.Offset.NewIQuantity]
    mov  byte[esi+HouseClass.Offset.BuildInfantry],-1 ; I just built something. Recheck my limits.
    ;inc  dword [ebx+eax*4+HouseClass.Offset.IQuantity]
    jmp  0x004DCD6D

_HouseClass__Tracking_Add_New_Vehicle_Tracking:
    movzx eax, cl
    inc  dword [ebx+eax*4+HouseClass.Offset.NewUQuantity]
    mov  byte[esi+HouseClass.Offset.BuildUnit],-1 ; I just built something. Recheck my limits.
    ;inc  dword [ebx+eax*4+HouseClass.Offset.UQuantity]
    jmp  0x004DCDF0

_HouseClass__Tracking_Add_New_Vessels_Tracking:
    movsx eax, cl
    inc  dword [ebx+eax*4+HouseClass.Offset.NewVQuantity]
    mov  byte[esi+HouseClass.Offset.BuildVessel],-1 ; I just built something. Recheck my limits.
    ;inc  dword [ebx+eax*4+HouseClass.Offset.VQuantity]
    jmp  0x004DCE5E


_HouseClass__AI_Replace_UQuantity:
    mov  esi,dword[ebp-0x58]
    lea  edx,[esi+0x400]
    jmp  0x004D4B28

_HouseClass__AI_Replace_IQuantity:
    mov  esi,dword[ebp-0x58]
    lea  edx,[esi+0x400]
    jmp  0x004D4B45

_HouseClass__AI_Replace_AQuantity:
    mov  esi,dword[ebp-0x58]
    lea  edx,[esi+0x400]
    jmp  0x004D4B62

_HouseClass__AI_Replace_VCount:
    add  edx,4
    cmp  esi,[VesselTypeClass.Count]
    jmp  0x004D4B8F

_CellClass__GoodieCheck_Replace_Quantity:
    ; edx is houseclass
    lea  eax,[edx+HouseClass.Offset.NewUQuantity]
    lea  ecx,[eax+0x400*4] ; NewUQuantity, NewIQuantity, NewAQuantity, NewVQuantity
    xor  ebx,ebx
.Repeat:
    add  ebx,dword[eax]
.Next:
    add  eax,4
    cmp  eax,ecx
    jl   .Repeat  
    add  dword[ebp-192],ebx
.CountBuildings:
    lea  eax,[edx+HouseClass.Offset.NewBQuantity]
    lea  ecx,[eax+0x400] ; NewBQuantity
    xor  ebx,ebx
.CountBuildings_Repeat:
    add  ebx,dword[eax]
.CountBuildings_Next:
    add  eax,4
    cmp  eax,ecx
    jl   .Repeat
    shr  ebx,1 ; divide building score by 2
    add  dword[ebp-192],ebx
.Done:
    jmp  0x004A085D

_HouseClass__AI_Replace_AAPowerCheck:
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x800 ; ADV.DEFENSE
    jz   .TeslaOffline
    test dword[eax+HouseClass.Offset.BPreGroupScan],0x1000 ; AA.DEFENSE
    jz   .AAOffline
    mov  edx,0x203
    jmp  0x004D49B2
.TeslaOffline:
    mov  edx,0x202
    jmp  0x004D49B2
.AAOffline:
    mov  edx,0x201
    jmp  0x004D49B2
