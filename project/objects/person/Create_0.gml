ID = instance_number(person)-1
ds_list_add(personController.person_list,id)
ds_list_add(personController.person_available_list,id)

in_line = false
line_pos = 0
Kiosk = 0
timer = 0
movespeed = 4
states = states.idle

var _gap = 128
var _xx = irandom_range(x-_gap,x+_gap)
var _yy = irandom_range(y-_gap,y+_gap)
var _goal = instance_create_layer(_xx,_yy,"Instances",goalPost)

goals = ds_stack_create()

ds_stack_push(goals,_goal)

depth = -2
