#region Selection 

if selection_timer > 0 selection_timer-- 

if selection == -1 and !ds_list_empty(selections) {
	for(var i=0;i<ds_list_size(selections);i++) {
		if !instance_exists(selections[| i]) {

		} else {
			selections[| i].selected = false	
		}
	}
	ds_list_clear(selections)
	debug_log("Clearing selections")
}

if grid_x > -1 and grid_y > -1 and !plaque.window_two_mouseover and !plaque.button_delete_mouseover {
	//	Creating selection rectangle x1 and y1
	if mouse_left_press and selection_timer == -1 {
		selection_x1 = mouse_x
		selection_y1 = mouse_y
		selection_cell_x1 = grid_x
		selection_cell_y1 = grid_y
		selection_timer = 5
	}

	//	Creating our selection x2 and y2
	if mouse_left and selection_timer == 0 and selection == -1 {
		selection_x2 = mouse_x
		selection_y2 = mouse_y
		selection_cell_x2 = grid_x
		selection_cell_y2 = grid_y
	}


	//	Single click selection
	if (mouse_left_release and selection_timer > 0 and !shop.menu_mouseover) or
	(mouse_left_release and selection_timer == 0 and selection_x2 == -1 and selection_y2 == -1 and !shop.menu_mouseover) {
		selection_timer = -1
		var object = gridController.grid_objects[# grid_x, grid_y]
		
		//	This object isn't in our selections
		if !ds_list_empty(selections) and ds_list_find_index(selections,object) == -1 {
			for(var i=0;i<ds_list_size(selections);i++) {
				if !instance_exists(selections[| i]) {

				} else {
					selections[| i].selected = false	
				}
			}
			ds_list_clear(selections)
			debug_log("Clearing selections")
			
			selection = object
			selection.selected = true
			ds_list_add(selections,object)
		} 
		//	This object is in our selections, lets switch to it
		else if !ds_list_empty(selections)and ds_list_size(selections) > 1 and ds_list_find_index(selections,object) > -1 {
			selection = object
			
		} 
		//	We currently already have an item selected, lets unselect it!
		else if ds_list_size(selections) == 1 and selection > -1 and selection != object and object > -1 {
			selection.selected = false
			if ds_list_find_index(selections,selection) != -1 {
				ds_list_delete(selections,ds_list_find_index(selections,selection))	
			}
			selection = object
			selection.selected = !selection.selected
			if ds_list_find_index(selections,selection) == -1 {
				ds_list_add(selections,selection)	
			}	
		} else if ds_list_size(selections) == 1 and selection > -1 and selection == object {
			selection.selected = !selection.selected
			if !selection.selected {
				if ds_list_find_index(selections,selection) != -1 {
					ds_list_delete(selections,ds_list_find_index(selections,selection))	
				}	
				selection = -1
			}
		
		} else if selection == -1 and object > -1 {
			selection = object
			selection.selected = !selection.selected
			if ds_list_find_index(selections,selection) == -1 {
				ds_list_add(selections,selection)	
			}	
		} else if object == -1 {
			if selection > -1 {
				selection.selected = false
				if ds_list_find_index(selections,selection) != -1 {
					ds_list_delete(selections,ds_list_find_index(selections,selection))	
				}	
				selection = -1
			}
			
			selection_x1 = -1
			selection_y1 = -1
			
		}	
	} 
	//	Clicking on the menu/selecting anoth
	else if (mouse_left_release and selection_timer > 0) and shop.menu_mouseover or
	(mouse_left_release and selection_timer == 0 and selection_x2 == -1 and selection_y2 == -1) and shop.menu_mouseover{
		selection_x1 = -1
		selection_y1 = -1	
		selection_timer = -1
		
		var currently_selected = -1
		for(var i=0;i<ds_list_size(selections);i++) {
			if selections[| i] = selection {
				currently_selected = selections[| i]
			} else {
				if !instance_exists(selections[| i]) {
					
				} else {
					selections[| i].selected = false	
				}
			}
		}
		ds_list_clear(selections)
		ds_list_add(selections,currently_selected)
		debug_log("Clearing selections")
	}
	//	Rectangle selection
	else if mouse_left_release and selection_timer == 0 and selection_x2 > -1 and selection_y2 > -1 {
		
		//	Get topleft cell_x1, y1
		var _x1 = min(selection_cell_x1,selection_cell_x2)
		var _y1 = min(selection_cell_y1,selection_cell_y2)
		var _x2 = max(selection_cell_x1,selection_cell_x2)
		var _y2 = max(selection_cell_y1,selection_cell_y2)
		
		//	Check if this grid cell is within the rectangle, if so and it has an item then its selected
		var first = -1
		for(var w=_x1;w<_x2+1;w++) {
			for(var h=_y1;h<_y2+1;h++) {
				var _object = gridController.grid_objects[# w, h]
				if _object > -1 and ds_list_find_index(selections,_object) == -1 {
					if first == -1 {
						first = 1 
						selection = _object
					}
					ds_list_add(selections,_object)
					_object.selected = true
				}
			}
		}
		
		selection_x1 = -1
		selection_y1 = -1
		selection_x2 = -1
		selection_y2 = -1
		selection_cell_x1 = -1
		selection_cell_y1 = -1
		selection_cell_x2 = -1
		selection_cell_y2 = -1
		selection_timer = -1
	} 
	
}

#endregion