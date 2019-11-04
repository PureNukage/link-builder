if time.seconds_switch {
	for(var i=0;i<ds_list_size(data_list);i++) {
		var _data = data_list[| i]
		for(var a=0;a<array_height_2d(data_needs);a++) {
			if _data == data_needs[a,0] {
				data_needs[a,1] = 1	
				exit
			} else {
				data_needs[a,1] = 0	
			}
		}
	}
	ds_list_clear(data_list)
}