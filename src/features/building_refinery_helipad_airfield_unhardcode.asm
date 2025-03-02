;----------------------------------------------------------------
; src/features/building_refinery_helipad_airfield_unhardcode.asm
;
; Customizable refinery, helipad and airfield functions.
; This file also contains all uses of the docking logic that all 3 share (and Repair Pad)
;
; This function is enabled by adding any of the following to the building type:
;   [<BuildingType>] > IsHelipad=yes 
;   [<BuildingType>] > IsAirfield=yes 
;   [<BuildingType>] > IsRefinery=yes 
; Use more than one logic for a single building at your own risk!
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

cextern Globals___ScenarioInit
cextern Coord___Distance_As_Coord
cextern Globals___ScenarioInit
cextern CargoClass__Attached_Object
cextern CargoClass__Detach_Object
cextern InfantryClass.Count
cextern CellClass__Cell_Building
cextern Coord___Coord_Cell
cextern Target___As_Target


[section .data] 
Temp.FindDockingBayInitBuilding dd 0


@HACK 0x0041F36D,0x0041F37E,_AircraftClass__Mission_Move_LandingBuilding_Unhardcode
; eax is the AircraftType class
    mov  ebx,eax
    AircraftTypeClass.IsFixedWing.Get(ebx,dl)
    push edi
    push esi
    mov  esi,edi
    xor  edi,edi
    mov  dword[Temp.FindDockingBayInitBuilding],0  
    test dl,dl
    jz   .NotFixedWing.Repeat
.FixedWing.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsAirfield.Get(edx,al)
    test al,al
    jz   .FixedWing.Next
    mov  edx,edi
    xor  ebx,ebx
    mov  eax,ecx
    call [esi+0x168] ; Find_Docking_Bay
    test eax,eax
    jz   .FixedWing.Next
.FixedWing.Found:
    mov  dword[Temp.FindDockingBayInitBuilding],eax   
.FixedWing.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .FixedWing.Repeat
    jmp  .Done
.NotFixedWing.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsHelipad.Get(edx,al)
    test al,al
    jz   .NotFixedWing.Next
    mov  edx,edi
    xor  ebx,ebx
    mov  eax,ecx
    call [esi+0x168] ; Find_Docking_Bay
    test eax,eax
    jz   .NotFixedWing.Next
.NotFixedWing.Found:
    mov  dword[Temp.FindDockingBayInitBuilding],eax   
.NotFixedWing.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .NotFixedWing.Repeat
.Done: 
    mov  eax,dword[Temp.FindDockingBayInitBuilding]   
    pop  esi
    pop  edi
    mov  dword[Temp.FindDockingBayInitBuilding],0     
    jmp  0x0041F37E
@ENDHACK


@HACK 0x0041FBDF,0x0041FBF3,_AircraftClass__Enter_Idle_Mode_LandingBuilding_Unhardcode
    ; eax is the AircraftType class
    mov  ecx,esi
    mov  esi,dword[ebp-0x20]  
    mov  ebx,eax
    AircraftTypeClass.IsFixedWing.Get(ebx,dl)
    push edi
    xor  edi,edi
    mov  dword[Temp.FindDockingBayInitBuilding],0  
    test dl,dl
    jz   .NotFixedWing.Repeat
.FixedWing.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsAirfield.Get(edx,al)
    test al,al
    jz   .FixedWing.Next
    mov  edx,edi
    xor  ebx,ebx
    mov  eax,ecx
    call [esi+0x168] ; Find_Docking_Bay
    test eax,eax
    jz   .FixedWing.Next
.FixedWing.Found:
    mov  dword[Temp.FindDockingBayInitBuilding],eax   
.FixedWing.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .FixedWing.Repeat
    jmp  .Done
.NotFixedWing.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsHelipad.Get(edx,al)
    test al,al
    jz   .NotFixedWing.Next
    mov  edx,edi
    xor  ebx,ebx
    mov  eax,ecx
    call [esi+0x168] ; Find_Docking_Bay
    test eax,eax
    jz   .NotFixedWing.Next
