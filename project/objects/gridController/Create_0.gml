#macro cell_width 160
#macro cell_height 160
#macro grid_width 12
#macro grid_height 9

grid = ds_grid_create(grid_width,grid_height)

ds_grid_set_region(grid,0,0,grid_width,grid_height,0)

//	Spawning a starting kiosk 
grid[# 1, 1] = 3
var _x = x
var _y = y
_x -= 160
_y -= 160
_x = _x + (2*cell_width) + 80
_y = _y + (2*cell_height) + 80
var _kiosk = instance_create_layer(_x,_y,"Instances",kiosk)
_kiosk.sprite_index = s_kiosk
_kiosk.grid_x = 1
_kiosk.grid_y = 1
var _system = instance_create_layer(_x,_y,"Instances",system)
ds_list_add(_system.parts,_kiosk)
_kiosk.System = _system
with _kiosk {
	//	Edge of grid check
	for(var i=0;i<4;i++) {
		cells[i,0] = 1	
	}
	if grid_y = 0 cells[0,0] = 0
	if grid_x = grid_width-1 cells[1,0] = 0
	if grid_y = grid_height-1 cells[2,0] = 0
	if grid_x = 0 cells[3,0] = 0
		
	for(var i=0;i<4;i++) {
		if cells[i,0] == 1 {
			var _grid_x = grid_x
			var _grid_y = grid_y
			switch(i)
			{
				case 0:	_grid_y -= 1 break	//	Top cell
				case 1:	_grid_x += 1 break  //	Right cell
				case 2:	_grid_y += 1 break  //	Bottom cell
				case 3:	_grid_x -= 1 break  //	Left cell
			}
				
			if gridController.grid[# _grid_x, _grid_y] > 0 {
				var _xx = gridController.x + (_grid_x*160)
				var _yy = gridController.y + (_grid_y*160)
				var _object_id = instance_nearest(_xx,_yy,itemParent)
				cells[i,1] = _object_id
				cells[i,2] = _grid_x
				cells[i,3] = _grid_y
			} else {
				cells[i,1] = 0
				cells[i,2] = _grid_x
				cells[i,3] = _grid_y
			}

	}}	
}

grid_mouse_w = -1
grid_mouse_h = -1
