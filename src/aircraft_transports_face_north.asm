@HOOK 0x00420662 _AircraftClass__PoseDir_FixedWingTransportsFaceNorth

_AircraftClass__PoseDir_FixedWingTransportsFaceNorth:
    mov  dl, BYTE [edx + 0x196] ; dl is now the ID
    movsx edx,dl
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
