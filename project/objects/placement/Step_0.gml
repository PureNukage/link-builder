x = mouse_x - 80
y = mouse_y - 80

var a = 160
if !place_snapped(a,a) {
	move_snap(a,a)	
}

if input.mouse_left_press and shop.button_mouseover = 0 and shop.menu_mouseover = 0 {
	gridController.grid[# gridController.grid_mouse_w, gridController.grid_mouse_h] = type
	var _item = instance_create_layer(x+80,y+80,"Instances",type)
	_item.sprite_index = sprite
	shop.item_placing = 0
	instance_destroy()
}

if input.mouse_right_press {
	shop.item_placing = 0
	instance_destroy()	
}