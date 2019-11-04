switch(states)
{
	case states.idle:
		if ds_stack_size(goals) > 0 {
			states = states.walk	
		}
		
		if timer >= time.stream and in_line == false {
			//	Idle walk
			var _gap = 128
			var _xx = irandom_range(x-_gap,x+_gap)
			var _yy = irandom_range(y-_gap,y+_gap)
			var _goal = instance_create_layer(_xx,_yy,"Instances",goalPost)

			ds_stack_push(goals,_goal)	
		}
		
		if in_line == true {
			if line_pos == ds_list_find_index(Kiosk.line,id) {
				var _line_pos = ds_list_find_index(Kiosk.line,id)
				if x != Kiosk.x or y != Kiosk.y+(72*_line_pos) {
					var _xx = Kiosk.x
					var _yy = Kiosk.y + (72*_line_pos)
					var _goal = instance_create_layer(_xx,_yy,"Instances",goalPost)
				
					ds_stack_push(goals,_goal)	
				}
				
			} else {
				//	Moving up a space on line
				var _line_pos = ds_list_find_index(Kiosk.line,id)
				var _xx = Kiosk.x
				var _yy = Kiosk.y + (72*_line_pos)
				var _goal = instance_create_layer(_xx,_yy,"Instances",goalPost)
				
				ds_stack_push(goals,_goal)
			}
		}
	
	break
	case states.walk:
		
		var goal = ds_stack_top(goals)
		if point_distance(x,y,goal.x,goal.y) > movespeed {
			move_towards_point(goal.x,goal.y,movespeed)
		} else {
			instance_destroy(goal)
			ds_stack_pop(goals)
			states = states.idle
			speed = 0
			if in_line == false {
				timer = irandom_range(3,6)
				timer += time.stream
			} else {
				timer = 0	
			}
		}	
	
	break
}