///@param id
///@param ports_count
///@param port_index

var _id = argument[0]
var ports_count = argument[1]
var port_index = argument[2]

if ports_count == 1 {
	var _0 = port_get_direction(_id,_id.ports[port_index,port_object])
	
} else if ports_count == 2 {
	
	//	Figure out directions
	var _0 = port_get_direction(_id,_id.ports[0,port_object])
	var _1 = port_get_direction(_id,_id.ports[1,port_object])
							
	//	Straight
	if (abs(_0[0]) == abs(_1[0])) or (abs(_0[1]) == abs(_1[1])) {
		_id.straight = true
	} else {
		_id.straight = false	
	}
							
	_id.sprite = _id.sprites[_id.straight]
							
	//	Set ports xy's
	_id.ports[0,port_x] = _id.center_cell_x + _0[0]
	_id.ports[0,port_y] = _id.center_cell_y + _0[1]
	_id.ports[1,port_x] = _id.center_cell_x + _1[0]
	_id.ports[1,port_y] = _id.center_cell_y + _1[1]
}