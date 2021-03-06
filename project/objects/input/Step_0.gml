mouse_left_press = mouse_check_button_pressed(mb_left)
mouse_left = mouse_check_button(mb_left)
mouse_left_release = mouse_check_button_released(mb_left)

mouse_right_press = mouse_check_button_pressed(mb_right)
mouse_right = mouse_check_button(mb_right)

space = keyboard_check_pressed(vk_space)

rotate_right = keyboard_check_pressed(ord("E"))
rotate_left = keyboard_check_pressed(ord("Q"))

keypress_r = keyboard_check_pressed(ord("R"))

keypress_p = keyboard_check_pressed(ord("P"))

middle_mouse_press = mouse_check_button_pressed(mb_middle)
middle_mouse = mouse_check_button(mb_middle)
middle_mouse_release = mouse_check_button_released(mb_middle)

f5 = keyboard_check_pressed(vk_f5)
f9 = keyboard_check_pressed(vk_f9)

alt = keyboard_check_pressed(vk_alt)

if f5 and app.tutorial == -1 and !game.game_over {
	save_game()
	create_textbox("Game has been saved...",-1,60)
}

if keypress_r and ds_list_size(selections) > 1 and !multireplace {
	item_multireplace()
}

escape = keyboard_check_pressed(vk_escape)


if escape {
	debug_log("I hit Escape!")
	if instance_exists(mainmenu) {
		if mainmenu.menu == menu.options mainmenu.menu = menu.in_game
		else instance_destroy(mainmenu)
	} else {
		var _menu = instance_create_layer(0,0,"Instances",mainmenu)
		_menu.menu = menu.in_game
		_menu.in_game = true
	}
	
}

#region wip finger camera scrolling
	//finger_left_x_previous = finger_left_x
	//finger_left_y_previous = finger_left_y
	//finger_right_x_previous = finger_right_x
	//finger_right_y_previous = finger_right_y

	//finger_left_x = device_mouse_x(0)
	//finger_left_y = device_mouse_y(0)
	//finger_right_x = device_mouse_x(1)
	//finger_right_y = device_mouse_y(1)

	//var finger_left_x_diff = abs(finger_left_x_previous - finger_left_x)
	//var finger_right_x_diff = abs(finger_right_x_previous - finger_right_x)
	////	calc if fingers have moved since last frame AND are moving away from each other
	//var finger_left_y_diff = abs(finger_left_y_previous - finger_left_y)
	//var finger_right_y_diff = abs(finger_right_y_previous - finger_right_y)
	//if finger_left_y_diff > 5 and finger_right_y_diff > 5 {
	//	var finger_left_y_dir = finger_left_y_previous - finger_left_y
	//}

	//if finger_left_x_diff < 10 and finger_right_x_diff < 10 and
#endregion

scroll_up = mouse_wheel_up()
scroll_down = mouse_wheel_down()

delete_press = keyboard_check_pressed(vk_delete)

control_press = keyboard_check_pressed(vk_control)

give_money = keyboard_check_pressed(vk_home)

if give_money {
	player.link += 2000
	player.eth += 2000
	player.value += 2000
	player.money += 2000
}

#region Calculating grid_x,y and grid_moved 
	var _x = gridController.grid_start_x
	var _y = gridController.grid_start_y
	for(var _w=0;_w<grid_width;_w++) {
		_y = gridController.grid_start_y
		for(var _h=0;_h<grid_height;_h++) {
				if point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+cell_width,_y+cell_height) {
					grid_xprevious = grid_x
					grid_yprevious = grid_y
					grid_x = _w
					grid_y = _h
					if grid_xprevious != grid_x or grid_yprevious != grid_y {
						grid_moved = true	
					} else {
						grid_moved = false
					}	
					exit
				} else {
					if _w == grid_width and _h == grid_height {
						grid_xprevious = grid_x
						grid_yprevious = grid_y
						grid_x = -1
						grid_y = -1
						if grid_xprevious != grid_x or grid_yprevious != grid_y {
							grid_moved = true	
						} else {
							grid_moved = false
						}
					}
				}
			_y += cell_height
		}
		_x += cell_width
	}
#endregion
