///@param condition_type
///@param condition_value

var array = []

var arg0 = 0
var arg1 = 1

for(var c=0;c<(argument_count/2);c++) {
	array[c,condition_type] = argument[arg0]
	array[c,condition_value] = argument[arg1]
	
	array[c,condition_met] = false
	
	switch(array[c,condition_type])
	{
		case conditions.cnd_active:
			var String = "Online"
		break
		case conditions.cnd_payment_eth:
			var String = "Payments in ETH"
		break
		case conditions.cnd_reliability_high:
			var String = "High Reliability"
		break
	}

	array[c,condition_string] = String
	arg0 += 2
	arg1 += 2
}

return array

