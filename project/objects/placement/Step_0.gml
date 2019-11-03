x = mouse_x - 80
y = mouse_y - 80

if moved == true {
	//	Update grid coordinates
	grid_x = gridController.grid_mouse_w
	grid_y = gridController.grid_mouse_h
	
	//	Recalc a bunch of shit
	if grid_x > -1  and grid_y > -1 {
		color = c_white
	} else {
		color = c_red
	}
}

var a = 160
if !place_snapped(a,a) {
	move_snap(a,a)	
}

if input.mouse_left_press and shop.button_mouseover = 0 and shop.menu_mouseover = 0 {
	if grid_x > -1 and grid_y > -1 {
		gridController.grid[# grid_x, grid_y] = type
		var _item = instance_create_layer(x+80,y+80,"Instances",type)
		_item.sprite_index = sprite
		shop.item_placing = 0
		instance_destroy()
	}
}

if input.mouse_right_press {
	shop.item_placing = 0
	instance_destroy()	
}