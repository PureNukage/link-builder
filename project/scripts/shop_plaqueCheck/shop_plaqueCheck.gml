if Plaque > -1 and instance_exists(Plaque) {
	return true
} else if !instance_exists(Plaque) {
	debug_log("ERROR Instance of object Plaque does not exist!")
	return false
}
if Plaque == -1 {
	return false	
}