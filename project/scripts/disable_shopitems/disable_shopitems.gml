//	Disable everything in the shop
for(var d=0;d<array_height_2d(shop.item_data);d++) {
	shop.item_data[d, item_available] = false
}
for(var n=0;n<array_height_2d(shop.item_node);n++) {
	shop.item_node[n, node_available] = false	
}
for(var c=0;c<array_height_2d(contracts.contract);c++) {
	contracts.contract[c, contract_available] = false	
}