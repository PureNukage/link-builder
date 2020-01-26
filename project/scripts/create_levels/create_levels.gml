///@param jobruns
///@param ports

var array = []

var arg0 = 0
var arg1 = 1

for(var i=0;i<argument_count/2;i++) {
	array[i,0] = argument[arg0]	
	array[i,1] = argument[arg1]
	if i == 0 array[i,2] = true else array[i,2] = false
	
	arg0 += 2
	arg1 += 2
}

return array