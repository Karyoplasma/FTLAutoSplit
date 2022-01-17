state("FTLGame")
{
	int gameOver: 0x00513C3C;
	int sectorJumps: 0x005139CC;
	int totalJumps: 0x005139B0;
	int menuState: 0x00516000;
}

start
{
	if (current.totalJumps == 1 && current.sectorJumps == 1 && current.menuState == 0){
		return true;
	}
}

split
{
	if (current.sectorJumps == 1 && old.sectorJumps != 1){
		return true;
	}

	return (current.gameOver == 1);
}