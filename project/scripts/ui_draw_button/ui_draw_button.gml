/// @param button_width
/// @param button_height
/// @param buttonX
/// @param buttonY
/// @param button_color
/// @param button_message
/// @param button_mouseover
/// @param [button_message_help]

var _button_width = argument[0]
var _button_height = argument[1]
var _buttonX = argument[2]
var _buttonY = argument[3]
var _button_color = argument[4]
var _button_message = argument[5]
var _button_mouseover = argument[6]
if argument_count == 8 {
	var _button_message_help = argument[7]
}

//	Draw button background color
draw_set_color(_button_color)
draw_roundrect(_buttonX,_buttonY,_buttonX+_button_width,_buttonY+_button_height,false)

//	Draw button outline
draw_set_color(c_black)
draw_roundrect(_buttonX,_buttonY,_buttonX+_button_width,_buttonY+_button_height,true)

//	Draw button string
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(_buttonX+(_button_width/2),_buttonY+(_button_height/2),_button_message)

//	Draw button help string
if argument_count == 8 and _button_mouseover == true {
	draw_set_valign(fa_bottom)
	draw_text(_buttonX+(_button_width/2),_buttonY-string_height(_button_message_help)-8,_button_message_help)	
}