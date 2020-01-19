with all {
	if object_index == app or object_index == soundSystem {
		
	} else {
		instance_destroy()		
	}
}

if app.tutorial > -1 app.tutorial = -1

room_goto(main_menu)