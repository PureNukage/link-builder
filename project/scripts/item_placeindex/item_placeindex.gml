///@param [id]

if argument_count == 1 {

	var _id = argument[0]

	with _id {
		for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
			for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
				gridController.grid_items[# w, h] = object_index
			}
		}
	}
} else {
	for(var w=topleft_cell_x;w<topleft_cell_x+size_width;w++) {
		for(var h=topleft_cell_y;h<topleft_cell_y+size_height;h++) {
			gridController.grid_items[# w, h] = object_index
		}
	}
}