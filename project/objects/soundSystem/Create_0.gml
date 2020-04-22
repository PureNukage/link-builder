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