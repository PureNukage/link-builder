///@param string
///@param [return string?]

var _string = argument[0]
if argument_count == 2 var _return_string = argument[1] else var _return_string = false

var _array = []
_array[0] = "ETH/USD"
_array[1] = "LINK/USD"
_array[2] = "BTC/USD"

var _is_price = false
var _returned_string = -1
for(var i=0;i<array_length_1d(_array);i++){
	if string_pos(_array[i],_string) != 0 {
		_is_price = true
		_returned_string = _array[i]
	}
}

if _is_price {
	if _return_string {
		return _returned_string
	} else return true
} else {
	return false	
}