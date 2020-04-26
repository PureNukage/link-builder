var current_nodes = 0
var unavailable_nodes = 0
for(var n=0;n<array_height_2d(shop.item_node);n++) {
	if shop.item_node[n, node_available] current_nodes++	
	else unavailable_nodes[array_length_1d(unavailable_nodes)] = n
}

var new_nodes = 0
if player.value >= 0 and current_nodes < 2 {
	new_nodes = 2	
}
if player.value >= 1000 and current_nodes < 3 {
	new_nodes = 1
}
if player.value >= 2000 and current_nodes < 4 {
	new_nodes = 1	
}
if player.value >= 3000 and current_nodes < 5 {
	new_nodes = 1	
}

while new_nodes > 0 {
	
	//	Make a random node available
	if is_array(unavailable_nodes) {
		if array_length_1d(unavailable_nodes) == 1 var Random = 0
		else if array_length_1d(unavailable_nodes) > 1 var Random = irandom_range(0,array_length_1d(unavailable_nodes)-1)
			
		var index = unavailable_nodes[Random]
		shop.item_node[index, node_available] = true
		
		new_nodes--
	}	
	
}