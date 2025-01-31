;----------------------------------------------------------------
; src/features/house_new_quantity_tracking_offsets.asm
;
; Move object quantity tracking to new offsets to allow for the full use of 256 types per technotype class
; 
; This function is enabled by default and is not controllable.
; A good deal of testing is needed to check for compatibility issues, as many things are tied to the affected values
;----------------------------------------------------------------

; _HouseClass__Tracking_Remove_New_Building_Tracking
@SET 0x004DCB58,{shr eax,0x18}
@SET 0x004DCB5B,{dec dword[ebx+eax*4+HouseClass.Offset.NewBQuantity]}

; _HouseClass__Tracking_Remove_New_Planes_Tracking
@SET 0x004DCB79,{shr eax,0x18}
@SET 0x004DCB7C,{dec dword[ebx+eax*4+HouseClass.Offset.NewAQuantity]}

; _HouseClass__Tracking_Remove_New_Infantry_Tracking
@SET 0x004DCBA7,{shr eax,0x18}
@SJMP 0x004DCBAA,0x004DCBB2
@SET 0x004DCBB2,{dec dword[ebx+eax*4+HouseClass.Offset.NewIQuantity]}

; _HouseClass__Tracking_Remove_New_Vehicle_Tracking
@SET 0x004DCBD1,{shr eax,0x18}
@SJMP 0x004DCBD4,0x004DCBDC
@SET 0x004DCBDC,{dec dword[ebx+eax*4+HouseClass.Offset.NewUQuantity]}

; _HouseClass__Tracking_Remove_New_Vessels_Tracking
@SET 0x004DCBFB,{shr eax,0x18}
@SJMP 0x004DCBFE,0x004DCC06
@SET 0x004DCC06,{dec dword[ebx+eax*4+HouseClass.Offset.NewVQuantity]}

; HouseClass::Get_Quantity
@SET 0x004DDBC2,{mov eax,[eax+edx*4+HouseClass.Offset.NewAQuantity]}
@SET 0x004DDCEE,{mov eax,[eax+edx*4+HouseClass.Offset.NewBQuantity]}

; HouseClass::Find_Building
@SET 0x004D8F4B,{cmp dword[ecx+eax*4+HouseClass.Offset.NewBQuantity],0}

; HouseClass::AI
; this check for force sub surfacing is rather wasteful. Maybe try to use a bitmask? 
@SET 0x004D4AF3,{cmp dword[eax+HouseClass.Offset.NewVQuantity],0} ; SUB
@SET 0x004D4B05,{lea edx,[esi+0x400]}
@SET 0x004D4B0B,{mov edi,[esi+HouseClass.Offset.NewBQuantity]}
@SET 0x004D4B28,{mov ebx,[esi+HouseClass.Offset.NewUQuantity]}
@SET 0x004D4B45,{mov ecx,[esi+HouseClass.Offset.NewIQuantity]}
@SET 0x004D4B62,{mov edi,[esi+HouseClass.Offset.NewAQuantity]}
@SET 0x004D4B82,{add eax,[edx+HouseClass.Offset.NewVQuantity]}
@SET 0x004D4B95,{add eax,[edx+HouseClass.Offset.NewVQuantity]}


@HACK 0x004DCC8F,0x004DCC95,_HouseClass__Tracking_Add_New_Building_Tracking
    inc  dword[esi+HouseClass.Offset.NewBQuantity]
    mov  byte[esi+HouseClass.Offset.BuildStructure],-1 ; I just built something. Recheck my build order.
    jmp  0x004DCC95
@ENDHACK


@HACK 0x004DCCF8,0x004DCCFE,_HouseClass__Tracking_Add_New_Planes_Tracking
    inc  dword[esi+HouseClass.Offset.NewAQuantity]
    mov  byte[esi+HouseClass.Offset.BuildAircraft],-1 ; I just built something. Recheck my limits.
    jmp  0x004DCCFE
@ENDHACK


@HACK 0x004DCD5B,0x004DCD6D,_HouseClass__Tracking_Add_New_Infantry_Tracking
    movzx eax,cl
    inc  dword[ebx+eax*4+HouseClass.Offset.NewIQuantity]
    mov  byte[esi+HouseClass.Offset.BuildInfantry],-1 ; I just built something. Recheck my limits.
    jmp  0x004DCD6D
@ENDHACK


@HACK 0x004DCDD2,0x004DCDF0,_HouseClass__Tracking_Add_New_Vehicle_Tracking
    movzx eax,cl
    inc  dword[ebx+eax*4+HouseClass.Offset.NewUQuantity]
    mov  byte[esi+HouseClass.Offset.BuildUnit],-1 ; I just built something. Recheck my limits.
    jmp  0x004DCDF0
@ENDHACK


@HACK 0x004DCE40,0x004DCE5E,_HouseClass__Tracking_Add_New_Vessels_Tracking
    movsx eax,cl
    inc  dword[ebx+eax*4+HouseClass.Offset.NewVQuantity]
    mov  byte[esi+HouseClass.Offset.BuildVessel],-1 ; I just built something. Recheck my limits.
    jmp  0x004DCE5E
@ENDHACK


@HACK 0x004D4B22,0x004D4B28,_HouseClass__AI_Sub_Check_Replace_UQuantity
    mov  esi,dword[ebp-0x58]
    lea  edx,[esi+0x400]
    jmp  0x004D4B28
@ENDHACK


@HACK 0x004D4B3F,0x004D4B45,_HouseClass__AI_Sub_Check_Replace_IQuantity
    mov  esi,dword[ebp-0x58]
    lea  edx,[esi+0x400]
    jmp  0x004D4B45
@ENDHACK


@HACK 0x004D4B5C,0x004D4B62,_HouseClass__AI_Sub_Check_Replace_AQuantity
    mov  esi,dword[ebp-0x58]
    lea  edx,[esi+0x400]
    jmp  0x004D4B62
@ENDHACK


@HACK 0x004D4B89,0x004D4B8F,_HouseClass__AI_Sub_Check_Replace_VCount
    add  edx,4
    cmp  esi,[VesselTypeClass.Count]
    jmp  0x004D4B8F
@ENDHACK


;Temp
; CellClass::GoodieCheck
;@SET 0x004A077E,{mov ebx,[ecx+ebx*4+HouseClass.Offset.NewUQuantity]}
@HACK 0x004A08AA,0x004A08AF,_CellClass__GoodieCheck_Replace_Quantity
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
@ENDHACK


@HACK 0x004D496F,0x004D49B2,_HouseClass__AI_Replace_AAPowerCheck
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
@ENDHACK
