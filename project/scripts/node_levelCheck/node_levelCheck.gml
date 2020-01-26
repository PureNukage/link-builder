var current_level = shop.item_node[item_index, node_level]
var levels = shop.item_node[item_index, node_levels]
var leveled_up = false
for(var l=0;l<array_height_2d(shop.item_node[item_index, node_levels]);l++) {
	if jobruns >= levels[l, 0] and !levels[l,2] and l > current_level {
		shop.item_node[item_index, node_level]++
		levels[current_level, 2] = false
		levels[l, 2] = true
		leveled_up = true
		debug_log("Node "+shop.item_node[item_index, node_name]+" is now level "+string(shop.item_node[item_index,node_level]))
	}
}
shop.item_node[item_index, node_levels] = levels
if leveled_up {
	return true
} else {
	return false	
}