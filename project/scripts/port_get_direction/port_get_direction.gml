///@param id
///@param target_id 

var _id = argument[0]
var _target_id = argument[1]

var directionX = 0
var directionY = 0

var found = 0

with _target_id {
	for(var w=topleft_cell_x-1;w<topleft_cell_x+size_width+1;w++) {
		for(var h=topleft_cell_y-1;h<topleft_cell_y+size_height+1;h++) {
			if w > -1 and w < grid_width and h > -1 and h < grid_height {
				if point_in_rectangle(w,h,_id.topleft_cell_x,_id.topleft_cell_y,_id.bottomright_cell_x,_id.bottomright_cell_y)  and !found {
					//	Right side
					if w == bottomright_cell_x+1 {
						directionX = 1
					}	
					//	Bottom side
					else if h == bottomright_cell_y+1 {
						directionY = 1
					}
					//	Left side
					else if w == topleft_cell_x-1 and w == _id.bottomright_cell_x {
						directionX = -1
					}
					//	Top side
					else if h == topleft_cell_y-1 {
						directionY = -1
					}
					found = 1
				}	
			}
		}
	}
}

var array = []
array[0] = directionX
array[1] = directionY

return array