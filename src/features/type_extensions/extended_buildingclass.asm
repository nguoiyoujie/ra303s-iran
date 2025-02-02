
cextern HouseClass__As_Pointer
cextern Globals___EngineerCaptureLevel

; no buildingcrew if the house has no building crew set
; this requires the extended houseclass option NoBuildingCrew
@HACK 0x0045E429,0x0045E42F,_BuildingClass__Building_Crew_House_NoBuildingCrew
    Save_Registers

    mov  edx,[eax+0x11]  ; vtable
    call dword[edx+8] ; HousesType const TechnoClass::Owner(void)
    call HouseClass__As_Pointer
    test byte[eax+HouseClass.Offset.NoBuildingCrew],0x10 ; offset 5
    Restore_Registers
    jnz  .No_Building_Crew

.Ret:
    mov  edx,[eax+0xCD]
    jmp  0x0045E42F

.No_Building_Crew:
    jmp  0x0045E542
@ENDHACK

;edi = buildingclass
@HACK 0x004EC58F,0x004EC594,_InfantryClass__Per_Cell_Process_House_Instant_Capture
    Save_Registers

    mov  eax,edi ; make sure eax has this pointer
    mov  edx,[eax+0x11]  ; vtable
    call dword[edx+8] ; HousesType const TechnoClass::Owner(void)
    call HouseClass__As_Pointer
    test byte[eax+HouseClass.Offset.InstantCapture],0x8 ; offset 4
    Restore_Registers
    jnz  .Capture_Building

.Normal_Code:
    and  eax,0xFF
    jmp  0x004EC594

.Capture_Building:
    jmp  0x004EC59A
@ENDHACK

;ebx = buildingclass
@HACK 0x004EFC9E,0x004EFCB3,_InfantryClass__What_Action_House_Instant_Capture
    Save_Registers

    mov  eax,ebx ; make sure eax has this pointer
    mov  edx,[eax+0x11]  ; vtable
    call dword[edx+8] ; HousesType const TechnoClass::Owner(void)
    call HouseClass__As_Pointer
    test byte[eax+HouseClass.Offset.InstantCapture],0x8 ; offset 4
    Restore_Registers
    jnz  .Capture_Building

.Normal_Code:
    mov  bx,[Globals___EngineerCaptureLevel] ; EngineerCaptureLevel
    mov  ax,[eax]
    cmp  ax,bx
    setbe al
    and  eax,0xFF
    jmp  0x004EFCB3

.Capture_Building:
    jmp  0x004EFCB5
@ENDHACK
