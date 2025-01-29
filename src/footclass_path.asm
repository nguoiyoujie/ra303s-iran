@LJMP 0x004C0A88, _FootClass__BasicPath_AlwaysPathToExactNavCom

_FootClass__BasicPath_AlwaysPathToExactNavCom:
    ; BasicPath had a distance check against StrayDistance or CloseEnoughDistance. 
	; This may prevent a move from being initiated if the destination is too close. 
	; Remove it, and rely on the game to check only when the unit is blocked
    jmp  0x004C0A8E