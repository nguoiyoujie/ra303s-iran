;----------------------------------------------------------------
; src/fixes/invalid_techno_crash_fix.asm
;
; Fixes crash when an invalid Techno is invoked by some code. This might happen if the object is already deleted but information is still retained (for example as targets).
; Crash happens when Target_Legal checks were not performed on a target, and subsequent code tries to use it.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected.
;----------------------------------------------------------------

; Building check failures. Building exists but is being reset, return -1. Rather than trying to extract information and crashing, exit the process in such a case.
@SJMP 0x00405581,0x004055D1  ; AbstractClass__Distance
@SET 0x005626FE,{jz 0x0056278D}  ; TechnoClass__In_Range, exact 6 bytes
@SET 0x005627DC,{jz 0x0056286C}  ; TechnoClass__In_Range, exact 6 bytes
@SJMP 0x004C16D1,0x004C171E  ; FootClass__Approach_Target

@SJMP 0x0049EF1F,0x0049EF78  ; CellClass__Cell_Color
@SET 0x004EDA2B,{jz 0x004EDAD6}  ; InfantryClass__Can_Enter_Cell, exact 6 bytes


;<register holding possible techno object>
; returns eax=1 if legal, eax=0 otherwise
%macro Techno_Target_Legal_Check 1
    ; edx holds target, which is AABBBBBB, where AA is the RTTI and BBBBBB is the ID
    push edx
    mov  eax,%1
    test eax,eax ; check for TARGET_NONE
    jz   %%done
    ; get the object from target
    xor  edx,edx
    call 0x00555190 ; As_Object()
    test eax,eax ; check if it is object
    je   %%ret1 ; if not an object, it is valid (e.g. template layer)
  %%isTechno:
    ; Check IsActive
    mov  byte dl,[eax+0xD]
    test dl,1 ; bit
    jz   %%ret0
  %%ret1:
    mov  eax,1
    jmp  %%done
  %%ret0:
    xor  eax,eax
  %%done:
    pop  edx
%endmacro

; also consider non-buildings being invalid. Remastered seems to have this fix applied.
@HACK 0x005626BF,0x005626CF,_TechnoClass_In_Range_Do_Target_Legal_Check_1
    ; edx is the techno object
    Techno_Target_Legal_Check edx
    test eax,eax 
    jz   0x0056278D ; invalid target, go home
    jmp  0x005626CF ; valid target, continue
@ENDHACK
