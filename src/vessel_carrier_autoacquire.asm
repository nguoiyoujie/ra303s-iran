@HOOK 0x0058B862 _VesselClass__Greatest_Threat_Carrier_AutoAcquire
;@HOOK 0x0058B862 _AircraftClass__Greatest_Threat_Carrier_AutoAcquire

@HOOK 0x00532FE4 _Reinf__Create_Group_EntitiesInTransports_AreNot_Loaners


_VesselClass__Greatest_Threat_Carrier_AutoAcquire:
    ; Carrier considered all threat as zero. 
	; Allow threat to be considered normally so as to allow AI to use carriers to attack
	; In future, replace this with some kind of AutoAcquire key

    jnz  0x0058B868
    ; further check House is not player, carrier has passengers, and first passenger is fully armed
    ; ebx is the vessel object, eax is no longer used in the function
    push eax
    push ebx
    push ecx
    push edx
    ; get object->House
    mov  edx,dword [0x006017f0]
    mov  eax,dword [ebx+0x93]
    imul eax,dword [edx+0x4]
    mov  edx,dword [edx+0x10]
    add  eax,edx
    test byte [eax+0x42],0x4 ; object->House->IsPlayerControl
    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
    jnz  .Clear_Threat ; player house target manually

    mov  al,byte [ebx+0x53]
    test al,al
    jz   .Clear_Threat ; carrier has no passengers, no target

    mov  eax,ebx
    add  eax,0x53 ; cargo class
    call 0x0046247C ; CargoClass::Attached_Object
.Iterate_Passengers:
    test eax,eax
    jz   .End_Iterate
    push eax
    push ebx
    push ecx
    push edx
    mov  ecx,dword [eax+0xc5] ; object->Ammo 
    push eax
    push ecx
    mov  ecx,dword [eax+0x11]
    call dword [ecx + 0x34]
    pop  ecx
    cmp  ecx,dword [eax+0x15e] ; object->TechnoType->MaxAmmo 
    pop  eax
    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
    jne  .Clear_Threat ; at least one passenger does not have full ammo, don't target
    mov  eax,dword [eax+0x1d] ; object = object->Next
    jmp  .Iterate_Passengers
.End_Iterate:

    jmp  0x0058B868
.Clear_Threat:
    xor  eax,eax
    jmp  0x0058B872



_Reinf__Create_Group_EntitiesInTransports_AreNot_Loaners:
    ; primarily for aircraft in carriers, but this is true for all types of units inside an aircraft or vessel
    ; ecx is the head of the object (transported) list
    push ecx
    ;push ebx
.Iterate_Transportees:
    test ecx,ecx
    jz   .End_Iterate
    and  byte [ecx+0x71],0xEF ; clear object->IsALoaner (0x10)
    mov  ecx,dword [ecx+0x1D] ; object = object->Next
    jmp  .Iterate_Transportees
.End_Iterate:
    ;pop  ebx
    pop  ecx
    lea  eax,[ebx+0x53]
    mov  edx,ecx
    jmp  0x00532FE9

    ;cmp  al,1
    ;jz   0x00532FFF    
    ;cmp  al,0x1e
    ;jz   0x00532FFF    
    ;jmp  0x00533006

