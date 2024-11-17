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

@HOOK 0x004232DC _AircraftClass_Can_Fire_UseIsDroppingForParabomb
@HOOK 0x00423323 _AircraftClass_Can_Fire_RemovePassengerCheckForBombing
@HOOK 0x00423385 _AircraftClass_Can_Fire_UseWeaponRangeForBombing

_AircraftClass_Can_Fire_UseIsDroppingForParabomb:
    test byte [edx + 0x138],0x8 ;IsDropping
    jmp  0x004232E3


; Replace
;    if (camera || (fudge && Passenger && Is_Something_Attached())) 
; with
;    if (camera || fudge) 

_AircraftClass_Can_Fire_RemovePassengerCheckForBombing:
    jmp  0x00423348

_AircraftClass_Can_Fire_UseWeaponRangeForBombing:
    ; ebx is camera, it is used only to switch between a range of 0x200 and 0x320. 
	; we use ebx  instead to fetch the weapon range of the primary weapon of this aircraft. If there is no primary weapon, fallback to 0x200
	push eax
    lea  ebx,[esi + 0x146]
    ;cmp        edi,-0x1
    mov  eax,dword [0x00601820]
    mov  ebx,dword [ebx]
    imul ebx,dword [eax + 0x4]
    mov  eax,dword [eax + 0x10]
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

;    mov  [edx+0x172] ; primary
;    ...
;    jmp  0x00423395
