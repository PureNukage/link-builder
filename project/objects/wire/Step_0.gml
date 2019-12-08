event_inherited()

switch(states)
{
	#region Placement
		case states.placement:
	
			if input.mouse_left_press and time.stream > time_spawn {
				cell_x1 = input.grid_x
				cell_y1 = input.grid_y
				cell_x2 = input.grid_x
				cell_y2 = input.grid_y
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
					for(var i=0;i<ds_list_size(path_objects);i++) {
						instance_destroy(path_objects[| i])	
					}
					ds_list_clear(path_objects)
				
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
										
										//	Spawn a wire in the path
										var _wire = instance_create_layer(_x,_y,"Instances",wire)
										_wire.states = states.limbo
										_wire.center_cell_x = w
										_wire.center_cell_y = h
										_wire.topleft_cell_x = w
										_wire.topleft_cell_y = h
										_wire.bottomright_cell_x = w
										_wire.bottomright_cell_y = h
										
										ds_list_add(path_objects,_wire)
								
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
					
					#region	Sort out path cells in ascending distance from cell_x1
					var distances = ds_list_create()
					var distances_sorted = ds_list_create()
					for(var i=0;i<ds_list_size(path_points_x);i++) {
						var _x2 = path_points_x[| i]
						var _y2 = path_points_y[| i]
						var _distance = abs(point_distance(cell_x1,cell_y1,_x2,_y2))
						ds_list_add(distances,_distance)
						
					}
					
					ds_list_copy(distances_sorted,distances)
					ds_list_sort(distances_sorted,true)
					
					var path_points_x2 = ds_list_create()
					var path_points_y2 = ds_list_create()
					var path_objects2 = ds_list_create()
					for(var i=0;i<ds_list_size(distances_sorted);i++) {
						for(var a=0;a<ds_list_size(path_points_x);a++) {
							var _x2 = path_points_x[| a]
							var _y2 = path_points_y[| a]
							if abs(point_distance(cell_x1,cell_y1,_x2,_y2)) == distances_sorted[| i] {
								path_points_x2[| a] = path_points_x[| i]
								path_points_y2[| a] = path_points_y[| i]
								path_objects2[| a] = path_objects[| i]
							}	
						}
					}
					
					ds_list_clear(path_points_x)
					ds_list_clear(path_points_y)
					ds_list_clear(path_objects)
					ds_list_copy(path_points_x,path_points_x2)
					ds_list_copy(path_points_y,path_points_y2)
					ds_list_copy(path_objects,path_objects2)
					
					ds_list_destroy(distances)
					ds_list_destroy(distances_sorted)
					ds_list_destroy(path_points_x2)
					ds_list_destroy(path_points_y2)
					ds_list_destroy(path_objects2)
					#endregion
					
					
					#region Assign wires their ports
					for(var i=0;i<ds_list_size(path_points_x);i++) {
						
						var _wire = path_objects[| i]
						
						#region	The first wire
						if i == 0 {
							// There are no more wires
							if i >= ds_list_size(path_objects)-1 {
									
							} 
							//	There is another wire ahead of us
							else {
								_wire.port_out[0] = path_objects[| i+1]
							}
						} 
						#endregion
						
						#region Middle wire
						if i > 0 and i < ds_list_size(path_objects)-1 {
							_wire.port_in[0] = path_objects[| i-1]
							_wire.port_out[0] = path_objects[| i+1]
							
						}
						#endregion
						
						#region Last Wire
						if i == ds_list_size(path_points_x)-1 {
							_wire.port_in[0] = path_objects[| i-1]
							
						}
						
						
						#endregion				
								
					}
					#endregion
			
					#region Assign wires their direction
					
					for(var i=0;i<ds_list_size(path_objects);i++) {
						
						var _wire = path_objects[| i]
						
						//	In but no out
						if _wire.port_in[0] > -1 and _wire.port_out[0] == -1 {
							var w2 = _wire.center_cell_x
							var h2 = _wire.center_cell_y
							var w1 = _wire.port_in[0].center_cell_x
							var h1 = _wire.port_in[0].center_cell_y
							_wire.rotation = cell_direction(w1,h1,w2,h2)
						}
						
						//	In and Out
						//	and Out and no in
						if (_wire.port_in[0] > -1 and _wire.port_out[0] > -1)
						and (_wire.port_in[0] == -1 and _wire.port_out[0] > -1) {
							var w1 = _wire.center_cell_x
							var h1 = _wire.center_cell_y
							var w2 = _wire.port_out[0].center_cell_x
							var h2 = _wire.port_out[0].center_cell_y
							_wire.rotation = cell_direction(w1,h1,w2,h2)
						}
						
					}
					
					
					
					#endregion
					
					
				}
			
			
			}	
		
			if input.mouse_left_release and cell_x1 > -1 and cell_y1 > -1 {
				
				for(var i=0;i<ds_list_size(path_objects);i++) {
					instance_destroy(path_objects[| i])	
				}
				ds_list_clear(path_points_x)
				ds_list_clear(path_points_y)
				cell_x1 = -1
				cell_y1 = -1
				cell_x2 = -1
				cell_y2 = -1
				instance_destroy()
			
			}
		
		
		break
	#endregion
	
	#region Limbo
		case states.limbo:	
			
			
			
			
			
			
			
		break
	#endregion
}