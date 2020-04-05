var radius = contracts.contract[smartcontract, contract_radius]
var width = (radius/32)
					
var tempgrid = ds_grid_create(grid_width,grid_height)
ds_grid_set_region(tempgrid,0,0,grid_width-1,grid_height-1,0)
					
ds_grid_set_disk(tempgrid,center_cell_x,center_cell_y,width,1)
					
//	Loop through my sonar cells and decentralize any contracts that require my price
var kiosks = ds_list_create()
var data_im_giving = data_needed[0,0]
var data_string = shop.item_data[data_im_giving, item_name]
for(var w=0;w<grid_width;w++) {
	for(var h=0;h<grid_height;h++) {
		if tempgrid[# w, h] {
			//	This is a contract that I haven't added before, lets check if it needs my price
			if gridController.grid_items[# w, h] == kiosk and ds_list_find_index(kiosks,gridController.grid_objects[# w, h]) == -1 {
				var Kiosk = gridController.grid_objects[# w, h]
				if Kiosk != id {
					for(var d=0;d<array_height_2d(Kiosk.data_needed);d++) {
						var Data = Kiosk.data_needed[d,0]
						var needed_data_string = shop.item_data[Data, item_name]
						var price_string = is_price(needed_data_string, true)
						if is_string(price_string) and string_pos(price_string,data_string) != 0 {
							//	Lets make this guy decentralized
							Kiosk.data_needed[d,3] = true
							with Kiosk.System system_dataflow_check()
						}	
					}
					debug_log("Providing data to a new Contract")
					ds_list_add(kiosks,Kiosk)
				}
			}
		}	
	}
}
ds_list_copy(contracts_supporting, kiosks)
ds_list_destroy(kiosks)
ds_grid_destroy(tempgrid)