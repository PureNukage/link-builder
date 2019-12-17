///@ param rotation

var _rotation = argument[0]

var right1 = bottomright_cell_x+1
var right2 = center_cell_y

var bottom1 = center_cell_x
var bottom2 = bottomright_cell_y+1

var left1 = topleft_cell_x-1
var left2 = center_cell_y

var top1 = center_cell_x
var top2 = topleft_cell_y-1

switch(abs(_rotation))
{
	case 0:
		ports[0,port_x] = right1
		ports[0,port_y] = right2

		ports[1,port_x] = bottom1
		ports[1,port_y] = bottom2

		ports[2,port_x] = left1
		ports[2,port_y] = left2

		ports[3,port_x] = top1
		ports[3,port_y] = top2
	break
	case 90:
		ports[0,port_x] = top1
		ports[0,port_y] = top2

		ports[1,port_x] = right1
		ports[1,port_y] = right2
		
		ports[2,port_x] = bottom1
		ports[2,port_y] = bottom2

		ports[3,port_x] = left1
		ports[3,port_y] = left2
	break
	case 180:
		ports[0,port_x] = left1
		ports[0,port_y] = left2

		ports[1,port_x] = top1
		ports[1,port_y] = top2

		ports[2,port_x] = right1
		ports[2,port_y] = right2

		ports[3,port_x] = bottom1
		ports[3,port_y] = bottom2
	break
	case 270:
		ports[0,port_x] = bottom1
		ports[0,port_y] = bottom2

		ports[1,port_x] = left1
		ports[1,port_y] = left2

		ports[2,port_x] = top1
		ports[2,port_y] = top2

		ports[3,port_x] = right1
		ports[3,port_y] = right2
	break
}