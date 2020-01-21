///@param uniqueID

var _uniqueID = argument[0]

var found_it = false
if instance_exists(textboxController) {
	for(var m=0;m<ds_list_size(textboxController.previous_messages);m++) {
		var messageID = textboxController.previous_messages[| m]
		var message_uniqueID = messageID.uniqueID
		if message_uniqueID == _uniqueID {
			found_it = true
		}
	}
}

if found_it return true else return false