///@param rotation

var _rotation = argument[0]

switch(abs(_rotation))
{
	case 0:
		ports[0,port_x] = bottomright_cell_x+1
		ports[0,port_y] = center_cell_y
	break
	case 270:
		ports[0,port_x] = center_cell_x
		ports[0,port_y] = topleft_cell_y-1	
	break
	case 180:
		ports[0,port_x] = topleft_cell_x-1
		ports[0,port_y] = center_cell_y
	break
	case 90:
		ports[0,port_x] = center_cell_x
		ports[0,port_y] = bottomright_cell_y+1		
	break
}