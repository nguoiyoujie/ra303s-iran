;----------------------------------------------------------------
; src/features/type_extensions/BulletTypeClass/bulletclass_new_types.asm
;
; Continuation of Iran's work in enabling the game to use new BulletTypeClass.
; 
; This function is enabled by including the section [BulletTypes] in Rules.ini. This section includes an indexed array of names of bullets to load.
;   [BulletTypes]
;   0=HeatSeekerAA
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

@HOOK 0x00426C90 _BulletTypeClass__Init_Heap_Init_Extra_BulletTypes
@HOOK 0x00426CF5 _BulletTypeClass__One_Time_Unhardcode_BulletTypes
@HOOK 0x00463701 _CCINIClass__Get_BulletType_Unhardcode_BulletTypes_Count
@HOOK 0x004F40D8 _Init_Game_Set_Bullet_Types_Heap_Count


_BulletTypeClass__Init_Heap_Init_Extra_BulletTypes:
    Loop_Over_RULES_INI_Section_Entries str_BulletTypes,Init_BulletTypeClass
.Ret:
    lea  esp,[ebp-4]
    pop  edx
    pop  ebp
    retn


Init_BulletTypeClass:
    mov  eax,BulletTypeClass.NEW_SIZE
    call BulletTypeClass__new
    test eax,eax
    jz   .Ret
    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call __strdup
    mov  edx,eax
    pop  eax
    call BulletTypeClass__BulletTypeClass
.Ret:
    retn


_BulletTypeClass__One_Time_Unhardcode_BulletTypes:
    mov  al,byte[BulletTypeClass.Count]
    cmp  dh,al
    jl   0x00426CAD
    jmp  0x00426CFA


_CCINIClass__Get_BulletType_Unhardcode_BulletTypes_Count:
    mov  [ebp-0x4],dl
    mov  al,byte[BulletTypeClass.Count]
    cmp  dl,al
    jl   0x00463710
    jmp  0x00463709


_Init_Game_Set_Bullet_Types_Heap_Count:
    mov  edx,BulletTypeClass.ORIGINAL_COUNT
    Get_RULES_INI_Section_Entry_Count str_BulletTypes
    add  edx,eax
    jmp  0x004F40DD
