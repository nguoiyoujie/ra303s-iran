; unused

;@HACK 0x00567343,0x00567348,_TechnoClass__Remap_Table_Building_Check
;    cmp  dword[eax+0x93],2
;    jne  .Ret_Normal
;    cmp  dword[eax+0x10],0x5F73E000
;    jne  .Ret_Custom_Building_Unit_Scheme
;.Ret_Normal:
;    mov  edx,eax
;    mov  ebx,[eax+0x11]
;    jmp  0x00567348
;.Ret_Custom_Building_Colour_Scheme:
;;    mov        eax,0x00666B3E ; Red colour remap
;    mov  eax,0x0066690A ; Civilian yellow colour remap
;    jmp  0x005673A1
;.Ret_Custom_Building_Unit_Scheme:
;    mov  eax,0x00666A24 ; blue remap
;;    mov        eax,ColorRemaps.ExtendedColors+ColorRemaps.Black.Offset
;    jmp  0x005673A1
;@ENDHACK
