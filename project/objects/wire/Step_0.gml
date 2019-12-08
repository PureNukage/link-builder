event_inherited()

switch(states)
{
	case states.placement:
	
		if input.mouse_left_press and time.stream > time_spawn {
			cell_x1 = input.grid_x
			cell_y1 = input.grid_y
		}
		
		if input.mouse_left and input.grid_moved and time.stream > time_spawn and cell_x1 > -1 and cell_y1 > -1 {
			cell_x2 = input.grid_x
			cell_y2 = input.grid_y
			
			var _x1 = gridController.grid_positions_x[cell_x1]+(cell_width/2)
			var _y1 = gridController.grid_positions_y[cell_y1]+(cell_height/2)
			var _x2 = gridController.grid_positions_x[cell_x2]+(cell_width/2)
			var _y2 = gridController.grid_positions_y[cell_y2]+(cell_height/2)
			
			if mp_grid_define_path(_x1,_y1,_x2,_y2,path,gridController.mp_grid,false) {
				var top_left_x = min(cell_x1,cell_x2)
				var top_left_y = min(cell_y1,cell_y2)
				var bottom_right_x = max(cell_x1,cell_x2)
				var bottom_right_y = max(cell_y1,cell_y2)
				
				ds_list_clear(path_points_x)
				ds_list_clear(path_points_y)
				
				var _placeable = 0
				var buffer = 0
				while _placeable == 0 {
					for(var w=top_left_x-buffer;w<=bottom_right_x+buffer;w++) {
						for(var h=top_left_y-buffer;h<=bottom_right_y+buffer;h++) {
						
							var _xx = gridController.grid_positions_x[w]
							var _yy = gridController.grid_positions_y[h]
						
							for(var i=0;i<path_get_number(path);i++) {
								var _x = path_get_point_x(path,i)
								var _y = path_get_point_y(path,i)
								if point_in_rectangle(_x,_y,_xx,_yy,_xx+cell_width,_yy+cell_height) {
									ds_list_add(path_points_x,w)
									ds_list_add(path_points_y,h)
								
									if gridController.grid_items[# w,h] == -1 {
										_placeable++	
									}
								
								}
							
							}
						
						}
					}
				
					if _placeable == path_get_number(path) {
						placeable = true	
					} else {
						_placeable = 0	
						buffer++
					}
				}
					
				
			}
			
			
		}	
		
		if input.mouse_left_release and cell_x1 > -1 and cell_y1 > -1 {
			
			ds_list_clear(path_points_x)
			ds_list_clear(path_points_y)
			cell_x1 = -1
			cell_y1 = -1
			cell_x2 = -1
			cell_y2 = -1
			instance_destroy()
			
		}
		
		
	break
}