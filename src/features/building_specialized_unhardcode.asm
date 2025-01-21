;----------------------------------------------------------------
; src/features/building_specialized_unhardcode.asm
;
; Unhardcode various building-specific logic by linking it to ini keys
; This allows other builds to adopt their logic. For example, the Silo draw logic (5 frames for ore fill states)
;
; This function is enabled by adding any of the following to the building type:
;   [<BuildingType>] > IsSilo=yes 
;   [<BuildingType>] > IsRefinery=yes 
;   [<BuildingType>] > IsHelipad=yes 
;   [<BuildingType>] > IsAirfield=yes 
;   [<BuildingType>] > IsRepairPad=yes 
; Use more than one logic for a single building at your own risk!
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

@HOOK 0x0041F36D _AircraftClass__Mission_Move_LandingBuilding_Unhardcode
@HOOK 0x0041FBDF _AircraftClass__Enter_Idle_Mode_LandingBuilding_Unhardcode
@HOOK 0x0041FE9E _AircraftClass__Enter_Idle_Mode_LandingBuilding_Unhardcode2
@HOOK 0x0042054A _AircraftClass__What_Action_RepairPad_Unhardcode
@HOOK 0x00422C24 _AircraftClass__Mission_Guard_RepairPad_Unhardcode
@HOOK 0x00422CD0 _AircraftClass__Mission_Guard_Helipad_Unhardcode
@HOOK 0x00453CD3 _BuildingClass__Raw_Cost_FreeUnit_Override

@HOOK 0x00454CE3 _BuildingClass__Receive_Message_RadioDocking_Unhardcode1
@HOOK 0x00454E1C _BuildingClass__Receive_Message_RadioDocking_Unhardcode2
@HOOK 0x00454F6A _BuildingClass__Receive_Message_RadioDocking_Refinery_Unhardcode3
@HOOK 0x00454A6E _BuildingClass__Receive_Message_RadioCanLoad_Unhardcode
@HOOK 0x00454B89 _BuildingClass__Receive_Message_RadioCanLoad_Harvester_Unhardcode
@HOOK 0x0045505D _BuildingClass__Receive_Message_RadioAreRefinery_Refinery__Unhardcode
@HOOK 0x00454BFC _BuildingClass__Receive_Message_RadioImIn_Unhardcode
@HOOK 0x00455111 _BuildingClass__Receive_Message_RadioUnloaded_RepairPad_Unhardcode
@HOOK 0x0045517F _BuildingClass__Receive_Message_RadioUnloaded_RunAway_Unhardcode
@HOOK 0x004558FF _BuildingClass__Shape_Number_Silo_Unhardcode
@HOOK 0x00458DCD _BuildingClass__Exit_Object_InfantryUnit_Unhardcode
@HOOK 0x00458C8F _BuildingClass__Exit_Object_Vessel_Unhardcode
@HOOK 0x00459CD0 _BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit
@HOOK 0x00459DF2 _BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit2
@HOOK 0x00459EFC _BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit3
@HOOK 0x00459F68 _BuildingClass__Grand_Opening_Helipad_Unhardcode
@HOOK 0x0045A507 _BuildingClass__What_Action_Kennel_Unhardcode
@HOOK 0x0045A574 _BuildingClass__What_Action_Kennel_Unhardcode2
@HOOK 0x0045A61D _BuildingClass__What_Action_Kennel_Unhardcode3

