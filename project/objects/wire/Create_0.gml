size_width = 1									//	Set; cells width this item takes up
size_height = 1									//	Set; cells height this item takes up
sprite = s_wire									//	Set; sprite for this item
states = states.placement						//	Set; inital state of this item
ports_count = 2									//	Set; holds the number of ports in this item has
portrait = s_portrait_wire
name = "Wire"

sprites = []
sprites[1] = s_wire
sprites[0] = s_wire_corner
color = c_sergey_blue

item_index = 2

path = path_add()								//	Active; holds the path
cell_x1 = -1									//	Active; holds the x1 of the path
cell_y1 = -1									//	Active; holds the y1 of the path
cell_x2 = -1									//	Active; holds the x2 of the path
cell_y2 = -1									//	Active; holds the y2 of the path
path_points_x = ds_list_create()				//	Active; holds the cells x in the path
path_points_y = ds_list_create()				//	Active; holds the cells y in the path
path_objects = ds_list_create()					//	Active; holds the instance ids of objects in the path
port1 = -1										//	Active; holds the id of the first item we're connecting to
port2 = -1										//	Active; holds the id of the second item we're connecting to
straight = true									//	Active; holds if this wire is a straight piece or a corner piece
sockets = []
sockets[0] = -1
sockets[1] = -1
pos = -1
ID = -1

// Inherit the parent event
event_inherited()

for(var w=0;w<size_width;w++) {
	for(var h=0;h<size_height;h++) {
		my_cells_items[# w, h] = -1
	}
}
my_cells_items[# floor(size_width/2), floor(size_height/2)] = wire

ports[0,port_x] = center_cell_x+1
ports[0,port_y] = center_cell_y

ports[1,port_x] = center_cell_x-1
ports[1,port_y] = center_cell_y