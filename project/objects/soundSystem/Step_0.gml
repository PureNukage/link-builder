//	If we're on the main menu
if room == main_menu {
	//	The main menu of the main menu, lol
	if mainmenu.menu == menu.main {
		new_track = music_menu
	}
	//	The options menu
	if mainmenu.menu == menu.options {
		new_track = music_options	
	}
}

//	We switched tracks!
if current_track != new_track {
	audio_pause_sound(current_track)
	audio_resume_sound(new_track)
	current_track = new_track
	audio_sound_gain(current_track,current_volume,0)
}

//	Our volume has changed!
if current_volume != new_volume and current_track > -1 {
	current_volume = new_volume
	audio_sound_gain(current_track,new_volume,0)
}

////	Event Dialogue
if current_dialogue != new_dialogue {
	audio_stop_sound(current_dialogue)
	audio_play_sound(new_dialogue,0,false)
	audio_sound_gain(new_dialogue,current_dialogue_volume,0)
	current_dialogue = new_dialogue
} else {
	if !audio_is_playing(current_dialogue) {
		new_dialogue = -1	
	}
}
//	Event Volume changed
if current_dialogue_volume != new_dialogue_volume {
	current_dialogue_volume = new_dialogue_volume
	audio_sound_gain(current_dialogue,current_dialogue_volume,0)
}


//	Sound Effect Volume Changed
if current_sound_effect_volume != new_sound_effect_volume {
	current_sound_effect_volume = new_sound_effect_volume
}