///@param systems_index

var index = argument[0]
var color = -1

var red = 0
var green = 0 
var blue = 0

if index > 0 and index < 10 {
	red = index * 20
	green = 0
	blue = 0
} else if index > 10 and index < 20 {
	index -= 10
	red = 255
	green = index * 20
	blue = 0
} else if index > 20 and index < 30 {
	index -= 20
	red = 255
	green = 255
	blue = index * 20
}

color = make_color_rgb(red,green,blue)

return color