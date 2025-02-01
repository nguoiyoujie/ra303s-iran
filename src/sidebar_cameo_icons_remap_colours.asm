
extern Globals___PlayerPtr


@HACK 0x0054E871,0x0054E87B,_StripClass__Draw_it_Dont_Destroy_EAX
    mov  ecx,[ebp-0x1C]
    jmp  0x0054E87B
@ENDHACK


@HACK 0x0054E863,0x0054E868,_StripClass__Draw_It_Colour_Remap_Icon
    xor  edx,edx
    mov  ebx,1
    xor  eax,eax ; just to be sure
    cmp  byte[RedAlert.Options.ColorRemapSidebarIcons],0
    jz   .No_Colour_Remap
    mov  eax,[Globals___PlayerPtr]
    xor  ebx,ebx
    mov  bl,[eax+HouseClass.Offset.RemapColor]
    call 0x004D6528 ; const HouseClass::Remap_Table(int,RemapType)
.No_Colour_Remap:
    push eax
    test eax,eax
    jz   0x0054E86F
    jmp  0x0054E868
@ENDHACK

