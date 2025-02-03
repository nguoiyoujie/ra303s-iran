;----------------------------------------------------------------
; src/features/ai_repair_singleplayer.asm
;
; AI doesn't repair reconstructed buildings in Singleplayer, even if [IQ] RepairSell values are met
; 
; This function is enabled by adding [AI] RepairConstructedBuildingsInSingleplayer=yes
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

cextern Globals___Session_Type

cextern Rules.AI.RepairConstructedBuildingsInSingleplayer


@HACK 0x00460073,0x0046007A,_BuildingClass_Repair_AI_SingleplayerRepair
    cmp  dword[InCoopMode],1 ; inherited from coop mode
    je   0x0046007C
    cmp  byte[Rules.AI.RepairConstructedBuildingsInSingleplayer],1
    je   0x00460089
.OrginalCode:
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jmp  0x0046007A
@ENDHACK


@HACK 0x0045FF34,0x0045FF3B,_BuildingClass_Repair_AI_Singleplayer_Sellback
    cmp  dword[InCoopMode],1 ; inherited from coop mode
    je   0x00460176
    cmp  byte[Rules.AI.RepairConstructedBuildingsInSingleplayer],1
    je   0x0045FF41
.OrginalCode:
    cmp  byte[Globals___Session_Type],GameType.GAME_NORMAL
    jmp  0x0045FF3B
@ENDHACK
