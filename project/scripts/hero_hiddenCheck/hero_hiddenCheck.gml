for(var h=0;h<array_height_2d(personController.heros);h++) {
	switch(h)
	{
		case hero.adelyn:
		case hero.thomas:
			if player.value >= 500 heros[h, hero_hidden] = false
		break
		case hero.aaronwright:
		case hero.chicocrypto:
			if player.value >= 2500 heros[h, hero_hidden] = false
		break
		case hero.cz:
		case hero.krown:
		case hero.pomp:
		case hero.coventry:
			if player.value >= 4500 heros[h, hero_hidden] = false
		break
		case hero.andreas:
			if heros[hero.pomp, hero_acquired] heros[h, hero_hidden] = false
		break
		case hero.satoshi:
			if heros[hero.andreas, hero_acquired] heros[h, hero_hidden] = false
		break
		case hero.sergey:
			if heros[hero.coventry, hero_acquired] heros[h, hero_hidden] = false
		break	
		case hero.vitalik:
			if player.value >= 8500 heros[h, hero_hidden] = false
		break
		//case hero.gaben:
		//	if player.value >= 5500 heros[h, hero_hidden] = false
		//break
	}
}