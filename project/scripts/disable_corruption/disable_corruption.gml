var Corruption = create_data_corruption(0,-1,0)
for(var d=0;d<array_height_2d(shop.item_data);d++) {
	shop.item_data[d, item_corruption_levels] = Corruption
	shop.item_data[d, item_corruption] = 0
}