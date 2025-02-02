;----------------------------------------------------------------
; src/features/aircraft_isdropping_act_like_parabombs.asm
;
; Instead of IsParachute=yes, we check IsDropping=yes to use carpet bombing logic for aircraft.
; This will allow the aircraft to continue dropping bombs while the target is behind the aircraft.
; 
; Additionally, the weapon range is used to determine when the parabomb drops begin. Previously it was hardcoded.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------

@SJMP 0x00423323,0x00423348 ; _AircraftClass_Can_Fire_RemovePassengerCheckForBombing

@HACK 0x004232DC,0x004232E3,_AircraftClass_Can_Fire_UseIsDroppingForParabomb
    test byte[edx+0x138],0x8 ;IsDropping
    jmp  0x004232E3
@ENDHACK


@HACK 0x00423385,0x00423395,_AircraftClass_Can_Fire_UseWeaponRangeForBombing
    ; ebx is camera, it is used only to switch between a range of 0x200 and 0x320. 
	; we use ebx  instead to fetch the weapon range of the primary weapon of this aircraft. If there is no primary weapon, fallback to 0x200
	push eax
    lea  ebx,[esi+0x146]
    ;cmp        edi,-0x1
    mov  eax,dword[0x00601820]
    mov  ebx,dword[ebx]
    imul ebx,dword[eax+0x4]
    mov  eax,dword[eax+0x10]
    add  ebx,eax
    TechnoTypeClass.PrimaryWeapon.Get(ebx,eax) ; eax is now the weapon ptr
	test eax,eax
    jz   .UseDefaultRange ; primary weapon is null
	xor  ebx,ebx
    WeaponTypeClass.Range.Get(eax,bx)          ; bx is now the range value
	test ebx,ebx
    jz   .UseDefaultRange ; primary weapon has 0 range
    jmp  .Ret
.UseDefaultRange:
    mov  ebx,0x200
.Ret:
	pop  eax
    jmp  0x00423395 ; cmp code is here
@ENDHACK


@HACK 0x0041DBD6,0x0041DBDE,_AircraftClass_Mission_Hunt_Regroup_Selectable_Bombers
    ; the parabomber doesn't check the status of the target, and will continue to fly forward if it is dead. This is not a problem with the support power, because the target (ground) is always alive.
    ; for our custom selectable bombers, we want them to return to the airport
    cmp  eax,6 ; REGROUP
    ja   .Next
    jmp  0x0041DBDE
.Next:
    cmp  eax,8
    jne  0x0041DB48 ; continue
    ; perform Target_Legal check
    mov  eax,[esi+0xB2]
    Techno_Target_Legal_Check eax
    test eax,eax
    jnz   0x0041DB48 ; continue
    jmp  0x0041DB06 ; REGROUP
@ENDHACK


