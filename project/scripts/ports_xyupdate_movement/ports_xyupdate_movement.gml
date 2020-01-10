//	Movement Update
for(var p=0;p<ports_count;p++) {
		//	Right side 
	//if center_cell_x+ports[p,port_x_diff] == bottomright_cell_x+1 {
	
	//}  
	////	Bottom side
	//else if center_cell_y+ports[p,port_y_diff] == bottomright_cell_y+1 {
			
	//}
	////	Left side
	//else if center_cell_x+ports[p,port_x_diff] == topleft_cell_x-1 {	

	//}
	////	Top side
	//else if center_cell_y+ports[p,port_y_diff] == topleft_cell_y-1 {	

			
	//}
	
	ports[p,port_x] = center_cell_x + ports[p,port_x_diff]
	ports[p,port_y] = center_cell_y + ports[p,port_y_diff]
}