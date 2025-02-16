;----------------------------------------------------------------
; src/features/type_extensions/AircraftTypeClass/aircraft_persistguard.asm
;
; Allow aircraft to acquire new targets while in the air. Essentially, instead of returning to base, aircraft can perform seek out guardrange again from whenever they are.
; This does mean that aircraft may extend beyond their GuardRange since they acquire their targets relative to their new position instead of their starting one
; 
; This function is enabled by setting [<AircraftType>] SeekerGuard=true.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

cextern TechnoClass__Target_Something_Nearby

@HACK 0x00420DA6,0x00420DAB,_AircraftClass__Mission_Attack__GuardAgain ; Heli
    AircraftClass.Class.Get(esi,edx)
    AircraftTypeClass.FromIndex(edx,ebx)
    test byte[ebx+AircraftTypeClass.Offset.SeekerGuard],1<<(AircraftTypeClass.Bit.SeekerGuard-1) 
    jz   .EnterIdleMode
    cmp  byte[esi+TechnoClass.Offset.Ammo],0
    je   .EnterIdleMode
    mov  eax,esi
    mov  edx,1
    call TechnoClass__Target_Something_Nearby
    test eax,eax
    jz   .EnterIdleMode
    mov  byte[esi+MissionClass.Offset.Status],0 ; VALIDATE_AZ
    jmp  0x00420749 ; skip idle
.EnterIdleMode:
    mov  ebx,[esi+0x11]
    mov  eax,esi
    xor  edx,edx
    jmp  0x00420DAB
@ENDHACK


@HACK 0x0041DFA7,0x0041DFAE,_AircraftClass__Mission_Hunt__GuardAgain ; Wing
    AircraftClass.Class.Get(esi,edx)
    AircraftTypeClass.FromIndex(edx,ebx)
    test byte[ebx+AircraftTypeClass.Offset.SeekerGuard],1<<(AircraftTypeClass.Bit.SeekerGuard-1) 
    jz   .EnterIdleMode
    cmp  byte[esi+TechnoClass.Offset.Ammo],0
    je   .EnterIdleMode
    mov  eax,esi
    mov  edx,1
    call TechnoClass__Target_Something_Nearby
    test eax,eax
    jz   .EnterIdleMode
    mov  byte[esi+MissionClass.Offset.Status],2 ; FLY_TO_TARGET
    jmp  0x00420749 ; skip idle
.EnterIdleMode:
    mov  ebx,[esi+0x11]
    mov  eax,esi
    xor  edx,edx
    jmp  0x0041DFAE
@ENDHACK