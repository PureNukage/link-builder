///@param data_type_1
///@param [data_type_2]
///@param [data_type_3]

var _data = []
for(var d=0;d<argument_count;d++) {
	_data[d,0] = argument[d]			//	Data type
	_data[d,1] = false					//	Are we getting it?
	_data[d,2] = -1						//	If so, from which node?
}

return _data