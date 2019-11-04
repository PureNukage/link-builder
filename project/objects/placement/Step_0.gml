x = mouse_x - 80
y = mouse_y - 80

if moved == true {
	//	Update grid coordinates
	grid_x = gridController.grid_mouse_w
	grid_y = gridController.grid_mouse_h
	placeable = true
	newsystem = true
	ds_list_clear(systems)
	
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
				var _grid_x = grid_x
				var _grid_y = grid_y
				switch(i)
				{
					case 0:	_grid_y -= 1 break	//	Top cell
					case 1:	_grid_x += 1 break  //	Right cell
					case 2:	_grid_y += 1 break  //	Bottom cell
					case 3:	_grid_x -= 1 break  //	Left cell
				}
				
				if gridController.grid[# _grid_x, _grid_y] > 0 {
					var _xx = gridController.x + (_grid_x*160)
					var _yy = gridController.y + (_grid_y*160)
					var _object_id = instance_nearest(_xx,_yy,itemParent)
					if ds_list_find_index(systems,_object_id.System) == -1 {
						ds_list_add(systems,_object_id.System)
					}
				}

			}}
		
	}
	
	
	//	Update our color
	if placeable == false {
		color = c_red	
	} else {
		if ds_list_size(systems) > 0 {
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
	if ds_list_size(systems) > 0 {
		//	How many systems are we connecting	
		if ds_list_size(systems) == 1 {
			_item.System = systems[| 0]
			ds_list_add(systems[| 0].parts,_item)
		}
		
		else {
			//	Make new system that contains all current systems and their parts 
			
		}
	}
	
	shop.item_placing = 0
	instance_destroy()

}

if input.mouse_right_press {
	shop.item_placing = 0
	instance_destroy()	
}