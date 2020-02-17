menu_index_string = menu_choices[menu_index]
switch(menu_index_string)
{
	case "Data":
		icon = s_resource_money
		array = item_data
	break
	case "Nodes":
		icon = s_resource_money
		array = item_node
	break
	case "Contracts":
		icon = s_resource_value_shop
		array = contracts.contract
	break
}

const_bar_width = 55
const_handle_width = 42
	
list_spacer = 8
name_spacer = 16
name_width = 120	//	default
icon_width = sprite_get_width(icon)
price_spacer = 8
price_width = 28
	
list_width = (list_spacer*2)+(name_spacer*2)+name_width+icon_width+(price_spacer*2)+price_width
list_height = 40
price_width = 40
icon_width = 40
		
amount_of_items = array_height_2d(array)
if menu_index_string == "Contracts" {
	amount_of_items = 0
	for(var i=0;i<array_height_2d(array);i++) {
		if !array[i, contract_purchased] amount_of_items++
	}
}
item_index = 0
item_clamp = 4
item_mouseover = -1
amount_of_items = clamp(amount_of_items,0,item_clamp)

#region	Lets get our list width (todo: height)
	draw_set_font(fnt_shop)
	for(var i=0;i<array_height_2d(array);i++) {
		//if array[item_available] {
			var _name = array[i, item_name]
			var _price = array[i, item_price]
			var _name_width = string_width(_name)
			//var _string_height = string_height(_name)
			var _price_width = string_width(string(_price))
		
			var this_list_width = (list_spacer*2)+(name_spacer*2)+_name_width+icon_width+(price_spacer*2)+_price_width
		
			if this_list_width > list_width list_width = this_list_width
		//}
		
	}
	draw_set_font(-1)
#endregion

//	Shop Menu scrollbar
bar_width = const_bar_width
bar_height = amount_of_items*60-20
barX = menuX+menu_width - bar_width - 6
barY = menuY+menu_header_height-header_buffer+6
	
handle_width = const_handle_width
handle_height = round(bar_height/(amount_of_items))
handleX = menuX+menu_width - handle_width - 12
handleY = barY + (item_index*round(bar_height/(amount_of_items)))

//if shop_plaqueCheck() {
//	instance_destroy(Plaque)
//	Plaque = -1
//}