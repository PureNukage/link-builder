switch(type)
{
	case node: sprite = s_chainlink break
	case data: sprite = s_database break
}

draw_sprite_ext(sprite,0,x+80,y+80,1,1,0,color,alpha)