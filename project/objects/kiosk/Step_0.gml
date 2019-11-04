if time.seconds_switch {
	if ds_list_size(data_list) > 0 {
		for(var i=0;i<ds_list_size(data_list);i++) {
			var _data = data_list[| i]
			for(var a=1;a<array_height_2d(data_needs);a++) {
				data_needs[a,1] = 0
				if _data == data_needs[a,0] {
					data_needs[a,1] = 1	
				}
			}
		}
		//	Update the contract data needs in object contrats
		ds_list_replace(contracts.contracts_list,contract_pos,data_needs)
		ds_list_clear(data_list)
		
		//	Is this contract complete?
		var _complete = 0
		for(var b=1;b<array_height_2d(data_needs);b++) {
			if data_needs[b,1] == 1 {
				_complete++	
			}
		}
		if _complete = array_height_2d(data_needs)-1 complete = true
		else complete = false
	}
}