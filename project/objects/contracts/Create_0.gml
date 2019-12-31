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

//var _kiosk = place_kiosk(25,17)

contract = []
contract[contract_types.eth_transfer, contract_name] = "Eth Transfer"
contract[contract_types.eth_transfer, contract_online] = false
contract[contract_types.eth_transfer, contract_kiosk] = -1 //_kiosk
contract[contract_types.eth_transfer, contract_traffic] = 20
contract[contract_types.eth_transfer, contract_traffic_live] = 0
contract[contract_types.eth_transfer, contract_reward] = 100
contract[contract_types.eth_transfer, contract_price] = 150
contract[contract_types.eth_transfer, contract_purchased] = 0
contract[contract_types.eth_transfer, contract_channel] = 2		//	in Seconds
contract[contract_types.eth_transfer, contract_width] = -1
contract[contract_types.eth_transfer, contract_height] = -1

contracts_purchased[| contract_types.eth_transfer] = true

//_kiosk.smartcontract = contract_types.eth_transfer

