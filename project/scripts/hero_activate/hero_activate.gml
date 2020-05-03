///@param index

var index = argument[0]

if heros[index, hero_id] == -1 and index != hero.duck and !heros[index, hero_acquired] {
	if instance_exists(person) { with person {
		if hero == -1 and other.heros[index, hero_id] == -1 {
			other.heros[index, hero_acquired] = true
			other.heros[index, hero_new] = false
			other.heros[index, hero_hidden] = false
			with personController debug_log("Hero "+string(heros[index, hero_name])+" is being placed into Person "+string(other.id))
			hero = index
			other.heros[index, hero_id] = id
			if other.heros[index, hero_virgin] {
				other.heros[index, hero_virgin]	= false
				other.new_hero = true
			}
		}
	}} else {
		//debug_log("ERROR No People exist. Acquiring hero anyways")
	}
}

if index == hero.duck {
	var amount = 0
	var ducks = 0
	var free_people = 0
	//	How many ducks should we have?
	if instance_exists(kiosk) with kiosk {
		if contracts.contract[smartcontract, contract_online]
		and contracts.contract[smartcontract, contract_name] == "OpenLaw" {
			amount++	
		}
	}
	//	How many ducks do we have?
	for(var d=0;d<ds_list_size(personController.people);d++) {
		var Person = personController.people[| d]
		if Person.hero == hero.duck ducks++
		if Person.hero == -1 free_people++
	}
	if amount > ducks and free_people >= (amount-ducks) and instance_exists(person) {
		while amount > 0 {
			with person if hero == -1 and amount > 0 {
				other.heros[index, hero_acquired] = true
				other.heros[index, hero_hidden] = false
				hero = hero.duck
				with personController debug_log("Hero "+string(heros[index, hero_name])+" is being placed into Person "+string(other.id))
				
				
				if other.heros[index, hero_virgin] {
					other.heros[index, hero_virgin]	= false
					other.new_hero = true
				}
				amount--
			}
		}
	}
}

