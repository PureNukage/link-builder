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
	case 2:

	
	break
	case 3:
		for(var s=0;s<ds_list_size(systemController.systems);s++) {
			var _parts_list = systemController.systems[| s].parts
			for(var p=0;p<ds_list_size(_parts_list);p++) {
				var _part = _parts_list[| p]
				var _xx = _part.grid_x
				var _yy = _part.grid_y
				
				var _x = gridController.x-160
				var _y = gridController.y-160
				for(var _w=0;_w<grid_width;_w++) {
					_y = gridController.y-160
					_x += cell_width
					for(var _h=0;_h<grid_height;_h++) {
						_y += cell_height
				
						if _w == _xx and _h == _yy {
							draw_set_color(c_green)
							draw_set_alpha(.5)
							draw_rectangle(_x+1,_y+1,_x+cell_width-1,_y+cell_height-1,false)
							draw_rectangle(_x,_y,_x+cell_width,_y+cell_height,false)
							draw_set_alpha(1)
						}
		
					}
				}
			}
		}
		

		
		
	break
}
