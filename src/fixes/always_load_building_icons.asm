;----------------------------------------------------------------
; src/fixes/always_load_building_icons.asm
;
; If TechLevel == -1 for a building their icon isn't loaded, infantry etc don't have this check.
; This affects maps that make buildings buildable that have TechLevel -1 in RULES.INI
; We jump over this check
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------


@HOOK 0x004535D0 _BuildingTypeClass__One_Time_TechLevel_Check

_BuildingTypeClass__One_Time_TechLevel_Check:
    jmp  0x004535D9
