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

hero = -1

new_speech = -1
current_speech = -1
current_speech_timer = 120
current_speech_fade_up = false
current_speech_alpha = 0

states = states.idle

//sprite = choose(s_man0,s_man1)
//sprite_index = sprite

male = choose(0,1,1)

if male {
	var one = s_hair_0
	var two = s_hair_1
	hair = choose(one,one,two,two,s_hair_2)
	head = s_head_0
	body = choose(s_body_0,s_body_1,s_body_2)
	hand = s_hand_0
	legs = s_legs_0
}
//	Female
else {
	hair = choose(s_female_hair0,s_female_hair1)
	head = choose(s_female_head0)
	body = choose(s_female_body0,s_female_body1,s_female_body2)
	legs = choose(s_female_legs0,s_female_legs1)
	hand = choose(s_female_hand0,s_female_hand1)
	
	if legs == s_female_legs1 or hand == s_female_hand1 {
		hand = s_female_hand1
		legs = s_female_legs0
	}
	
}

var Random = irandom_range(0,array_length_1d(personController.hair_colors)-1)
hair_color = personController.hair_colors[Random]

var Random = irandom_range(0,array_length_1d(personController.head_colors)-1)
head_color = personController.head_colors[Random]

var Random = irandom_range(0,array_length_1d(personController.body_colors)-1)
body_color = personController.body_colors[Random]

var Random = irandom_range(0,array_length_1d(personController.legs_colors)-1)
legs_color = personController.legs_colors[Random]

