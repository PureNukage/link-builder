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

grid_mouse_w = -1
grid_mouse_h = -1