.NotFixedWing.Found:
    mov  dword[Temp.FindDockingBayInitBuilding],eax   
.NotFixedWing.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .NotFixedWing.Repeat
.Done: 
    mov  eax,dword[Temp.FindDockingBayInitBuilding]   
    pop  edi
    mov  dword[Temp.FindDockingBayInitBuilding],0     
    mov  esi,dword[ebp-0x20]  
    jmp  0x0041FBF3
@ENDHACK


@HACK 0x0041FE9E,0x0041FEB1,_AircraftClass__Enter_Idle_Mode_LandingBuilding_Unhardcode2
; eax is the AircraftType class
    mov  edx,eax
    mov  ecx,esi
    mov  esi,edi
    mov  ebx,eax
    AircraftTypeClass.IsFixedWing.Get(ebx,dl)
    push edi
    xor  edi,edi
    mov  dword[Temp.FindDockingBayInitBuilding],0  
    test dl,dl
    jz   .NotFixedWing.Repeat
.FixedWing.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsAirfield.Get(edx,al)
    test al,al
    jz   .FixedWing.Next
    mov  edx,edi
    xor  ebx,ebx
    mov  eax,ecx
    call [esi+0x168] ; Find_Docking_Bay
    test eax,eax
    jz   .FixedWing.Next
.FixedWing.Found:
    mov  dword[Temp.FindDockingBayInitBuilding],eax   
.FixedWing.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .FixedWing.Repeat
    jmp  .Done
.NotFixedWing.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsHelipad.Get(edx,al)
    test al,al
    jz   .NotFixedWing.Next
    mov  edx,edi
    xor  ebx,ebx
    mov  eax,ecx
    call [esi+0x168] ; Find_Docking_Bay
    test eax,eax
    jz   .NotFixedWing.Next
.NotFixedWing.Found:
    mov  dword[Temp.FindDockingBayInitBuilding],eax   
.NotFixedWing.Next:
    inc  edi
    mov  eax,[BuildingTypeClass.Count]
    cmp  edi,eax
    jb   .NotFixedWing.Repeat
.Done: 
    mov  eax,dword[Temp.FindDockingBayInitBuilding]   
    pop  edi
    mov  dword[Temp.FindDockingBayInitBuilding],0     
    mov  esi,edi
    jmp  0x0041FEB1
@ENDHACK


@HACK 0x00422CD0,0x00422CE2,_AircraftClass__Mission_Guard_Helipad_Unhardcode
    push edi
    xor  edi,edi
    mov  dword[Temp.FindDockingBayInitBuilding],0   
.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsHelipad.Get(edx,al)
    test al,al
    jz   .Next
    mov  edx,edi
    xor  ebx,ebx
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
    mov  dword[Temp.FindDockingBayInitBuilding],0   
    jmp  0x00422CE2
@ENDHACK


@HACK 0x00454CE3,0x00454CEB,_BuildingClass__Receive_Message_RadioDocking_Unhardcode1
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al) ; Refinery
    test al,al
    jnz  .Refinery
    BuildingTypeClass.IsRepairPad.Get(edi,al) ; RepairPad
    test al,al
    jnz  .RepairPad
    TechnoTypeClass.MaxPassengers.Get(edi,eax) ; Passengers
    test eax,eax
    jnz  .Bunker
    jmp  .Normal
.Bunker:
    mov  ecx,eax
    mov  ebx,esi
    mov  eax,[ebx+RadioClass.Offset.Radio]
    mov  edx,dword[ebp-0xC]
    cmp  eax,edx
    mov  edi,[esi+0x11]
    je   .Bunker.Now
.Bunker.Standby:
    cmp  byte[ebx+CargoClass.Offset.Quantity],cl
    jae  .Bunker.RetNegative
    test eax,eax
    jnz  .Bunker.RetRoger
    mov  ecx,dword[ebp-0xC]
    mov  edx,2 ; RADIO_HELLO
    mov  eax,esi
    mov  ebx,0x00669928
    call [edi+0x158] ; Transmit_Message
