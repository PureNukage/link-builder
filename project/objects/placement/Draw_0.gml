switch(type)
{
	case node: sprite = s_chainlink break
	case data: sprite = s_database break
	case kiosk: sprite = s_kiosk break
}

//	Draw item
draw_sprite_ext(sprite,0,x+80,y+80,1,1,0,color,alpha)

//	Draw grid cell outline
draw_set_color(color)
draw_roundrect(x,y,x+160,y+160,true)
draw_roundrect(x-1,y-1,x+159,y+159,true)

//	Draw tiles
if placeable == false {
	draw_set_color(c_red)
	var _w = grid_x - (size_width/2)
	var _h = grid_y - (size_height/2)
	var _x = x+80 - (size_width/2 * cell_width)
	var _y = y+80 - (size_height/2 * cell_height)
	for(var a=0;a<size_width;a++) {
		_h = grid_y - (size_height/2)
		_y = y+80 - (size_height/2 * cell_height)
		for(var b=0;b<size_height;b++) {
			//if grid_array[_w, _h] > 0 {
				draw_rectangle(_x,_y,_x+cell_width,_y+cell_height,false)	
			//}
			_y += cell_width
			_h++
		}
		_x += cell_height
		_w++
	}
}