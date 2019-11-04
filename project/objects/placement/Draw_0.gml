switch(type)
{
	case node: sprite = s_chainlink break
	case data: sprite = s_database break
}

//	Draw item
draw_sprite_ext(sprite,0,x+80,y+80,1,1,0,color,alpha)

//	Draw grid cell
draw_set_color(color)
draw_roundrect(x,y,x+160,y+160,true)
draw_roundrect(x-1,y-1,x+159,y+159,true)