.Bunker.Now:
    test byte[esi+TechnoClass.Offset.IsTethered],1<<(TechnoClass.Bit.IsTethered-1)
    jnz  .Bunker.RetRoger
    mov  ecx,[ebp-0xC]
    mov  edx,0x13 ; RADIO_NEED_TO_MOVE
    mov  eax,esi
    mov  ebx,0x00669928
    call [edi+0x158] ; Transmit_Message
    cmp  al,1 ; RADIO_ROGER
    jnz  .Bunker.RetRoger
    ; prep nearby cell as As_Target()
    mov  eax,esi
    mov  edx,[ebp-0xC]
    call [edi+0x16C] ; Find_Exit_Cell
    test ax,ax
    jz   .Bunker.Out
    movzx eax,ax
    call Target___As_Target
    mov  ebx,[ebp-0x1C]
    mov  [ebx],eax
    mov  ecx,[ebp-0xC]
    mov  edx,0x12 ; RADIO_MOVE_HERE
    mov  eax,esi
    call [edi+0x158] ; Transmit_Message
    cmp  al,0x14 ; RADIO_YEA_NOW_WHAT
    jnz  .Bunker.RetRoger
    mov  edx,0x18 ; RADIO_TETHER
    mov  eax,esi
    xor  ecx,ecx
    mov  ebx,0x00669928
    call [edi+0x158] ; Transmit_Message
    ; prep the building as As_Target()
    mov  byte al,[esi]
    movzx eax,al
    mov  edx,[esi+1]
    shl  eax,0x18
    and  edx,0xFFFFFF
    or   eax,edx
    mov  ebx,[ebp-0x1C]
    mov  [ebx],eax
    mov  ecx,[ebp-0xC]
    mov  edx,0x12 ; RADIO_MOVE_HERE
    mov  eax,esi
    call [edi+0x158] ; Transmit_Message
    cmp  al,1 ; RADIO_ROGER
    je   .Bunker.Unselect
.Bunker.Out:
    mov  edx,3 ; RADIO_OVER_OUT
    mov  ecx,[ebp-0xC]
    mov  eax,esi
    mov  ebx,0x00669928
    call [edi+0x158] ; Transmit_Message
    jmp  .Bunker.RetRoger
.Bunker.Unselect:
    mov  eax,[esi+RadioClass.Offset.Radio]
    mov  edi,[eax+0x11]
    call [edi+0xB4] ; Unselect
    jmp  .Bunker.RetRoger
.Bunker.RetNegative:
    pop  edi
    mov  dword eax,0x10
    jmp  0x00454D8D
.Bunker.RetRoger:
    pop  edi
    mov  dword eax,1
    jmp  0x00454D8D
.RepairPad:
    pop  edi
    jmp  0x00454D33
.Refinery:
    pop  edi
    jmp  0x00454CEB
.Normal:
    pop  edi
    jmp  0x00454DB3
@ENDHACK


@HACK 0x00454E1C,0x00454E39,_BuildingClass__Receive_Message_RadioDocking_Unhardcode2
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al) ; Refinery
    test al,al
    jnz  .Refinery
    BuildingTypeClass.IsAirfield.Get(edi,al) ; Airfield
    test al,al
    jnz  .Airfield
    BuildingTypeClass.IsHelipad.Get(edi,al) ; Helipad
    test al,al
    jnz  .Helipad    
    BuildingTypeClass.IsRepairPad.Get(edi,al) ; RepairPad
    test al,al
    jz   .Normal
.RepairPad:
    pop  edi
    jmp  0x00454E8D
.Refinery:
    pop  edi
    jmp  0x00454EBE 
.Airfield:
    pop  edi
    jmp  0x00454E39
.Helipad:
    pop  edi
    jmp  0x00454E64
