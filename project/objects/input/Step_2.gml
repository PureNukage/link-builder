#region Selection 

//	Single click selection
if mouse_left_press and grid_x > -1 and grid_y > -1 {
	var object = gridController.grid_objects[# grid_x, grid_y]
	//	We currently already have an item selected, lets unselect it!
	if selection > -1 and selection != object and object > -1 {
		selection.selected = false
		if ds_list_find_index(selections,selection) != -1 {
			ds_list_delete(selections,ds_list_find_index(selections,selection))	
		}
		selection = object
		selection.selected = !selection.selected
		if ds_list_find_index(selections,selection) == -1 {
			ds_list_add(selections,selection)	
		}	
	} else if selection > -1 and selection == object {
		selection.selected = !selection.selected
		
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
		}
		
	}	
}

if selection == -1 and !ds_list_empty(selections) {
	ds_list_clear(selections)
	debug_log("Clearing selections")
}

#endregion