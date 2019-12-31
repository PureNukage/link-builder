people = ds_list_create()

population = ds_list_size(people)

needed_population = 0

spawners = ds_list_create()

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
	var spawner = instance_create_layer(_xx,_yy,"Instances",personSpawner)	
	spawner.ID = i
	ds_list_add(spawners,spawner)
}