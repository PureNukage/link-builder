///@param index

var index = argument[0]

var rectangle_color = -1
var sprite = -1
var xscale = -1
var yscale = -1
var color = -1
var alpha = -1

switch(index)
{
	case node:
		rectangle_color = c_sergey_blue
		sprite = s_resource_link
		xscale = 1
		yscale = 1
		color = c_black
		alpha = .2
	break
	case data:
		rectangle_color = c_gray
		sprite = s_icon_database
		xscale = .75
		yscale = .75
		color = c_white
		alpha = .33
	break
	case kiosk:
		rectangle_color = c_olive
		sprite = s_icon_contract
		xscale = 2
		yscale = 2
		color = c_white
		alpha = .2
	break
}
draw_set_color(rectangle_color)
if topleft_cell_x > -1 and bottomright_cell_x < grid_width-1 and topleft_cell_y > -1 and bottomright_cell_y < grid_height-1 {
	var xx = gridController.grid_positions_x[topleft_cell_x]
	var yy = gridController.grid_positions_y[topleft_cell_y]
	var spacer = 10
	var width = size_width*cell_width
	var height = size_height*cell_height
	draw_roundrect(xx+spacer,yy+spacer,xx+width-spacer,yy+height-spacer,false)
			
	draw_sprite_ext(sprite,0,xx+spacer/2+(width-spacer)/2,yy+spacer/2+(height-spacer)/2,xscale,yscale,0,color,alpha)
			
	draw_set_color(c_black)		
	draw_text_ext(xx+width/2,yy+height/2,name,string_height(name),width-40)
}