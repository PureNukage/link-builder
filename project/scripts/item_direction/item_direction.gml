///@param id
///@param target_id 

var _id = argument[0]
var _target_id = argument[1]

var directionX = -1
var directionY = -1

directionX = sign(_target_id.center_cell_x-_id.center_cell_x)
directionY = sign(_target_id.center_cell_y-_id.center_cell_y)

//	translate
var _right, _down, _left, _up
if directionX > 0 _right = 1 else _right = 0
if directionX < 0 _left = 1 else _left = 0
if directionY > 0 _down = 1 else _down = 0
if directionY < 0 _up = 1 else _up = 0

if _right > 0 {
	_id.directions[right] = _right
	debug_log("Connection on my right")
}
if _down > 0 {
	_id.directions[down] = _down
	debug_log("Connection on my bottom")
}
if _left > 0 {
	_id.directions[left] = _left
	debug_log("Connection on my left")
}
if _up > 0 {
	_id.directions[up] = _up
	debug_log("Connection on my top")
}