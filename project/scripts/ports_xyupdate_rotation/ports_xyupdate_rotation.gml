///@param direction

//var _rotation = argument[0]

var _direction = argument[0]

if _direction == 1 {
	//	Rotate to the right
	for(var p=0;p<ports_count;p++) {
	
		//	Right side 
		if center_cell_x+ports[p,port_x_diff] == bottomright_cell_x+1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
		
			var new_x = center_cell_x + ports[p,port_y_diff]
			var new_y = center_cell_y + ports[p,port_x_diff]
		
		}  
		//	Bottom side
		else if center_cell_y+ports[p,port_y_diff] == bottomright_cell_y+1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
		
			var new_x = center_cell_x - ports[p,port_y_diff]
			var new_y = center_cell_y + ports[p,port_x_diff]
			
		}
		//	Left side
		else if center_cell_x+ports[p,port_x_diff] == topleft_cell_x-1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
			
			var x_diff_abs = abs(x_diff)
			var y_diff_abs = abs(y_diff)
		
			var new_x = center_cell_x - abs(ports[p,port_y_diff])
			var new_y = center_cell_y - abs(ports[p,port_x_diff])
		
		}
		//	Top side
		else if center_cell_y+ports[p,port_y_diff] == topleft_cell_y-1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
			
			var x_diff_abs = abs(x_diff)
			var y_diff_abs = abs(y_diff)
		
			var new_x = center_cell_x + abs(ports[p,port_y_diff])
			var new_y = center_cell_y - abs(ports[p,port_x_diff])
			
		}
		
		ports[p,port_x] = new_x
		ports[p,port_y] = new_y
		ports[p,port_x_diff] = ports[p,port_x] - center_cell_x
		ports[p,port_y_diff] = ports[p,port_y] - center_cell_y
	}
} else if _direction == -1 {
	//	Rotate to the left
	for(var p=0;p<ports_count;p++) {
		//	Right side 
		if center_cell_x+ports[p,port_x_diff] == bottomright_cell_x+1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
		
			var new_x = center_cell_x + ports[p,port_y_diff]
			var new_y = center_cell_y - ports[p,port_x_diff]
		
		}  
		//	Bottom side
		else if center_cell_y+ports[p,port_y_diff] == bottomright_cell_y+1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
		
			var new_x = center_cell_x + ports[p,port_y_diff]
			var new_y = center_cell_y - ports[p,port_x_diff]
			
		}
		//	Left side
		else if center_cell_x+ports[p,port_x_diff] == topleft_cell_x-1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
			
			var x_diff_abs = abs(x_diff)
			var y_diff_abs = abs(y_diff)
		
			var new_x = center_cell_x - abs(ports[p,port_y_diff])
			var new_y = center_cell_y + abs(ports[p,port_x_diff])
		
		}
		//	Top side
		else if center_cell_y+ports[p,port_y_diff] == topleft_cell_y-1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
			
			var x_diff_abs = abs(x_diff)
			var y_diff_abs = abs(y_diff)
		
			var new_x = center_cell_x - abs(ports[p,port_y_diff])
			var new_y = center_cell_y + abs(ports[p,port_x_diff])
			
		}
		
		ports[p,port_x] = new_x
		ports[p,port_y] = new_y
		ports[p,port_x_diff] = ports[p,port_x] - center_cell_x
		ports[p,port_y_diff] = ports[p,port_y] - center_cell_y
	}
}	
