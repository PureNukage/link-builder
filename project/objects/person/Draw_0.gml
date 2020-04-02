if !game.vision and !game.temp_vision draw_self()

if pissed {
	sprite_set_offset(s_madface,sprite_get_width(s_madface)/2-1,sprite_get_height(s_madface)/2-1)
	draw_sprite(s_madface,0,x,y-100)	
}

draw_set_color(c_yellow)
draw_text(x,y-100,string(id))
var enum_array = []
enum_array[states.idle] = "idle"
enum_array[states.move] = "move"
enum_array[states.wait_in_line] = "waiting in line"
enum_array[states.using_smartcontract] = "using smartcontract"
draw_text(x,y-80,enum_array[states])