.Normal:
    pop  edi
    jmp  0x00454F0F
@ENDHACK


@HACK 0x00454F6A,0x00454F72,_BuildingClass__Receive_Message_RadioDocking_Refinery_Unhardcode3
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al)
    test al,al
    pop  edi
.Refinery:
    jnz  0x00454F72
.NotARefinery:
    jmp  0x00454FA1
@ENDHACK


@HACK 0x00454A6E,0x00454A9A,_BuildingClass__Receive_Message_RadioCanLoad_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al) ; Refinery
    test al,al
    jnz  .Refinery
    mov  edx,dword[ebp-0xC]
    add  edx,0x146
    BuildingTypeClass.IsAirfield.Get(edi,al) ; Airfield
    test al,al
    jnz  .Airfield
    BuildingTypeClass.IsHelipad.Get(edi,al) ; Helipad
    test al,al
    jnz  .Helipad    
    BuildingTypeClass.IsRepairPad.Get(edi,al) ; RepairPad
    test al,al
    jnz  .RepairPad
    TechnoTypeClass.MaxPassengers.Get(edi,eax) ; Passengers
    test eax,eax
    jnz  .Bunker
    jmp  .Normal
.Bunker:
    cmp  byte[esi+CargoClass.Offset.Quantity],al
    jb   .Bunker.RetRoger
.Bunker.RetNegative:
    pop  edi
    mov  dword eax,0xA
    jmp  0x00454AD4
.Bunker.RetRoger:
    pop  edi
    mov  dword eax,1
    jmp  0x00454AD4
.RepairPad:
    pop  edi
    jmp  0x00454B1A
.Refinery:
    pop  edi
    jmp  0x00454B52
.Airfield:
    pop  edi
    jmp  0x00454A9A
.Helipad:
    pop  edi
    jmp  0x00454ADB
.Normal:
    pop  edi
    jmp  0x00454BBC
@ENDHACK


@HACK 0x0045505D,0x00455069,_BuildingClass__Receive_Message_RadioAreRefinery_Refinery__Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al)
    test al,al
    pop  edi
.Refinery:
    jnz  0x00455069
.NotARefinery:
    jmp  0x00454FA1
@ENDHACK


@HACK 0x00454BFC,0x00454C18,_BuildingClass__Receive_Message_RadioImIn_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al) ; Refinery
    test al,al
    jnz  .Refinery
    BuildingTypeClass.IsAirfield.Get(edi,al) ; Airfield
    test al,al
    jnz  .AirstripOrHelipad
    BuildingTypeClass.IsHelipad.Get(edi,al) ; Helipad
    test al,al
    jnz  .AirstripOrHelipad    
    BuildingTypeClass.IsRepairPad.Get(edi,al) ; RepairPad
    test al,al
    jnz  .RepairPad
    TechnoTypeClass.MaxPassengers.Get(edi,eax) ; Passengers
    test eax,eax
    jnz  .Bunker
    jmp  .Normal
.Bunker:
    pop  edi
    mov  dword eax,5 ; RADIO_ATTACH
    jmp  0x00454CAA
.RepairPad:
    pop  edi
    jmp  0x00454C18
.Refinery:
    pop  edi
    jmp  0x00454C81
.AirstripOrHelipad:
    pop  edi
    jmp  0x00454C54
.Normal:
    pop  edi
    jmp  0x00455221
@ENDHACK


@HACK 0x0045517F,0x004551EB,_BuildingClass__Receive_Message_RadioUnloaded_RunAway_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRepairPad.Get(edi,al) ; Repair Pad
    test al,al
    jnz  .RunAway
    BuildingTypeClass.IsAirfield.Get(edi,al) ; Airfield
    test al,al
    jnz  .RunAway
    BuildingTypeClass.FactoryType.Get(edi,al) ; War Factory
    cmp  al,RTTIType.UnitType
    jne  .Normal
.RunAway:
    pop  edi
    jmp  0x004551EB
