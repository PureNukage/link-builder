#region Shop Button
	//	Drawing the Shop button background
	draw_set_color(c_dkgray)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)

	//	Drawing the Shop button outline
	draw_set_color(c_black)
	draw_roundrect(buttonX+1,buttonY+1,buttonX+button_width-1,buttonY+button_height-1,true)
	draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,true)

	//	Drawing the Shop button text
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(fnt_shop)
	draw_text(buttonX+button_width/2,buttonY+button_height/2,button_text)
	draw_set_font(-1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
#endregion 

#region Shop Menu
if menu_open == true {
	//	Drawing the Shop menu background
	draw_set_color(c_dkgray)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,false)
	
	//	Drawing the Shop menu outline
	draw_set_color(c_black)
	draw_roundrect(menuX,menuY,menuX+menu_width,menuY+menu_height,true)
	draw_roundrect(menuX+1,menuY+1,menuX+menu_width-1,menuY+menu_height-1,true)
	
	//	Drawing the items
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	var _x = menuX+item_buffer
	var _y = menuY+item_buffer
	
	//	Draw Nodes menu
	draw_set_color(c_gray)
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
	var _string = ""
	if nodes_open _string = "- Nodes" else _string = "+ Nodes"
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	var _yy = _y + 16
	draw_text(_xx,_yy,_string)
	
	_y += 32+item_buffer
	
	if nodes_open {
		for(var n=0;n<array_height_2d(item_node);n++) {
			//	Draw node background
			draw_set_color(c_dkgray)
			draw_set_valign(fa_top)
			draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
			draw_set_color(c_black)
			draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,true)
			
			draw_set_color(c_white)
			var _string = item_node[n,0]
			draw_set_color(c_white)
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			var _xx = _x+(menu_width-item_buffer-item_buffer)/2
			var _yy = _y + 16
			draw_text(_xx,_yy,_string)
			
			if (string_width(_string) - menu_width) > 0 menu_width = string_width(_string) + 16
			
			_y += 32+item_buffer	
		}
	}
	
	//	Draw Data menu
	draw_set_color(c_gray)
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
	var _string = ""
	if data_open _string = "- Data" else _string = "+ Data"
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	var _yy = _y + 16
	draw_text(_xx,_yy,_string)
	
	_y += 32+item_buffer
	
	if data_open {
		for(var d=0;d<array_height_2d(item_data);d++) {
			//	Draw data background
			draw_set_color(c_dkgray)
			draw_set_valign(fa_top)
			draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
			draw_set_color(c_black)
			draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,true)
			
			draw_set_color(c_white)
			var _string = item_data[d,0]
			draw_set_color(c_white)
			draw_set_color(c_white)
			draw_set_halign(fa_center)
			draw_set_valign(fa_middle)
			var _xx = _x+(menu_width-item_buffer-item_buffer)/2
			var _yy = _y + 16
			draw_text(_xx,_yy,_string)
			
			if (string_width(_string) - menu_width) > 0 menu_width = string_width(_string) + 16
			
			_y += 32+item_buffer
			
		}
	}
	
	//	Draw wire
	draw_set_color(c_dkgray)
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
	draw_set_color(c_black)
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,true)
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	var _yy = _y + 16
	draw_text(_xx,_yy,"Wire")
	
	_y += 32+item_buffer
	
	//	Draw kiosk
	draw_set_color(c_dkgray)
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,false)
	draw_set_color(c_black)
	draw_roundrect(_x,_y,_x+menu_width-item_buffer-item_buffer,_y+32,true)
	
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _xx = _x+(menu_width-item_buffer-item_buffer)/2
	var _yy = _y + 16
	draw_text(_xx,_yy,"Kiosk")
	
	//if (_y - menuY+menu_height) > 32+item_buffer {
	if _y+32 > menuY+menu_height {
		menu_height = _y-64
	}	
	
}	
#endregion

#region Points

var _xx = buttonX+button_width+32
var _yy = buttonY

//	Draw background
draw_set_color(c_dkgray)
draw_roundrect(_xx,_yy,_xx+128,_yy+64,false)

//	Draw outline
draw_set_color(c_black)
draw_roundrect(_xx,_yy,_xx+128,_yy+64,true)
draw_roundrect(_xx+1,_yy+1,_xx+128-1,_yy+64-1,true)

//	Draw points
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_text(_xx+128/2,_yy+32,string(player.points))

#endregion