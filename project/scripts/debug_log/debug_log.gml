/// @param string

var _string = argument[0]

if instance_exists(time) var time_stream = "["+string(time.stream)+"] "
else var time_stream = "[0] "

var _object_name = object_get_name(object_index)

var ID = string(id)

var finished_string = time_stream + string_upper(_object_name) + " " + ID + " " + _string

show_debug_message(finished_string)