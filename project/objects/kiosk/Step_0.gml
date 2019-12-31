//	lets add our contract into a persons queue
if active and contracts.contract[smartcontract, contract_traffic_live] < contracts.contract[smartcontract, contract_traffic] {
	for(var i=0;i<ds_list_size(personController.people);i++) {
		var _person = personController.people[| i]
		//	this contract is not in this persons queue, lets add it
		if ds_list_find_index(_person.smartcontracts,smartcontract) == -1 {
			ds_list_add(_person.smartcontracts,smartcontract)
			contracts.contract[smartcontract, contract_traffic_live]++
		}
		
		
	}
}