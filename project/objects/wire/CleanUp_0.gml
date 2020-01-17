event_inherited()

ds_list_destroy(path_points_x)
ds_list_destroy(path_points_y)
ds_list_destroy(path_objects)
if port1 > -1 ds_list_destroy(port1)
if port2 > -1 ds_list_destroy(port2)
path_delete(path)
