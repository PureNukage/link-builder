population = ds_list_size(people)

var _needed_population = 0
//	calculate needed population
for(var i=0;i<ds_list_size(contracts.contracts_online);i++) {
	_needed_population += contracts.contract[contracts.contracts_online[| i], contract_traffic]
}
needed_population = _needed_population

//	spawn a person if we need more
if needed_population > population { 
	
	var _x = irandom_range(0,room_width)
	var _y = irandom_range(0,room_height)
	
	var _person = instance_create_layer(_x,_y,"Instances",person)
	
}