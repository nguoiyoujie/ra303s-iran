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
@SETD 0x004CB854 HouseTypeClass.NEW_SIZE
@SETD 0x004CB98E HouseTypeClass.NEW_SIZE
@SETD 0x004CBAC8 HouseTypeClass.NEW_SIZE
@SETD 0x004CBC02 HouseTypeClass.NEW_SIZE
@SETD 0x004CBD3C HouseTypeClass.NEW_SIZE
@SETD 0x004CBE76 HouseTypeClass.NEW_SIZE
@SETD 0x004CBFB0 HouseTypeClass.NEW_SIZE
@SETD 0x004CC0EA HouseTypeClass.NEW_SIZE
@SETD 0x004CC224 HouseTypeClass.NEW_SIZE
@SETD 0x004CC35E HouseTypeClass.NEW_SIZE
@SETD 0x004CC498 HouseTypeClass.NEW_SIZE
@SETD 0x004CC5D2 HouseTypeClass.NEW_SIZE
@SETD 0x004CC70C HouseTypeClass.NEW_SIZE
@SETD 0x004CC846 HouseTypeClass.NEW_SIZE
@SETD 0x004CC980 HouseTypeClass.NEW_SIZE
@SETD 0x004CCABA HouseTypeClass.NEW_SIZE
@SETD 0x004CCBF4 HouseTypeClass.NEW_SIZE
@SETD 0x004CCD2E HouseTypeClass.NEW_SIZE
@SETD 0x004CCE68 HouseTypeClass.NEW_SIZE
@SETD 0x004CCFA2 HouseTypeClass.NEW_SIZE

;fn_Init
@SETD 0x004C73B4 HouseTypeClass.NEW_SIZE

;TFixedIHeapClass_HouseTypeClass___Constructor
@SETD 0x004C9026 HouseTypeClass.NEW_SIZE

;TFixedIHeapClass_HouseTypeClass___Save()
@SETD 0x004D0764 HouseTypeClass.NEW_SIZE

;TFixedIHeapClass_HouseTypeClass___Load()
@HOOK 0x004D0860 _TFixedIHeapClass__HouseTypeClass__Load_Clear_Memory
@SETD 0x004D0846 HouseTypeClass.NEW_SIZE


_TFixedIHeapClass__HouseTypeClass__Load_Clear_Memory:
    Clear_Extended_Class_Memory_For_Old_Saves ecx,HouseTypeClass.NEW_SIZE,HouseTypeClass.ORIGINAL_SIZE
.Ret:
    mov  dword[esi+0x21],0x005FA8A8
    jmp  0x004D0867


