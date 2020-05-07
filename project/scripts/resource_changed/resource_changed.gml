///@param resource_string
///@param amount
///@param popup_x
///@param popup_y
///@param gui

var resource = argument[0]
var amount = argument[1]
var xx = argument[2]
var yy = argument[3]
var _gui = argument[4]

var _icon = -1

switch(resource)
{
	case "LINK":
		player.link -= amount
		_icon = s_resource_link_shop
	break
	case "ETH":
		player.eth -= amount
		_icon = s_resource_eth_shop
	break
	case "VALUE":
		player.value -= amount
		_icon = s_resource_value_shop
	break
	case "$$":
		player.money -= amount
		_icon = s_resource_money
		
		//	Person UI list
		if amount != 0 {
			ds_list_insert(player.money_list,0,amount)
			ds_list_insert(player.money_list_time,0,time.stream)
		}
		
	break
}

var _string = ""
var _color

if amount > 0 {
	//_string += "- " 
	_color = c_red
} else {
	//_string += "+ "
	_color = c_green
}

_string += string(amount)

if amount < 0 _string = string_replace(_string,"-","")

if app.tutorial == -1 and amount != 0 create_popup(xx,yy,_string,_color,1,3,_icon,_gui)

if instance_exists(system) with system {
	system_dataflow_check()	
}