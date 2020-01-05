var _placeable = 0
//	Determine if placeable
for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
	for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
		
		if (w > -1 and w < grid_width) and (h > -1 and h < grid_height) {
								
			if gridController.grid_items[# w, h] == -1 or gridController.grid_items[# w, h] < 0 {
				
			} else {
				_placeable++		
			}
		} else {
			_placeable++	
		}
								
	}
}

if item_index > -1 {
	if player.points < price {
		_placeable++
	}
}

if shop.menu_mouseover or shop.menu_mouseover or plaque.window_two_mouseover or contracts.menu_mouseover { 
	_placeable++
}

if item_index > -1 and object_index == data and shop.item_data[item_index,2] {
	_placeable++	
}

if !_placeable {
	return true	
} else {
	return false	
}