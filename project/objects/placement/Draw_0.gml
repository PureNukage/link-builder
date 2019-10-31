switch(type)
{
	case node: sprite = s_chainlink break
	case data: sprite = s_database break
}

draw_sprite(sprite,0,x+80,y+80)