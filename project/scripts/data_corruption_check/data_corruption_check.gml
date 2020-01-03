if shop.item_data[item_index, item_calls] > 0 and shop.item_data[item_index, item_calls] < 11 {
	shop.item_data[item_index, item_corruption] = 0
}
if shop.item_data[item_index, item_calls] > 11 and shop.item_data[item_index, item_calls] < 21 {
	shop.item_data[item_index, item_corruption] = 10	
}
if shop.item_data[item_index, item_calls] > 21 and shop.item_data[item_index, item_calls] < 31 {
	shop.item_data[item_index, item_corruption] = 20	
}
if shop.item_data[item_index, item_calls] > 31 and shop.item_data[item_index, item_calls] < 41 {
	shop.item_data[item_index, item_corruption] = 30	
}
if shop.item_data[item_index, item_calls] > 41 and shop.item_data[item_index, item_calls] < 51 {
	shop.item_data[item_index, item_corruption] = 40	
}
if shop.item_data[item_index, item_calls] > 51 {
	shop.item_data[item_index, item_corruption] = 50		
}