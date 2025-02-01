; TO-DO: Figure out what this code does

; AUTO:004A9CF0     TechnoTypeClass * Fetch_Techno_Type(RTTIType,int) proc near
; AUTO:004BF368     TechnoClass * const FactoryClass::Get_Object(void)const  proc near

; First data member of a TechnoClass object is it's RTTIType, we grab this and grab the TechnoTypeClass, then compare it with the TechnoTypeClass of the cameo being processed in the StripClass::Draw_It() function. If they differ we need to set the "IsBeingBuilt" data member of the TechnoTypeClass to 0xFFFFFFFF to signal the game the object isn't being built.

; Need to also check "Hack_Prevented" local function variable because I patch out a check whether a factory for a TechnoTypeClass actually exists.

extern FactoryClass__Get_Object
extern HouseClass__Fetch_Factory
extern Globals___PlayerPtr


@CLEAR 0x0054EA80,0x90,0x0054EA82 ; was 0x0054EA81,why not 0x0054EA82... 

; eax = 1,"being built" is set to true,eax = 0xFFFFFFFF,"being built" is set to false
Set_Is_Being_Built:
    push eax
    mov  eax,[ebp-0x44]
    lea  eax,[eax+eax*8]
    cmp  byte[esi+eax+0x3D],0xE
    mov  edx,[ebp-0x48]
    mov  edx,[edx+0x21]
    mov  eax,[ebp-0x48]
    call dword[edx+0x30]
    mov  edi,eax
    mov  eax,[ebp-0x44]
    lea  eax,[eax+eax*8]
    add  eax,esi
    xor  ecx,ecx
    pop  edx
    mov  dword[eax+0x3E],edx  ; is being built check?
    retn

@HACK 0x0054EA90,0x0054EA95,_SidebarClass__StripClass__Draw_It_Is_TechnoType_Being_Built_By_Its_Factory_Check
    Save_Registers

;    cmp dword[ebp-0x3C],1 ; Is hack prevented local variable
;    jz  .Hack_Prevented

    ; Get factory
    mov  edx,[ecx+0x3A]
    mov  dword eax,[Globals___PlayerPtr]
    sar  edx,0x18
    call HouseClass__Fetch_Factory

    ; If FactoryClass object is NULL goto .Hack_Prevented
    cmp  dword eax,0
    jz   .Hack_Prevented

    ; Get what's being built
    call FactoryClass__Get_Object

    ; If NULL,goto .Hack_Prevented
    cmp  dword eax,0
    jz   .Hack_Prevented

    ; Get the RTTIType
    mov  ecx,eax
    mov  byte al,[ecx] ; RTTIType
    mov  byte dl,[ecx+0x15C] ; ObjectType

    ; if RTTIType is 5 it's a building we need to set it to 6 and get ObjectType from a different offset
    cmp  byte al,RTTIType.Building
    jnz  .No_Change_For_Building_RTTIType
    mov  byte al,6
    mov  byte dl,[ecx+0xCD] ; ObjectType

.No_Change_For_Building_RTTIType:
    cmp  byte al,RTTIType.Infantry
    jnz  .No_Change_For_Infantry_RTTIType
    mov  byte dl,[ecx+0x141] ; ObjectType

.No_Change_For_Infantry_RTTIType:
    cmp  byte al,RTTIType.Aircraft
    jnz  .No_Change_For_Aircraft_RTTIType
    mov  byte dl,[ecx+0x146] ; ObjectType

.No_Change_For_Aircraft_RTTIType:
    ; Get the TechnoTypeClass
    call 0x004A9CF0    ; TechnoTypeClass * Fetch_Techno_Type(RTTIType,int)

    ; compare TechnoTypeClass returned with current TechnoTypeClass,if not the same goto .Hack_Prevented
    cmp  dword eax,[ebp-0x48]
    jnz  .Hack_Prevented

    mov  dword[ebp-0x3C],0 ; Hack_Prevented local function variable
    Restore_Registers
    jmp  0x0054EAA0

.Hack_Prevented:
    mov  dword eax,[ebp-0x48]
    ; Set that the current cameo isn't being built
    mov  eax,0xFFFFFFFF
    call Set_Is_Being_Built
.Ret:
    Restore_Registers
    cmp  dword[ebp-0x3C],1 ; Check if Hack_Prevented was set
    jz   0x0054EAA0
    call 0x004DE154 ; const HouseClass::Is_Hack_Prevented(RTTIType,int) ; causes crash with aircrafts
    jmp  0x0054EA95
@ENDHACK
