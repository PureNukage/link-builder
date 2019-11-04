if time.seconds_switch {
	for(var a=0;a<4;a++) {
		if cells[a,0] == 1 {
			if cells[a,1].object_index == kiosk {
				for(var i=0;i<ds_list_size(input_list);i++) {
					if ds_list_find_index(cells[a,1].data_list,input_list[| i]) == -1 {
						ds_list_add(cells[a,1].data_list,input_list[| i])	
					}
				}
				ds_list_clear(input_list)
			}
		}
	}
} 