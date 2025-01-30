
;----------------------------------------------------------------
; src/harvester_harvest_closest_ore.asm
;
; Harvests shall harvest the closest ore
; 
; This function is by default and is not modifable.
; No compatibility issues is expected.
;
;----------------------------------------------------------------
@HACK 0x0057E3E6,0x0057E3F0,_UnitClass__Mission_Harvest_Set_Target_Ore_Patch_To_NULL
    Save_Registers
    mov  eax,ecx
    xor  edx,edx
    call 0x00580B94 ; UnitClass::Assign_Destination(long)
    Restore_Registers
    mov  edx,eax
    mov  eax,ecx
    mov  [ecx+0x141],bh
    jmp  0x0057E3F0
@ENDHACK


@HACK 0x0057E5DD,0x0057E5E4,_UnitClass__Mission_Harvest_Set_Target_Ore_Patch_To_NULL2
    Save_Registers
    mov  eax,ecx
    xor  edx,edx
    call 0x00580B94 ; UnitClass::Assign_Destination(long
    Restore_Registers
    sar  eax,8
    mov  edx,eax
    mov  eax,ecx
    jmp  0x0057E5E4
@ENDHACK
