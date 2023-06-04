@HOOK 0x0045CF1B _BuildingClass_Mission_Repair_Replace_TypeCheck_with_FactoryTypeCheck

;_BuildingClass_Mission_Repair:
; in future, also apply this to other visuals (e.g. BuildingClass.Shape_Number -> with Storage and IsSilo check, replace (*this == STRUCT_STORAGE) so other buildings can enjoy the visual changes of the silo as well.

;Overrides the structure type check with a FactoryType=xx check
_BuildingClass_Mission_Repair_Replace_TypeCheck_with_FactoryTypeCheck:
    BuildingTypeClass.FromIndex(eax,eax)
    cmp  byte [eax + BuildingTypeClass.Offset.FactoryType],RTTIType.BuildingType 
    jz   0x0045CF57 ; is a conyard
    jmp  0x0045CF6D