.Normal:
    pop  edi
    jmp  0x0045513B
@ENDHACK


@HACK 0x00459F68,0x00459F74,_BuildingClass__Grand_Opening_Helipad_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsHelipad.Get(edi,al)
    test al,al
    pop  edi
.Helipad:
    jnz  0x00459F74
.NotAHelipad:
    jmp  0x0045A12D
@ENDHACK


@HACK 0x0045B84A,0x0045B852,_BuildingClass__Sort_Y_Refinery_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al)
    test al,al
    pop  edi
.Refinery:
    jnz  0x0045B852
.NotARefinery:
    jmp  0x0045B864 
@ENDHACK



@HACK 0x0045BB59,0x0045BB61,_BuildingClass__Can_Demolish_Refinery_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al)
    test al,al
    pop  edi
.Refinery:
    jnz  0x0045BB61
.NotARefinery:
    jmp  0x0045BB73
@ENDHACK


@HACK 0x004B6817,0x004B681F,_DriveClass__Assign_Destination_Refinery_Unhardcode
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al)
    test al,al
    pop  edi
.Refinery:
    jnz  0x004B681F
.NotARefinery:
    jmp  0x004B687E
@ENDHACK


@HACK 0x00569039,0x0056903F,_TechnoClass__Find_Docking_Bay_UseInitBuilding
    mov  edx,dword[Temp.FindDockingBayInitBuilding]
    mov  dword[ebp-0x1C],edx
    mov  edx,dword[ebp-0x13]
    jmp  0x0056903F
@ENDHACK


@HACK 0x00569075,0x0056907A,_TechnoClass__Find_Docking_Bay_RecalcBestValue
; edi originally -1
    xor  edx,edx
    cmp  dword[ebp-0x1C],0
    je   .Done
    push esi
    push eax
    push edx
    mov  eax,dword[ebp-0x1C]
    mov  edx,dword[eax+0x11]
    call dword[edx+0x10] ; Coord (Building)
    mov  edx,eax
    mov  eax,ecx
    mov  esi,dword[ecx+0x11]
    call dword[esi+0xC] 
    call Coord___Distance_As_Coord
    mov  edi,eax
    pop  edx 
    pop  eax 
    pop  esi 
.Done:
    mov  dword[ebp-0x14],edi
    jmp  0x0056907A
@ENDHACK


@HACK 0x0057B33E,0x0057B358,_UnitClass__Take_Damage_Refinery_Unhardcode
    push edi
    xor  edi,edi
    mov  dword[Temp.FindDockingBayInitBuilding],0   
.Repeat:
    mov  eax,edi
    BuildingTypeClass.FromIndex(eax,edx)
    BuildingTypeClass.IsRefinery.Get(edx,al)
    test al,al
    jz   .Next
    mov  ecx,dword[ebp-0x18]
    mov  edx,edi
    mov  ecx,dword[ecx+0x11]
    mov  eax,dword[ebp-0x18]
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
    jz   0x0057B386  
    jmp  0x0057B358
@ENDHACK


@HACK 0x0057E656,0x0057E668,_UnitClass__Mission_Harvest_Refinery_Unhardcode1
    mov  esi,dword[ecx+0x11]
    mov  eax,ecx
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
    xor  ebx,ebx
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
    mov  esi,eax
    jz   0x0057E6F1  
    jmp  0x0057E672
@ENDHACK


@HACK 0x0057E6F1,0x0057E71E,_UnitClass__Mission_Harvest_Refinery_Unhardcode2
    mov  esi,dword[ecx+0x11]
    mov  eax,ecx
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
    mov  eax,[Globals___ScenarioInit]
    inc  eax
    mov  [Globals___ScenarioInit],eax
    pop  eax
    push eax
    xor  ebx,ebx
    call [esi+0x168] ; Find_Docking_Bay
    mov  edx,[Globals___ScenarioInit]
    dec  edx
    mov  [Globals___ScenarioInit],edx
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
    jz   0x0057E4CF  
    jmp  0x0057E71E
