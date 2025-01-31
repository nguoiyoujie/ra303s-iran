;----------------------------------------------------------------
; src/features/extra_multiplayer_countries.asm
;
; Allows the selection of the 8 major countries in skirmish and network menus.
; 
; This function is not configurable at the moment
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

%define Extract_String                    0x005C5070
%define SystemStrings                    0x0066991C
%define DropListClass__Add_Item            0x004B8628


@SJMP 0x0054AC83,0x0054ACA3 ;_SessionClass_Jump_Over_Side_Bounds_Check

@HACK 0x0051290B,0x00512910,_Skirmish_Dialog_DropList_Increase_Drop_List_Display_Size
    mov  esi,0x70
    jmp  0x00512910
@ENDHACK


@HACK 0x00506C28,0x00506C30,_Net_Join_Dialog_DropList_Increase_Drop_List_Display_Size
    call MFCD__Retrieve
    push eax
    push 0x70
    jmp  0x00506C30
@ENDHACK


@HACK 0x005070FE,0x00507107,_Net_Join_Dialog_DropList_Set_Index_Fixup
    lea  eax,[ebp-0xBDC]
    cmp  edx,1
    jg   .Jump_Add
    add  edx,8
.Jump_Add:
    sub  edx,2
    jmp  0x00507107
@ENDHACK


@HACK 0x0050892F,0x00508934,_Net_Join_Dialog_DropList_Set_Index_Fixup2
    push eax
    cmp  eax,8
    je   .Ret_Custom
    cmp  eax,9
    je   .Ret_Custom
    jmp  .Ret
.Ret_Custom:
    add  esp,4
    sub  eax,8
    mov  [0x0067F314],al
    jmp  0x00508934
.Ret:
    pop  eax
    mov  [0x0067F314],al
    jmp  0x00508934
@ENDHACK


@HACK 0x00508C3F,0x00508C44,_Net_Join_Dialog_DropList_Set_Index_Fixup3
    push eax
    cmp  eax,8
    je   .Ret_Custom
    cmp  eax,9
    je   .Ret_Custom
    jmp  .Ret
.Ret_Custom:
    add  esp,4
    sub  eax,8
    mov  [0x0067F314],al
    jmp  0x00508C44
.Ret:
    pop  eax
    mov  [0x0067F314],al
    jmp  0x00508C44
@ENDHACK


; We added greece and spain to the end, if they're selected the
; wrong countries, we need to fix up the index to get the right country
@HACK 0x00508759,0x0050875E,_Net_Join_Dialog_DropList_Get_Index_Fixup
    push eax
    cmp  eax,8
    je   .Ret_Custom
    cmp  eax,9
    je   .Ret_Custom
    jmp  .Ret
.Ret_Custom:
    add  esp,4
    sub  eax,8
    mov  [0x0067F314],al
    jmp  0x0050875E
.Ret:
    pop  eax
    mov  [0x0067F314],al
    jmp  0x0050875E
@ENDHACK


; 371 = Spain, 374 = Greece
@HACK 0x005070F5,_Net_Join_Dialog_DropList_Add_Greece_Spain
    mov  edx,[0x0067F30F+2]
    push edx
    mov  eax,[SystemStrings]
    mov  edx,371
    call Extract_String
    mov  edx,eax
    lea  eax,[ebp-0xBDC]
    call DropListClass__Add_Item
    mov  eax,[SystemStrings]
    mov  edx,374
    call Extract_String
    mov  edx,eax
    lea  eax,[ebp-0xBDC]
    call DropListClass__Add_Item
    pop  edx
    jmp  0x005070FB
@ENDHACK


@HACK 0x005070BF,0x005070C5,_Net_Join_Dialog_DropList_Add_Amount
    mov  [ebp-0x1C],cl
    cmp  cl,7 ;7
    jmp  0x005070C5
@ENDHACK


@HACK 0x005133A8,0x005133B0,_Skirmish_Dialog_DropList_Set_Index_Fixup
    cmp  edx,1
    jg   .Jump_Add
    add  edx,8
.Jump_Add:
    sub  edx,2
    mov  ebx,1
    jmp  0x005133B0
@ENDHACK


; We added greece and spain to the end, if they're selected the
; wrong countries, we need to fix up the index to get the right country
@HACK 0x00514686,0x0051468B,_Skirmish_Dialog_DropList_Get_Index_Fixup
    push eax
    cmp  eax,8
    je   .Ret_Custom
    cmp  eax,9
    je   .Ret_Custom
    jmp  .Ret
.Ret_Custom:
    add  esp,4
    sub  eax,8
    mov  [0x0067F314],al
    jmp  0x0051468B
.Ret:
    pop  eax
    mov  [0x0067F314],al
    jmp  0x0051468B
@ENDHACK


@HACK 0x00513363,0x00513369,_Skirmish_Dialog_DropList_Add_Amount
    mov  [ebp-0x20],ch
    cmp  ch,7
    jmp  0x00513369
@ENDHACK


; 371 = Spain, 374 = Greece
@HACK 0x00513399,0x0051339F,_Skirmish_Dialog_DropList_Add_Greece_Spain
    mov  edx,[0x0067F30F+2]
    push edx
    mov  eax,[SystemStrings]
    mov  edx,371
    call Extract_String
    mov  edx,eax
    lea  eax,[ebp-0xC64]
    call DropListClass__Add_Item
    mov  eax,[SystemStrings]
    mov  edx,374
    call Extract_String
    mov  edx,eax
    lea  eax,[ebp-0xC64]
    call DropListClass__Add_Item
    pop  edx
    jmp  0x0051339F
@ENDHACK
