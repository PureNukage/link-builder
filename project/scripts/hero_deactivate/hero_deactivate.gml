var index = argument[0]

//	Deal with the Person object
if heros[index, hero_id] > -1 {
	//	Person instance doesn't exist for some reason
	if !instance_exists(heros[index, hero_id]) {
		debug_log("Hero "+heros[index, hero_name]+", Person "+string(heros[index, hero_id])+" doesn't exist. Deactivating anyways")
		heros[index, hero_id] = -1
	}  
	//	Revert person back to their normie self
	else {
		debug_log("Hero "+heros[index, hero_name]+", Person "+string(heros[index, hero_id])+" is getting dectivated")
		heros[index, hero_id].hero = -1
		heros[index, hero_id] = -1
	}
}

heros[index, hero_acquired] = false