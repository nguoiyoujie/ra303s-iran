;----------------------------------------------------------------
; src/features/infantry_retaliates.asm
;
; Human-owned infantry do not automatically retaliate against incoming fire from infantry, unless PlayerReturnFire is on.
; The Tanya was an exception to that.
; Now you can instruct other infantry to be like Tanya.
; 
; This function is enabled by setting the InfantryType to Retaliates=yes.
; This function is not enabled for other types as it could put them out of position. They will use their GuardRange/Attack range to defend themselves.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x00568312,0x00568318,_TechnoClass__Is_Allowed_To_Retaliate_AllowRetaliation_Against_Infantry
    movzx eax,al
    InfantryTypeClass.FromIndex(eax,edx)
    test byte[edx+InfantryTypeClass.Offset.Retaliates],1<<(InfantryTypeClass.Bit.Retaliates-1)
    jz   0x00568320
    jmp  0x0056831A
@ENDHACK 
