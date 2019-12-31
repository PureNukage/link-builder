var _xx = irandom_range(-256,256)
var _yy = irandom_range(-256,256)

var new_x = x + _xx
var new_y = y + _yy

new_x = clamp(new_x,0,room_width)
new_y = clamp(new_y,0,room_height)

goal_current = instance_create_layer(new_x,new_y,"Instances",goal)
goal_current.goal_type = goal_type.idlewalk

states = states.move