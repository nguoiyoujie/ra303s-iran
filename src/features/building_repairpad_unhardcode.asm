;----------------------------------------------------------------
; src/features/building_repairpad_unhardcode.asm
;
; Customizable repair pad function for buildings.
;
; This function is enabled by setting [BuildingType] > IsRepairPad=yes
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@HACK 0x0042054A,0x00420553,_AircraftClass__What_Action_RepairPad_Unhardcode
    push edi
    push eax
    mov  al,byte[edx+0x1A4]
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  eax
    pop  edi
.RepairPad:
    jnz  0x00420553
.NotARepairPad:
    jmp  0x00420578
@ENDHACK


@HACK 0x00422C24,0x00422C2C,_AircraftClass__Mission_Guard_RepairPad_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x00422C9E
.NotARepairPad:
; try to find a repair pad
    push edi
    xor  edi,edi
    mov  dword[Temp.FindDockingBayInitBuilding],0   
.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsRepairPad.Get(edx,al)
    test al,al
    jz   .Next
    mov  edx,edi
    mov  ebx,1
    mov  ecx,dword[esi+0x11]
    mov  eax,esi
    call [ecx+0x168] ; Find_Docking_Bay
    test eax,eax
    jz   .Next
.Found:
    mov  dword[Temp.FindDockingBayInitBuilding],eax   
.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done: 
    mov  eax,dword[Temp.FindDockingBayInitBuilding]   
    pop  edi
    test eax,eax
    mov  dword[Temp.FindDockingBayInitBuilding],0   
    jz   0x00422C9E  
    jmp  0x00422C45
@ENDHACK


@HACK 0x00455111,0x00455119,_BuildingClass__Receive_Message_RadioUnloaded_RepairPad_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x00455119
.NotARepairPad:
    jmp  0x00455147
@ENDHACK


@HACK 0x0045B7D4,0x0045B7DC,_BuildingClass__Sort_Y_RepairPad_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x0045B7DC
.NotARepairPad:
    jmp  0x0045B7E4
@ENDHACK


@HACK 0x0045BD3B,0x0045BD43,_BuildingClass__Mission_Guard_RepairPad_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x0045BD43
.NotARepairPad:
    jmp  0x0045BD5C
@ENDHACK


@HACK 0x0045BFBB,0x0045BFF7,_BuildingClass__Mission_Deconstruction_SellUnit_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    jnz  .CanDemolish
    BuildingTypeClass.IsAirfield.Get(edi,al)
    test al,al
    jz   .Normal
.CanDemolish:
    pop  edi
    jmp  0x0045BFF7
.Normal:
    pop  edi
    jmp  0x0045C095
@ENDHACK

    
@HACK 0x004C2CBE,0x004C2CC6,_FootClass__Receive_Message_RadioOnDepot_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x004C2CC6
.NotARepairPad:
    jmp  0x004C2CE3
@ENDHACK


@HACK 0x004C3383,0x004C338B,_FootClass__Can_Demolish_RepairPad_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x004C338B
.NotARepairPad:
    jmp  0x004C33B5
@ENDHACK


@HACK 0x0055C552,0x0055C55A,_TeamClass__AI_RepairPad_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x0055C55A
.NotARepairPad:
    jmp  0x0055C567
@ENDHACK


@HACK 0x0057EE77,0x0057EE7F,_UnitClass__Can_Enter_Cell_RepairPad_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x0057EE7F
.NotARepairPad:
    jmp  0x0057EE8C
@ENDHACK


@HACK 0x0057F869,0x0057F872,_UnitClass__What_Action_RepairPad_Unhardcode
    push eax
    mov  eax,[eax+0x1A4]
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
    pop  eax
.RepairPad:
    jnz  0x0057F872
.NotARepairPad:
    jmp  0x0057F8B3
@ENDHACK


@HACK 0x005802FD,0x0058031B,_UnitClass__Mission_Repair_Refinery_Unhardcode
    mov  esi,dword[eax+0x11]
    and  byte[ecx+0x141],0xFE
    push edi
    push eax
    xor  edi,edi
    mov  dword[Temp.FindDockingBayInitBuilding],0   
.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsRefinery.Get(edx,al)
    test al,al
    jz   .Next
    mov  edx,edi
    pop  eax
    push eax
    mov  ebx,1
    mov  ecx,eax
    call [esi+0x168] ; Find_Docking_Bay
    test eax,eax
    jz   .Next
.Found:
    mov  dword[Temp.FindDockingBayInitBuilding],eax   
.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .Repeat
.Done:
    mov  eax,dword[Temp.FindDockingBayInitBuilding]   
    pop  edi
    pop  edi
    test eax,eax
    mov  dword[Temp.FindDockingBayInitBuilding],0   
    jz   0x0058031B  
    jmp  0x00580533
@ENDHACK


@HACK 0x00580C8E,0x00580C9A,_UnitClass__Assign_Destination_RepairPad_Unhardcode1
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x00580DC7
.NotARepairPad:
    jmp  0x00580C9A
@ENDHACK


@HACK 0x00580CF4,0x00580CFC,_UnitClass__Assign_Destination_RepairPad_Unhardcode2
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x00580CFC
.NotARepairPad:
    jmp  0x00580D05
@ENDHACK


@HACK 0x00580D33,0x00580D3F,_UnitClass__Assign_Destination_RepairPad_Unhardcode3
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al)
    test al,al
    pop  edi
.RepairPad:
    jnz  0x00580DC7
.NotARepairPad:
    jmp  0x00580D3F
@ENDHACK

