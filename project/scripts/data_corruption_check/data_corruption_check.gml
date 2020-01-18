var calls = shop.item_data[item_index, item_calls]

if calls > 0 and calls < 100 {
	shop.item_data[item_index, item_corruption] = 0
}
if calls > 99 and calls < 250 {
	shop.item_data[item_index, item_corruption]	= 10
}
if calls > 249 and calls < 500 {
	shop.item_data[item_index, item_corruption]	= 20
}
if calls > 499 and calls < 1000 {
	shop.item_data[item_index, item_corruption]	= 30
}
if calls > 999 {
	shop.item_data[item_index, item_corruption]	= 40
}