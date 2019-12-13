/// @param rotation 
/// @param grid
/// @param [ports]

var _rotation = argument[0]
var old_grid = argument[1]
if argument_count == 3 var _ports = argument[2]

var _size_width = ds_grid_width(old_grid)
var _size_height = ds_grid_height(old_grid)

var new_grid = ds_grid_create(_size_height,_size_width)
var new_size_width = _size_height
var new_size_height = _size_width

if argument_count == 3 {
	var new_array = []
	for(var i=0;i<array_height_2d(_ports);i++) {
		new_array[i,port_object] = _ports[i,port_object]
		new_array[i,port_direction] = _ports[i,port_direction]
		new_array[i,port_x] = _ports[i,port_x]
		new_array[i,port_y] = _ports[i,port_y]
	
	}
}

switch(_rotation)
{
	//	Right 
	case 1:
	
		for(var h=0;h<new_size_height;h++) {
			for(var w=0;w<new_size_width;w++) {
		
				var _cell = old_grid[# w, h]
		
				var new_cell_x = (new_size_width-1) - h
				var new_cell_y = w
				
				//	If this cell is a port
				if _cell == -2 and argument_count == 3 {
					for(var i=0;i<array_height_2d(_ports);i++) {
						//	If this is the port we're moving, update its x, y variables
						if _ports[i,port_x] == w and _ports[i,port_y] == h {
							new_array[i,port_x] = new_cell_x
							new_array[i,port_y] = new_cell_y
						}
					}
				}
		
				new_grid[# new_cell_x, new_cell_y] = _cell
		
			}
		}
		
	break
	
	//	Left
	case -1:
		
		for(var w=new_size_width-1;w>-1;w--) {
			for(var h=0;h<new_size_height;h++) {
		
				var _cell = old_grid[# w, h]
		
				var new_cell_x = h
				var new_cell_y = (new_size_height-1) - w
				
				//	If this cell is a port
				if _cell == -2 and argument_count == 3 {
					for(var i=0;i<array_height_2d(_ports);i++) {
						//	If this is the port we're moving, update its x, y variables
						if _ports[i,port_x] == w and _ports[i,port_y] == h {
							new_array[i,port_x] = new_cell_x
							new_array[i,port_y] = new_cell_y
						}
					}
				}
		
				new_grid[# new_cell_x, new_cell_y] = _cell
				//debug_log("x: "+string(new_cell_x)+", y: "+string(new_cell_y))
			}
		}
		
	break
}

ds_grid_clear(old_grid,-1)
ds_grid_copy(old_grid,new_grid)
ds_grid_destroy(new_grid)

if argument_count == 3 return new_array