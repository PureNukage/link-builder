music_menu = snd_menu

music_options = snd_options

current_track = -1
new_track = -1

current_volume = -1
new_volume = 0

audio_play_sound(music_menu,0,true)
audio_play_sound(music_options,0,true)
audio_pause_sound(music_menu)
audio_pause_sound(music_options)

//	Event dialogue
current_dialogue = -1
new_dialogue = -1
current_dialogue_volume = 100
new_dialogue_volume = 0

//	Sound effects
current_sound_effect_volume = 100
new_sound_effect_volume = 0.5
//soundEffect[sounds.click1] = snd_click_1
//soundEffect[sounds.click2] = snd_click_2
//soundEffect[sounds.click3] = snd_click_3
//soundEffect[sounds.hover1] = snd_hover_1
//soundEffect[sounds.hover2] = snd_hover_2
//soundEffect[sounds.place1] = snd_place_item_1
//soundEffect[sounds.place2] = snd_place_item_2
//soundEffect[sounds.startGame] = snd_start_game


//	Check load file
ini_open(working_directory + "savedgame.ini")
var music = ini_read_real("Sound","Music",0.5)
var dialogue = ini_read_real("Sound","Dialogue",0.5)
ini_close()

new_volume = music
new_dialogue_volume = dialogue