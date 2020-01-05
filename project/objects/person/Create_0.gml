if ds_list_find_index(personController.people,id) == -1 {
	ds_list_add(personController.people,id)
}

goal_current = -1
smartcontract = -1
smartcontracts = ds_list_create()
cooldown = 0
movespeed = 4
timer = 0
pissed = false

states = states.idle

sprite = choose(s_man0,s_man1)
sprite_index = sprite