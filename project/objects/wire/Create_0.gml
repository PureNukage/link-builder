size_width = 3						//	Set; cells width this item takes up
size_height = 3						//	Set; cells height this item takes up
sprite = s_wire						//	Set; sprite for this item
states = states.placement			//	Set; inital state of this item
ports_count = 2						//	Set; holds the number of ports in this item has

path = path_add()					//	Active; holds the path
cell_x1 = -1						//	Active; holds the x1 of the path
cell_y1 = -1						//	Active; holds the y1 of the path
cell_x2 = -1						//	Active; holds the x2 of the path
cell_y2 = -1						//	Active; holds the y2 of the path
path_points_x = ds_list_create()	//	Active; holds the cells x in the path
path_points_y = ds_list_create()	//	Active; holds the cells y in the path
path_objects = ds_list_create()		//	Active; holds the instance ids of objects in the path
time_spawn = time.stream			//	Active; holds the time this wire spawned

// Inherit the parent event
event_inherited()

for(var w=0;w<size_width;w++) {
	for(var h=0;h<size_height;h++) {
		my_cells_items[# w, h] = -1
	}
}
my_cells_items[# floor(size_width/2), floor(size_height/2)] = wire
my_cells_items[# 0, 1] = -2
my_cells_items[# 2, 1] = -2

ports[0,port_x] = 0
ports[0,port_y] = 1

ports[1,port_x] = 2
ports[1,port_y] = 1