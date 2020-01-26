var new_value = 0
for(var c=0;c<array_height_2d(contracts.contract);c++) {
	if contracts.contract[c, contract_purchased] {
		new_value += contracts.contract[c, contract_value]
	}	
}

player.value = new_value