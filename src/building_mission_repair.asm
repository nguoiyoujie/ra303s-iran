@HOOK 0x0045CF1B _BuildingClass_Mission_Repair_Replace_TypeCheck_with_FactoryTypeCheck

;Overrides the structure type check with a FactoryType=xx check

;_BuildingClass_Mission_Repair:
; /original
; /   cmp  eax, 0xb ; con yard
;
; TO-DO: Find a way to fetch the BuildingTypeClass, from type id (EAX)
;        Then reference Offset_FactoryType / 0x19B to seek the BYTE holding the factory type. A value of 6 shall pass the check.
;
; in future, also apply this to other visuals (e.g. BuildingClass.Shape_Number -> with Storage and IsSilo check, replace (*this == STRUCT_STORAGE) so other buildings can enjoy the visual changes of the silo as well.

_BuildingClass_Mission_Repair_Replace_TypeCheck_with_FactoryTypeCheck:
    BuildingTypeClass.FromIndex  eax
    cmp  BYTE [eax + 0x19B], 6 ; FactoryType=6
    jz   0x0045CF57 ; is a conyard
    jmp  0x0045CF6D



; 0x0054e1f8   SidebarClass::StripClass::Add
;  MAX_BUILDABLE check
;           0054e208 83 78 35 4b     CMP        dword ptr [EAX + 0x35],0x4b

