///@param name
///@param text
///@param price
///@param [jobruns]
///@param [level]
///@param [levels]
///@param [available]

var _node_name = argument[0]
var _node_text = argument[1]
var _node_price = argument[2]
if argument_count >= 4 var _node_jobruns = argument[3]
if argument_count >= 5 var _node_level = argument[4]
if argument_count >= 6 var _node_levels = argument[5]
if argument_count >= 7 var _node_available = argument[6]

var new_node = array_height_2d(item_node)

item_node[new_node, node_name] = _node_name
item_node[new_node, node_text] = _node_text
item_node[new_node, node_price] = _node_price

item_node[new_node, node_placed] = 0
item_node[new_node, node_object_index] = -1
if argument_count >= 4 item_node[new_node, node_jobruns] = _node_jobruns else item_node[new_node, node_jobruns] = 0
if argument_count >= 5 item_node[new_node, node_level] = _node_level else item_node[new_node, node_level] = 0
if argument_count >= 6 item_node[new_node, node_levels] = _node_levels 
else {
	item_node[new_node, node_levels] = create_levels(0, 2)	
}
if argument_count >= 7 item_node[new_node, node_available] = _node_available else item_node[new_node, node_available] = false
item_node[new_node, node_level_ports] = create_level_ports(2,4,6,8)
item_node[new_node, node_uptime] = 0
item_node[new_node, node_purchased] = false