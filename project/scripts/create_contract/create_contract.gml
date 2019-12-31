///@param name
///@param text
///@param reward
///@param price
///@param [channel_time]
///@param [max_traffic]
///@param [data]

var _name = argument[0]
var _text = argument[1]
var _reward = argument[2]
var _price = argument[3]
if argument_count >= 5 var _channel_time = argument[4]
if argument_count >= 6 var _max_traffic = argument[5]
if argument_count >= 7 var _data = argument[6]

var contract_index = array_height_2d(contract)

var default_max_traffic = 20
var default_channel_time = 2
var default_data = []
default_data[0,0] = data_types.binance_ETHUSD
default_data[0,1] = false
default_data[0,2] = -1

contract[contract_index, contract_name] = _name
contract[contract_index, contract_text] = _text
contract[contract_index, contract_reward] = _reward
contract[contract_index, contract_price] = _price
if argument_count >= 6 contract[contract_index, contract_traffic] = _max_traffic else contract[contract_index, contract_traffic] = default_max_traffic
if argument_count >= 5 contract[contract_index, contract_channel] = _channel_time else contract[contract_index, contract_traffic] = default_channel_time
if argument_count >= 7 contract[contract_index, contract_data] = _data
else {
	var new_data = create_data_needed(data_types.binance_ETHUSD)
	contract[contract_index, contract_data] = new_data
}

contract[contract_index, contract_online] = false
contract[contract_index, contract_kiosk] = -1
contract[contract_index, contract_traffic_live] = 0
contract[contract_index, contract_purchased] = false
contract[contract_index, contract_width] = -1
contract[contract_index, contract_height] = -1

contracts_purchased[| contract_index] = true