@ENDHACK


@HACK 0x00453C2D,0x00453C32,_BuildingTypeClass__Max_Pips_Passenger
    cmp  dword[eax+TechnoTypeClass.Offset.MaxPassengers],0
    jg   .PassengerPip
    call 0x00453B6C ; BuildingTypeClass__Width
    jmp  0x00453C32
.PassengerPip:
    mov  eax,[eax+TechnoTypeClass.Offset.MaxPassengers]
    jmp  0x00453C69
@ENDHACK


@HACK 0x0045702B,0x00457034,_BuildingClass__Take_Damage_EjectPassengers_OnDestruction
    mov  ecx,eax
    push edx
    BuildingClass.Class.Get(ecx,edx)
    BuildingTypeClass.FromIndex(edx,eax)
    cmp  dword[eax+TechnoTypeClass.Offset.MaxPassengers],0
    pop  edx
    je   .Normal
    mov  ecx,[ebp-0x84]
    add  ecx,0x53
    push esi
    push edi
.Repeat:
    mov  eax,ecx
    call CargoClass__Attached_Object
    test eax,eax
    jz   .Done
    mov  edi,[ebp-0x84]
    mov  eax,ecx
    mov  dword edx,1
    call CargoClass__Detach_Object
    mov  esi,eax
    test eax,eax
    jz   .Repeat
    cmp  byte[eax],RTTIType.Infantry ; Check IsInfantry
    jne  .Delete
    inc  dword[Globals___ScenarioInit]
    mov  edx,[edi+AbstractClass.Offset.Coord]
    mov  edi,[esi+0x11]
    xor  ebx,ebx
    call [edi+0x64] ; Unlimbo
    dec  dword[Globals___ScenarioInit]
    test eax,eax
    jz   .Delete
.Eject:
    mov  eax,esi
    mov  edi,[esi+0x11]
    xor  edx,edx
    push ecx
    xor  ecx,ecx
    mov  ebx,1
    call [edi+0xC4] ; Scatter
    pop  ecx
    jmp  .Repeat
.Delete:
    mov  edx,2   
    mov  eax,esi
    mov  esi,[esi+0x11]
    call [esi]
    jmp  .Repeat
.Done:
    pop  edi
    pop  esi
    jmp  0x00457071

.Normal:
    mov  ecx,[ebp-0x84]
    add  ecx,0x53
    jmp  0x00457034
@ENDHACK


@HACK 0x0045C42D,0x0045C438,_BuildingClass__Mission_Deconstruction_EjectPassengers_OnSell
    push edx
    BuildingClass.Class.Get(esi,edx)
    BuildingTypeClass.FromIndex(edx,eax)
    cmp  dword[eax+TechnoTypeClass.Offset.MaxPassengers],0
    pop  edx
    je   .Normal
    mov  ecx,esi
    add  ecx,0x53
    push esi
    push edi
.Repeat:
    mov  eax,ecx
    call CargoClass__Attached_Object
    test eax,eax
    jz   .Done
    mov  edi,[ebp-0x10]
    mov  eax,ecx
    mov  dword edx,1
    call CargoClass__Detach_Object
    mov  esi,eax
    test eax,eax
    jz   .Repeat
    cmp  byte[eax],RTTIType.Infantry ; Check IsInfantry
    jne  .Delete
    inc  dword[Globals___ScenarioInit]
    mov  edx,[edi+AbstractClass.Offset.Coord]
    mov  edi,[esi+0x11]
    xor  ebx,ebx
    call [edi+0x64] ; Unlimbo
    dec  dword[Globals___ScenarioInit]
    test eax,eax
    jz   .Delete
.Eject:
    mov  eax,esi
    mov  edi,[esi+0x11]
    xor  edx,edx
    push ecx
    xor  ecx,ecx
    mov  ebx,1
    call [edi+0xC4] ; Scatter
    pop  ecx
    jmp  .Repeat
