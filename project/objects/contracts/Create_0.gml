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
menu_cap = 5
menu_index = 0

contract = 0

//	CREATE CONTRACTS
var _data = create_data_needed(data_types.binance_ETHUSD)
create_contract("Eth Transfer","",100,150,s_portrait_ethereum,2,10,5,_data)

var _data = create_data_needed(data_types.binance_ETHUSD,data_types.paypal)
var _string = "Blockchain users can now trade their ETH with\neach other for USD by querying a PayPal invoice"
create_contract("LinkPal",_string,200,500,s_portrait_linkpal,2,10,5,_data)

var _data = create_data_needed(data_types.binance_ETHUSD,data_types.github)
var _string = "An open-source software contributor is paid\nwhen their code gets merged into a project"
create_contract("BountiBot",_string,300,2000,s_portrait_bountibot,2,10,5,_data)


