ini_open(working_directory + "savedgame.ini")

//	save general game information
var node_count = instance_number(node)

ini_write_real("General","Node Count",node_count)

var section = "Item Databases"
//	save the node item database
var database_copy = shop.item_node
for(var n=0;n<array_height_2d(database_copy);n++) {
	database_copy[n, node_object_index] = -1
}
var list = ds_list_create()
list[| 0] = database_copy
var string_encoded = ds_list_write(list)
ini_write_string(section,"Nodes DB",string_encoded)

//	save the nodes that are in the level
var ID = 0
var section = "Nodes"
with node {
	if states == states.placed {
		var key_base = string(ID)+"'s: "
		ini_write_real(section,key_base+"x",center_cell_x)
		ini_write_real(section,key_base+"y",center_cell_y)
		ini_write_real(section,key_base+"item_index",item_index)
		
		//	convert ports array into a ds_list and then encode it into a string
		var list = ds_list_create()
		list[| 0] = ports
		var string_encoded = ds_list_write(list)
		ini_write_string(section,key_base+"ports",string_encoded)
		ds_list_destroy(list)
		

	}
}

ini_close()