.Delete:
    mov  edx,2   
    mov  eax,esi
    mov  esi,[esi+0x11]
    call [esi]
    jmp  .Repeat
.Done:
    pop  edi
    pop  esi
.Normal:
    mov eax,esi
    xor edx,edx
    mov dword[esi+0x2A],2
    jmp 0x0045C438
@ENDHACK


@HACK 0x0045A636,0x0045A63B,_BuildingClass__What_Action_Passengers_Deploy
    ; ecx is techno
    push edx
    BuildingClass.Class.Get(ecx,edx)
    BuildingTypeClass.FromIndex(edx,eax)
    cmp  dword[eax+TechnoTypeClass.Offset.MaxPassengers],0
    pop  edx
    je   .Normal
    cmp  byte[ecx+CargoClass.Offset.Quantity],0
    je   .NoDeploy
.Deploy:
    mov  byte[ebp-0x18],4 ; ACTION_SELF
    jmp  0x0045A63B
.NoDeploy:
    mov  byte[ebp-0x18],0x1D ; ACTION_NO_DEPLOY
    jmp  0x0045A63B
.Normal:
    xor  ah,ah ; ACTION_NONE
    mov  byte[ebp-0x18],ah
    jmp  0x0045A63B
@ENDHACK


@HACK 0x0045876E,0x00458773,_BuildingClass__Active_Click_With_Passengers_Deploy
    ; dl is action 
    ; ecx is techno
    cmp  dl,5 ; ACTION_ATTACK
    je   0x00458773
    cmp  dl,4 ; ACTION_SELF
    jne  0x004587B0
    test ebx,ebx
    jz   0x004587B0
    mov  dword edx,0xF
    mov  edi,[eax+0x11]
    xor  ecx,ecx
    xor  ebx,ebx
    mov  eax,esi
    call [edi+0x1A8] ; Player_Assign_Mission
    jmp  0x004587B0
@ENDHACK


@HACK 0x0045DFC6,0x0045DFCC,_BuildingClass__Mission_Unload_EjectPassengers_OnRequest
    mov  esi,eax
    BuildingClass.Class.Get(esi,edx)
    BuildingTypeClass.FromIndex(edx,ebx)
    cmp  dword[ebx+TechnoTypeClass.Offset.MaxPassengers],0
    je   .Normal
    mov  ecx,esi
    add  ecx,0x53
    push esi
    push edi
.Repeat:
    mov  eax,ecx
    call CargoClass__Attached_Object
    test eax,eax
    jz   .Done
    mov  edi,[ebp-0x20]
    mov  eax,ecx
    mov  dword edx,1
    call CargoClass__Detach_Object
    mov  esi,eax
    test eax,eax
    jz   .Repeat
    cmp  byte[eax],RTTIType.Infantry ; Check IsInfantry
    jne  .Delete
    inc  dword[Globals___ScenarioInit]
    push ebx
    mov  edx,[ebx+BuildingTypeClass.Offset.ExitCoordX]
    add  edx,[edi+AbstractClass.Offset.Coord]
    mov  edi,[esi+0x11]
    xor  ebx,ebx
    call [edi+0x64] ; Unlimbo
    pop  ebx
    dec  dword[Globals___ScenarioInit]
    test eax,eax
    jz   .Delete
.Eject:
    mov  eax,esi
    mov  edi,[esi+0x11]
    xor  edx,edx
    push ecx
    push ebx
    xor  ecx,ecx
    mov  ebx,1
    call [edi+0xC4] ; Scatter
    pop  ebx
    pop  ecx
    jmp  .Repeat
.Delete:
    mov  edx,2   
    mov  eax,esi
    mov  esi,[esi+0x11]
    call [esi]
    jmp  .Repeat
.Done:
    mov  eax,[ebp-0x20]
    mov  ecx,[eax+0x11]
    xor  edx,edx
    mov  byte [eax+MissionClass.Offset.Mission],MissionType.MISSION_GUARD
    call [ecx+0x1FC] ; Enter_Idle_Mode
    pop  edi
    pop  esi
