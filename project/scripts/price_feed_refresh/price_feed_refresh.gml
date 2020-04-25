var my_price = shop.item_data[data_needed[0,0], item_name]
for(var c=0;c<ds_list_size(contracts_supporting);c++) {
	var Kiosk = contracts_supporting[| c]
	
	if instance_exists(Kiosk) {
		for(var d=0;d<array_height_2d(Kiosk.data_needed);d++) {
			var Data = Kiosk.data_needed[d,0]
			var Data_string = shop.item_data[Data, item_name]
			var price_string = is_price(Data_string,true)
			if is_string(price_string) and string_pos(price_string,my_price) != 0 {
				Kiosk.data_needed[d,3] = false
			}
		}
		with Kiosk.System system_dataflow_check()
	} else debug_log("ERROR Attempting to unsupport a Kiosk that doesn't exist!")
}

ds_list_clear(contracts_supporting)