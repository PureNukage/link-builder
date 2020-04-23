if !contracts_open and !nodes_open and !data_open and menu_mouseover {
	menu_mouseover = false
	
	
	if plaqueCheck() {
		instance_destroy(Plaque)
		Plaque = -1
	}
}

data_checkNew()
node_checkNew()
contract_checkNew()