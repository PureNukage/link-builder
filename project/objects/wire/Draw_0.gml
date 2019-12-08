event_inherited()

switch(states)
{
	case states.placement:
		
		if cell_x1 >-1 and cell_y1 > -1 and cell_x2 > -1 and cell_y2 > -1 {
			var _x = gridController.grid_positions_x[cell_x1]+(cell_width/2)
			var _y = gridController.grid_positions_y[cell_y1]+(cell_height/2)
			draw_path(path,_x,_y,false)
		}
	
		if !ds_list_empty(path_points_x) {
			for(var i=0;i<ds_list_size(path_points_x);i++) {
				
				var w = path_points_x[| i]
				var h = path_points_y[| i]
				var _xx = gridController.grid_positions_x[w]+(cell_width/2)
				var _yy = gridController.grid_positions_y[h]+(cell_height/2)
				
				draw_sprite(s_wire,0,_xx,_yy)
				
			}
			
			
		}
	
	
	break
}