var selected_list = input.multireplaceIDs
ds_list_clear(input.multireplaceIDs)
ds_list_copy(input.multireplaceIDs,input.selections)
ds_list_clear(input.selections)

input.multireplace = true

//	Prelim loop
var x1 = 100
var y1 = 100
var x2 = -1
var y2 = -1
for(var i=0;i<ds_list_size(selected_list);i++) {
	with selected_list[| i] {
		var oldID = selected_list[| i]
		selected = false
		var Object_index = oldID.object_index
		var Name = oldID.name
		var Portrait = oldID.portrait
		var XX = oldID.center_cell_x
		var YY = oldID.center_cell_y
		if Object_index == kiosk var item_index = oldID.smartcontract else var item_index = oldID.item_index
		if Object_index == kiosk var newID = item_create(Object_index,XX,YY,item_index,Name,Portrait,0,item_index)
		else var newID = item_create(Object_index,XX,YY,item_index,Name,Portrait,0)
		
		input.selections[| i] = newID
		oldID.multireplaced = true
		oldID.multireplacedID = newID
		
		if topleft_cell_x < x1 x1 = topleft_cell_x
		if topleft_cell_y < y1 y1 = topleft_cell_y
		if bottomright_cell_x > x2 x2 = bottomright_cell_x
		if bottomright_cell_y > y2 y2 = bottomright_cell_y
	}
}

//	Find the center of the mass
var width = x2 - x1
var height = y2 - y1
input.centerX = x1 + floor(width/2)// + 1
input.centerY = y1 + floor(height/2)

for(var l=0;l<ds_list_size(selected_list);l++) {
	var oldID = selected_list[| l]
	var newID = input.selections[| l]
	var Object_index = newID.object_index
	
	var offsetX = oldID.center_cell_x - input.centerX
	var offsetY = oldID.center_cell_y - input.centerY
	var newX = input.grid_x + offsetX
	var newY = input.grid_y + offsetY
	
	newID.multireplace = true
	newID.multireplaceID = oldID
	newID.multireplace_offsetX = offsetX
	newID.multireplace_offsetY = offsetY
	
	newID.sockets = oldID.sockets
	newID.ports = oldID.ports
	newID.ports_count = oldID.ports_count
	if Object_index == node newID.ports_count_max = oldID.ports_count_max
	for(var p=0;p<newID.ports_count;p++) {
		if oldID.ports[p,port_object] > -1 {
			var connected_id = oldID.ports[p,port_object]
			//	This is part of our multiselection!
			if ds_list_find_index(selected_list,connected_id) > -1 {
				var index = ds_list_find_index(selected_list,connected_id)
				var new_connected_id = ds_list_find_value(input.selections,index)
				newID.ports[p,port_object] = new_connected_id
				newID.sockets[p] = new_connected_id
			}
			//	This is not part of our multiselection
			else {
				newID.ports[p,port_object] = -1
				newID.sockets[p] = -1
			}
		}
	}
	
	switch(Object_index) {
		case data:
		break
		case node:
		break
		case kiosk:
		break
		case wire:
			newID.sprite = oldID.sprite
			newID.straight = oldID.straight
			newID.rotation = oldID.rotation
			newID.color = oldID.color
		break
	}
	
	with newID {
		item_move(newX,newY)
	}
	
}