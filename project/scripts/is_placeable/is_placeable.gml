var _placeable = 0
//	Determine if placeable
for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
	for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
		
		if (w > -1 and w < grid_width) and (h > -1 and h < grid_height) {
			
			//	This cell is empty
			if gridController.grid_items[# w, h] == -1 or gridController.grid_items[# w, h] < 0 {
				
			} 
			//	This cell is NOT empty
			else {
				//	This cell contains myself
				if (replace and replace_id == gridController.grid_objects[# w, h]) or (multireplace and ds_list_find_index(input.multireplaceIDs,gridController.grid_objects[# w, h]) > -1) {
						
				}
				//	This cell contains another object
				else {
					_placeable++		
				}
			}
		} else {
			_placeable++	
		}
								
	}
}

//if item_index > -1 and !replace and object_index != node {
//	var resource_amount
//	switch(object_index) 
//	{
//		case node:	resource_amount = player.money break
//		case data: resource_amount = player.money break
//		case kiosk: resource_amount = player.value break
//	}
//	if resource_amount < price {
//		if app.tutorial == -1 {
//			_placeable++
//		}
//	}
//}

if topmenu.data_mouseover or plaque.window_mouseover or contracts.menu_mouseover { 
	_placeable++
}

if item_index > -1 and object_index == data and !replace and !multireplace and shop.item_data[item_index,item_placed] {
	_placeable++	
}

if item_index > -1 and object_index == node and !replace and !multireplace and shop.item_node[item_index, node_placed] {
	_placeable++	
}

if app.tutorial == tutorial.basics and tutorialHelper.stage < 7 {
	_placeable++	
}

if !_placeable {
	return true	
} else {
	return false	
}