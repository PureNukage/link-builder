///@param x1
///@param y1
///@param x2
///@param y2
///@param preferred_side		
///@param string 

var x1 = argument[0]
var y1 = argument[1]
var x2 = argument[2]
var y2 = argument[3]
var _direction = argument[4]
var _string = argument[5]

var _string_width = string_width(_string)
var _string_height = string_height(_string)

var buffer = 16

var rect_width = _string_width + (buffer*2)
var rect_height = _string_height + (buffer*2)

var rectX
var rectY
switch(_direction) 
{
	case 0:
		var rectX = (x2 + buffer) //+ rect_width
		var rectY = y1	
	break
	case 1:
		var rectX = x1
		var rectY = y2 + buffer
	break
	case 2:
		var rectX = (x1 - buffer) - rect_width
		var rectY = y1	
	break
	case 3:
		var rectX = x1
		var rectY = y1 - buffer
	break
}

//	Draw background
draw_set_color(c_dkgray)
draw_roundrect(rectX,rectY,rectX+rect_width,rectY+rect_height,false)

//	Draw background outline
draw_set_color(c_black)
draw_roundrect(rectX,rectY,rectX+rect_width,rectY+rect_height,true)

//	Draw text
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(rectX+(rect_width/2),rectY+(rect_height/2),_string)

var array = []
array[0] = rectX
array[1] = rectY
array[2] = rectX+rect_width
array[3] = rectY+rect_height

return array
