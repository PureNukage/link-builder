///@param uniqueID
///@param [event_type]
///@param [object_id]

var _uniqueID = argument[0]
if argument_count >= 2 {
	var Event_type = argument[1]
	var Object_id = argument[2]
}

if textboxController.current_message > -1 {
	var messageID = textboxController.current_message
	var message_uniqueID = messageID.uniqueID
	var message_event_type = messageID.event_types
	var message_object_id = messageID.object_id
	if argument_count == 1 {
		if message_uniqueID == _uniqueID {
			return true
		}
	} else {
		if Event_type == message_event_type and Object_id == message_object_id and _uniqueID == message_uniqueID {
			return true
		}
	}
}
//	There is no current message
else {
	return false
}