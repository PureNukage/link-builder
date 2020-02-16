///@param uniqueID
///@param [event_type]
///@param [object_id]

var _uniqueID = argument[0]
if argument_count >= 2 {
	var Event_type = argument[1]
	var Object_id = argument[2]
}

var found_it = false
if instance_exists(textboxController) {
	for(var m=0;m<ds_list_size(textboxController.previous_messages);m++) {
		var messageID = textboxController.previous_messages[| m]
		var message_uniqueID = messageID.uniqueID
		var message_event_type = messageID.event_types
		var message_object_id = messageID.object_id
		if argument_count == 1 {
			if message_uniqueID == _uniqueID {
				found_it = true
			}
		} else {
			if Event_type == message_event_type and Object_id == message_object_id and _uniqueID == message_uniqueID {
				found_it = true	
			}
		}
	}
	//if instance_exists(textbox) with textbox {
	//	var message_uniqueID = uniqueID
	//	var message_event_type = event_types
	//	var message_object_id = object_id
	//	if argument_count == 1 {
	//		if message_uniqueID == _uniqueID {
	//			found_it = true
	//		}
	//	} else {
	//		if Event_type == message_event_type and Object_id == message_object_id and _uniqueID == message_uniqueID {
	//			found_it = true	
	//		}
	//	} 
	//}
}

if found_it return true else return false