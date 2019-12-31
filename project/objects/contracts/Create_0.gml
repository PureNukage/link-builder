button_width = 128
button_height = 64
buttonX = camera_get_view_width(camera.Camera)-button_width-32
buttonY = 32
button_text = "Contracts"
button_mouseover = false
button_open = false

contracts_purchased = ds_list_create()
contracts_online = ds_list_create()

menu_mouseover = false

contract = []

//	CREATE CONTRACTS
var _data = create_data_needed(data_types.binance_ETHUSD)
create_contract("Eth Transfer","",100,150,2,20,_data)

var _data = create_data_needed(data_types.binance_ETHUSD,data_types.paypal)
create_contract("LinkPal","",200,500,2,20,_data)


