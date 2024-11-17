;----------------------------------------------------------------
; src/features/aircraft_transports_face_north.asm
;
; All heli (rotary wing) transports will face north when landing. This differs from other helis which usually face north-east
; This may be extended in the future for a custom landing direction.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@HOOK 0x00420662 _AircraftClass__PoseDir_HeliTransportsFaceNorth

_AircraftClass__PoseDir_HeliTransportsFaceNorth:
    mov  dl,byte [edx + 0x196] ; dl is now the ID
    movzx edx,dl
    push eax
    push ebx
    AircraftTypeClass.FromIndex(edx,ebx)
    AircraftTypeClass.IsFixedWing.Get(ebx,al) ; check not fixed wing + passengers > 0
    cmp  al,0
    jnz  .IsNotHeliTransport
    TechnoTypeClass.MaxPassengers.Get(ebx,eax)
    cmp  eax,0
    jz   .IsNotHeliTransport

.IsHeliTransport:
    pop  ebx
    pop  eax
    xor  eax,eax
    jmp  0x004206B2

.IsNotHeliTransport:
    pop  ebx
    pop  eax
    jmp  0x00420673
