event_inherited()

switch(states)
{
	#region Placement
		case states.placement:
	
			if input.mouse_left_press and time.stream > time_spawn and placeable {
				cell_x1 = input.grid_x
				cell_y1 = input.grid_y

			}
		
			#region	If holding down mouse and moved cells
			if input.mouse_left and input.grid_moved and time.stream > time_spawn and cell_x1 > -1 and cell_y1 > -1 and placeable {
				cell_x2 = input.grid_x
				cell_y2 = input.grid_y
			
				var _x1 = gridController.grid_positions_x[cell_x1]+(cell_width/2)
				var _y1 = gridController.grid_positions_y[cell_y1]+(cell_height/2)
				var _x2 = gridController.grid_positions_x[cell_x2]+(cell_width/2)
				var _y2 = gridController.grid_positions_y[cell_y2]+(cell_height/2)
				
				//	Make sure to clear my previous path if any 
				for(var i=0;i<ds_list_size(path_objects);i++) {
					instance_destroy(path_objects[| i])	
				}
				ds_list_clear(path_objects)
			
				//	The path can make it
				if mp_grid_define_path(_x1,_y1,_x2,_y2,path,gridController.mp_grid,false) {
					var top_left_x = min(cell_x1,cell_x2)
					var top_left_y = min(cell_y1,cell_y2)
					var bottom_right_x = max(cell_x1,cell_x2)
					var bottom_right_y = max(cell_y1,cell_y2)
				
					ds_list_clear(path_points_x)
					ds_list_clear(path_points_y)
				
					var _placeable = 0
					var buffer = 0
					#region While Loop for creating the path
					while _placeable == 0 {
						
						//	Make sure to clear my previous path if any 
						for(var i=0;i<ds_list_size(path_objects);i++) {
							instance_destroy(path_objects[| i])	
						}
						ds_list_clear(path_objects)
						ds_list_clear(path_points_x)
						ds_list_clear(path_points_y)
					
						//	Start the loop through the grid containing my path + buffer
						for(var w=top_left_x-buffer;w<=bottom_right_x+buffer;w++) {
							for(var h=top_left_y-buffer;h<=bottom_right_y+buffer;h++) {
								
								//	Is his cell within game boundaries?
								if (w > -1 and w < grid_width)
								and (h > -1 and h < grid_height) {
						
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
						}
				
						if _placeable == path_get_number(path) {
							placeable = true	
						} else {
							_placeable = 0	
							buffer++
						}
					}
					#endregion
					
					debug_log("Points in path: "+string(path_get_number(path)))
					debug_log("Size of path_objects: "+string(ds_list_size(path_objects)))
					
					#region	Sort out path cells in order as to the path
					
					var path_points_x2 = ds_list_create()
					var path_points_y2 = ds_list_create()
					var path_objects2 = ds_list_create()
					
					//	Loop through every point in the path
					for(var i=0;i<path_get_number(path);i++) {
						
						var point_x = path_get_point_x(path,i)
						var point_y = path_get_point_y(path,i)
						
						for(var w=0;w<ds_list_size(path_points_x);w++) {
							var _w = path_points_x[| w]
							var _h = path_points_y[| w]
							var _xx = gridController.grid_positions_x[_w]
							var _yy = gridController.grid_positions_y[_h]
								
							if point_in_rectangle(point_x,point_y,_xx,_yy,_xx+cell_width,_yy+cell_height) {
								ds_list_add(path_points_x2,_w)
								ds_list_add(path_points_y2,_h)
								ds_list_add(path_objects2,path_objects[| w])	
							}
						}
					}
					
					ds_list_clear(path_points_x)
					ds_list_clear(path_points_y)
					ds_list_clear(path_objects)
					ds_list_copy(path_points_x,path_points_x2)
					ds_list_copy(path_points_y,path_points_y2)
					ds_list_copy(path_objects,path_objects2)
					
					ds_list_destroy(path_points_x2)
					ds_list_destroy(path_points_y2)
					ds_list_destroy(path_objects2)
				
					#endregion
					
					#region Trim path_objects of any duplicates
					
					if cell_x1 != cell_x2 and cell_y1 != cell_y2 {
						var trimmed_path_objects = ds_list_create()
						var trimmed_path_points_x = ds_list_create()
						var trimmed_path_points_y = ds_list_create()
						var _x = -1
						var _x_previous = -1
						var _y = -1
						var _y_previous = -1
						//var duplicates = 0
						for(var i=0;i<ds_list_size(path_points_x);i++) {
						
							var _x = path_points_x[| i]
							var _y = path_points_y[| i]
							var duplicates = 0
							for(var a=0;a<ds_list_size(trimmed_path_points_x);a++) {
								var _xx = trimmed_path_points_x[| a]
								var _yy = trimmed_path_points_y[| a]
								if _x == _xx and _y == _yy {
									duplicates++
								}	
							}
							if duplicates == 0 {
								ds_list_add(trimmed_path_objects,path_objects[| i])
								ds_list_add(trimmed_path_points_x,path_points_x[| i])
								ds_list_add(trimmed_path_points_y,path_points_y[| i])
							
							} else {
								instance_destroy(path_objects[| i])	
							}
							_x_previous = _x
							_y_previous = _y
						
						}
						ds_list_clear(path_objects)
						ds_list_clear(path_points_x)
						ds_list_clear(path_points_y)
						ds_list_copy(path_objects,trimmed_path_objects)
						ds_list_copy(path_points_x,trimmed_path_points_x)
						ds_list_copy(path_points_y,trimmed_path_points_y)
					
						debug_log("Trimmed path_objects down to: "+string(ds_list_size(path_objects)))
					}
					
					#endregion
					
					#region Assign wires their ports
					for(var i=0;i<ds_list_size(path_objects);i++) {
						
						var __wire = path_objects[| i]
						
						debug_log("Wire object name: "+object_get_name(__wire.object_index))
						
						#region	The first wire
						if i == 0 {
							// There are no more wires
							if i >= ds_list_size(path_objects)-1 {
								debug_log("This is a solo wire!")
							} 
							//	There is another wire ahead of us
							else {
								__wire.port_out[0,0] = path_objects[| i+1]
								//debug_log("Just set Wire's: ["+string(i)+"] "+string(_wire)+" port_out to ["+string(i+1)+"] "+string(_wire.port_out[0,0]))
							}
						} 
						#endregion
						
						#region Middle wire
						if i > 0 and i < ds_list_size(path_objects)-1 {
							__wire.port_in[0,0] = path_objects[| i-1]
							__wire.port_out[0,0] = path_objects[| i+1]
							//debug_log("Just set Wire's: ["+string(i)+"] "+string(_wire)+" port_in to ["+string(i-1)+"] "+string(_wire.port_in[0,0]))
							//debug_log("Just set Wire's: ["+string(i)+"] "+string(_wire)+" port_out to ["+string(i+1)+"] "+string(_wire.port_out[0,0]))
						}
						#endregion
						
						#region Last Wire
						if i == ds_list_size(path_points_x)-1 and i != 0{
							__wire.port_in[0,0] = path_objects[| i-1]
							debug_log("Just set Wire's: ["+string(i)+"] "+string(__wire)+" port_in to ["+string(i-1)+"] "+string(__wire.port_in[0,0]))
							
						}
						
						
						#endregion			
						
						debug_log("Just set Wire's: ["+string(i)+"] "+string(__wire)+" port_in to ["+string(i-1)+"] "+string(__wire.port_in[0,0]))
						debug_log("Just set Wire's: ["+string(i)+"] "+string(__wire)+" port_out to ["+string(i+1)+"] "+string(__wire.port_out[0,0]))
								
					}
					#endregion
			
					#region Assign wires their direction
					
					for(var i=0;i<ds_list_size(path_objects);i++) {
						
						var _wire = path_objects[| i]
						
						//	In but no out
						if _wire.port_in[0,0] > -1 and _wire.port_out[0,0] == -1 {
							var w2 = _wire.center_cell_x
							var h2 = _wire.center_cell_y
							var w1 = _wire.port_in[0,0].center_cell_x
							var h1 = _wire.port_in[0,0].center_cell_y
							_wire.rotation = cell_direction(w1,h1,w2,h2)
						}
						
						//	In and Out
						//	and Out and no in
						if (_wire.port_in[0,0] > -1 and _wire.port_out[0,0] > -1)
						or (_wire.port_in[0,0] == -1 and _wire.port_out[0,0] > -1) {
							var w1 = _wire.center_cell_x
							var h1 = _wire.center_cell_y
							var w2 = _wire.port_out[0,0].center_cell_x
							var h2 = _wire.port_out[0,0].center_cell_y
							_wire.rotation = cell_direction(w1,h1,w2,h2)
						}
						
						debug_log("Wire: "+"["+string(i)+"] "+string(_wire)+" set to a rotation of : "+string(_wire.rotation))
						
					}
					
					
					
					#endregion
					
					
				}
			
			
			}	
			#endregion
		
			if input.mouse_left_release and time.stream > time_spawn + 15 {
				
				//	Placeable
				if placeable {
					//	If we have a path 
					if cell_x2 > -1 and cell_y2 > -1 {
						for(var i=0;i<ds_list_size(path_objects);i++) {
							path_objects[| i].states = states.placed
							var _x = path_objects[| i].center_cell_x
							var _y = path_objects[| i].center_cell_y
							gridController.grid_items[# _x, _y] = path_objects[| i].object_index
							mp_grid_add_cell(gridController.mp_grid,_x, _y)
						}
						instance_destroy()
						debug_log("I have a path")
					}
					//	If its just us
					else {
						states = states.placed
						var _x = gridController.grid_positions_x[input.grid_x]+(cell_width/2)
						var _y = gridController.grid_positions_y[input.grid_y]+(cell_height/2)
						gridController.grid_items[# input.grid_x, input.grid_y] = object_index
						mp_grid_add_instances(gridController.mp_grid,id,false)
						debug_log("I have no path")
					}
				} 
				//	Not placeable
				else {
					for(var i=0;i<ds_list_size(path_objects);i++) {
					instance_destroy(path_objects[| i])
						}
						instance_destroy()	
					}
			
			}
			
			if input.mouse_right_press {
				for(var i=0;i<ds_list_size(path_objects);i++) {
					instance_destroy(path_objects[| i])
				}
				instance_destroy()	
			}
		
		
		break
	#endregion
	
	#region Limbo
		case states.limbo:	
			
			
			
			
			
			
			
		break
	#endregion
}