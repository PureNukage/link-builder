///@param corruption_calls_min
///@param corruption_calls_max
///@param corruption_amount

var array = []

var arg0 = 0
var arg1 = 1
var arg2 = 2

for(var i=0;i<(argument_count/3);i++) {

	array[i,corruption_calls_min] = argument[arg0]
	array[i,corruption_calls_max] = argument[arg1]
	array[i,corruption_amount] = argument[arg2]
	
	arg0 += 3
	arg1 += 3
	arg2 += 3
	
}

return array