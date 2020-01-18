///@param name
///@param text
///@param reward
///@param price
///@param [portrait]
///@param [channel_time]
///@param [max_traffic]
///@param [line_size]
///@param [contract_type]
///@param [level_ports]
///@param [data]
///@param [available]

var _name = argument[0]
var _text = argument[1]
var _reward = argument[2]
var _price = argument[3]
if argument_count >= 5 var _portrait = argument[4]
if argument_count >= 6 var _channel_time = argument[5]
if argument_count >= 7 var _max_traffic = argument[6]
if argument_count >= 8 var _line_size = argument[7]
if argument_count >= 9 var _contract_type = argument[8]
if argument_count >= 10 var _port_levels = argument[9]
if argument_count >= 11 var _data = argument[10]
if argument_count >= 12 var _available = argument[11]

var contract_index = array_height_2d(contract)

var default_max_traffic = 20
var default_channel_time = 2
var default_linesize = 5
var default_portrait = s_portrait_ethereum
var default_contract_type = contract_types.utility

var default_port_levels = []
default_port_levels[0] = 1
default_port_levels[1] = 2
default_port_levels[2] = 3
default_port_levels[3] = 4

var default_data = []
default_data[0,0] = data_types.binance_ETHUSD
default_data[0,1] = false
default_data[0,2] = -1

contract[contract_index, contract_name] = _name
contract[contract_index, contract_text] = _text
contract[contract_index, contract_reward] = _reward
contract[contract_index, contract_price] = _price
if argument_count >= 5 contract[contract_index, contract_portrait] = _portrait else contract[contract_index, contract_portrait] = default_portrait
if argument_count >= 6 contract[contract_index, contract_channel] = _channel_time else contract[contract_index, contract_channel] = default_channel_time
if argument_count >= 7 contract[contract_index, contract_traffic] = _max_traffic else contract[contract_index, contract_traffic] = default_max_traffic
if argument_count >= 8 contract[contract_index, contract_linesize] = _line_size else contract[contract_index, contract_linesize] = default_linesize
if argument_count >= 9 contract[contract_index, contract_type] = _contract_type else contract[contract_index, contract_linesize] = default_contract_type
if argument_count >= 10 contract[contract_index, contract_level_ports] = _port_levels else contract[contract_index, contract_level_ports] = default_port_levels
if argument_count >= 11 contract[contract_index, contract_data] = _data
else {
	var new_data = create_data_needed(data_types.binance_ETHUSD)
	contract[contract_index, contract_data] = new_data
}
if argument_count >= 12 contract[contract_index, contract_available] = _available else contract[contract_index, contract_available] = false

contract[contract_index, contract_online] = false
contract[contract_index, contract_kiosk] = -1
contract[contract_index, contract_traffic_live] = 0
contract[contract_index, contract_purchased] = false
contract[contract_index, contract_width] = 128
contract[contract_index, contract_height] = 64
contract[contract_index, contract_misfires] = 0
contract[contract_index, contract_reliability] = 100
contract[contract_index, contract_uses] = 0
contract[contract_index, contract_level] = 0

contracts_purchased[| contract_index] = true























