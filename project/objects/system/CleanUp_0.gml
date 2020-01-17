ds_list_destroy(parts)
if instance_exists(systemController) and ds_exists(systemController.systems,ds_type_list) and ds_list_find_index(systemController.systems,id) != -1 {
	ds_list_delete(systemController.systems,ds_list_find_index(systemController.systems,id))
}