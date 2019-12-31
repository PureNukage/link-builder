///@param x
///@param y
///@param string
///@param color
///@param duration
///@param movespeed

var _x = argument[0]
var _y = argument[1]
var _text = argument[2]
var _color = argument[3]
var _duration = argument[4]
var _movespeed = argument[5]

var _popup = instance_create_layer(_x,_y,"Instances",popup)

_popup.color = _color 

_popup.duration = _duration

_popup.text = _text

_popup.movespeed = _movespeed

