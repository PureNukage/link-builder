x = mouse_x - size_width/2*cell_width
y = mouse_y - size_height/2*cell_height

if moved == true {
	//	Update grid coordinates
	grid_x = gridController.grid_mouse_w
	grid_y = gridController.grid_mouse_h
	var _x = grid_x - floor(size_width/2)
	var _y = grid_y - floor(size_height/2)
	
	for(var size_w=0;size_w<size_width;size_w++) {
		_y = grid_y - floor(size_height/2)
		for(var size_h=0;size_h<size_height;size_h++) {
			if _x > -1 and _y > -1 {
				grid_array[_x, _y] = gridController.grid[# _x, _y]
			}
			_y++
		}
		_x++
	}
	placeable = true
	newsystem = true
	ds_list_clear(systems)
	
	//	Not in grid
	if gridController.grid_mouse_w == -1  and gridController.grid_mouse_h == -1 {
		placeable = false
	}
	
	var _x = grid_x - floor(size_width/2)
	var _y = grid_y - floor(size_height/2)
	
	for(var size_w=0;size_w<size_width;size_w++) {
		_y = grid_y - floor(size_height/2)
		for(var size_h=0;size_h<size_height;size_h++) {
			if _x > -1 and _y > -1 {
				if gridController.grid[# _x, _y] > 0 {
					placeable = false	
				}
			}
			_y++
		}
		_x++
	}
	
	////	Already an item in this cell
	//if gridController.grid[# grid_x, grid_y] > 0 {
	//	placeable = false	
	//}
	
	//	Don't have enough points!
	if systemController.points < price {
		placeable = false
	}
	
	//	Empty cell
	else {
		//	Edge of grid check
		for(var i=0;i<4;i++) {
			cells[i,0] = 1	
		}
		if grid_y = 0 cells[0,0] = 0
		if grid_x = grid_width-1 cells[1,0] = 0
		if grid_y = grid_height-1 cells[2,0] = 0
		if grid_x = 0 cells[3,0] = 0
		
		for(var i=0;i<4;i++) {
			if cells[i,0] == 1 {
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
					var _xx = gridController.x + (_grid_x*cell_width)
					var _yy = gridController.y + (_grid_y*cell_height)
					var _object_id = instance_nearest(_xx,_yy,itemParent)
					if ds_list_find_index(systems,_object_id.System) == -1 {
						ds_list_add(systems,_object_id.System)
					}
					cells[i,1] = _object_id
					cells[i,2] = _grid_x
					cells[i,3] = _grid_y
				} else {
					cells[i,1] = 0
					cells[i,2] = _grid_x
					cells[i,3] = _grid_y
				}

			}}
		
	}
	
	
	//	Update our color
	if placeable == false {
		color = c_red	
	} else {
		if ds_list_size(systems) > 0 {
			color = c_orange
		} else {	
			color = c_green
		}
	}
	
}

//	Snap placement to grid
var a = cell_width
var b = cell_height
if !place_snapped(a,b) {
	move_snap(a,b)	
}

