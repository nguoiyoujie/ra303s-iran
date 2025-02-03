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
@SET 0x004CB853,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CB98D,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CBAC7,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CBC01,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CBD3B,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CBE75,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CBFAF,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CC0E9,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CC223,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CC35D,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CC497,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CC5D1,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CC70B,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CC845,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CC97F,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CCAB9,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CCBF3,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CCD2D,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CCE67,{mov eax,HouseTypeClass.NEW_SIZE}
@SET 0x004CCFA1,{mov eax,HouseTypeClass.NEW_SIZE}

;fn_Init
@SET 0x004C73B3,{mov edx,HouseTypeClass.NEW_SIZE}

;TFixedIHeapClass_HouseTypeClass___Constructor
@SET 0x004C9025,{mov edx,HouseTypeClass.NEW_SIZE}

;TFixedIHeapClass_HouseTypeClass___Save()
@SET 0x004D0763,{mov ebx,HouseTypeClass.NEW_SIZE}

;TFixedIHeapClass_HouseTypeClass___Load()
@SET 0x004D0845,{mov ebx,HouseTypeClass.NEW_SIZE}


@HACK 0x004D0860,0x004D0867,_TFixedIHeapClass__HouseTypeClass__Load_Clear_Memory
    Clear_Extended_Class_Memory_For_Old_Saves ecx,HouseTypeClass.NEW_SIZE,HouseTypeClass.ORIGINAL_SIZE
.Ret:
    mov  dword[esi+0x21],0x005FA8A8
    jmp  0x004D0867
@ENDHACK

