population = ds_list_size(people)

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