/// @param rotation 
/// @param grid

var _rotation = argument[0]
var old_grid = argument[1]

var _size_width = ds_grid_width(old_grid)
var _size_height = ds_grid_height(old_grid)

var new_grid = ds_grid_create(_size_width,_size_height)

switch(_rotation)
{
	//	Right 
	case 1:
	
		for(var h=0;h<_size_height;h++) {
			for(var w=0;w<_size_width;w++) {
		
				var _cell = old_grid[# w, h]
		
				var new_cell_x = (_size_width-1) - h
				var new_cell_y = w
		
				new_grid[# new_cell_x, new_cell_y] = _cell
		
			}
		}
		
	break
	
	//	Left
	case -1:
		
		for(var w=_size_width-1;w>-1;w--) {
			for(var h=0;h<_size_height;h++) {
		
				var _cell = old_grid[# w, h]
		
				var new_cell_x = h
				var new_cell_y = (_size_height-1) - w
		
				new_grid[# new_cell_x, new_cell_y] = _cell
		
			}
		}
		
	break
}

ds_grid_clear(old_grid,-1)
ds_grid_copy(old_grid,new_grid)
ds_grid_destroy(new_grid)