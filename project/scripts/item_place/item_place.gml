

var _x = grid_x - (size_width/2)
var _y = grid_y - (size_height/2)
	
for(var size_w=0;size_w<size_width;size_w++) {
	_y = grid_y - (size_height/2)
	for(var size_h=0;size_h<size_height;size_h++) {
		if _x > -1 and _y > -1 {
			gridController.grid[# _x, _y] = type
		}
		_y++
	}
	_x++
}