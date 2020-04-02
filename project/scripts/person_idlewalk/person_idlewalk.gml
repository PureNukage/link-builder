var _xx = irandom_range(-256,256)
var _yy = irandom_range(-256,256)

var new_x = x + _xx
var new_y = y + _yy

new_x = clamp(new_x,0,room_width)
new_y = clamp(new_y,0,room_height)

var _random = 256
//	lets try and not walk on a big item, okay?
while instance_position(new_x,new_y,node) or instance_position(new_x,new_y,data) or instance_position(new_x,new_y,kiosk) {
	var _xx = irandom_range(-_random,_random)
	var _yy = irandom_range(-_random,_random)

	var new_x = x + _xx
	var new_y = y + _yy

	new_x = clamp(new_x,0,room_width)
	new_y = clamp(new_y,0,room_height)
	
	_random += 32
}

if goal_current > -1 and instance_exists(goal_current) and goal_current.object_index == goal {
	instance_destroy(goal_current)
}

goal_current = instance_create_layer(new_x,new_y,"Instances",goal)
goal_current.goal_type = goal_type.idlewalk

timer = irandom_range(45,140)

states = states.move