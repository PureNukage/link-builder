///@param index

var index = argument[0]

switch(index)
{
	case hero.rory:
		heros[hero.adelyn, hero_hidden] = false
		heros[hero.thomas, hero_hidden] = false
	break
	case hero.adelyn:
	case hero.thomas:
		if heros[hero.adelyn, hero_acquired] and heros[hero.thomas, hero_acquired] {
			heros[hero.chicocrypto, hero_hidden] = false
			heros[hero.cz, hero_hidden] = false
		}
	break
	case hero.chicocrypto:
	case hero.cz:
		if heros[hero.chicocrypto, hero_acquired] and heros[hero.cz, hero_acquired] {
			heros[hero.duck, hero_hidden] = false
			heros[hero.pepe, hero_hidden] = false
		}
	break
}

hero_newCheck()