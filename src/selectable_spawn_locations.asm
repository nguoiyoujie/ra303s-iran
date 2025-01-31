

[section .data]
multi1_Spawn    dd -1
multi2_Spawn    dd -1
multi3_Spawn    dd -1
multi4_Spawn    dd -1
multi5_Spawn    dd -1
multi6_Spawn    dd -1
multi7_Spawn    dd -1
multi8_Spawn    dd -1

multi_Spawns    times 8 dd 0 ; Multi1-8


@HACK 0x0053E4CE,0x0053E4D4,_Create_Units_Set_Selected_Spawn_Locations
    mov  dword[ebp-0x84],eax
    Save_Registers
    xor  esi,esi
.Loop:
    cmp  esi,7
    jg   .Ret
    mov  edi,dword[multi_Spawns+esi*4]
    cmp  edi,-1
    jz   .Dont_Set_Spawn_As_Used
    mov  dword[ebp+edi*4-0x1BC],1
.Dont_Set_Spawn_As_Used:
    inc  esi
    jmp  .Loop
.Ret:
    Restore_Registers
    jmp  0x0053E4D4
@ENDHACK


@HACK 0x0053E511,0x0053E516,_Create_Units_First_Spawn_Check_If_Not_Selected
    call 0x005BC960
    push esi
    push edi
;; uncomment this code if there are issues with every player selecting spawns
;    mov     esi,dword[multi_Spawns]
;    cmp     esi,-1
;    jnz     .First_Spawn_Selected
    xor  esi,esi
.Loop:
    cmp  esi,7
    jg   .Ret
    mov  edi,dword[multi_Spawns+esi*4]
    cmp  edi,eax
    jz   .Find_Another_Spawn
    inc  esi
    jmp  .Loop
.Ret:
    pop  edi
    pop  esi
    jmp  0x0053E516
.Find_Another_Spawn:
    pop  edi
    pop  esi
    jmp  0x0053E4D9
;.First_Spawn_Selected:
;    mov eax,esi
;    pop     edi
;    pop     esi
;    jmp     0x0053E516
@ENDHACK


@HACK 0x0053E534,0x0053E539,_Create_Units_First_Spawn_Save_Waypoint_number_In_ECX
    mov  ecx,eax
    jmp  0x0053E6A9
@ENDHACK


@HACK 0x0053E6A9,0x0053E6B0,_Create_Units_Spawn_Location
; [ebp-0x30] is spawn location local variable
    mov  dword ebx,[ebp-0x1B]
    sar  ebx,0x18
    cmp  ebx,0x13 ; Multi8
    ja   .Ret
    cmp  ebx,0xC ; Multi1
    jb   .Ret
.Spawn_Multi:
    lea  eax,[ebx-0xC]
    mov  dword eax,[multi_Spawns+eax*4]
    cmp  eax,dword -1
    jz   .Ret
    ; Fix up "used spawn locations" local array
    mov  dword[ebp+ecx*4-0x1BC],0 ; Set previously game selected spawn location as free
    mov  dword[ebp+eax*4-0x1BC],1 ; Set the spawn location we just loaded from the ini as used
    add  eax,eax
    add  eax,2
    add  eax,0x006678F5 ; Waypoints
    xor  edi,edi
    mov  word di,[eax]
    mov  eax,edi
    mov  dword[ebp-0x30],eax
    jmp  0x0053E6B0
.Ret:
    mov  eax,dword[ebp-0x30]
    mov  word[ebp-0x1C],ax
    jmp  0x0053E6B0
@ENDHACK


; Save spawn location in EXTENDED HouseClass so we can dump this info for statistics
@HACK 0x0053E6B0,0x0053E6B6,_Create_Units_Save_Spawn_Location_In_HouseClass
    mov  ax,[ebp-0x30] ; SpawnLocation
    mov  word[esi+HouseClass.Offset.SpawnLocation],ax
.Ret:
    mov  eax,[ebp-0x1C]
    and  eax,0x7F
    jmp  0x0053E6B6
@ENDHACK



[section .text]
;@LJMP 0x0053DDEB,_Read_Scenario_INI_Spawn_Locations
_Read_Scenario_INI_Spawn_Locations:
    push eax
    Save_Registers

    lea  esi,[ebp-140]

    call_INIClass__Get_Int esi,str_SpawnLocations,str_Multi1,-1
    mov  dword[multi_Spawns],eax

    call_INIClass__Get_Int esi,str_SpawnLocations,str_Multi2,-1
    mov  dword[multi_Spawns+4],eax

    call_INIClass__Get_Int esi,str_SpawnLocations,str_Multi3,-1
    mov  dword[multi_Spawns+8],eax

    call_INIClass__Get_Int esi,str_SpawnLocations,str_Multi4,-1
    mov  dword[multi_Spawns+0xC],eax

    call_INIClass__Get_Int esi,str_SpawnLocations,str_Multi5,-1
    mov  dword[multi_Spawns+0x10],eax

    call_INIClass__Get_Int esi,str_SpawnLocations,str_Multi6,-1
    mov  dword[multi_Spawns+0x14],eax

    call_INIClass__Get_Int esi,str_SpawnLocations,str_Multi7,-1
    mov  dword[multi_Spawns+0x18],eax

    call_INIClass__Get_Int esi,str_SpawnLocations,str_Multi8,-1
    mov  dword[multi_Spawns+0x1C],eax

    Restore_Registers
    pop  eax
    call 0x0053E204 ; Create_Units(int)
    jmp  0x0053DDF0

