event_inherited()

switch(states)
{
	#region Placement
		case states.placement:
		
			//	Clamp rotation
			if abs(rotation) == 360 rotation = 0
		
			//	Update ports (and debug if ports are at this cell xy)
			if input.grid_moved {
				wire_update_ports_xy(rotation)
				#region Placeable check
					if (topleft_cell_x > -1 and bottomright_cell_x < grid_width)
					and (topleft_cell_y > -1 and bottomright_cell_y < grid_height) 
					and (gridController.grid_items[# center_cell_x, center_cell_y] < 0) {
						placeable = true
					}
					
				#endregion
				var _object_test = port_check(input.grid_x,input.grid_y)
				if _object_test > 0 {
					debug_log(object_get_name(_object_test.object_index)+" has a port here!")		
				}
			}
		
			//	Rotation
			if input.rotate_right or input.rotate_left {
				var _direction = input.rotate_right - input.rotate_left
				ports = grid_rotation(_direction,my_cells_items,ports)
				if _direction == 1 {
					rotation -= 90
				} else {
					rotation += 90
				}
				size_width = size_width + size_height
				size_height = size_width - size_height
				size_width = size_width - size_height
				//Cells
				center_cell_x = input.grid_x
				center_cell_y = input.grid_y

				topleft_cell_x = center_cell_x-floor(size_width/2)
				topleft_cell_y = center_cell_y-floor(size_height/2)

				bottomright_cell_x = topleft_cell_x + (size_width-1)
				bottomright_cell_y = topleft_cell_y + (size_height-1)
				debug_log("size_width: "+string(size_width)+", size_height: "+string(size_height))
				for(var w=0;w<size_width;w++) {
					for(var h=0;h<size_height;h++) {
						debug_log("x: "+string(w)+", y: "+string(h)+" contains: "+string(my_cells_items[# w, h]))
					}
				}
				
			}
	
			//	Left click to start placing a wire
			if input.mouse_left_press and time.stream > time_spawn and placeable {
				cell_x1 = input.grid_x
				cell_y1 = input.grid_y
				port1 = port_check(cell_x1,cell_y1)
			}
		
			#region	If holding down mouse and moved cells
			if input.mouse_left and input.grid_moved and time.stream > time_spawn and cell_x1 > -1 and cell_y1 > -1 and placeable {
				cell_x2 = input.grid_x
				cell_y2 = input.grid_y
				
				//	Port 2
				port2 = port_check(cell_x2,cell_y2)
			
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
											_wire.topleft_cell_x = w-1
											_wire.topleft_cell_y = h
											_wire.bottomright_cell_x = w+1
											_wire.bottomright_cell_y = h
										
											ds_list_add(path_objects,_wire)
								
											if gridController.grid_items[# w,h] < 0 {
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
					
						#region We dragged and have more than one cell in our path
						if (cell_x1 != cell_x2 or cell_y1 != cell_y2) {
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
					
						}
						#endregion
						
						#region We have one cell in our path
						else {
							
							for(var i=0;i<ds_list_size(path_points_x);i++) {
								instance_destroy(path_objects[| i])	
							}
							
							ds_list_clear(path_objects)
							ds_list_clear(path_points_x)
							ds_list_clear(path_points_y)
							
							var _x = gridController.grid_positions_x[input.grid_x]+(cell_width/2)
							var _y = gridController.grid_positions_y[input.grid_y]+(cell_height/2)
							//	Spawn a wire in the path
							var _wire = instance_create_layer(_x,_y,"Instances",wire)
							_wire.states = states.limbo
							_wire.center_cell_x = input.grid_x
							_wire.center_cell_y = input.grid_y
							_wire.topleft_cell_x = input.grid_x
							_wire.topleft_cell_y = input.grid_y
							_wire.bottomright_cell_x = input.grid_x
							_wire.bottomright_cell_y = input.grid_y
										
							ds_list_add(path_objects,_wire)
							ds_list_add(path_points_x,input.grid_x)
							ds_list_add(path_points_y,input.grid_y)
							
						}
						#endregion
					
					debug_log("Trimmed path_objects down to: "+string(ds_list_size(path_objects)))
					
					#endregion
					
					#region Assign wires their ports
					for(var i=0;i<ds_list_size(path_objects);i++) {
						
						var __wire = path_objects[| i]
						
						#region	The first wire
						if i == 0 {
							// There are no more wires
							if i >= ds_list_size(path_objects)-1 {
								debug_log("This is a solo wire!")
							} 
							//	There is another wire ahead of us
							else {
								__wire.ports[0,port_object] = path_objects[| i+1]
							}
						} 
						#endregion
						
						#region Middle wire
						if i > 0 and i < ds_list_size(path_objects)-1 {
							__wire.ports[1,port_object] = path_objects[| i-1]
							__wire.ports[0,port_object] = path_objects[| i+1]
						}
						#endregion
						
						#region Last Wire
						if i == ds_list_size(path_points_x)-1 and i != 0 {
							__wire.ports[1,port_object] = path_objects[| i-1]
						}
						#endregion			
						
						debug_log("Just set Wire's: ["+string(i)+"] "+string(__wire)+" port_in to ["+string(i-1)+"] "+string(__wire.ports[1,port_object]))
						debug_log("Just set Wire's: ["+string(i)+"] "+string(__wire)+" port_out to ["+string(i+1)+"] "+string(__wire.ports[0,port_object]))
								
					}
					#endregion
			
					#region Assign wires their direction 
					
					for(var i=0;i<ds_list_size(path_objects);i++) {
						
						var _wire = path_objects[| i]
						
						//	In but no out
						if _wire.ports[1,port_object] > -1 and _wire.ports[0,port_object] == -1 {
							var w2 = _wire.center_cell_x
							var h2 = _wire.center_cell_y
							var w1 = _wire.ports[1,port_object].center_cell_x
							var h1 = _wire.ports[1,port_object].center_cell_y
							_wire.rotation = cell_direction(w1,h1,w2,h2)
						}
						
						//	In and Out
						//	and Out and no in
						if (_wire.ports[0,port_object] > -1 and _wire.ports[1,port_object] > -1)
						or (_wire.ports[1,port_object] == -1 and _wire.ports[0,port_object] > -1) {
							var w1 = _wire.center_cell_x
							var h1 = _wire.center_cell_y
							var w2 = _wire.ports[0,port_object].center_cell_x
							var h2 = _wire.ports[0,port_object].center_cell_y
							_wire.rotation = cell_direction(w1,h1,w2,h2)
						}
						
						//	Rotate my_cells_items grid and update ports
						if _wire.rotation > 0 {
							var _rotates = abs(_wire.rotation/90)
							debug_log("Wire: "+"["+string(i)+"] has: "+string(_rotates)+" rotations to make")
							for(var a=0;a<_rotates;a++) {
								_wire.ports = grid_rotation(-1,_wire.my_cells_items,_wire.ports)	
								_wire.size_width = _wire.size_width + _wire.size_height
								_wire.size_height = _wire.size_width - _wire.size_height
								_wire.size_width = _wire.size_width - _wire.size_height
								//Cells
								_wire.topleft_cell_x = _wire.center_cell_x-floor(_wire.size_width/2)
								_wire.topleft_cell_y = _wire.center_cell_y-floor(_wire.size_height/2)

								_wire.bottomright_cell_x = _wire.topleft_cell_x + (_wire.size_width-1)
								_wire.bottomright_cell_y = _wire.topleft_cell_y + (_wire.size_height-1)
							}
						}
						
						debug_log("Wire: "+"["+string(i)+"] "+string(_wire)+" set to a rotation of : "+string(_wire.rotation))
						
					}
					
					
					
					#endregion
					
					
				}
			
			
			}	
			#endregion
		
			//	Left release to finalize placement of the wire
			if input.mouse_left_release and time.stream > time_spawn + 15 {	
				
				//	Check for item connections
				
				port1 = -1
				port2 = -1
				
				//	Placeable
				if placeable {
					
					//	If we have a path 
					if cell_x2 > -1 and cell_y2 > -1 {
						for(var i=0;i<ds_list_size(path_objects);i++) {
							var _wire = path_objects[| i]
							_wire.states = states.placed
							var _x = _wire.center_cell_x
							var _y = _wire.center_cell_y
							with _wire {
								wire_update_ports_xy(_wire.rotation)	
							}
							ds_grid_set_grid_region(gridController.grid_items,_wire.my_cells_items,0,0,_wire.size_width,_wire.size_height,_wire.topleft_cell_x,_wire.topleft_cell_y)
							mp_grid_add_cell(gridController.mp_grid,_x, _y)
							//	Add ports
							for(var _p=0;_p<_wire.ports_count;_p++) {
								var _grid = gridController.grid_port_objects
								var _grid_x = gridController.grid_port_x
								var _grid_y = gridController.grid_port_y
								ds_list_add(_grid,_wire)
								ds_list_add(_grid_x,_wire.ports[_p,port_x])
								ds_list_add(_grid_y,_wire.ports[_p,port_y])
							}
						}
						instance_destroy()
						debug_log("I have a path")
					}
					//	If its just us
					else {
						var _wire = id
						states = states.placed
						var _x = gridController.grid_positions_x[input.grid_x]+(cell_width/2)
						var _y = gridController.grid_positions_y[input.grid_y]+(cell_height/2)
						ds_grid_set_grid_region(gridController.grid_items,my_cells_items,0,0,size_width,size_height,topleft_cell_x,topleft_cell_y)
						mp_grid_add_instances(gridController.mp_grid,id,false)
						//	Add ports
						for(var _p=0;_p<_wire.ports_count;_p++) {
							var _grid = gridController.grid_port_objects
							var _grid_x = gridController.grid_port_x
							var _grid_y = gridController.grid_port_y
							ds_list_add(_grid,_wire)
							ds_list_add(_grid_x,_wire.ports[_p,port_x])
							ds_list_add(_grid_y,_wire.ports[_p,port_y])
						}
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
			
			//	Right press to destroy the wire and any path
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