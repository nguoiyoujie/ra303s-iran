;----------------------------------------------------------------
; src/fixes/mcv_undeploy_fix.asm
;
; Fix undeploy logic check for the MCV
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
;@HACK 0x0045A71A,0x0045A723,_BuildingClass__What_Action_MCV_Undeploy
;    cmp  byte[Spawn.Settings.MCVUndeploy],1
;    jz   0x0045A725
;    test byte[Globals___Rule_IsMCVDeploy_Address],Globals___Rule_IsMCVDeploy_BitMask ; Lovalmidas: 2023.06.04: was 0x80, was bug
;    jnz  0x0045A725
;    jmp  0x0045A723
;@ENDHACK


@HACK 0x0045C1CE,0x0045C1D7,_BuildingClass__Mission_Deconstruction_MCV_Undeploy
    cmp  byte[Spawn.Settings.MCVUndeploy],1
    jz   0x0045C1D7
    test byte[Globals___Rule_IsMCVDeploy_Address],Globals___Rule_IsMCVDeploy_BitMask ; Lovalmidas: 2023.06.04: was 0x80, was bug
    jnz  0x0045C1D7
    jmp  0x0045C204
@ENDHACK
