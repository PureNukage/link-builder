population = ds_list_size(people)

//	DEBUG Spawn a person
if input.keypress_p {
	//	Choose a random personSpawner
	var index = irandom_range(0,3)
	var _spawner = spawners[| index]
	var _x = _spawner.x
	var _y = _spawner.y
	
	var _person = instance_create_layer(_x,_y,"Instances",person)
}

var _needed_population = 0
//	calculate needed population
if instance_exists(contracts) and !ds_list_empty(contracts.contracts_online) {
	var list_size = ds_list_size(contracts.contracts_online)
	for(var i=0;i<ds_list_size(contracts.contracts_online);i++) {
		var Contract = contracts.contracts_online[| i]
		if contracts.contract[contracts.contracts_online[| i], contract_reliability] > 50 {
			_needed_population += contracts.contract[contracts.contracts_online[| i], contract_traffic]
		}
	}
	needed_population = _needed_population
}

//	spawn a person if we need more
if needed_population > population { 
	
	//	Choose a random personSpawner
	var index = irandom_range(0,3)
	var _spawner = spawners[| index]
	var _x = _spawner.x
	var _y = _spawner.y
	
	var _person = instance_create_layer(_x,_y,"Instances",person)
	
}

////	Heros 
//	Hero speech
if heros_talking < heros_talking_max canTalk = true else canTalk = false

//	Heros spawn
if time.stream >= hero_check_timer {
	hero_check_time = time.stream + hero_check_timer
	for(var h=0;h<array_height_2d(heros);h++) {
		var hidden = heros[h, hero_hidden]
		var acquired = heros[h, hero_acquired]
		var ID = heros[h, hero_id]
		//if !hidden {
			var amount = 0
			var required = -1
			switch(h) {
				case hero.rory:
					var required = 2
					if instance_exists(kiosk) with kiosk {
						if contracts.contract[smartcontract, contract_online] {
							if contracts.contract[smartcontract, contract_name] == "Cerberus Wallet 2FA" {
								amount++
							}
							if contracts.contract[smartcontract, contract_name] == "Backerr" {
								amount++
							}
						}
					}
				break
				case hero.adelyn:
					var required = 5
					if instance_exists(kiosk) with kiosk {
						if contracts.contract[smartcontract, contract_online] {
							if contracts.contract[smartcontract, contract_name] == "LinkPal" amount++
							if contracts.contract[smartcontract, contract_name] == "BountiBot" amount++
							if contracts.contract[smartcontract, contract_name] == "Smart Marketing Campaign" amount++
							if contracts.contract[smartcontract, contract_name] == "TokenSet" amount++
						}
					}
					if heros[hero.rory, hero_acquired] amount++
				break
				case hero.thomas:
					var required = 3
					if instance_exists(kiosk) with kiosk {
						if contracts.contract[smartcontract, contract_name] == "ETH/USD Price Feed" {
							for(var d=0;d<ds_list_size(data_held);d++) {
								var data_index = data_held[| d]
								var data_name = shop.item_data[data_index, item_name]
								if is_price(data_name) and is_price(data_name,true) == "ETH/USD" {
									amount++	
								}
							}
						}
					}
				break
				case hero.chicocrypto:
					var required = 1
					if instance_exists(kiosk) with kiosk {
						if contracts.contract[smartcontract, contract_name] == "Revenue Share" 
						and contracts.contract[smartcontract, contract_online] {
							amount++
						}
					}
				break
				case hero.cz:
					var required = 3
					if instance_exists(data) with data {
						if states == states.placed {
							var name = shop.item_data[data_generated, item_name]
							if string_pos("Binance",name) != 0 {
								amount++
							}
						}
					}
				break
				case hero.aaronwright:
					var required = 1
					if instance_exists(kiosk) with kiosk {
						if contracts.contract[smartcontract, contract_name] == "OpenLaw" 
						and contracts.contract[smartcontract, contract_online] {
							amount++
						}
					}
				break
				case hero.krown:
					var required = 2
					if instance_exists(kiosk) with kiosk {
						if contracts.contract[smartcontract, contract_online] and 
						(contracts.contract[smartcontract, contract_name] == "Loopring"
						or contracts.contract[smartcontract, contract_name] == "Synthetix") {
							amount++	
						}
					}
				break
				case hero.gaben:
					var required = 1
					if instance_exists(kiosk) with kiosk {
						if contracts.contract[smartcontract, contract_online]
						and contracts.contract[smartcontract, contract_name] == "eSports Tournament" {
							amount++	
						}
					}
				break
				case hero.duck:
					var required = 1
					if instance_exists(kiosk) with kiosk {
						if contracts.contract[smartcontract, contract_online]
						and contracts.contract[smartcontract, contract_name] == "OpenLaw" {
							amount++	
						}
					}	
					
				break
				case hero.pepe:
					var required = 1
					if player.link >= 1000 amount++
				break
			}	
		
			//	This hero is (or should be) active!
			if required > -1 and amount > 0 and amount >= required {
				hero_activate(h)
			}
			//	This hero should not be active
			//if amount < required {
			//	hero_deactivate(h)
			//}
		//}
	
	}
}

hero_newCheck()
hero_hiddenCheck()


//	make sure personSpawners are in the right spot 
for(var i=0;i<4;i++) {
	switch(i)
	{
		case 0:		//	Right
			
			var _xx = room_width + 256
			var _yy = room_height/2
			
		break
		case 1:		//	Bottom
		
			var _xx = room_width/2
			var _yy = room_height + 256
		
		break
		case 2:		//	Left
		
			var _xx = -256
			var _yy = room_height/2
		
		break
		case 3:		//	Top
		
			var _xx = room_width/2
			var _yy = -256
		
		break
	}
}