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

@LJMP 0x0041F36D,_AircraftClass__Mission_Move_LandingBuilding_Unhardcode
@LJMP 0x0041FBDF,_AircraftClass__Enter_Idle_Mode_LandingBuilding_Unhardcode
@LJMP 0x0041FE9E,_AircraftClass__Enter_Idle_Mode_LandingBuilding_Unhardcode2
@LJMP 0x00422CD0,_AircraftClass__Mission_Guard_Helipad_Unhardcode
@LJMP 0x00454CE3,_BuildingClass__Receive_Message_RadioDocking_Unhardcode1
@LJMP 0x00454E1C,_BuildingClass__Receive_Message_RadioDocking_Unhardcode2
@LJMP 0x00454F6A,_BuildingClass__Receive_Message_RadioDocking_Refinery_Unhardcode3
@LJMP 0x00454A6E,_BuildingClass__Receive_Message_RadioCanLoad_Unhardcode
@LJMP 0x0045505D,_BuildingClass__Receive_Message_RadioAreRefinery_Refinery__Unhardcode
@LJMP 0x00454BFC,_BuildingClass__Receive_Message_RadioImIn_Unhardcode
@LJMP 0x0045517F,_BuildingClass__Receive_Message_RadioUnloaded_RunAway_Unhardcode


@LJMP 0x00459F68,_BuildingClass__Grand_Opening_Helipad_Unhardcode
@LJMP 0x0045B84A,_BuildingClass__Sort_Y_Refinery_Unhardcode
@LJMP 0x0045BB59,_BuildingClass__Can_Demolish_Refinery_Unhardcode
@LJMP 0x004B6817,_DriveClass__Assign_Destination_Refinery_Unhardcode

@LJMP 0x00569039,_TechnoClass__Find_Docking_Bay_UseInitBuilding
@LJMP 0x00569075,_TechnoClass__Find_Docking_Bay_RecalcBestValue

@LJMP 0x0057B33E,_UnitClass__Take_Damage_Refinery_Unhardcode
@LJMP 0x0057E656,_UnitClass__Mission_Harvest_Refinery_Unhardcode1
@LJMP 0x0057E6F1,_UnitClass__Mission_Harvest_Refinery_Unhardcode2

[section .data] 
Temp.FindDockingBayInitBuilding dd 0


[section .text] 
_AircraftClass__Mission_Move_LandingBuilding_Unhardcode:
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


_AircraftClass__Enter_Idle_Mode_LandingBuilding_Unhardcode:
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


_AircraftClass__Enter_Idle_Mode_LandingBuilding_Unhardcode2:
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


_AircraftClass__Mission_Guard_Helipad_Unhardcode:
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


_BuildingClass__Receive_Message_RadioDocking_Unhardcode1:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al) ; Refinery
    test al,al
    jnz  .Refinery
    BuildingTypeClass.IsRepairPad.Get(edi,al) ; RepairPad
    test al,al
    jz   .Normal
.RepairPad:
    pop  edi
    jmp  0x00454D33
.Refinery:
    pop  edi
    jmp  0x00454CEB
.Normal:
    pop  edi
    jmp  0x00454DB3


_BuildingClass__Receive_Message_RadioDocking_Unhardcode2:
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


_BuildingClass__Receive_Message_RadioDocking_Refinery_Unhardcode3:
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


_BuildingClass__Receive_Message_RadioCanLoad_Unhardcode:
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
    jz   .Normal
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


_BuildingClass__Receive_Message_RadioAreRefinery_Refinery__Unhardcode:
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



_BuildingClass__Receive_Message_RadioImIn_Unhardcode:
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
    jz   .Normal
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


_BuildingClass__Receive_Message_RadioUnloaded_RunAway_Unhardcode:
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


_BuildingClass__Grand_Opening_Helipad_Unhardcode:
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


_BuildingClass__Sort_Y_Refinery_Unhardcode:
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


_BuildingClass__Can_Demolish_Refinery_Unhardcode:
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


_DriveClass__Assign_Destination_Refinery_Unhardcode:
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


_TechnoClass__Find_Docking_Bay_UseInitBuilding:
    mov  edx,dword[Temp.FindDockingBayInitBuilding]
    mov  dword[ebp-0x1C],edx
    mov  edx,dword[ebp-0x13]
    jmp  0x0056903F


_TechnoClass__Find_Docking_Bay_RecalcBestValue:
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


_UnitClass__Take_Damage_Refinery_Unhardcode:
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


_UnitClass__Mission_Harvest_Refinery_Unhardcode1:
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


_UnitClass__Mission_Harvest_Refinery_Unhardcode2:
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

