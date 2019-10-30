x += (keyboard_check(ord("D")) - keyboard_check(ord("A")))*5
y += (keyboard_check(ord("S")) - keyboard_check(ord("W")))*5

var edgeX = camera_get_view_width(cam)/2
var edgeY = camera_get_view_height(cam)/2
x = clamp(x,0+edgeX,room_width-edgeX)
y = clamp(y,0+edgeY,room_height-edgeY)