///@param id
///@param target_id 

var _id = argument[0]
var _target_id = argument[1]

var directionX = -1
var directionY = -1

directionX = sign(_target_id.center_cell_x-_id.center_cell_x)
directionY = sign(_target_id.center_cell_y-_id.center_cell_y)

var array = []
array[0] = directionX
array[1] = directionY

return array