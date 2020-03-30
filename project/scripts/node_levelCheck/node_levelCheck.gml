var current_level = shop.item_node[item_index, node_level]
var levels = shop.item_node[item_index, node_levels]
var leveled_up = false

var previous_runs = levels[current_level]
if current_level == array_length_1d(levels)-1 {
	var needed_runs = 100000	
} else {
	var needed_runs = levels[current_level+1]
}

if jobruns >= needed_runs {
	shop.item_node[item_index, node_level]++
	leveled_up = true
	debug_log("Node "+shop.item_node[item_index, node_name]+" is now level "+string(shop.item_node[item_index,node_level]))
}

if leveled_up {
	return true
} else {
	return false	
}