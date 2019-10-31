switch(mode)
{
	case 1:
		if instance_exists(person) {
			with person {
				var _y = y-16
				draw_text(x,_y,"ID: "+string(ID)) _y -= 16
			}	
		}
	break
}
