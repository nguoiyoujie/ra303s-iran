;----------------------------------------------------------------
; src/features/techno_static_disguise.asm
;
; Renders a techno unit without threat so long as it is not moving. Optionally provides an alternative render for the unit when still.
; The effect is eliminated when the unit receives damage, recovering after a while. 
; Only works for infantry and unit types. Units will transform into a tree. Infantry will just shimmer.
; 
; This function is enabled by setting the technotype IsStaticDisguise=yes.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

cextern Conquer___CC_Draw_Shape

%assign MIRAGE_THRESHOLD      0x18
%assign MIRAGE_UNIT_SHADOW    0x24
%assign MIRAGE_UNIT_SHIMMER   0x2C
%assign MIRAGE_TREE_SHIMMER   0x38
%assign MIRAGE_TREE           0x40
%assign MIRAGE_MOVE_REDUCE    4

[section .rdata]
Disguise.TreeSHP db "T01.TEM",0 ; "T01" hardcoded

@HACK 0x00562F86,0x00562F8C,_TechnoClass__Evaluate_Object_StaticDisguise
    jz   0x0056349C
    ; eax=technotype target, dl=techno RTTI, esi=techno
    cmp  byte[esi+TechnoClass.Offset.StaticDisguiseShimmer],MIRAGE_THRESHOLD
    jge  0x0056349C ; invalid target
    jmp  0x00562F8C
@ENDHACK


@HACK 0x005644A1,0x005644A7,_TechnoClass__AI_UpdateStaticDisguise
    ; ecx=techno, eax, ebx, edx are free to use
    test byte[ecx+FootClass.Offset.IsDriving],1<<(FootClass.Bit.IsDriving-1)
    jnz  .Reveal
    AbstractClass.RTTI.Get(ecx,dl)
    cmp  dl,RTTIType.Infantry
    je   .CheckInfantry  
    cmp  dl,RTTIType.Unit
    je   .CheckUnit  
    jmp  .Ret

.CheckInfantry:
    InfantryClass.Class.Get(ecx,eax)
    InfantryTypeClass.FromIndex(eax,ebx)
    test byte[ebx+InfantryTypeClass.Offset.IsStaticDisguise],1<<(InfantryTypeClass.Bit.IsStaticDisguise-1)
    jz   .Ret
    jmp  .Mirage

.CheckUnit:
    UnitClass.Class.Get(ecx,eax)
    UnitTypeClass.FromIndex(eax,ebx)
    test byte[ebx+UnitTypeClass.Offset.IsStaticDisguise],1<<(UnitTypeClass.Bit.IsStaticDisguise-1)
    jz   .Ret
    ;jmp  .Mirage

.Mirage:
    cmp  byte[ecx+TechnoClass.Offset.StaticDisguiseShimmer],MIRAGE_TREE
    jge  .CheckAlwaysShimmer
    inc  byte[ecx+TechnoClass.Offset.StaticDisguiseShimmer]
.MarkChange:
    mov  ebx,[ecx+0x11]
    mov  edx,3 ; MARK_CHANGE_REDRAW
    mov  eax,ecx
    call [ebx+0x9C] ; Mark
    jmp  .Ret
.CheckAlwaysShimmer:
    ; Infantry does not have a tree effect, so alwyas shimmer instead
    cmp  dl,RTTIType.Infantry
    jne  .Ret  
    jmp  .MarkChange
.Reveal:
    cmp  byte[ecx+TechnoClass.Offset.StaticDisguiseShimmer],0
    jle  .Ret
    sub  byte[ecx+TechnoClass.Offset.StaticDisguiseShimmer],MIRAGE_MOVE_REDUCE
.Ret:
    lea  eax,[ecx+0x93]
    jmp  0x005644A7
@ENDHACK


@HACK 0x0057CA18,0x0057CA1E,_UnitClass__Draw_It_StaticDisguise_AsTree
    jz   0x0057CCEE
    ; esi=techno 
    cmp  byte[esi+TechnoClass.Offset.StaticDisguiseShimmer],MIRAGE_TREE
    jge  .SeeTree
    cmp  byte[esi+TechnoClass.Offset.StaticDisguiseShimmer],MIRAGE_UNIT_SHIMMER
    jl   0x0057CA1E ; Ret (draw normal unit)
    cmp  byte[esi+TechnoClass.Offset.StaticDisguiseShimmer],MIRAGE_TREE_SHIMMER
    jl   .SeeTreeShimmer
    mov  eax,0x330
    jmp  .DrawTree
.SeeTreeShimmer:
    mov  eax,0x230 ; SHAPE_PREDATOR
    jmp  .DrawTree
.SeeTree:
    mov  eax,0x1030
.DrawTree:
    mov  dword [0x006A1788],1
    push 0x100
    push 0
    push 0x00657CE4
    push 0x00657CE0
    push eax
    mov  byte cl,[ebp-0x10]
    movsx eax,cl
    push eax
    xor  edi,edi
    mov  eax,Disguise.TreeSHP
    mov  ecx,[ebp-0x48]
    mov  ebx,[ebp-0x4C]
    sub  ecx,0xC ; hardcoded shift
    add  ebx,0xC ; hardcoded shift
    xor  edx,edx
    call MFCD__Retrieve
    call Conquer___CC_Draw_Shape
    mov  dword [0x006A1788],0
    jmp  0x0057CCEE
@ENDHACK


@HACK 0x005672AF,0x005672B4,_TechnoClass__Techno_Draw_Object_PredatorEffect
    mov  ebx,[ebp-0x10]
    cmp  byte[ebx+TechnoClass.Offset.StaticDisguiseShimmer],MIRAGE_THRESHOLD
    jl   .Normal
    cmp  byte[ebx+TechnoClass.Offset.StaticDisguiseShimmer],MIRAGE_UNIT_SHADOW
    jl   .Shadow
    push 0x230
    jmp  0x005672B4
.Shadow:
    push 0x330
    jmp  0x005672B4
.Normal:
    push 0x1130
    jmp  0x005672B4
@ENDHACK
