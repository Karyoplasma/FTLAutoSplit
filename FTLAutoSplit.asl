state("FTLGame")
{
	bool gameOver: 0x00513C3C;
	int sectorJumps: 0x005139CC;
	int totalJumps: 0x005139B0;
	bool menuState: 0x00516000;
	int flagShipPhase: 0x00513020, 0xC, 0x4, 0x160;
}

start
{
	if (current.totalJumps == 1 && current.sectorJumps == 1 && !current.menuState){
		return true;
	}
}

split
{
	if (current.sectorJumps == 1 && old.sectorJumps != 1){
		return true;
	}
	if (old.flagShipPhase == 1 && current.flagShipPhase == 2){
		return true;
	}
	if (old.flagShipPhase == 2 && current.flagShipPhase == 3){
		return true;
	}
	return (current.gameOver && current.flagShipPhase == 3);
}