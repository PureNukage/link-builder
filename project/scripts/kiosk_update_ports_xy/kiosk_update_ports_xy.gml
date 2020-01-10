///@param direction

//var _rotation = argument[0]

var _direction = argument[0]

if _direction == 1 {
	//	Rotate to the right
	for(var p=0;p<ports_count;p++) {
	
		//	Right side 
		if ports[p,port_x] == bottomright_cell_x+1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
		
			var new_x = center_cell_x + y_diff
			var new_y = center_cell_y - x_diff
		
			ports[p,port_x] = new_x
			ports[p,port_y] = new_y
		
		}  
		//	Bottom side
		else if ports[p,port_y] == bottomright_cell_y+1 {
		
			var x_diff = ports[p,port_x] - center_cell_x
			var y_diff = ports[p,port_y] - center_cell_y
		
			var new_x = center_cell_x - y_diff
			var new_y = center_cell_y + x_diff
			
		}
		//	Left side
		else if ports[p,port_x] == topleft_cell_x-1 {
		
			var x_diff = abs(ports[p,port_x] - center_cell_x)
			var y_diff = abs(ports[p,port_y] - center_cell_y)
		
			var new_x = center_cell_x - y_diff
			var new_y = center_cell_y - x_diff
		
		}
		//	Top side
		else if ports[p,port_y] == topleft_cell_y-1 {
		
			var x_diff = abs(ports[p,port_x] - center_cell_x)
			var y_diff = abs(ports[p,port_y] - center_cell_y)
		
			var new_x = center_cell_x + y_diff
			var new_y = center_cell_y - x_diff
			
		}
	}
}
////	Rotate to the left
//for(var p=0;p<ports_count;p++) {
//	//	Right side 
//	if ports[p,port_x] == bottomright_cell_x+1 {
	
		
//	}  
//	//	Bottom side
//	else if ports[p,port_y] == bottomright_cell_y+1 {
	
			
//	}
//	//	Left side
//	else if ports[p,port_x] == topleft_cell_x-1 {	

		
//	}
//	//	Top side
//	else if ports[p,port_y] == topleft_cell_y-1 {	

			
//	}	
//}

////	Movement Update
//for(var p=0;p<ports_count;p++) {
//		//	Right side 
//	if center_cell_x+ports[p,port_x_diff] == bottomright_cell_x+1 {
	
//	}  
//	//	Bottom side
//	else if center_cell_y+ports[p,port_y_diff] == bottomright_cell_y+1 {
			
//	}
//	//	Left side
//	else if center_cell_x+ports[p,port_x_diff] == topleft_cell_x-1 {	

//	}
//	//	Top side
//	else if center_cell_y+ports[p,port_y_diff] == topleft_cell_y-1 {	

			
//	}
	
//	ports[p,port_x] = center_cell_x + ports[p,port_x_diff]
//	ports[p,port_y] = center_cell_y + ports[p,port_y_diff]
//}

//switch(abs(_rotation))
//{
//	case 0:	//	Ports at left and right
	
//		ports[0,port_x] = center_cell_x -  topleft_cell_x - 1
//		ports[0,port_y] = center_cell_y
//		//ports[1,port_x] = bottomright_cell_x + 1
//		//ports[1,port_y] = center_cell_y
	
//	break
//	case 270:
		
//		ports[0,port_x] = center_cell_x
//		ports[0,port_y] = topleft_cell_y - 1
//		//ports[1,port_x] = center_cell_x
//		//ports[1,port_y] = bottomright_cell_y + 1
		
//	break
//	case 180:
		
//		ports[0,port_x] = bottomright_cell_x + 1
//		ports[0,port_y] = center_cell_y
//		//ports[1,port_x] = topleft_cell_x - 1
//		//ports[1,port_y] = center_cell_y
		
//	break
//	case 90:
		
//		ports[0,port_x] = center_cell_x
//		ports[0,port_y] = bottomright_cell_y + 1
//		//ports[1,port_x] = center_cell_x
//		//ports[1,port_y] = topleft_cell_y - 1
		
//	break
//}