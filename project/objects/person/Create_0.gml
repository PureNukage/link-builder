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

//sprite = choose(s_man0,s_man1)
//sprite_index = sprite

hair = s_hair_0
head = s_head_0
body = s_body_0
hand = s_hand_0
legs = s_legs_0

var Random = irandom_range(0,array_length_1d(personController.hair_colors)-1)
hair_color = personController.hair_colors[Random]

var Random = irandom_range(0,array_length_1d(personController.head_colors)-1)
head_color = personController.head_colors[Random]

var Random = irandom_range(0,array_length_1d(personController.body_colors)-1)
body_color = personController.body_colors[Random]

var Random = irandom_range(0,array_length_1d(personController.legs_colors)-1)
legs_color = personController.legs_colors[Random]

