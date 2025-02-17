;----------------------------------------------------------------
; src/features/type_extensions/BulletTypeClass/bullettypeclass_heap_size.asm
;
; Allows for expansion of allocated memory. This in turn allows for new INI values to be implemented.
; 
; This function is enabled by default and is not configurable.
; 
; No compatibility issues is expected. However, changes to the allocated memory renders older savegames incompatible. It is generally a good idea to allocate more than is needed to avoid that incompatibility
;
;----------------------------------------------------------------

cextern BulletTypeClass.ORIGINAL_SIZE
cextern BulletTypeClass.NEW_SIZE

;Read INI settings
@SET 0x00426AE0,{mov eax,BulletTypeClass.NEW_SIZE} ; BulletTypeClass__Init_Heap
@SET 0x00426AF8,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426B10,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426B28,{mov eax,BulletTypeClass.NEW_SIZE}  
@SET 0x00426B40,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426B58,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426B70,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426B88,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426BA0,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426BB8,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426BD0,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426BE8,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426C00,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426C18,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426C30,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426C48,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426C60,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x00426C78,{mov eax,BulletTypeClass.NEW_SIZE} 
@SET 0x004C7475,{mov edx,BulletTypeClass.NEW_SIZE} ; fn_init
@SET 0x004C9465,{mov edx,BulletTypeClass.NEW_SIZE} ; TFixedIHeapClass_BulletTypeClass___Constructor
@SET 0x004D0F53,{mov ebx,BulletTypeClass.NEW_SIZE} ; TFixedIHeapClass_BulletTypeClass___Save
@SET 0x004D1035,{mov ebx,BulletTypeClass.NEW_SIZE} ; TFixedIHeapClass_BulletTypeClass___Load


@HACK 0x004D104C,0x004D1057,_TFixedIHeapClass__BulletTypeClass__Load_Clear_Memory
    Clear_Extended_Class_Memory_For_Old_Saves ecx,BulletTypeClass.NEW_SIZE,BulletTypeClass.ORIGINAL_SIZE
.Ret:
    test esi,esi
    jz   0x004D1057
    mov  dword[esi+0x21],0x005F7078
    jmp  0x004D1057
@ENDHACK

