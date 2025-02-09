;----------------------------------------------------------------
; src/features/prerequisitesystem/prerequisite_groups.asm
;
; Implements PrerequisiteTypes, which allows for some basic grouping of several building types to fulfill prerequisites.
; Extensive changes, affecting counting, map events, AI and superweapons
; 
; Consider separating these functions to smaller functional groups
; 
; This function is enabled by defining [<BuildingType>] PrerequisiteType= , then using it as a Prerequisite condition 
; Compatibility warnings:
;   Adv. Power Plant no longer fulfill prerequisites that require Power Plant.
;   Soviet/Allied Tech Center will also no longer fulfill prerequisites that require the other.
;----------------------------------------------------------------

@HACK 0x004D40DF,0x004D40E4,_HouseClass__Can_Build_ReimplementExtendedPrerequisiteCheck
    ; edx is the technotype pointer 
    ; esi is the houseclass pointer 
    xor  eax,eax
    TechnoTypeClass.ExtPrerequisiteOffset.Get(edx,ax)
    cmp  ax,0
    jz   .Fulfilled
    lea  eax,[edx+eax] ; eax is now pointer to start of the prerequisite fields
    ;mov  ebx,dword[esi+HouseClass.Offset.ID] ; HouseClass->ID     
    ; AND over 256-bit BScan
    lea  ecx,[esi+HouseClass.Offset.NewActiveBScan]
    mov  edx,8
.RepeatIter:
    mov  ebx,dword[eax]
    and  ebx,dword[ecx]
    cmp  ebx,dword[eax]
    jne  .NotFulfilled
    dec  edx
    add  eax,4
    add  ecx,4
    cmp  edx,0
    jg   .RepeatIter
.Fulfilled:
    mov  eax,1 ; prerequisite is met
    jmp  0x004D40E4
.NotFulfilled:
    xor  eax,eax ; prerequisite is not met
    jmp  0x004D40E4
@ENDHACK

