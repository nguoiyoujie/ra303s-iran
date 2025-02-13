;----------------------------------------------------------------
; src/features/ai_units.asm
;
; Extends House AI with the following features
; - Unit production obey Can_Build() checks
; - AI will consider training new units beyond the original set when Auto Production is enabled
; - AI will consider training new units listed in Teams
;
; If House AI has already selected a unit to build based on Teams, it will skip processing of AutoBase selection (if AutoBase is enabled). That way Team fulfillment take priority.
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

cextern HouseClass__Can_Build
cextern UnitTypeClass__As_Reference
cextern Rules.AI.UnitReserve


;added by lovalmidas
; hook into AI_Unit() to change how AI weights units in order to make its choices. This is done to support the additional units beyond the original UNIT_COUNT
; Note that AI behavior depends on Can_Build() checks and new units will be treated similar to Aftermath units due to being placed after them

@SJMP 0x004DBB6A,0x004DBB73 ; _HouseClass__AI_Unit_Extend_Remove_CanBuild_From_TeamTypeCheck

; Warning stack manipulation!
@SET 0x004DB7F4,{sub esp,0x5E8} ; was 0xE8, add 0x200 to hold counter[UNIT_COUNT] (0x400) and bestlist[UNIT_COUNT] (0x100)
; this section deals with the AI with Teams
@SET 0x004DB880,{mov ebx,0x500} ; was 0x58, for, memset
@SET 0x004DB885,{lea eax,[ebp-0x5FC]} ; 0xFFFFFA04 ; was 0xFFFFFF04
@SET 0x004DB969,{mov dword[ebp+ebx*4-0x5FC],1}
@SET 0x004DBA40,{mov esi,dword[ebp+ebx-0x5FC]}
@SET 0x004DBA6D,{mov dword[ebp+ecx*4-0x5FC],ebx}
@SET 0x004DBA95,{cmp dword[ebp+eax*4-0x5FC],0}
@SET 0x004DBAC9,{dec dword[ebp+eax*4-0x5FC]}
@SET 0x004DBB2D,{cmp dword[ebp+eax*4-0x5FC],0}
@SET 0x004DBB9D,{cmp esi,dword[ebp+eax*4-0x5FC]}
@SET 0x004DBBAE,{mov esi,dword[ebp+eax*4-0x5FC]}
; this section deals with the AI with BaseBuilding, to include the additional units in its random building roster
;@SET 0x004DBC45,{mov dword[ebp+eax*4-0x4FC],0x14} ; 0xFFFFFB04 ; was 0xFFFFFF5C
;@SET 0x004DBC58,{mov dword[ebp+eax*4-0x4FC],0x1}
@SET 0x004DBC6B,{mov dword[ebp+eax*4-0x4FC],edi}
@SET 0x004DBC78,{mov ecx,dword[ebp+eax*4-0x4FC]}
@SET 0x004DBCDF,{mov esi,dword[ebp+edx-0x4FC]}


[section .data] 
Temp.AIUnit.Harvester db 0


[section .text] 
@HACK 0x004DB839,0x004DB845,_HouseClass__AI_Unit_CheckHarvester
    ; edx = HouseClass
    ; set edi to 1 if there is income, 0 otherwise
    push edi
    push esi
    push ebx
    push eax
    xor  esi,esi
    xor  edi,edi
.CheckRefn.Repeat:
    mov  eax,esi
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.IsRefinery.Get(ebx,al)
    test al,al
    jz   .CheckRefn.Next
    add  edi,dword[edx+4*esi+HouseClass.Offset.NewBQuantity]
.CheckRefn.Next:
    inc  esi
    mov  eax,[BuildingTypeClass.Count]
    cmp  esi,eax
    jb   .CheckRefn.Repeat
    xor  esi,esi
.CheckHarv.Repeat:
    mov  eax,esi
    UnitTypeClass.FromIndex(eax,ebx)
    UnitTypeClass.IsToHarvest.Get(ebx,al)
    test al,al
    jz   .CheckHarv.Next
    sub  edi,dword[edx+4*esi+HouseClass.Offset.NewUQuantity]
.CheckHarv.Next:
    inc  esi
    mov  eax,[UnitTypeClass.Count]
    cmp  esi,eax
    jb   .CheckHarv.Repeat
.Done:
    pop  eax
    pop  ebx
    pop  esi
    cmp  edi,0
    pop  edi
    jmp  0x004DB845
@ENDHACK


@HACK 0x004DB84D,0x004DB86E,_HouseClass__AI_Unit_PickHarvester
    ; edx: House class
    ; cycle through all units
    ; pick the first unit that is buildable
    push edi
    push esi
    push ebx
    xor  edi,edi
