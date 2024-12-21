;----------------------------------------------------------------
; src/features/atom_damage_custom.asm
;
; Customizes the atomic bomb parameters.
;
; This function is enabled by setting the following key(s):
;   Rules.ini/Map > [Basic] > UseAtomWhiteScreenEffectInMP - In multiplayer, show the white screen effect
;   Rules.ini/Map > [Basic] > UseSinglePlayerAtomDamage - In multiplayer, use rules AtomDamage values
;   Rules.ini/Map > [Basic] > AtomRadius - Sets the radius of the atomic effect. The center cell is not counted, so the effective blast covers a square area of AtomRadius * 2 + 1
; 
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
@HOOK 0x00425BA8 _AnimClass__Override_Atom_Range
@HOOK 0x00425BC9 _AnimClass__Do_Atom_Damage
@HOOK 0x00425C26 _AnimClass__Do_Atom_Damage2

_AnimClass__Do_Atom_Damage2:
    cmp  dword [Map.Basic.UseAtomWhiteScreenEffectInMP],1
    jz   .Jump_Past

    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    jnz  0x00425C43

.Jump_Past:
    jmp  0x00425C2F

_AnimClass__Override_Atom_Range:
    cmp  dword [Rules.General.AtomRadius],0
    jge   .Override_Range
    mov  ecx,4
    jmp  .After_Override_Range
.Override_Range:
    mov  ecx,[Rules.General.AtomRadius]
.After_Override_Range:
    jmp  0x00425BAD


_AnimClass__Do_Atom_Damage:
    cmp  dword [Map.Basic.UseAtomWhiteScreenEffectInMP],0
    jz   .No_Whiten_Screen_Effect

    mov  ebx,Conquer___Call_Back
    mov  edx,1Eh
    mov  eax,Globals___WhitePalette

    call PaletteClass__Set

.No_Whiten_Screen_Effect:
    cmp  dword [Rules.General.AtomRadius],0
    jge   .Override_Range
    mov  ecx,3
    jmp  .After_Override_Range
.Override_Range:
    mov  ecx,[Rules.General.AtomRadius]
.After_Override_Range:
    cmp  dword [Map.Basic.UseSinglePlayerAtomDamage],1
    mov  esi,[Globals___Rule_AtomDamage]
    jz   0x00425BE1

.Normal_Code:
    mov  eax,[Globals___Rule_AtomDamage]
    jmp  0x00425BCE