if (input.mouse_left_press and shop.button_mouseover = 0 and shop.menu_mouseover = 0 and placeable == true) and systemController.points >= price {
	
	item_place(grid_x,grid_y,type,size_width,size_height,sprite)
	
	//var _x = grid_x - (size_width/2)
	//var _y = grid_y - (size_height/2)
	
	//for(var size_w=0;size_w<size_width;size_w++) {
	//	_y = grid_y - (size_height/2)
	//	for(var size_h=0;size_h<size_height;size_h++) {
	//		if _x > -1 and _y > -1 {
	//			gridController.grid[# _x, _y] = type
	//		}
	//		_y++
	//	}
	//	_x++
	//}
	////gridController.grid[# grid_x, grid_y] = type
	//var _item = instance_create_layer(x+80,y+80,"Instances",type)
	//_item.sprite_index = sprite
	//_item.grid_x = grid_x
	//_item.grid_y = grid_y
	
	////	System
	//if ds_list_size(systems) > 0 {
	//	//	Joining a system
	//	if ds_list_size(systems) == 1 {
	//		for(var i=0;i<ds_list_size(systems[| 0].parts);i++) {
	//			var _part = systems[| 0].parts[| i]
	//			with _part {
	//				//	Edge of grid check
	//				for(var i=0;i<4;i++) {
	//					cells[i,0] = 1	
	//				}
	//				if grid_y = 0 cells[0,0] = 0
	//				if grid_x = grid_width-1 cells[1,0] = 0
	//				if grid_y = grid_height-1 cells[2,0] = 0
	//				if grid_x = 0 cells[3,0] = 0
		
	//				for(var i=0;i<4;i++) {
	//					if cells[i,0] == 1 {
	//						var _grid_x = grid_x
	//						var _grid_y = grid_y
	//						switch(i)
	//						{
	//							case 0:	_grid_y -= 1 break	//	Top cell
	//							case 1:	_grid_x += 1 break  //	Right cell
	//							case 2:	_grid_y += 1 break  //	Bottom cell
	//							case 3:	_grid_x -= 1 break  //	Left cell
	//						}
				
	//						if gridController.grid[# _grid_x, _grid_y] > 0 {
	//							var _xx = gridController.x+80 + (_grid_x*cell_width)
	//							var _yy = gridController.y+80 + (_grid_y*cell_height)
	//							var _object_id = instance_nearest(_xx,_yy,itemParent)
	//							//show_message(object_get_name(_object_id.object_index)+" at "+string(_xx)+","+string(_yy))
	//							cells[i,1] = _object_id
	//							cells[i,2] = _grid_x
	//							cells[i,3] = _grid_y
	//						} else {
	//							cells[i,1] = 0
	//							cells[i,2] = _grid_x
	//							cells[i,3] = _grid_y
	//						}

	//					}}		
	//			}
	//		}
			
			
			
	//		_item.System = systems[| 0]
	//		ds_list_add(systems[| 0].parts,_item)
	//	}
		
	//	else {
	//		//	Combining systems
	//		var _newsystem = instance_create_layer(x+80,y+80,"Instances",system)
	//		for(var _oldsystem=0;_oldsystem<ds_list_size(systems);_oldsystem++) {
	//			var _parts_list = systems[| _oldsystem].parts
	//			var _parts_amount = ds_list_size(systems[| _oldsystem].parts)
	//			for(var i=0;i<_parts_amount;i++) {
	//				if ds_list_find_index(_newsystem.parts,_parts_list[| i]) != -1 {
							
	//				} else {
	//					ds_list_add(_newsystem.parts,_parts_list[| i])	
	//					with _parts_list[| i] {
	//						//	Edge of grid check
	//						for(var i=0;i<4;i++) {
	//							cells[i,0] = 1	
	//						}
	//						if grid_y = 0 cells[0,0] = 0
	//						if grid_x = grid_width-1 cells[1,0] = 0
	//						if grid_y = grid_height-1 cells[2,0] = 0
	//						if grid_x = 0 cells[3,0] = 0
		
	//						for(var i=0;i<4;i++) {
	//							if cells[i,0] == 1 {
	//								var _grid_x = grid_x
	//								var _grid_y = grid_y
	//								switch(i)
	//								{
	//									case 0:	_grid_y -= 1 break	//	Top cell
	//									case 1:	_grid_x += 1 break  //	Right cell
	//									case 2:	_grid_y += 1 break  //	Bottom cell
	//									case 3:	_grid_x -= 1 break  //	Left cell
	//								}
				
	//								if gridController.grid[# _grid_x, _grid_y] > 0 {
	//									var _xx = gridController.x+80 + (_grid_x*cell_width)
	//									var _yy = gridController.y+80 + (_grid_y*cell_height)
	//									var _object_id = instance_nearest(_xx,_yy,itemParent)
	//									//show_message(object_get_name(_object_id.object_index)+" at "+string(_xx)+","+string(_yy))
	//									cells[i,1] = _object_id
	//									cells[i,2] = _grid_x
	//									cells[i,3] = _grid_y
	//								} else {
	//									cells[i,1] = 0
	//									cells[i,2] = _grid_x
	//									cells[i,3] = _grid_y
	//								}

	//							}}	
	//					}
	//				}
	//			}
	//		}
	//		for(var i=0;i<ds_list_size(systems);i++) {
	//			instance_destroy(systems[| i])
	//		}
			
	//		ds_list_add(_newsystem.parts,_item)
	//		_item.System = _newsystem
			
	//	}
	//} 
	
	//else {
	//	//	Starting a new system!
	//	var _newsystem = instance_create_layer(x+80,y+80,"Instances",system)
	//	ds_list_add(_newsystem.parts,_item)
	//	_item.System = _newsystem
	//}
	
	//_item.cells = cells
	
	systemController.points -= price
	
	shop.item_placing = 0
	instance_destroy()

}

if input.mouse_right_press {
	shop.item_placing = 0
	instance_destroy()	
}