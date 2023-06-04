@HOOK 0x00425BA8 _AnimClass__Override_Atom_Range
@HOOK 0x00425BC9 _AnimClass__Do_Atom_Damage
@HOOK 0x00425C26 _AnimClass__Do_Atom_Damage2

_AnimClass__Do_Atom_Damage2:
    cmp  dword [UseAtomWhiteScreenEffectInMP],1
    jz   .Jump_Past

    cmp  byte [Globals___Session_Type],GameType.GAME_NORMAL
    jnz  0x00425C43

.Jump_Past:
    jmp  0x00425C2F

_AnimClass__Override_Atom_Range:
    cmp  dword [AtomRadius],0
    jge   .Override_Range
    mov  ecx,4
    jmp  .After_Override_Range
.Override_Range:
    mov  ecx,[AtomRadius]
.After_Override_Range:
    jmp  0x00425BAD


_AnimClass__Do_Atom_Damage:
    cmp  dword [UseAtomWhiteScreenEffectInMP],0
    jz   .No_Whiten_Screen_Effect

    mov  ebx,Conquer___Call_Back
    mov  edx,1Eh
    mov  eax,Globals___WhitePalette

    call PaletteClass__Set

.No_Whiten_Screen_Effect:
    cmp  dword [AtomRadius],0
    jge   .Override_Range
    mov  ecx,3
    jmp  .After_Override_Range
.Override_Range:
    mov  ecx,[AtomRadius]
.After_Override_Range:
    cmp  dword [UseSinglePlayerAtomDamage],1
    mov  esi,[Globals___Rule_AtomDamage]
    jz   0x00425BE1

.Normal_Code:
    mov  eax,[Globals___Rule_AtomDamage]
    jmp  0x00425BCE
