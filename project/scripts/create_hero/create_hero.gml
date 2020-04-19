///@param enum
///@param name
///@param condition_string
///@param [available]
///@param [acquired]
///@param [hidden]
///@param [sprite]
///@param [head_sprite]

var index = argument[0]

heros[index, hero_name] = argument[1]
heros[index, hero_condition_string] = argument[2]

if argument_count >= 4 heros[index, hero_available] = argument[3] else heros[index, hero_available] = false
if argument_count >= 5 heros[index, hero_acquired] = argument[4] else heros[index, hero_acquired] = false
if argument_count >= 6 heros[index, hero_hidden] = argument[5] else heros[index, hero_hidden] = false
if argument_count >= 7 heros[index, hero_sprite] = argument[6] else heros[index, hero_sprite] = s_hero_rory
if argument_count >= 8 heros[index, hero_head] = argument[7] else heros[index, hero_head] = s_hero_rory_head

heros[index, hero_id] = -1
heros[index, hero_new] = true
heros[index, hero_virgin] = true