.Repeat:
    mov  eax,edi
    UnitTypeClass.FromIndex(eax,ebx)
    UnitTypeClass.IsToHarvest.Get(ebx,al)
	test al,al
    jz   .Next
    push ebx
    push ecx
    push edx
    mov  ecx,ebx
    mov  bl,byte[edx+HouseClass.Offset.ActLike]
    movzx ebx,bl
    mov  eax,edx
    mov  edx,ecx
    call HouseClass__Can_Build
    pop  edx
    pop  ecx
    pop  ebx
    test eax,eax
    jz   .Next
.SelectHarv:
    mov  eax,edi
    jmp  .Done
.Next:
    inc  edi
    mov  eax,[UnitTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
    jmp  0x004DB873
.Done:
    pop  ebx
    pop  esi
    pop  edi
    push eax
    call UnitTypeClass__As_Reference
    mov  eax,dword[eax+0x14C]
    cmp  eax,dword[edx+0x20]
    pop  eax
    ja   0x004DB873
    mov  byte[edx+HouseClass.Offset.BuildUnit],al
    mov  eax,0xF
    jmp  0x004DB86E
@ENDHACK


@HACK 0x004DBBB6,0x004DBBBD,_HouseClass__AI_Unit_Extend_BestList_1
    mov  al,byte[ebp-0x18]
    mov  byte[ecx+ebp*0x1 - 1533],al  ; was -0x4D
    jmp  0x004DBBBD
@ENDHACK


@HACK 0x004DBBE4,0x004DBBEE,_HouseClass__AI_Unit_Extend_BestList_2
    mov  al,byte[eax+ebp*0x1 - 1532] ; was -0x4C
    mov  byte[edx+HouseClass.Offset.BuildUnit],al
    jmp  0x004DBCF6 ; skip AutoBase
@ENDHACK


@HACK 0x004DBBEE,0x004DBBF5,_HouseClass__AI_Unit_Credits_Check
    mov  eax,[ebp-0x20]
    ; Check reserve
    push ebx
    mov  ebx,dword[eax+HouseClass.Offset.Tiberium]
    add  ebx,dword[eax+HouseClass.Offset.Credits]
    cmp  ebx,[Rules.AI.AircraftReserve]
    pop  ebx
    jl   0x004DBCF6 ; skip
    mov  eax,[ebp-0x20]
    test byte[eax+0x42],0x20
    jmp  0x004DBBF5 
@ENDHACK


@HACK 0x004DBBC5,0x004DBBCE,_HouseClass__AI_Unit_Expand
    cmp  byte bl,[UnitTypeClass.Count] ; was UNIT_COUNT (0x16)
    jl   0x004DBB27
    jmp  0x004DBBCE
@ENDHACK


@HACK 0x004DBC89,0x004DBC91,_HouseClass__AI_Unit_Expand_Choice
    cmp  byte al,[UnitTypeClass.Count] ; was UNIT_COUNT (0x16)
    jl   0x004DBC05
    jmp  0x004DBC91
@ENDHACK


; extends the check to new unittypeclass
@HACK 0x004DBCAE,0x004DBCB3,_HouseClass__AI_Unit_Expand_Choice_2
    cmp  byte dh,[UnitTypeClass.Count] ; was UNIT_COUNT (0x16)
    jl   0x004DBCD6
    jmp  0x004DBCB3
@ENDHACK


@HACK 0x004DBC32,0x004DBC37,_HouseClass__AI_Unit_Ignore_Harvesters
    movzx eax,al
    push ebx
    UnitTypeClass.FromIndex(eax,ebx)
    UnitTypeClass.IsToHarvest.Get(ebx,al)
    pop  ebx
	test al,al
    jnz  0x004DBC65 ; harvester
    jmp  0x004DBC37
@ENDHACK


@HACK 0x004DBC37,0x004DBC65,_HouseClass__AI_Unit_Set_Weight
    mov  eax,dword[ebp-0x1F]
    shr  eax,0x18
    ; HouseClass us ebp-0x20
    push ebx 
    push edx 
    push edi
    mov  edx,dword[ebp-0x20]
    lea  edx,[edx+eax*4+HouseClass.Offset.NewUQuantity] ; House->NewIQuantity[unit]
.CheckLimit:
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.AIBuildLimit.Get(edi,ebx)
    cmp  ebx,0 ; 0 or negative values = no limit
    jle  .Set
    cmp  ebx,dword[edx]
    jle  .Clear
.Set:
    UnitTypeClass.AIBuildWeight.Get(edi,ebx)
    mov  dword[ebp+eax*4 -1276],ebx
    jmp  .Done
.Clear:
    mov  dword[ebp+eax*4 -1276],0
.Done:
    pop  edi
    pop  edx
    pop  ebx
    jmp  0x004DBC72    
@ENDHACK

