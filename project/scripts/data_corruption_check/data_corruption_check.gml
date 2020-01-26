var calls = shop.item_data[item_index, item_calls]

var Corruption = shop.item_data[item_index, item_corruption_levels]

for(var c=0;c<array_height_2d(Corruption);c++) {
	if Corruption[c, corruption_calls_max] == -1 {
		if calls >= Corruption[c, corruption_calls_min] {
			shop.item_data[item_index, item_corruption] = Corruption[c, corruption_amount]	
		}
	} else {
		if calls >= Corruption[c, corruption_calls_min] and calls < Corruption[c, corruption_calls_max] {
			shop.item_data[item_index, item_corruption] = Corruption[c, corruption_amount]	
		}
			
	}
}
//if calls > 0 and calls < 100 {
//	shop.item_data[item_index, item_corruption] = 0
//}
//if calls > 99 and calls < 250 {
//	shop.item_data[item_index, item_corruption]	= 10
//}
//if calls > 249 and calls < 500 {
//	shop.item_data[item_index, item_corruption]	= 20
//}
//if calls > 499 and calls < 1000 {
//	shop.item_data[item_index, item_corruption]	= 30
//}
//if calls > 999 {
//	shop.item_data[item_index, item_corruption]	= 40
//}