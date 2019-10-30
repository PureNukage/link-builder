#macro cell_width 160
#macro cell_height 160
#macro grid_width 12
#macro grid_height 9

grid = ds_grid_create(grid_width,grid_height)

ds_grid_set_region(grid,0,0,grid_width,grid_height,0)

grid_mouse_w = -1
grid_mouse_h = -1
