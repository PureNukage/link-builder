///@param cell_x
///@param cell_y

var _w = argument[0]
var _h = argument[1]

var _x = gridController.grid_positions_x[_w]+(cell_width/2)
var _y = gridController.grid_positions_y[_h]+(cell_height/2)

var _kiosk = instance_create_layer(_x,_y,"Instances",kiosk)
_kiosk.states = states.placed
with _kiosk {
	item_move(_w,_h)
	
	kiosk_update_ports_xy(rotation)
	
	item_place()
	
	system_set()
	
	item_placeid()
}

return _kiosk