;----------------------------------------------------------------
; src/features/type_extensions/HouseTypeClass/housetypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

;_HouseTypeClass__Init_Heap_NewSize (one for each of the 20 originally allocated houses)
; SETD only accepts constants, not HouseTypeClass.NEW_SIZE
@SETD 0x004CB854 0x14A
@SETD 0x004CB98E 0x14A
@SETD 0x004CBAC8 0x14A
@SETD 0x004CBC02 0x14A
@SETD 0x004CBD3C 0x14A
@SETD 0x004CBE76 0x14A
@SETD 0x004CBFB0 0x14A
@SETD 0x004CC0EA 0x14A
@SETD 0x004CC224 0x14A
@SETD 0x004CC35E 0x14A
@SETD 0x004CC498 0x14A
@SETD 0x004CC5D2 0x14A
@SETD 0x004CC70C 0x14A
@SETD 0x004CC846 0x14A
@SETD 0x004CC980 0x14A
@SETD 0x004CCABA 0x14A
@SETD 0x004CCBF4 0x14A
@SETD 0x004CCD2E 0x14A
@SETD 0x004CCE68 0x14A
@SETD 0x004CCFA2 0x14A

;TFixedIHeapClass_HouseTypeClass___Constructor
@SETD 0x004C9026 0x14A

;TFixedIHeapClass_HouseTypeClass___Save()
@SETD 0x004D0764 0x14A

;TFixedIHeapClass_HouseTypeClass___Load()
@HOOK 0x004D0860 _TFixedIHeapClass__HouseTypeClass__Load_Clear_Memory
@SETD 0x004D0846 0x14A


_TFixedIHeapClass__HouseTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,HouseTypeClass.NEW_SIZE,HouseTypeClass.ORIGINAL_SIZE
.Ret:
    mov  dword[esi+0x21],0x005FA8A8
    jmp  0x004D0867


