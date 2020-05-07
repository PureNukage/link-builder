var grid = ds_grid_create(grid_width,grid_height)
ds_grid_set_region(grid,0,0,grid_width-1,grid_height-1,0)
ds_grid_destroy(gridController.grid_fog)
gridController.grid_fog = grid
with c_item if object_index != wire and states == states.placed {
	ds_grid_set_disk(gridController.grid_fog,center_cell_x,center_cell_y,16,1)
}