@HOOK 0x0045B7D4 _BuildingClass__Sort_Y_RepairPad_Unhardcode
@HOOK 0x0045B84A _BuildingClass__Sort_Y_Refinery_Unhardcode
@HOOK 0x0045BB59 _BuildingClass__Can_Demolish_Refinery_Unhardcode
@HOOK 0x0045BD3B _BuildingClass__Mission_Guard_RepairPad_Unhardcode
@HOOK 0x0045BFBB _BuildingClass__Mission_Deconstruction_SellUnit_Unhardcode
@HOOK 0x0045C0BA _BuildingClass__Mission_Deconstruction_DetachShips_Unhardcode
@HOOK 0x004B6817 _DriveClass__Assign_Destination_Refinery_Unhardcode
@HOOK 0x004C2CBE _FootClass__Receive_Message_RadioOnDepot_Unhardcode
@HOOK 0x004C3383 _FootClass__Can_Demolish_RepairPad_Unhardcode
@HOOK 0x004D5F67 _HouseClass__Silo_Redraw_Check_Unhardcode
@HOOK 0x0051EBBA _ObjectTypeClass__Who_Can_Build_Me_Helipad_Unhardcode
@HOOK 0x0051EBF2 _ObjectTypeClass__Who_Can_Build_Me_Airfield_Unhardcode
@HOOK 0x0055C552 _TeamClass__AI_RepairPad_Unhardcode
@HOOK 0x00569039 _TechnoClass__Find_Docking_Bay_UseInitBuilding
@HOOK 0x00569075 _TechnoClass__Find_Docking_Bay_RecalcBestValue
@HOOK 0x00578CB5 _UnitTypeClass__Max_Pips_Harvester_Unhardcode
@HOOK 0x0057B2F6 _UnitClass__Take_Damage_Harvester_Unhardcode
@HOOK 0x0057B3B4 _UnitClass__Take_Damage_Harvester_Unhardcode2
@HOOK 0x0057BFAF _UnitClass__Per_Cell_Process_Harvester_Unhardcode
@HOOK 0x0057B33E _UnitClass__Take_Damage_Refinery_Unhardcode
@HOOK 0x0057E656 _UnitClass__Mission_Harvest_Refinery_Unhardcode1
@HOOK 0x0057E6F1 _UnitClass__Mission_Harvest_Refinery_Unhardcode2
@HOOK 0x0057EE77 _UnitClass__Can_Enter_Cell_RepairPad_Unhardcode
@HOOK 0x0057F869 _UnitClass__What_Action_RepairPad_Unhardcode
@HOOK 0x00580136 _UnitClass__PipCount_Harvester_Unhardcode
@HOOK 0x005802FD _UnitClass__Mission_Repair_Refinery_Unhardcode
@HOOK 0x005808A4 _UnitClass__TiberiumLoad_Unhardcode
@HOOK 0x00580C8E _UnitClass__Assign_Destination_RepairPad_Unhardcode1
@HOOK 0x00580CF4 _UnitClass__Assign_Destination_RepairPad_Unhardcode2
@HOOK 0x00580D33 _UnitClass__Assign_Destination_RepairPad_Unhardcode3

Temp.FindDockingBayInitBuilding dd 0
Temp.FreeUnit db 0

_TechnoClass__Find_Docking_Bay_UseInitBuilding:
    mov  edx,dword[Temp.FindDockingBayInitBuilding]
    mov  dword[ebp-0x1c],edx
    mov  edx,dword[ebp-0x13]
    jmp  0x0056903F

_TechnoClass__Find_Docking_Bay_RecalcBestValue:
; edi originally -1
    xor  edx,edx
    cmp  dword[ebp-0x1c],0
    je   .Done
    push esi
    push eax
    push edx
    mov  eax,dword[ebp-0x1c]
    mov  edx,dword[eax+0x11]
    call dword[edx+0x10] ; Coord (Building)
    mov  edx,eax
    mov  eax,ecx
    ;mov  esi,dword[ebp-0x1c]
    call dword[esi+0xC] 
    ;mov  esi,dword[ebp-0x1c]
    call Coord___Distance_As_Coord
    mov  edi,eax
    pop  edx 
    pop  eax 
    pop  esi 
.Done:
    mov  dword[ebp-0x14],edi
    jmp  0x0056907A


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


_AircraftClass__What_Action_RepairPad_Unhardcode:
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


_AircraftClass__Mission_Guard_RepairPad_Unhardcode:
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


_BuildingClass__Raw_Cost_FreeUnit_Override:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FreeUnit.Get(edi,al)
    test al,al
    movzx eax,al
    pop  edi
.HasFreeUnit:
    jnz  0x00453CDD
.NotFreeUnit:
    jmp  0x00453CE8


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


_BuildingClass__Receive_Message_RadioCanLoad_Harvester_Unhardcode:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x00454B91
.NotAHarvester:
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


_BuildingClass__Receive_Message_RadioUnloaded_RepairPad_Unhardcode:
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


_BuildingClass__Shape_Number_Silo_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsSilo.Get(edi,al)
    test al,al
    pop  edi
.Silo:
    jnz  0x0045590B
.NotASilo:
    jmp  0x004559DC


_BuildingClass__Exit_Object_InfantryUnit_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsRefinery.Get(edi,al) ; Refinery
    test al,al
    jnz  .Refinery
    BuildingTypeClass.FactoryType.Get(edi,al) ; Barracks / War Factory
    cmp  al,RTTIType.InfantryType
    je   .Barracks
    cmp  al,RTTIType.UnitType
    jne  .Normal
.WarFactory:
    pop  edi
    jmp  0x00458EC7
.Refinery:
    pop  edi
    jmp  0x00458DEC
.Barracks:
    pop  edi
    jmp  0x004590B8
.Normal:
    pop  edi
    jmp  0x004592BC


_BuildingClass__Exit_Object_Vessel_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FactoryType.Get(edi,al) 
    cmp  al,RTTIType.VesselType
    jne  .Normal
.Shipyard:
    pop  edi
    jmp  0x00458C9F
.Normal:
    pop  edi
    jmp  0x00459582


_BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FreeUnit.Get(edi,al)
    test al,al
    mov  byte[Temp.FreeUnit],al
    pop  edi
.HasFreeUnit:
    jnz  0x00459CDC
.NotFreeUnit:
    jmp  0x00459F34


_BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit2:
    mov  dl,byte[Temp.FreeUnit]
    movzx edx,dl
    jmp  0x00459DF7


_BuildingClass__Grand_Opening_Refinery_Unhardcode_FreeUnit3:
    mov  al,byte[Temp.FreeUnit]
    movzx eax,al
    jmp  0x00459F01


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


_BuildingClass__What_Action_Kennel_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsKennel.Get(edi,al)
    test al,al
    pop  edi
.Kennel:
    jnz  0x0045A513
.NotAKennel:
    jmp  0x0045A585


_BuildingClass__What_Action_Kennel_Unhardcode2:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsKennel.Get(edi,al)
    test al,al
    pop  edi
.Kennel:
    jnz  0x0045A57C
.NotAKennel:
    jmp  0x0045A519


_BuildingClass__What_Action_Kennel_Unhardcode3:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsKennel.Get(edi,al)
    test al,al
    pop  edi
.Kennel:
    jnz  0x0045A58B
.NotAKennel:
    jmp  0x0045A629


_BuildingClass__Sort_Y_RepairPad_Unhardcode:
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


_BuildingClass__Mission_Guard_RepairPad_Unhardcode:
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


_BuildingClass__Mission_Deconstruction_SellUnit_Unhardcode:
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


_BuildingClass__Mission_Deconstruction_DetachShips_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.FactoryType.Get(edi,al) 
    cmp  al,RTTIType.VesselType
    jne  .Normal
.Shipyard:
    pop  edi
    jmp  0x0045C0F5
.Normal:
    pop  edi
    jmp  0x0045C176


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


_FootClass__Receive_Message_RadioOnDepot_Unhardcode:
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


_FootClass__Can_Demolish_RepairPad_Unhardcode:
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


_HouseClass__Silo_Redraw_Check_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsSilo.Get(edi,al)
    test al,al
    pop  edi
.Silo:
    jnz  0x004D5F6F
.NotASilo:
    jmp  0x004D5F7F


; Avoid NCO bug (allies_NCO_helipad_bug.asm)
_ObjectTypeClass__Who_Can_Build_Me_Helipad_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsHelipad.Get(edi,al)
    test al,al
    pop  edi
.Helipad:
    jnz  0x0051EBC2
.NotAHelipad:
    jmp  0x0051EBCB


_ObjectTypeClass__Who_Can_Build_Me_Airfield_Unhardcode:
    movzx eax,al
    push edi
    BuildingTypeClass.FromIndex(eax,edi)
    BuildingTypeClass.IsAirfield.Get(edi,al)
    test al,al
    pop  edi
.Airfield:
    jnz  0x0051EBFE
.NotAnAirfield:
    jmp  0x0051EB02


_TeamClass__AI_RepairPad_Unhardcode:
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


_UnitClass__Per_Cell_Process_Harvester_Unhardcode:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x0057BFBB
.NotAHarvester:
    jmp  0x0057C038


_UnitClass__Can_Enter_Cell_RepairPad_Unhardcode:
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


_UnitClass__Take_Damage_Harvester_Unhardcode:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x0057B302
.NotAHarvester:
    jmp  0x0057B386


_UnitClass__Take_Damage_Harvester_Unhardcode2:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x0057B3BC
.NotAHarvester:
    jmp  0x0057B3FB


_UnitTypeClass__Max_Pips_Harvester_Unhardcode:
    movzx edx,dl
    push edx
    push eax
    push edi
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.IsToHarvest.Get(edi,dl)
    test dl,dl
    pop  edi
    pop  eax
    pop  edx
    jz   .NotAHarvester
.Harvester:
    mov  eax,7 ; 7 pips
    jmp  0x00578CD5
.NotAHarvester:
    jmp  0x00578CBE


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


_UnitClass__Mission_Repair_Refinery_Unhardcode:
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


_UnitClass__What_Action_RepairPad_Unhardcode:
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


_UnitClass__PipCount_Harvester_Unhardcode:
    movzx eax,al
    push edi
    UnitTypeClass.FromIndex(eax,edi)
    UnitTypeClass.IsToHarvest.Get(edi,al)
    test al,al
    pop  edi
.Harvester:
    jnz  0x0058013E
.NotAHarvester:
    jmp  0x00580165


_UnitClass__TiberiumLoad_Unhardcode:
    movzx edx,dl
    push eax
    push edi
    UnitTypeClass.FromIndex(edx,edi)
    UnitTypeClass.IsToHarvest.Get(edi,dl)
    test dl,dl
    pop  edi
    pop  eax
.Harvester:
    jnz  0x005808AC
.NotAHarvester:
    jmp  0x005808C2


_UnitClass__Assign_Destination_RepairPad_Unhardcode1:
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


_UnitClass__Assign_Destination_RepairPad_Unhardcode2:
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


_UnitClass__Assign_Destination_RepairPad_Unhardcode3:
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


