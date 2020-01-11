///@param id
///@param target_id 

var _id = argument[0]
var _target_id = argument[1]

var directionX = 0
var directionY = 0

//	Right side
if _id.center_cell_x == _target_id.bottomright_cell_x+1 {
	directionX = 1
}
//	Bottom side
else if _id.center_cell_y == _target_id.bottomright_cell_y+1 {
	directionY = 1
}
//	Left side
else if _id.center_cell_x == _target_id.topleft_cell_x-1 {
	directionX = -1
}
//	Top side
else if _id.center_cell_y == _target_id.topleft_cell_y-1 {
	directionY = -1
}

//directionX = sign(_target_id.center_cell_x-_id.center_cell_x)
//directionY = sign(_target_id.center_cell_y-_id.center_cell_y)

var array = []
array[0] = directionX
array[1] = directionY

return array