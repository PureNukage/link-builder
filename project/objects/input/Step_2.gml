#region Selection test

//	Single click selection
if mouse_left_press and grid_x > -1 and grid_y > -1 {
	var object = gridController.grid_objects[# grid_x, grid_y]
	//	We currently already have an item selected, lets unselect it!
	if selection {
		selection.selected = false
		if ds_list_find_index(selections,selection) != -1 {
			ds_list_delete(selections,ds_list_find_index(selections,selection))	
		}
		selection = -1
	} 
	//	No item selected
	else {
		if object > -1 and object != selection {
			selection = object
			selection.selected = true
			if ds_list_find_index(selections,selection) == -1 {
				ds_list_add(selections,selection)	
			}	
		}
	}
}

#endregion