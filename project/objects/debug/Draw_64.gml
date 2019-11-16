switch(mode)
{
	#region Game Variables
		case 2:
			draw_set_color(c_white)
			draw_set_halign(fa_left)
			draw_set_valign(fa_top)
			draw_text(15,15,"Stream: "+string(time.stream))
			draw_text(15,30,"Frames: "+string(time.frames))
			draw_text(15,45,"Seconds: "+string(time.seconds))
		
			draw_text(15,75,"Systems: "+string(ds_list_size(systemController.systems)))
		
		
		break
	#endregion
}

//	What debug mode are we on?
if mode > 0 {
	draw_set_color(c_white)
	draw_set_halign(fa_right)
	var mode_string = ""
	switch(mode)
	{
		case 1: mode_string = "object variables" break
		case 2: mode_string = "game variables" break
		case 3: mode_string = "systems" break
	}	
	draw_text(display_get_gui_width()-15,15,"debug mode: "+mode_string)
	draw_set_halign(fa_left)
}