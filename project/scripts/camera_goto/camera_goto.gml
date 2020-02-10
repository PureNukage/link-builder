///@param x
///@param y
///@param [id]

var X = argument[0]
var Y = argument[1]
if argument_count >= 3 var ID = argument[2]

camera.camera_mode = camera_mode.moved_to
camera.x = X
camera.y = Y

if input.selection > -1 {
	input.selection.selected = false
	if ds_list_find_index(input.selections,input.selection) > -1 {
		ds_list_delete(input.selections,ds_list_find_index(input.selections,input.selection))	
	}
	input.selection = -1
}

if argument_count >= 3 {
	input.selection = ID
	ID.selected = true
	if ds_list_find_index(input.selections,ID) == -1 {
		ds_list_add(input.selections,ID)	
	}
	
}