;----------------------------------------------------------------
; src/features/unit_opentopped.asm
;
; A techno with passengers may be defined to be 'open-topped'. That is: Its passengers can fire from within the transport.
; 
; This function is enabled by setting OpenTopped= for the transport in question.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

cextern CargoClass__Attached_Object

[section .data]
Temp.LimboFire db 0

@HACK 0x00564418,0x0056441D,_TechnoClass__AI_CheckPassengersFire
    call 0x004B5C40 ; DoorClass::AI
    AbstractClass.RTTI.Get(ecx,dl)
    cmp  dl,RTTIType.Infantry
    je   .CheckInfantry  
    cmp  dl,RTTIType.Unit
    je   .CheckUnit
    cmp  dl,RTTIType.Vessel
    je   .CheckVessel  
    cmp  dl,RTTIType.Aircraft
    je   .CheckAircraft  
    cmp  dl,RTTIType.Building
    je   .CheckBuilding      
    jmp  .Ret

.CheckInfantry:
    InfantryClass.Class.Get(ecx,eax)
    InfantryTypeClass.FromIndex(eax,edx)
    test byte[edx+InfantryTypeClass.Offset.IsOpenTopped],1<<(InfantryTypeClass.Bit.IsOpenTopped-1)
    jz   .Ret
    jmp  .Proceed

.CheckUnit:
    UnitClass.Class.Get(ecx,eax)
    UnitTypeClass.FromIndex(eax,edx)
    test byte[edx+UnitTypeClass.Offset.IsOpenTopped],1<<(UnitTypeClass.Bit.IsOpenTopped-1)
    jz   .Ret
    jmp  .Proceed

.CheckVessel:
    VesselClass.Class.Get(ecx,eax)
    VesselTypeClass.FromIndex(eax,edx)
    test byte[edx+VesselTypeClass.Offset.IsOpenTopped],1<<(VesselTypeClass.Bit.IsOpenTopped-1)
    jz   .Ret
    jmp  .Proceed

.CheckAircraft:
    AircraftClass.Class.Get(ecx,eax)
    AircraftTypeClass.FromIndex(eax,edx)
    test byte[edx+AircraftTypeClass.Offset.IsOpenTopped],1<<(AircraftTypeClass.Bit.IsOpenTopped-1)
    jz   .Ret
    jmp  .Proceed

.CheckBuilding:
    BuildingClass.Class.Get(ecx,eax)
    BuildingTypeClass.FromIndex(eax,edx)
    test byte[edx+BuildingTypeClass.Offset.IsOpenTopped],1<<(BuildingTypeClass.Bit.IsOpenTopped-1)
    jz   .Ret
    ;jmp  .Proceed

.Proceed:
    lea  eax,[ecx+0x53]
    call CargoClass__Attached_Object
    mov  byte[Temp.LimboFire],1
.Repeat:
    mov  edx,eax
    test eax,eax
    jz   .Ret
    cmp  byte[edx+AbstractClass.Offset.RTTI],RTTIType.Infantry
    je   .Infantry
    cmp  byte[edx+AbstractClass.Offset.RTTI],RTTIType.Unit
    je   .Unit
    jmp  .Next
.Infantry:
    mov  eax,ecx
    mov  ebx,[ecx+0x11]
    call [ebx+0xC] ; Center_Coord()
    mov  [edx+AbstractClass.Offset.Coord],eax ; set Coord
    mov  eax,[ecx+TechnoClass.Offset.TarCom]
    mov  [edx+TechnoClass.Offset.TarCom],eax ; set TarCom
    mov  byte[edx+InfantryClass.Offset.Doing],0 ; clear Doing
    push ecx
    mov  ecx,[edx+0x11]
    mov  eax,edx
    call [ecx+0x114] ; ??::Mission_Guard
    pop  ecx
    mov  eax,edx
    call 0x004F0E58 ; InfantryClass__Firing_AI
    mov  dword[edx+AbstractClass.Offset.Coord],-1
    jmp  .Next
.Unit:
    mov  eax,ecx
    mov  ebx,[ecx+0x11]
    call [ebx+0xC] ; Center_Coord()
    mov  [edx+AbstractClass.Offset.Coord],eax ; set Coord
    mov  eax,[ecx+TechnoClass.Offset.TarCom]
    mov  [edx+TechnoClass.Offset.TarCom],eax ; set TarCom
    push ecx
    mov  ecx,[edx+0x11]
    mov  eax,edx
    call [ecx+0x114] ; ??::Mission_Guard
    pop  ecx
    mov  eax,edx
    call 0x0057A0CC ; UnitClass__Firing_AI
    ;mov  dword[edx+AbstractClass.Offset.Coord],-1
    ;jmp  .Next
.Next:
    mov  eax,[edx+ObjectClass.Offset.Next]
    jmp  .Repeat
.Ret:
    mov  byte[Temp.LimboFire],0
    jmp  0x0056441D
@ENDHACK


@HACK 0x004F10DD,0x004F10E2,_InfantryClass__Firing_AI_Skip_StageCheck
    cmp  byte[Temp.LimboFire],0
    jne  0x004F10EA   
    lea  edx,[esi+0x42]
    mov  edx,[edx]
    jmp  0x004F10E2
@ENDHACK

; should investigate why these values become invalid

@SJMP 0x00566870,0x0056688E ;_TechnoClass__Record_The_Kill_CrashFix

@SJMP 0x00566B13,0x00566B36 ;_TechnoClass__Record_The_Kill_CrashFix

@SJMP 0x00566B86,0x00566BAB ;_TechnoClass__Record_The_Kill_CrashFix
