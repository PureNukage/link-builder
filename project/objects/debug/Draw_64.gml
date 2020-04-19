if live_call() return live_result

draw_set_font(fnt_shop)
switch(mode)
{
	case mode.off:
	
	break
	
	#region Grid
		case mode.grid:
			
			//	Draw grid menu
			draw_set_color(c_ltgray)
			draw_roundrect(window_gridX,window_gridY,window_gridX+window_grid_width,window_gridY+window_grid_height,false)
			
			//	Draw mpgrid button
			ui_draw_button(button_mpgrid_width,button_mpgrid_height,button_mpgridX,button_mpgridY,button_mpgrid_color,button_mpgrid_string,button_mpgrid_mouseover)
			
			ui_draw_button(button_systems_width,button_systems_height,button_systemsX,button_systemsY,button_systems_color,button_systems_string,button_systems_mouseover)
			
			#region Object Variables

					//	Draw Variable window
					draw_set_color(c_ltgray)
					draw_roundrect(window_variableX,window_variableY,window_variableX+window_variable_width,window_variableY+window_variable_height,false)
	
					var _y = window_variableY + 8
					var _x = window_variableX + 8
					draw_set_color(c_black)
					draw_set_halign(fa_left)
					draw_set_valign(fa_top)
	
					draw_text(_x,_y,"GENERAL")													_y += 15 
					draw_text(_x,_y,"time_stream: "+string(time.stream))						_y += 15 
					draw_text(_x,_y,"time_seconds: "+string(time.seconds))						_y += 15 
																								_y += 15 
					draw_text(_x,_y,"mouse_gui_x: "+string(mouse_gui_x))						_y += 15 
					draw_text(_x,_y,"mouse_gui_y: "+string(mouse_gui_y))						_y += 15 
																								_y += 15
					draw_text(_x,_y,"grid x: "+string(input.grid_x))							_y += 15 
					draw_text(_x,_y,"grid y: "+string(input.grid_y))							_y += 15
																								_y += 15
					draw_text(_x,_y,"gui layer width: "+string(display_get_gui_width()))		_y += 15 
					draw_text(_x,_y,"gui layer height: "+string(display_get_gui_height()))		_y += 15 
	
	
																								_y += 15
					with camera {
						draw_text(_x,_y,"CAMERA")												_y += 15 
						
						draw_text(_x,_y,"camera zoom: "+string(zoom_level))					    _y += 15 
																								_y += 15
						draw_text(_x,_y,"camera view border x: "+string(camera_get_view_border_x(Camera)))	_y += 15 
						draw_text(_x,_y,"camera view border y: "+string(camera_get_view_border_y(Camera)))	_y += 15 
																								_y += 15
						draw_text(_x,_y,"edgeX: "+string(camera_get_view_width(Camera)/2))		_y += 15 
						draw_text(_x,_y,"edgeY: "+string(camera_get_view_height(Camera)/2))		_y += 15 
		
					}
					
					with input {															_y += 15 
						draw_text(_x,_y,"INPUT SELECTION")									_y += 15 
						draw_text(_x,_y,"Selection: "+string(selection))					_y += 15 
						draw_text(_x,_y,"Selections: "+string(ds_list_size(selections)))	_y += 15 
						draw_text(_x,_y,"Selection_x1: "+string(selection_x1))				_y += 15 
						draw_text(_x,_y,"Selection_y1: "+string(selection_y1))				_y += 15 
						draw_text(_x,_y,"Selection_x2: "+string(selection_x2))				_y += 15 
						draw_text(_x,_y,"Selection_y2: "+string(selection_y2))				_y += 15 
						draw_text(_x,_y,"Selection_cell_x1: "+string(selection_cell_x1))	_y += 15 
						draw_text(_x,_y,"Selection_cell_y1: "+string(selection_cell_y1))	_y += 15 
						draw_text(_x,_y,"Selection_cell_x2: "+string(selection_cell_x2))	_y += 15 
						draw_text(_x,_y,"Selection_cell_y2: "+string(selection_cell_y2))	_y += 15 
						draw_text(_x,_y,"Selection timer: "+string(selection_timer))		_y += 15
						
					}
					
					if _y > window_variableY+window_variable_height {
						window_variable_height = _y	
					}
	

	#endregion
				
			#region Kiosk Variables
			
				if input.selection.object_index == kiosk {
					
					var kw_windowX = window_variableX+window_variable_width
					var kw_windowY = window_variableY
					var kw_window_width = 200
					var kw_window_height = 300
					
					draw_set_color(c_ltgray)
					draw_roundrect(kw_windowX,kw_windowY,kw_windowX+kw_window_width,kw_windowY+kw_window_height,false)
					
					draw_set_color(c_black)
					var XX = kw_windowX+40
					var YY = kw_windowY+20
					draw_text(XX,YY,"Data Held") YY += 48
					for(var d=0;d<ds_list_size(input.selection.data_held);d++) {
						var data_index = input.selection.data_held[| d]
						var data_name = shop.item_data[data_index, item_name]
						draw_text(XX,YY,data_name) YY += 36
					}
					
				}
			
			#endregion
			
		break
	#endregion
}
