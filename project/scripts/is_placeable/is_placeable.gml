var _placeable = 0
//	Determine if placeable
for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
	for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
		
		if (w > -1 and w < grid_width+1) and (h > -1 and h < grid_height+1) {
								
			if gridController.grid_items[# w, h] == -1 {
									
			} else {
				_placeable++		
			}
		} else {
			_placeable++	
		}
								
	}
}

if !_placeable {
	return true	
} else {
	return false	
}