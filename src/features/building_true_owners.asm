;----------------------------------------------------------------
; src/features/building_true_owners.asm
;
; The factory owner (ActLike) was converted to either Greece (1) or USSR (2).
; Remove this conversion, and let the building belong truly to the house that built it.
; This allows truly custom owners and allows Owner=country1,country2 to be truly respected
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@LJMP 0x00456C7B, _BuildingClass_Unlimbo_RemoveHardcodeAlliedSovietOwners



_BuildingClass_Unlimbo_RemoveHardcodeAlliedSovietOwners:
    jmp  0x00456CCC