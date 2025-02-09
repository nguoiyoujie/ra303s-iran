;----------------------------------------------------------------
; src/fixes/what_weapon_should_i_use_crash_fix.asm
;
; When calling the function to check what weapon a unit should use against another unit an object reference is retrieved from an
; object ID. The function to retrieve the object reference will return NULL when the object reference is invalid, the function
; doesn't check for this.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HACK 0x00560B62,0x00560B67,_TechnoClass__What_Weapon_Should_I_Use_Object_Reference_Check
    call 0x00555190 ; As_Object(long)
    test eax,eax
    je   0x00560C93
    jmp  0x00560B67
@ENDHACK
