size_width = 1						//	Set; cells width this item takes up
size_height = 1						//	Set; cells height this item takes up
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