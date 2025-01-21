;----------------------------------------------------------------
; src/features/type_extensions/HouseTypeClass/housetypeclass_new_types.asm
;
; Allocate new HouseTypeClass.
; The new houses are named 'Multi9' to 'Multi20', filling the roster to a total of 32 houses. 
; This is the maximum that can be supported by the game logic without radical changes (32-bit fields)
; 
; This function is not configurable.
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

@HOOK 0x004CB760 _HouseTypeClass__AddNewHouseTypes
@HOOK 0x004CD0DB _HouseTypeClass__Init_Heap_AddNewHouseTypes
;@CLEAR 0x004F4095 HouseTypeClass.NEW_COUNT 0x004F4096 ; void Init_Game(void), set heap // alaredy hooked by _Init_Game_Early_RULES_INI_Load
@HOOK 0x00537513 _RulesClass__Objects_ReadIni_Fix

_RulesClass__Objects_ReadIni_Fix:
    mov  edx,ebx
    call HouseTypeClass__Read_INI
    jmp  0x00537518


_HouseTypeClass__AddNewHouseTypes:
;Multi9
    push 0x4d
    push 0x7
    mov  edx,0x14 ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi9
    push str_MP9
    mov  eax,HouseTypeClass.Multi9
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi10
    push 0x4d
    push 0x7
    mov  edx,0x15 ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi10
    push str_MP10
    mov  eax,HouseTypeClass.Multi10
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi11
    push 0x4d
    push 0x7
    mov  edx,0x16 ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi11
    push str_MP11
    mov  eax,HouseTypeClass.Multi11
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi12
    push 0x4d
    push 0x7
    mov  edx,0x17 ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi12
    push str_MP12
    mov  eax,HouseTypeClass.Multi12
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi13
    push 0x4d
    push 0x7
    mov  edx,0x18 ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi13
    push str_MP13
    mov  eax,HouseTypeClass.Multi13
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi14
    push 0x4d
    push 0x7
    mov  edx,0x19 ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi14
    push str_MP14
    mov  eax,HouseTypeClass.Multi14
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi15
    push 0x4d
    push 0x7
    mov  edx,0x1A ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi15
    push str_MP15
    mov  eax,HouseTypeClass.Multi15
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi16
    push 0x4d
    push 0x7
    mov  edx,0x1B ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi16
    push str_MP16
    mov  eax,HouseTypeClass.Multi16
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi17
    push 0x4d
    push 0x7
    mov  edx,0x1C ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi17
    push str_MP17
    mov  eax,HouseTypeClass.Multi17
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi18
    push 0x4d
    push 0x7
    mov  edx,0x1D ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi18
    push str_MP18
    mov  eax,HouseTypeClass.Multi18
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi19
    push 0x4d
    push 0x7
    mov  edx,0x1E ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi19
    push str_MP19
    mov  eax,HouseTypeClass.Multi19
    mov  dword [0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;Multi20
    push 0x4d
    push 0x7
    mov  edx,0x1F ;ID
    push 0
    mov  ecx,0x15 ;TXT_CIVILIAN
    mov  ebx,str_Multi20
    push str_MP20
    mov  eax,HouseTypeClass.Multi20
    mov  dword[0x006018B4],edx
    call HouseTypeClass__HouseTypeClass
;End
; move array pointer at 0x006018B0 to new location
    mov  eax,dword[0x006018B0]
    mov  ecx,0
.Fill:
    mov  edx,dword[eax+ecx*4]
    mov  dword[HouseTypeClass.DestructorPtrs+ecx*4],edx
    inc  ecx
    cmp  ecx,0x14 * 2
    jl   .Fill

    mov  dword[HouseTypeClass.DestructorPtrs-0x14*8],0x004CD4F0 ; HouseTypeClass::~HouseTypeClass(void)
    mov  dword[HouseTypeClass.DestructorPtrs-0x14*8+4],HouseTypeClass.Multi9
    mov  dword[HouseTypeClass.DestructorPtrs-0x15*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x15*8+4],HouseTypeClass.Multi10
    mov  dword[HouseTypeClass.DestructorPtrs-0x16*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x16*8+4],HouseTypeClass.Multi11
    mov  dword[HouseTypeClass.DestructorPtrs-0x17*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x17*8+4],HouseTypeClass.Multi12
    mov  dword[HouseTypeClass.DestructorPtrs-0x18*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x18*8+4],HouseTypeClass.Multi13
    mov  dword[HouseTypeClass.DestructorPtrs-0x19*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x19*8+4],HouseTypeClass.Multi14
    mov  dword[HouseTypeClass.DestructorPtrs-0x1A*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x1A*8+4],HouseTypeClass.Multi15
    mov  dword[HouseTypeClass.DestructorPtrs-0x1B*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x1B*8+4],HouseTypeClass.Multi16
    mov  dword[HouseTypeClass.DestructorPtrs-0x1C*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x1C*8+4],HouseTypeClass.Multi17
    mov  dword[HouseTypeClass.DestructorPtrs-0x1D*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x1D*8+4],HouseTypeClass.Multi18
    mov  dword[HouseTypeClass.DestructorPtrs-0x1E*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x1E*8+4],HouseTypeClass.Multi19
    mov  dword[HouseTypeClass.DestructorPtrs-0x1F*8],0x004CD4F0
    mov  dword[HouseTypeClass.DestructorPtrs-0x1F*8+4],HouseTypeClass.Multi20

    mov  dword[0x006018B0],HouseTypeClass.DestructorPtrs
    mov  dword[0x006018B4],HouseTypeClass.NEW_COUNT 
    jmp  0x004CB76A


_HouseTypeClass__Init_Heap_AddNewHouseTypes:
    HouseTypeClass.new HouseTypeClass.Multi9,0x14
    HouseTypeClass.new HouseTypeClass.Multi10,0x15
    HouseTypeClass.new HouseTypeClass.Multi11,0x16
    HouseTypeClass.new HouseTypeClass.Multi12,0x17
    HouseTypeClass.new HouseTypeClass.Multi13,0x18
    HouseTypeClass.new HouseTypeClass.Multi14,0x19
    HouseTypeClass.new HouseTypeClass.Multi15,0x1A
    HouseTypeClass.new HouseTypeClass.Multi16,0x1B
    HouseTypeClass.new HouseTypeClass.Multi17,0x1C
    HouseTypeClass.new HouseTypeClass.Multi18,0x1D
    HouseTypeClass.new HouseTypeClass.Multi19,0x1E
    HouseTypeClass.new HouseTypeClass.Multi20,0x1F
.Ret:
    lea  esp,[ebp-0x10]
    pop  edi
    pop  esi
    jmp  0x004CD0E0


