;----------------------------------------------------------------
; src/features/ai_vessels.asm
;
; Extends House AI with the following features
;  - Override Can_Build()
;  - Enable AI to build vessels in Multiplayer
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
; Future work
; - Unit production obey Can_Build() checks
; - AI will consider training new units beyond the original set when Auto Production is enabled
; - AI will consider training new units listed in Teams

@LJMP 0x004DBD3D, _HouseClass__AI_Vessel_Remove_Multiplayer_AI_Disable_Jump
@LJMP 0x004DBD95, _HouseClass__AI_Vessel_Can_Build_Force_True
@LJMP 0x004DC11E, _HouseClass__AI_Vessel_Fix_Crash
@LJMP 0x004DBD10, _HouseClass__AI_Vessel_Fix_Crash2

[section .data] 
VesselAIHouseClassPointer dd 0


[section .text] 
_HouseClass__AI_Vessel_Remove_Multiplayer_AI_Disable_Jump:
    jmp  0x004DBD43

_HouseClass__AI_Vessel_Can_Build_Force_True:
    mov  eax,1
    jmp  0x004DBD9A

_HouseClass__AI_Vessel_Fix_Crash:
    mov  dword eax,[VesselAIHouseClassPointer]
    test byte [eax+42h],20h
    jmp  0x004DC125

_HouseClass__AI_Vessel_Fix_Crash2:
    sub  esp,44h
    mov  [ebp-20h],eax
    mov  dword [VesselAIHouseClassPointer],eax
    jmp  0x004DBD16
