with kiosk {
	if complete == true and ds_list_size(line) < 5 {
		if ds_list_size(other.person_available_list) == 1 {
			var _random = 0	
		} else if ds_list_size(other.person_available_list) == 0 {
			var _random = -1
			debug_log("ERROR Out of available persons! ERROR")
		} else {
			var _random = irandom_range(0,ds_list_size(other.person_available_list)-1)	
		}
		
		if _random > -1 {
			with other.person_available_list[| _random] {
				Kiosk = other
				in_line = true
				ds_list_add(other.line,id)
				//line_pos = ds_list_find_index(other.line,id)
				ds_list_delete(personController.person_available_list,ds_list_find_index(personController.person_available_list,id))
			}
		}
		
	}
}