///@param id
///@param target_id 

var _id = argument[0]
var _target_id = argument[1]

var _rotation = 0

//	Right side
if _id.center_cell_x == _target_id.bottomright_cell_x+1 {
	_rotation = 0
}
//	Bottom side
else if _id.center_cell_y == _target_id.bottomright_cell_y+1 {
	_rotation = 90
}
//	Left side
else if _id.center_cell_x == _target_id.topleft_cell_x-1 {
	_rotation = 180
}
//	Top side
else if _id.center_cell_y == _target_id.topleft_cell_y-1 {
	_rotation = 270
}

return _rotation