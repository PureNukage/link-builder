///@param uniqueID
///@param [event_type]
///@param [object_id]

var _uniqueID = argument[0]
if argument_count >= 2 {
	var Event_type = argument[1]
	var Object_id = argument[2]
}

var found_it = false
for(var i=0;i<ds_list_size(textboxController.message_queue);i++) {
	var buffer_encoded = textboxController.message_queue[| 0]
	var buffer = buffer_base64_decode(buffer_encoded)
	var _text = buffer_read(buffer,buffer_string)
	var _icon = buffer_read(buffer,buffer_s8)
	var _timer = buffer_read(buffer,buffer_s8)
	var UniqueID = buffer_read(buffer,buffer_s32)
	var _Event_type = buffer_read(buffer,buffer_s8)
	var _Object_id = buffer_read(buffer,buffer_s32)
	if argument_count == 1 {
		if UniqueID == _uniqueID {
			found_it = true
		}
	} else {
		if Event_type > -1 and Object_id > -1 {
			if Event_type == _Event_type and Object_id == _Object_id and _uniqueID == UniqueID {
				found_it = true	
			}
		} 
	}
}
if found_it return true else return false