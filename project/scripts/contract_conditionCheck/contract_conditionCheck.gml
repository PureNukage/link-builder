var Conditions = contracts.contract[smartcontract, contract_conditions]
var value = 0
for(var c=0;c<array_height_2d(Conditions);c++) {
	var type = Conditions[c, condition_type]
	switch(type)
	{
		case conditions.cnd_active:
			if contracts.contract[smartcontract, contract_online] {
				value += Conditions[c, condition_value]
			}	
		break
		case conditions.cnd_payment_eth:
			if contracts.contract[smartcontract, contract_online] {
				value += Conditions[c, condition_value]	
			}
		break
		case conditions.cnd_reliability_high:
			if contracts.contract[smartcontract, contract_reliability] >= 80 {
				value += Conditions[c, condition_value]				
			}
		break
	}	
}

contracts.contract[smartcontract, contract_value] = value

calculate_value()