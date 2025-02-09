;----------------------------------------------------------------
; src/features/techno_deploy_to_fire.asm
;
; A weapon can be set to deploy to fire. This allows dummy weapons to be given to units in order to use their deploy functionality
; The unit will move to bring the target within the weapon range before it uses the deploy function.
; 
; This function is enabled by setting the weapon to DeployToFire=yes.
;
; No compatibility issues is expected.
;
;----------------------------------------------------------------

@HACK 0x00565330,0x00565336,_TechnoClass__Fire_At_DeployToFire
    push eax
    mov  ecx,eax
    WeaponTypeClass.DeployToFire.Get(ecx,al)
    test al,al
    jz   .Ret
    mov  eax,[ebp-0x18] ; TechnoClass
    mov  byte[eax+MissionClass.Offset.MisisonQueue],MissionType.MISSION_UNLOAD ; Queue?
    jmp  0x0056583A
.Ret:
    pop  eax
    mov  ecx,[0x0065D7E8]
    jmp  0x00565336
@ENDHACK
