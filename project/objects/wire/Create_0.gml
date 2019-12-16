size_width = 1									//	Set; cells width this item takes up
size_height = 1									//	Set; cells height this item takes up
sprite = s_wire									//	Set; sprite for this item
states = states.placement						//	Set; inital state of this item
ports_count = 2									//	Set; holds the number of ports in this item has
sprites = []
sprites[1] = s_wire
sprites[0] = s_wire_corner

path = path_add()								//	Active; holds the path
cell_x1 = -1									//	Active; holds the x1 of the path
cell_y1 = -1									//	Active; holds the y1 of the path
cell_x2 = -1									//	Active; holds the x2 of the path
cell_y2 = -1									//	Active; holds the y2 of the path
path_points_x = ds_list_create()				//	Active; holds the cells x in the path
path_points_y = ds_list_create()				//	Active; holds the cells y in the path
path_objects = ds_list_create()					//	Active; holds the instance ids of objects in the path
time_spawn = time.stream						//	Active; holds the time this wire spawned
port1 = -1										//	Active; holds the id of the first item we're connecting to
port2 = -1										//	Active; holds the id of the second item we're connecting to
straight = true									//	Active; holds if this wire is a straight piece or a corner piece
combinations_straight = ds_list_create()		//	Active; holds the amount of rotations the wire can do at this cell xy
combinations_corner = ds_list_create()			//	Active; holds the amount of rotations the wire can di at this cell xy
combo_straight_index = -1						//	Active; holds which straight piece we're currently on
combo_corner_index = -1							//	Active; holds which corner piece we're currently on
directions = []									//	Active; holds which sides ports are on
for(var i=0;i<4;i++) {
	directions[i] = 0	
}

// Inherit the parent event
event_inherited()

for(var w=0;w<size_width;w++) {
	for(var h=0;h<size_height;h++) {
		my_cells_items[# w, h] = -1
	}
}
my_cells_items[# floor(size_width/2), floor(size_height/2)] = wire
//my_cells_items[# 2, 0] = -2
//my_cells_items[# 0, 0] = -2

ports[0,port_x] = center_cell_x+1
ports[0,port_y] = center_cell_y

ports[1,port_x] = center_cell_x-1
ports[1,port_y] = center_cell_y