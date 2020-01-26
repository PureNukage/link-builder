ds_list_destroy(contracts_purchased)
ds_list_destroy(contracts_online)

for(var c=0;c<array_height_2d(contract);c++) {
	ds_list_destroy(contract[c, contract_uses])	
}