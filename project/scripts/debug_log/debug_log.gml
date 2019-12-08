/// @param string

var _string = argument[0]

var time_stream = "["+string(time.stream)+"] "

var _object_name = object_get_name(object_index)

var finished_string = time_stream + string_upper(_object_name) + " " + _string

show_debug_message(finished_string)