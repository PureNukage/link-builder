data_needs[0,0] = "test contract"
data_needs[0,1] = id
data_needs[0,2] = 5
data_needs[1,0] = eData.test
data_needs[1,1] = 0

ds_list_add(contracts.contracts_list,data_needs)

contract_pos = ds_list_find_index(contracts.contracts_list,data_needs)