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

hair_colors[0] = make_color_rgb(185,122,87)
hair_colors[1] = make_color_rgb(109,68,46)
hair_colors[2] = make_color_rgb(44,27,18)
hair_colors[3] = make_color_rgb(255,255,191)

head_colors[0] = make_color_rgb(255,215,172)
head_colors[1] = make_color_rgb(234,222,176)
head_colors[2] = make_color_rgb(129,99,69)
head_colors[3] = make_color_rgb(193,167,142)

body_colors[0] = make_color_rgb(53,164,91)
body_colors[1] = make_color_rgb(53,121,164)
body_colors[2] = make_color_rgb(159,49,6)
body_colors[3] = make_color_rgb(90,4,163)

legs_colors[0] = make_color_rgb(98,98,98)
legs_colors[1] = make_color_rgb(63,15,0)
legs_colors[2] = make_color_rgb(10,1,65)
legs_colors[3] = make_color_rgb(32,20,37)