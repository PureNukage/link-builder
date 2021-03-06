//	object_index specific stuff
switch(object_index)
{
	case node:
		shop.item_node[item_index, node_placed] = true
		shop.item_node[item_index, node_purchased] = true
		shop.item_node[item_index, node_object_index] = id
	break
	case data:
		
		////	GAME ANALYTICS	update resources if this is a new data purchase
		if input.selection = id and app.tutorial == -1 and !shop.item_data[item_index, item_purchased] {
			var Price = shop.item_data[item_index, item_price]
			ga_addResourceEvent(GA_RESOURCEFLOWTYPE_SINK, "money", Price, "purchase", name)
		}
	
		if !replace	resource_changed("$$",price,gui_mouse_x,gui_mouse_y,true)	
		shop.item_data[item_index, item_placed] = true
		shop.item_data[item_index, item_purchased] = true
		shop.item_data[item_index, item_object_index] = id
	break
	case kiosk:
		contracts.contract[smartcontract, contract_purchased] = true
		contracts.contract[smartcontract, contract_kiosk] = id
	break
}

if object_index != wire ds_grid_set_disk(gridController.grid_fog,center_cell_x,center_cell_y,16,1)

states = states.placed
			
item_placeindex()
item_placeid()
			
var _x1 = gridController.grid_positions_x[topleft_cell_x]+(cell_width/2)
var _y1 = gridController.grid_positions_y[topleft_cell_y]+(cell_height/2)
var _x2 = gridController.grid_positions_x[bottomright_cell_x]+(cell_width/2)
var _y2 = gridController.grid_positions_y[bottomright_cell_y]+(cell_height/2)
			
mp_grid_add_rectangle(gridController.mp_grid,_x1,_y1,_x2,_y2)
			
//	Add ports
for(var _p=0;_p<ports_count;_p++) {
	var _grid = gridController.grid_port_objects
	var _grid_x = gridController.grid_port_x
	var _grid_y = gridController.grid_port_y
	ds_list_add(_grid,id)
	ds_list_add(_grid_x,ports[_p,port_x])
	ds_list_add(_grid_y,ports[_p,port_y])
	gridController.grid_items[# ports[_p,port_x], ports[_p,port_y]] = -2
	//	if we have ports to connect
	if sockets[_p] > -1 and ports[_p,port_object] == -1 {
		ports[_p,port_object] = sockets[_p]
		debug_log("Connecting "+string(sockets[_p])+" to Port["+string(_p)+"]")
		for(var _pp=0;_pp<sockets[_p].ports_count;_pp++) {
			//	lets connect our items port to us as well
			if sockets[_p].sockets[_pp] > -1 and sockets[_p].ports[_pp,port_object] == -1 {
				sockets[_p].ports[_pp,port_object] = id
				with sockets[_p] {
					debug_log("Connecting "+string(other.id)+" to Port["+string(_pp)+"]")	
				}
			}
		}
	}
}

//	If this item was already placed
if (replace and instance_exists(replace_id)) or multireplace {
	//if multireplace with multireplaceID item_delete()
	if !multireplace with replace_id item_delete()	
	if object_index != wire ds_grid_set_disk(gridController.grid_fog,center_cell_x,center_cell_y,16,1)			
	item_placeindex()
	item_placeid()
	mp_grid_add_rectangle(gridController.mp_grid,_x1,_y1,_x2,_y2)
	if multireplace {
		multireplace = false
		multireplaceID = -1
		multireplace_offsetX = -1
		multireplace_offsetY = -1
	}
	//	object_index specific stuff
	switch(object_index)
	{
		case node:
			shop.item_node[item_index, node_placed] = true
			shop.item_node[item_index, node_purchased] = true
			shop.item_node[item_index, node_object_index] = id
		break
		case data:
			if !replace resource_changed("$$",price,gui_mouse_x,gui_mouse_y,true)
			shop.item_data[item_index, item_placed] = true
			shop.item_data[item_index, item_purchased] = true
			shop.item_data[item_index, item_object_index] = id
		break
		case kiosk:
			contracts.contract[smartcontract, contract_purchased] = true
			contracts.contract[smartcontract, contract_kiosk] = id
		break
	}
	
}
			
system_set()

//fogCheck()

check_availableData()
pricedata_priceCheck()

item_index_priority()
			
x = gridController.grid_positions_x[center_cell_x]+(cell_width/2)
y = gridController.grid_positions_y[center_cell_y]+(cell_height/2)
