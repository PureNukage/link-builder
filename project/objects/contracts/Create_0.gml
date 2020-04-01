button_active = true
button_width = 128
button_height = 64
buttonX = display_get_gui_width()-button_width-32
buttonY = 32
button_text = "Contracts"
button_mouseover = false
button_open = false

contracts_purchased = ds_list_create()
contracts_online = ds_list_create()

menu_mouseover = false
data_open = false
stats_open = false

item_index = 0

contract = 0

//	CREATE CONTRACTS
var _data = create_data_needed(data_types.binance_ETHUSD)
var levels = create_level_ports(1,1,1,1)
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_payment_eth,200,conditions.cnd_reliability_high,100)
create_contract("Eth Transfer","",5,150,s_portrait_ethereum,2,10,5,contract_types.people,levels,_data,false,Conditions,contract_types.hackathon)

var _data = create_data_needed(data_types.binance_ETHUSD,data_types.paypal)
var levels = create_level_ports(2,3,4,5)
var _string = "DeFi users can now trade their ETH with\neach other for USD by querying a PayPal invoice"
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_payment_eth,200,conditions.cnd_reliability_high,100)
create_contract("LinkPal",_string,20,500,s_portrait_linkpal,2,10,5,contract_types.people,levels,_data,true,Conditions,contract_types.hackathon)

var _data = create_data_needed(data_types.binance_ETHUSD,data_types.github)
var levels = create_level_ports(2,3,4,5)
var _string = "An open-source software contributor is paid\nwhen their code gets merged into a project"
var Conditions = create_conditions(conditions.cnd_active,400,conditions.cnd_payment_eth,200,conditions.cnd_reliability_high,250)
create_contract("BountiBot",_string,20,500,s_portrait_bountibot,2,10,5,contract_types.people,levels,_data,true,Conditions,contract_types.hackathon)

var _data = create_data_needed(data_types.binance_ETHUSD)
var _string = "Price Feeds can generate\na Decentralized price that nearby Contracts may use"
var levels = create_level_ports(1,2,3,4)
var Conditions = create_conditions(conditions.cnd_active,0)
create_contract("Price Feed",_string,0,500,s_portrait_ethereum,2,0,0,contract_types.utility,levels,_data,true,Conditions,contract_types.defi,384)

var _data = create_data_needed(data_types.emailAPI)
var _string = ""
var levels = create_level_ports(1,1,1,1)
var Conditions = create_conditions(conditions.cnd_active,125,conditions.cnd_reliability_high,125)
create_contract("Cerberus Wallet 2FA",_string,8,0,s_portrait_blank,2,10,5,contract_types.people,levels,_data,true,Conditions,contract_types.hackathon)

var _data = create_data_needed(data_types.binance_ETHUSD)
var _string = ""
var levels = create_level_ports(1,1,1,1)
var Conditions = create_conditions(conditions.cnd_active,125,conditions.cnd_reliability_high,125)
create_contract("Backerr",_string,12,0,s_portrait_blank,2,10,5,contract_types.people,levels,_data,true,Conditions,contract_types.hackathon)

var name = "TradingSet"
var _string = ""
var reward = 15
var price = 500
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,125,conditions.cnd_reliability_high,125)
var Contract_type2 = contract_types.hackathon
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Smart Marketing Campaign"
var _string = ""
var reward = 15
var price = 500
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,125,conditions.cnd_reliability_high,125)
var Contract_type2 = contract_types.hackathon
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Synthetix"
var _string = ""
var reward = 25
var price = 1000
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.defi
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Loopring"
var _string = ""
var reward = 25
var price = 1500
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.defi
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Etherisc"
var _string = ""
var reward = 25
var price = 1500
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.defi
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Compound"
var _string = ""
var reward = 25
var price = 1500
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.defi
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Bank Bond"
var _string = ""
var reward = 25
var price = 2500
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.enterprise
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "eSports Tournament"
var _string = ""
var reward = 25
var price = 1000
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.defi
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Crop Insurance"
var _string = ""
var reward = 25
var price = 3000
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.enterprise
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Cyber Security Insurance"
var _string = ""
var reward = 25
var price = 3000
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.enterprise
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Car Insurance"
var _string = ""
var reward = 25
var price = 3000
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.enterprise
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

var name = "Supply-Chain Agriculture Workflow"
var _string = ""
var reward = 25
var price = 2500
var portrait = s_portrait_blank
var channel_time = 2
var max_traffic = 10
var line_size = 5
var Contract_type = contract_types.people
var levels = create_level_ports(1,1,1,1)
var _data = create_data_needed(data_types.binance_ETHUSD)
var available = true
var Conditions = create_conditions(conditions.cnd_active,250,conditions.cnd_reliability_high,250)
var Contract_type2 = contract_types.enterprise
create_contract(name,_string,reward,price,portrait,channel_time,max_traffic,line_size,Contract_type,levels,_data,available,Conditions,Contract_type2)

//	GUI stuff
menu_width = 340
menu_height = 256
side_spacer = 16
menuX = display_get_gui_width() - menu_width - side_spacer
menuY = 120

amount_of_contracts = 0
	
contract_index = 0
contract_clamp = 5
contract_open = -1
	
name_width = 100
icon_width = 64
name_spacer = 32
icon_spacer = 16
	
line_width = name_width + icon_width + (name_spacer*2) + (icon_spacer*2)
line_height = 64

bar_width = 55
bar_height =  amount_of_contracts*line_height-20
barX = menuX + 6
barY = menuY + 6
	
handle_width = 42
handle_height = round(bar_height/(amount_of_contracts-1))
handleX = menuX + 12
handleY = barY + (contract_index*round(bar_height/(amount_of_contracts-1)))
handle_mouseover = false

contract_refresh()
	

