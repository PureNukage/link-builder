switch(mode)
{
	case 2:
		draw_set_color(c_white)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_text(15,15,"Systems: "+string(ds_list_size(systemController.systems)))
		
		
	break
}