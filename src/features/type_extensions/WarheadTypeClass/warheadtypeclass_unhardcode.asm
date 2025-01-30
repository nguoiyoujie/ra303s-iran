;----------------------------------------------------------------
; src/features/type_extensions/WarheadTypeClass/warheadtypeclass_new_types.asm
;
; Continuation of Iran's work in enabling the game to use new WarheadTypeClass.
; 
; This function is enabled by including the section [Warheads] in Rules.ini. This section includes an indexed array of names of warheads to load.
;   [Warheads]
;   0=SuperHE
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

@HACK 0x0046360D,0x00463615,_CCINIClass__Get_WarheadType_Unhardcode_WarheadTypes_Count
    mov  [ebp-0x8],dl
    Get_RULES_INI_Section_Entry_Count str_Warheads
    add  al,9
    cmp  dl,al
    jl   0x0046361C
    jmp  0x00463615
@ENDHACK


@HACK 0x0053618B,0x00536191,_RulesClass__Heap_Maximums_Set_Warheads_Heap_Count
    mov  edx,[esi+0x1D0] ; Hooked by patched warheads unhardcode code
    Get_RULES_INI_Section_Entry_Count str_Warheads
    add  edx,eax
    mov  eax,Warhead___Warheads
    jmp  0x00536191
@ENDHACK


@HACK 0x00536270,0x00536275,_RulesClass__Heap_Maximums_Init_Extra_WarheadTypes
    Loop_Over_RULES_INI_Section_Entries str_Warheads, Init_WarheadTypeClass
    mov  eax,Weapon__Weapons
    jmp  0x00536275
@ENDHACK


[section .text]
Init_WarheadTypeClass:
    mov  eax,WarheadTypeClass.NEW_SIZE
    call WarheadTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call _strdup
    mov  edx,eax

    pop  eax
    call WarheadTypeClass__WarheadTypeClass
.Ret:
    retn


