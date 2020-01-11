///@param id
///@param target_id 

var _id = argument[0]
var _target_id = argument[1]

var directionX = 0
var directionY = 0

with _target_id {
	for(var w=topleft_cell_x-1;w<topleft_cell_x+size_width+1;w++) {
		for(var h=topleft_cell_y-1;h<topleft_cell_y+size_height+1;h++) {
			if w == _id.center_cell_x and h == _id.center_cell_y {
				//	Right side
				if w == bottomright_cell_x+1 {
					directionX = 1
				}	
				//	Bottom side
				else if h == bottomright_cell_y+1 {
					directionY = 1
				}
				//	Left side
				else if w == topleft_cell_x-1 {
					directionX = -1
				}
				//	Top side
				else if h == topleft_cell_y-1 {
					directionY = -1
				}
				//directionX = sign()
			}	
		}
	}
}

//directionX = sign(_target_id.center_cell_x-_id.center_cell_x)
//directionY = sign(_target_id.center_cell_y-_id.center_cell_y)

var array = []
array[0] = directionX
array[1] = directionY

return array