///@param name
///@param price
///@param object_index
///@param text
///@param portrait
///@param [data_type]

var _name = argument[0]
var _price = argument[1]
var _object_index = argument[2]
var _text = argument[3]
var _portrait = argument[4]
if argument_count >= 6 var _data_generated = argument[5]

var item_index = array_height_2d(item_data)

var default_data_type = data_types.binance_ETHUSD

item_data[item_index, item_name] = _name
item_data[item_index, item_price] = _price
if argument_count >= 5 item_data[item_index, item_data_generated] = _data_generated 
else item_data[item_index, item_data_generated] = default_data_type
item_data[item_index, item_placed] = false
item_data[item_index, item_object_index] = _object_index
item_data[item_index, item_text] = _text
item_data[item_index, item_portrait] = _portrait
item_data[item_index, item_corruption] = 0