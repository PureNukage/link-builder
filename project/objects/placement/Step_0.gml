x = mouse_x - 80
y = mouse_y - 80

if moved == true {
	//	Update grid coordinates
	grid_x = gridController.grid_mouse_w
	grid_y = gridController.grid_mouse_h
	placeable = true
	newsystem = true
	
	//	Not in grid
	if grid_x == -1  and grid_y == -1 {
		placeable = false
	}
	
	//	Already an item in this cell
	if gridController.grid[# grid_x, grid_y] > 0 {
		placeable = false	
	}
	
	//	Empty cell
	else {
		//	Edge of grid check
		for(var i=0;i<4;i++) {
			cells[i] = 1	
		}
		if grid_y = 0 cells[0] = 0
		if grid_x = grid_width-1 cells[1] = 0
		if grid_y = grid_height-1 cells[2] = 0
		if grid_x = 0 cells[3] = 0
		
		for(var i=0;i<4;i++) {
			if cells[i] == 1 {
				switch(i)
				{
					case 0:	//	Top cell
						if gridController.grid[# grid_x, grid_y-1] > 0 newsystem = false
					break
					case 1:	//	Right cell
						if gridController.grid[# grid_x+1, grid_y] > 0 newsystem = false
					break
					case 2:	//	Bottom cell
						if gridController.grid[# grid_x, grid_y+1] > 0 newsystem = false
					break;
					case 3:	//	Left cell
						if gridController.grid[# grid_x-1, grid_y] > 0 newsystem = false
					break
				}
				
				//ds_list_add(systems,)

			}}
		
	}
	
	
	//	Update our color
	if placeable == false {
		color = c_red	
	} else {
		if newsystem == false {
			color = c_green
		} else {	
			color = c_white	
		}
	}
	
}

var a = 160
if !place_snapped(a,a) {
	move_snap(a,a)	
}

if input.mouse_left_press and shop.button_mouseover = 0 and shop.menu_mouseover = 0 and placeable == true {
	gridController.grid[# grid_x, grid_y] = type
	var _item = instance_create_layer(x+80,y+80,"Instances",type)
	_item.sprite_index = sprite
	_item.grid_x = grid_x
	_item.grid_y = grid_y
	
	//	System
	if newsystem == false {
		//	How many systems are we connecting	
		var _systems = ds_list_create()
		for(var i=0;i<4;i++) {
			if cells[i] == 1 {
				if ds_list_find_index(_systems,gridController.grid)	
			}
		}
	}
	
	shop.item_placing = 0
	instance_destroy()

}

if input.mouse_right_press {
	shop.item_placing = 0
	instance_destroy()	
}