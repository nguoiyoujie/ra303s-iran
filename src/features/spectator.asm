;----------------------------------------------------------------
; src/features/spectator.asm
;
; Provides spectators function
; 
; This function is enabled by default and cannot be configured.
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x00567048,0x0056704E,_TechnoClass_Visual_Character_Spectator_Stuff
    cmp  cl,5
    jnz  .Ret
    mov  eax,[Globals___PlayerPtr]
    test byte[eax+HouseClass.Offset.IsSpectator],1 ; offset 1
    jz   .Ret
    test byte[eax+HouseClass.Offset.IsDefeated],1 ; offset 1
    jz   .Ret
    mov  cl,3
.Ret:
    movsx eax,cl
    lea  esp,[ebp-0xC]
    jmp  0x0056704E
@ENDHACK


@HACK 0x00532855,0x0053285A,_RadarClass__Draw_Names__Draw_Credits_Count_For_Specator
    push eax
    mov  dword eax,[Globals___PlayerPtr]
    test byte[eax+HouseClass.Offset.IsSpectator],1 ; offset 1
    pop  eax
    jnz  .Draw_Credits_Count
    add  eax,edi
.Ret:
    cmp  cl,0x14
    jmp  0x0053285A
.Draw_Credits_Count:
    mov  eax,ebx
    call HouseClass__Available_Money
    jmp  .Ret
@ENDHACK


@HACK 0x005326A2,0x005326A7,_RadarClass__Draw_Names__Draw_Credits_Text_For_Specator
    mov  dword eax,[Globals___PlayerPtr]
    test byte[eax+HouseClass.Offset.IsSpectator],1 ; offset 1
    jnz  .Draw_Credits_Text
    push 0x12A
.Ret:
    jmp  0x005326A7
.Draw_Credits_Text:
    push 0xDF
    jmp  .Ret
@ENDHACK


@HACK 0x0045EF20,0x0045EF2E,_BuildingClass__Read_INI_Skip_Dead_Houses
    call HouseTypeClass__From_Name
    mov  bl,al
    mov  edx,str_Comma
    mov  bh,al
    cmp  al,0xFF
    jz   0x0045EF2E ; Code is different for buildings than for other stuff like infantry
    Save_Registers
    call HouseClass__As_Pointer
    test byte[eax+HouseClass.Offset.IsDefeated],1 ; offset 1
    jnz  .Next_Iteration
    Restore_Registers
    jmp  0x0045EF2E
.Next_Iteration:
    Restore_Registers
    jmp  0x0045EED8
@ENDHACK


@HACK 0x004F095B,0x004F0966,_InfantryClass__Read_INI_Skip_Dead_Houses
    call HouseTypeClass__From_Name
    mov  bh,al
    cmp  al,0xFF
    jz   0x004F0913
    Save_Registers
    call HouseClass__As_Pointer
    test byte[eax+HouseClass.Offset.IsDefeated],1 ; offset 1
    jnz  .Next_Iteration
    Restore_Registers
    jmp  0x004F0966
.Next_Iteration:
    Restore_Registers
    jmp  0x004F0913
@ENDHACK


@HACK 0x0058CAD3,0x0058CADE,_VesselClass__Read_INI_Skip_Dead_Houses
    call HouseTypeClass__From_Name
    mov  bh,al
    cmp  al,0xFF
    jz   0x0058CA8B
    Save_Registers
    call HouseClass__As_Pointer
    test byte[eax+HouseClass.Offset.IsDefeated],1 ; offset 1
    jnz  .Next_Iteration
    Restore_Registers
    jmp  0x0058CADE
.Next_Iteration:
    Restore_Registers
    jmp  0x0058CA8B
@ENDHACK


@HACK 0x00581153,0x0058115E,_UnitClass__Read_INI_Skip_Dead_Houses
    call HouseTypeClass__From_Name
    mov  bh,al
    cmp  al,0xFF
    jz   0x0058110B
    Save_Registers
    call HouseClass__As_Pointer
    test byte[eax+HouseClass.Offset.IsDefeated],1 ; offset 1
    jnz  .Next_Iteration
    Restore_Registers
    jmp  0x0058115E
.Next_Iteration:
    Restore_Registers
    jmp  0x0058110B
@ENDHACK


@HACK 0x004D8CB4,0x004D8CBA,_HouseClass__Init_Data_Spectator_Stuff
    Save_Registers
    mov  byte[eax+0x178F],dl
    cmp  byte[spawner_is_active],0
    jz   .Ret
    mov  ebx,eax
    call HouseClass__HousesType
    cmp  byte[SpectatorsArray+eax],0
    jz   .Ret
    mov  eax,ebx
    or   byte[eax+HouseClass.Offset.IsDefeated],1 ; Make house dead
    mov  byte[eax+HouseClass.Offset.IsSpectator],1
;    mov     eax,Globals___Map
;    mov     edx,1
;    call    0x0052D790
;    mov     eax,Globals___Map
;    mov     edx,3
;    call    0x0052D790
.Ret:
    Restore_Registers
    jmp  0x004D8CBA
@ENDHACK


@HACK 0x0053E4FB,0x0053E502,_Create_Units_Skip_Dead_Houses
    cmp  byte[spawner_is_active],0
    jz   .Ret
    test byte[eax+HouseClass.Offset.IsDefeated],1 ; offset 1
    jnz  .Spectator
.Ret:
    cmp  dword[ebp-0x8C],0
    jmp  0x0053E502
.Spectator:
    jmp  0x0053E4D6
@ENDHACK


@HACK 0x0053DFD7,0x0053DFDD,_Assign_Houses_Set_Up_Player_Pointer
    mov  dword[Globals___PlayerPtr],edi
    cmp  byte[spawner_is_active],0
    jz   .Ret
    test byte[eax+HouseClass.Offset.IsDefeated],1 ; offset 1
    jz   .Ret
    mov  dword[0x0065D7F0],1
    mov  dword[0x0067F315],1
.Ret:
    jmp  0x0053DFDD
@ENDHACK
