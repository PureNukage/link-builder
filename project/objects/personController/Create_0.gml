
initial_person_count = 20

person_list = ds_list_create()



for(var i=0;i<initial_person_count;i++) {
	var _x = irandom_range(0,room_width)
	var _y = irandom_range(0,room_height)
	var _person = instance_create_layer(_x,_y,"Instances",person)
	var _sprite = choose(s_man0,s_man1)
	_person.sprite_index = _sprite
}

