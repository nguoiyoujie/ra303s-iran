;----------------------------------------------------------------
; src/features/building_mission_repair.asm
;
; The Construction Yard plays an animation when this mission is applied to it. Now, all FactoryType=BuildingType buildings can play the same animation
;
; This function is enabled by having more buildings with FactoryType=BuildingType. Remember to set the relevant animation frames
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
@HOOK 0x0045CF1B _BuildingClass_Mission_Repair_Replace_TypeCheck_with_FactoryTypeCheck

;_BuildingClass_Mission_Repair:
; in future, also apply this to other visuals (e.g. BuildingClass.Shape_Number -> with Storage and IsSilo check, replace (*this == STRUCT_STORAGE) so other buildings can enjoy the visual changes of the silo as well.

;Overrides the structure type check with a FactoryType=xx check
_BuildingClass_Mission_Repair_Replace_TypeCheck_with_FactoryTypeCheck:
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  byte [eax + BuildingTypeClass.Offset.FactoryType],RTTIType.BuildingType 
    jz   0x0045CF57 ; is a conyard
    jmp  0x0045CF6D
