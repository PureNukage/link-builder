if time.seconds_switch {
	for(var a=0;a<4;a++) {
		if cells[a,0] == 1 {
			if cells[a,1] > 0 {
				if object_get_parent(cells[a,1].object_index) == nodeParent {
					ds_stack_push(cells[a,1].input_stack,output)
					var _popup = instance_create_layer(x,y-96,"Instances",popup)
					_popup.color = c_orange
					_popup.duration = 30
					_popup.message = "Data created"
				}
			}
		}
	}
}