.Normal:
    mov  eax,[ebp-0x20]
    mov  edx,[eax+0xCD]
    jmp  0x0045DFCC
@ENDHACK


@HACK 0x0045BB92,0x0045BB9B,_BuildingClass__Mission_Guard_AI_AutoGarrison
    ; eax/esi = building techno
    push eax
    cmp  dword[esi+RadioClass.Offset.Radio],0
    jne  .Normal
    TechnoClass.House.Get(esi,ebx)
    HouseClass.FromIndex(ebx,ecx)
    HouseClass.IsHuman.Get(ecx,al)
    test al,al
    jnz  .Normal
    BuildingClass.Class.Get(esi,edx)
    BuildingTypeClass.FromIndex(edx,eax)
    mov  ecx,dword[eax+TechnoTypeClass.Offset.MaxPassengers]
    test ecx,ecx
    je   .Normal
    mov  byte dl,[esi+CargoClass.Offset.Quantity]
    sub  cl,dl ; cl is the number of passengers pending
    jz   .Normal ; full
    xor  edi,edi
.Repeat:
    InfantryClass.FromIndex(edi,edx)
    test edx,edx
    jz   .Next
    test byte[edx+AbstractClass.Offset.IsActive],1<<(AbstractClass.Bit.IsActive-1)
    jz   .Next
    test byte[edx+ObjectClass.Offset.IsInLimbo],1<<(ObjectClass.Bit.IsInLimbo-1)
    jnz   .Next
    cmp  word[edx+ObjectClass.Offset.Strength],0
    je   .Next
    cmp  byte[edx+TechnoClass.Offset.House],bl
    jne  .Next
    cmp  dword[edx+TechnoClass.Offset.TarCom],0
    jnz  .Next
    cmp  dword[edx+FootClass.Offset.NavCom],0
    jnz  .Next
    push edx
    mov  ebx,edx
    mov  edx,[ebx+0x11]
    mov  eax,ebx
    call [edx+0x10]
    mov  ebx,[esi+0x11]
    mov  edx,eax
    mov  eax,esi
    call [ebx+0xC]
    call Coord___Distance_As_Coord
    cmp  eax,0x700
    pop  edx
    jge  .Next
    mov  byte ah,[edx+MissionClass.Offset.Mission]
    cmp  ah,MissionType.MISSION_GUARD
    jz   .Found
    cmp  ah,MissionType.MISSION_GUARD_AREA
    jnz  .Next
.Found:
    mov  byte al,[esi]
    movzx eax,al
    mov  ebx,[esi+1]
    shl  eax,0x18
    and  ebx,0xFFFFFF
    or   eax,ebx
    mov  [edx+TechnoClass.Offset.ArchiveTarget],eax
    mov  ebx,[edx+0x11]
    mov  eax,edx
    mov  edx,MissionType.MISSION_ENTER
    call [ebx+0xFC] ; Assign_Mission
    ; Assign mission
    dec  cl
    jz   .Normal
.Next:
    inc  edi
    cmp  edi,[InfantryClass.Count]
    jl   .Repeat

.Normal:
    pop  eax
    mov  edx,[eax+0x11]
    call [edx+0x180]
    jmp  0x0045BB9B
@ENDHACK


@HACK 0x004ECB36,0x004ECB3E,_InfantryClass__Per_Cell_Process_Enter_Building_AnyCell
    mov  byte al,[edi+AbstractClass.Offset.RTTI]
    cmp  al,RTTIType.Building
    jne  .Normal
    mov  eax,esi
    call CellClass__Cell_Building
    cmp  eax,edi
    jne  0x004ECB98
    jmp  0x004ECB43
.Normal:
    mov  eax,[edi+AbstractClass.Offset.Coord]
    call Coord___Coord_Cell
    jmp  0x004ECB3E
@ENDHACK
