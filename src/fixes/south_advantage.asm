;----------------------------------------------------------------
; src/fixes/south_advantage.asm
;
; Weapons are usually above the center of the unit. As a result, distance between a weapon and northern cell is slightly smaller than that with a southern cell.
; It means an attack from the south often has range advantage.
; 
; This function is enabled by default and cannot be configured.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

extern Coord___Distance_As_Coord
extern Face_Desired_Facing8
extern Face_Desired_Facing256


; args: <ObjectClass pointer to check facing for>, <ObjectClass pointer to check facing compared to>
; NOTE:
%macro Get_Facing_For_Objects 2
    push ebx
    push edx
    push ecx

    push %2
    push %1

    pop  eax ; %1
    mov  ebx,[eax+0x11]
    call [ebx+0xC]
    mov  ebx,eax
    pop  eax ; %2
    mov  ecx,[eax+0x11]
    call [ecx+0xC]
    xor  ecx,ecx
    mov  word cx,ebx
    xor  edx,edx
    and  ebx,0xFFFF     ; ebx & -1
    mov  word dx,eax
    and  eax,0xFFFF     ; eax & -1
    call Face_Desired_Facing256

    pop  ecx
    pop  edx
    pop  ebx
%endmacro

%macro Get_Facing_For_Objects_And_Long 2
    push ebx
    push edx
    push ecx

    push %2
    push %1

    pop  eax ; %1
    mov  ebx,[eax+0x11]
    call [ebx+0xC]
    mov  ebx,eax
    pop  eax ; %2
    xor  ecx,ecx
    mov  word cx,bx
    xor  edx,edx
    and  ebx,0xFFFF     ; ebx & -1
    mov  word dx,ax
    and  eax,0xFFFF     ; eax & -1
    call Face_Desired_Facing256

    pop  ecx
    pop  edx
    pop  ebx
%endmacro

; args: <identifier for unique branch identifiers>, <dirtype to check>
; NOTE: returns 1 or 0 in eax,destroying its value
%macro Is_Shooting_Northward 2
    mov  al,%2
    cmp  byte al,0xE0
    jz   .Return_True_%1
    cmp  byte al,0x00
    jz   .Return_True_%1
    cmp  byte al,0x20
    jz   .Return_True_%1

    xor  eax,eax
    jmp  .Return_%1

.Return_True_%1:
    mov  eax,1

.Return_%1:
%endmacro

; args: <identifier for unique branch identifiers>, <dirtype to check>
; NOTE: returns 1 or 0 in eax,destroying its value
%macro Is_Shooting_Southward 2
    mov  al,%2
    cmp  byte al,0xA0
    jz   .Return_True_%1
    cmp  byte al,0x60
    jz   .Return_True_%1
    cmp  byte al,0x80
    jz   .Return_True_%1

    xor  eax,eax
    jmp  .Return_%1

.Return_True_%1:
    mov  eax,1

.Return_%1:

%endmacro

%macro Get_Facing_For_Coords 2
    push ebx
    push edx
    push ecx

    push %2
    push %1

    pop  eax ; %1
    mov  ebx,eax
    pop  eax ; %2
    xor  ecx,ecx
    push ebx
    shr  ebx,16
    mov  word cx,bx
    pop  ebx
    xor  edx,edx
    and  ebx,0xFFFF     ; ebx & -1
    push eax
    shr  eax,16
    mov  word dx,ax
    pop  eax
    and  eax,0xFFFF     ; eax & -1
    call Face_Desired_Facing8

    pop  ecx
    pop  edx
    pop  ebx
%endmacro

@HACK 0x005627CA,0x005627D0,_TechnoClass_In_Range_ObjectClass_Pointer_Int_No_Building_Exception
    cmp  byte[Spawn.Settings.SouthAdvantageFix],0
    jz   .Normal_Code
    jmp  0x00562840
.Normal_Code:
    cmp  al,5
    jnz  0x00562840
    jmp  0x005627D0
@ENDHACK


@HACK 0x005626EA,0x005626F0,_TechnoClass_In_Range_Long_Int_No_Building_Exception
    cmp  byte[Spawn.Settings.SouthAdvantageFix],0
    jz   .Normal_Code
    jmp  0x00562762
.Normal_Code:
    test eax,eax
    jz   0x00562762
    jmp  0x005626F0
@ENDHACK


