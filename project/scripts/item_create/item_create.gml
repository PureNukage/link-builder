///@param object_index
///@param x
///@param y
///@param index
///@param name
///@param portrait 
///@param price
///@param [smartcontract]

var object = argument[0]
var xx = argument[1]
var yy = argument[2]
var index = argument[3]
var Name = argument[4]
var Portrait = argument[5]
var Price = argument[6]
if argument_count >= 8 var Smartcontract = argument[7]

var Item = instance_create_layer(xx,yy,"Instances",object)

Item.name = Name
Item.item_index = index
Item.portrait = Portrait
Item.price = Price

if argument_count >= 8 {
	Item.smartcontract = Smartcontract
	Item.data_needed = contracts.contract[Smartcontract, contract_data]
	var level = contracts.contract[Smartcontract, contract_level]
	var ports_level = contracts.contract[Smartcontract, contract_level_ports]
	Item.ports_count = ports_level[level]
}	

return Item