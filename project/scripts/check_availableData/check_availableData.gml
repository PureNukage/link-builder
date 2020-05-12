if app.tutorial == -1 {
	for(var d=0;d<array_height_2d(shop.item_data);d++) {
		var data_name = shop.item_data[d, item_name]
		switch(data_name)
		{
			//	PayPal, Github and Twitter
			case "PayPal":
			case "Github":
			case "Twitter":
				if player.value >= 500 {
					if !shop.item_data[d, item_available] shop.item_data[d, item_available] = true
				}
			break
			//	YouTube and Videogame API
			case "YouTube":
			case "DocuSign":
			case "VISA Payment":
				if player.value >= 2500 {
					if !shop.item_data[d, item_available] shop.item_data[d, item_available] = true	
				}
			break
			case "Flight API":
				if player.value >= 4500 {
					if !shop.item_data[d, item_available] shop.item_data[d, item_available] = true		
				}
			break
			//case "Videogame API":
			//	if player.value >= 5500 {
			//		if !shop.item_data[d, item_available] shop.item_data[d, item_available] = true		
			//	}
		
			//break
			//case "Swift GPI Payment":
			//case "Shipment Temperature API":
			//	if player.value >= 4000 {
			//		if !shop.item_data[d, item_available] shop.item_data[d, item_available] = true		
			//	}
			//break
		}
	
		//	LINK/USD
		if is_price(data_name) and is_price(data_name,true) == "LINK/USD" {
			if player.value >= 4500 {
				if !shop.item_data[d, item_available] shop.item_data[d, item_available] = true	
			}
		}
		
		//	BTC/USD
		if is_price(data_name) and is_price(data_name,true) == "BTC/USD" {
			if player.value >= 4500 {
				if !shop.item_data[d, item_available] shop.item_data[d, item_available] = true		
			}
		}
		
	}
}