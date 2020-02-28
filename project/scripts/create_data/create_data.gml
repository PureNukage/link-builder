///@param name
///@param price
///@param object_index
///@param text
///@param portrait
///@param [data_type]
///@param [corruption_levels]
///@param [available]
///@param [data_filter]

var _name = argument[0]
var _price = argument[1]
var _object_index = argument[2]
var _text = argument[3]
var _portrait = argument[4]
if argument_count >= 6 var _data_generated = argument[5]
if argument_count >= 7 var _data_corruption = argument[6]
if argument_count >= 8 var _data_available = argument[7]
if argument_count >= 9 var _data_filter = argument[8]

var item_index = array_height_2d(item_data)

var default_data_type = data_types.binance_ETHUSD

item_data[item_index, item_name] = _name
item_data[item_index, item_price] = _price
if argument_count >= 6 item_data[item_index, item_data_generated] = _data_generated else item_data[item_index, item_data_generated] = default_data_type
if argument_count >= 7 item_data[item_index, item_corruption_levels] = _data_corruption else {
	item_data[item_index, item_corruption_levels] = create_data_corruption(0,-1,0) 	
}
if argument_count >= 8 item_data[item_index, item_available] = _data_available else item_data[item_index, item_available] = false
if argument_count >= 9 item_data[item_index, item_filter] = _data_filter else item_data[item_index, item_filter] = data_filters.webdata
item_data[item_index, item_placed] = false
item_data[item_index, item_object_index] = -1 //_object_index
item_data[item_index, item_text] = _text
item_data[item_index, item_portrait] = _portrait
item_data[item_index, item_calls] = 0
item_data[item_index, item_corruption] = 0
item_data[item_index, item_purchased] = false