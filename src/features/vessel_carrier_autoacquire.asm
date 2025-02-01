;----------------------------------------------------------------
; src/features/vessel_carrier_autoacquire.asm
;
; Gives AI the ability to use Carriers to auto-acquire targets. For the moment, human-controlled houses still require manual targeting, like Tanya.
; As an aside, all transported units are controllable and no longer have IsALoaner set. This allows aircraft reinforced in Helicarriers be usable and return to the carrier after a fight. 
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as Helicarriers were not expected to be used by the AI in the original game. Modders and mappers beware though.
; 
;----------------------------------------------------------------
extern CargoClass__Attached_Object
extern Globals___Houses


@HACK 0x0058B862,0x0058B868,_VesselClass__Greatest_Threat_Carrier_AutoAcquire
    ; Carrier considered all threat as zero. 
	; Allow threat to be considered normally so as to allow AI to use carriers to attack
	; In future, replace this with some kind of AutoAcquire key

    jnz  0x0058B868
    ; further check House is not player, carrier has passengers, and all passengers are fully armed
    ; ebx is the vessel object, eax is no longer used in the function
    push eax
    push edx
    ; get object->House
    mov  edx,dword[Globals___Houses]
    mov  eax,dword[ebx+0x93]
    imul eax,dword[edx+0x4]
    mov  edx,dword[edx+0x10]
    add  eax,edx
    test byte[eax+0x42],0x4 ; object->House->IsPlayerControl
    pop  edx
    pop  eax
    jnz  .Clear_Threat ; player house target manually
    mov  al,byte[ebx+0x53]
    test al,al
    jz   .Clear_Threat ; carrier has no passengers, no target

    mov  eax,ebx
    add  eax,0x53 ; cargo class
    call CargoClass__Attached_Object
.Iterate_Passengers:
    test eax,eax
    jz   .End_Iterate
    push eax
    push ebx
    push ecx
    push edx
    mov  ecx,dword[eax+0xC5] ; object->Ammo 
    push eax
    push ecx
    mov  ecx,dword[eax+0x11]
    call dword[ecx+0x34]
    pop  ecx
    cmp  ecx,dword[eax+0x15E] ; object->TechnoType->MaxAmmo 
    pop  eax
    pop  edx
    pop  ecx
    pop  ebx
    pop  eax
    jne  .Clear_Threat ; at least one passenger does not have full ammo,don't target
    mov  eax,dword[eax+0x1D] ; object = object->Next
    jmp  .Iterate_Passengers
.End_Iterate:
    jmp  0x0058B868
.Clear_Threat:
    xor  eax,eax
    jmp  0x0058B872
@ENDHACK


@HACK 0x00532FE4,0x00532FE9,_Reinf__Create_Group_EntitiesInTransports_AreNot_Loaners
    ; primarily for aircraft in carriers, but this is true for all types of units inside an aircraft or vessel
    ; ecx is the head of the object (transported) list
    push ecx
    ;push ebx
.Iterate_Transportees:
    test ecx,ecx
    jz   .End_Iterate
    and  byte[ecx+0x71],0xEF ; clear object->IsALoaner (0x10)
    mov  ecx,dword[ecx+0x1D] ; object = object->Next
    jmp  .Iterate_Transportees
.End_Iterate:
    ;pop  ebx
    pop  ecx
    lea  eax,[ebx+0x53]
    mov  edx,ecx
    jmp  0x00532FE9
@ENDHACK
