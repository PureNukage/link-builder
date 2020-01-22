//	Movement Update
for(var p=0;p<ports_count;p++) {	
	ports[p,port_x] = center_cell_x + ports[p,port_x_diff]
	ports[p,port_y] = center_cell_y + ports[p,port_y_diff]
}