; 0x80 = shooting southward, 0x00 = shooting northward, 0xC0 = westward, 0x40 = eastward
@HACK 0x0056277D,0x00562782,_TechnoClass_In_Range_Long_Int_Distance_Check_Patched ; Check during actual firing
    cmp  byte[Spawn.Settings.SouthAdvantageFix],0
    jz   .Normal_Code
    mov  ebx,eax
    call Coord___Distance_As_Coord
    push eax
;    mov     ebx,[ecx+0x11]
;    call    dword[ebx+0x164] ; TechnoClass::Turret_Facing()
    Get_Facing_For_Coords esi,ebx
    mov  bl,al
    Is_Shooting_Northward derplong,bl
    cmp  al,0
    pop  eax
    jz   .Dont_Patch_South_Range
    add  eax,256    ; eax is the distance, edi contains range, we increase the distance because this unit
            ; has south advantage, 256 = one cell
.Dont_Patch_South_Range:
    cmp  byte[ecx],5 ; Check for building
    jnz  .Merge_Point ; If not building goto Merge_Point
    cmp  byte[ecx+0xCD],0x1F
    push eax
    jz   .Tesla_Coil_Adjustments
    pop  eax
    jmp  .Merge_Point
;.Dont_Patch_Range:
;    pop     eax
;    jmp     .Merge_Point
.Tesla_Coil_Adjustments:
    Is_Shooting_Northward derpnorth,bl
    cmp  al,0
    pop  eax
    jz   .Dont_Reduce_Tesla_Coil_North_Range
    add  eax,256 ; Reduce distance by increasing distance
.Dont_Reduce_Tesla_Coil_North_Range:
    push eax
;    Is_Shooting_Southward  derpsouth,bl
;    cmp     al,0
;    pop     eax
;    jz      .Dont_Increase_Tesla_Coil_South_Range

;    cmp     eax,256
;    jl      .Dont_Increase_Tesla_Coil_South_Range
;    sub     eax,256 ; Reduce distance by increasing distance

;.Dont_Increase_Tesla_Coil_South_Range:
    jmp  .Merge_Point
    int  3 ; not reached
.Merge_Point:
    jmp  0x00562782
.Normal_Code:
    call Coord___Distance_As_Coord
    jmp  0x00562782
@ENDHACK


@HACK 0x0056285C,0x00562861,_TechnoClass_In_Range_ObjectClass_Pointer_Int_Distance_Check_Patched ; For checking if your mouse turns into shooting cursor
    cmp  byte[Spawn.Settings.SouthAdvantageFix],0
    jz   .Normal_Code
    mov  ebx,eax
    push edx
    call Coord___Distance_As_Coord
    pop  edx
    push eax
    Get_Facing_For_Coords edx,ebx
    mov  bl,al
    Is_Shooting_Northward derpobject,bl
    cmp  al,0
    pop  eax
    jz   .Dont_Patch_South_Range
    add  eax,256    ; eax is the distance, edi contains range, we increase the distance because this unit
            ; has south advantage, 256 = one cell
.Dont_Patch_South_Range:
    cmp  byte[esi],5 ; Check for building
    jnz  .Merge_Point ; If not building goto Merge_Point
    cmp  byte[esi+0xCD],0x1F
    push eax
    jz   .Tesla_Coil_Adjustments
    pop  eax
    jmp  .Merge_Point
.Dont_Patch_Range:
    pop  eax
.Tesla_Coil_Adjustments:
    Is_Shooting_Northward derpnorth2,bl
    cmp  al,0
    pop  eax
    jz   .Dont_Reduce_Tesla_Coil_North_Range
    add  eax,256 ; Reduce distance by increasing distance
.Dont_Reduce_Tesla_Coil_North_Range:
;    push    eax

;    Is_Shooting_Southward  derpsouth2,bl
;    cmp     al,0
;    pop     eax
;    jz      .Dont_Increase_Tesla_Coil_South_Range


;    cmp     eax,256
;    jl      .Dont_Increase_Tesla_Coil_South_Range
;    sub     eax,256 ; Reduce distance by increasing distance

;.Dont_Increase_Tesla_Coil_South_Range:
    jmp  .Merge_Point
    int  3 ; not reached
.Merge_Point:
    jmp  0x00562861
.Normal_Code:
    call Coord___Distance_As_Coord
    jmp  0x00562861
@ENDHACK
