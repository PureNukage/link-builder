///@param index

var index = argument[0]

heros[index, hero_acquired] = true
heros[index, hero_new] = false

if heros[index, hero_id] == -1 {
	if instance_exists(person) { with person {
		if hero == -1 and other.heros[index, hero_id] == -1 {
			with personController debug_log("Hero "+string(heros[index, hero_name])+" is being placed into Person "+string(other.id))
			hero = index
			other.heros[index, hero_id] = id
			if other.heros[index, hero_virgin] {
				other.heros[index, hero_virgin]	= false
				other.new_hero = true
			}
		}
	}} else {
		debug_log("ERROR No People exist. Acquiring hero anyways")
	}
}

