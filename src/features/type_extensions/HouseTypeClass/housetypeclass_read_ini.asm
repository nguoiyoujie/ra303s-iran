;----------------------------------------------------------------
; src/features/type_extensions/HouseTypeClass/housetypeclass_read_ini.asm
;
; Implements the reading of new INI settings, or modifications to existing INI reads, if any.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

;Read INI settings
@LJMP 0x004CD36F, _HouseTypeClass__Read_INI_Extended

_HouseTypeClass__Read_INI_Extended:
    push esi
    push edi
    push eax
    mov  edi,esi
    mov  esi,[ebp-0x4C] ; HouseTypeClass

    HouseTypeClass.HeliUnit.Read(esi,edi,_GetAircraftTypeIDFromString)
    HouseTypeClass.MCVUnit.Read(esi,edi,_GetUnitTypeIDFromString)

    pop  eax
    pop  edi
    pop  esi

.Ret:
    lea  esp,[ebp-10h]
    pop  edi
    pop  esi
    pop  ecx
    jmp  0x004CD375

