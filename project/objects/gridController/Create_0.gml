#macro cell_width 32
#macro cell_height 32
#macro grid_width room_width/cell_width
#macro grid_height room_height/cell_height

grid = ds_grid_create(grid_width,grid_height)

ds_grid_set_region(grid,0,0,grid_width,grid_height,0)

#region	Spawning a starting kiosk 
var _grid_x = grid_width/2
var _grid_y = grid_height/2
grid[# _grid_x, _grid_y] = 3
var _x = x
var _y = y
_x -= cell_width
_y -= cell_height
_x = _x + ((grid_width/2)*cell_width) + 80
_y = _y + ((grid_height/2)*cell_height) + 80
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
				var _xx = gridController.x + (_grid_x*cell_width)
				var _yy = gridController.y + (_grid_y*cell_height)
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
#endregion

#region Spawning a starting data
grid[# grid_width/2-4, grid_height/2] = 2
var _x = x
var _y = y
_x -= cell_width
_y -= cell_height
_x = _x + ((grid_width/2-4)*cell_width) + 80
_y = _y + ((grid_height/2)*cell_height) + 80
var _data = instance_create_layer(_x,_y,"Instances",data)
_data.sprite_index = s_database
_data.grid_x = 3
_data.grid_y = 1
var _system = instance_create_layer(_x,_y,"Instances",system)
ds_list_add(_system.parts,_data)
_data.System = _system
with _data {
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
				var _xx = gridController.x+80 + (_grid_x*cell_width)
				var _yy = gridController.y+80 + (_grid_y*cell_height)
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

#endregion

grid_mouse_w = -1
grid_mouse_h = -1
