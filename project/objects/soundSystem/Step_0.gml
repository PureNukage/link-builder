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
	audio_stop_sound(current_track)
	audio_play_sound(new_track,0,true)
	current_track = new_track
	audio_sound_gain(current_track,current_volume,0)
}

//	Our volume has changed!
if current_volume != new_volume and current_track > -1 {
	current_volume = new_volume
	audio_sound_gain(current_track,new_volume,0)
}
