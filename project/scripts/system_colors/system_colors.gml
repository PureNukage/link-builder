/////@param systems_index

//var index = argument[0]
//var color = -1

//var red = 0
//var green = 0 
//var blue = 0

//if index > 0 and index < 10 {
//	red = index * 20
//	green = 0
//	blue = 0
//} else if index > 10 and index < 20 {
//	index -= 10
//	red = 255
//	green = index * 20
//	blue = 0
//} else if index > 20 and index < 30 {
//	index -= 20
//	red = 255
//	green = 255
//	blue = index * 20
//}

//color = make_color_rgb(red,green,blue)

//return color

///@param system_index

var i = argument[0]

var color = -1
switch(i)
{
	case 0:	color = c_blue			break
	case 1:	color = c_red			break	
	case 2: color = c_green			break
	case 3: color = c_aqua			break
	case 4: color = c_fuchsia		break
	case 5: color = c_maroon		break
	case 6: color = c_lime			break
	case 7: color = c_navy			break
	case 8: color = c_olive			break
	case 9: color = c_orange		break
	case 10: color = c_purple		break
	case 11: color = c_silver		break
	case 12: color = c_yellow		break
}

return color 