;----------------------------------------------------------------
; src/defines/fixediheapclass_templates.asm
;
; Constants to access AnimTypeClass offsets
;
;----------------------------------------------------------------

; FixedHeapClass
;   size 0x??
;     unsigned IsAllocated:1  offset 0
;     int Size offset 4
;     int TotalCount offset 8
;     int ActiveCount offset 12
;     void* array Buffer offset 16
;     ? FreeFlag offset 20

; FixedIHeapClass
;   size 0x4C
;     FixedHeapClass 
;     + DynamicVectorClass<void *> ActivePointers (
;        void * * Vector 
;        unsigned VectorMax
;        unsigned IsAllocated:1
;        int ActiveCount 
;        int GrowthStep 

; Note: %assign doesn't work with certain hexadecimal prefixes (the letter ones). Better to use 0x00 format throughout 
