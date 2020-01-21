///@param uniqueID

var ID = argument[0]

if instance_exists(finger) {
	with finger {
		if uniqueID == ID {
			instance_destroy()	
			return true
		}
	}
}