if time.minutes >= timer {
	
	if ds_list_empty(affected_data) {
		
		var list = ds_list_create()
		//if player.value >= 500 and player.value <= 2001 {
			list[| 0] = "LinkPal"
			list[| 1] = "BountiBot"
			list[| 2] = "Smart Marketing Campaign"
			list[| 3] = "TradingSet"
			
			//	check how many eth/usd data sources the player has down
			var data_list = ds_list_create()
			for(var d=0;d<array_height_2d(shop.item_data);d++) {
				var name = shop.item_data[d,item_name]
				var purchased = shop.item_data[d,item_purchased]
				if purchased and is_price(name) and is_price(name,true) == "ETH/USD" {
					ds_list_add(data_list,d)	
				}
			}
			if ds_list_size(data_list) > 5 and ds_list_size(data_list) <= 7 {
				var data_amount = 4
			} else if ds_list_size(data_list) > 3 and ds_list_size(data_list) <= 5 and player.money >= 2500 {
				var data_amount = 3
			} else if ds_list_size(data_list) <= 3 and player.money >= 1500 {
				var data_amount = 2	
			} else {
				var data_amount = 1
			}
			
			ds_list_destroy(data_list)

		//}
		
		var amount = 0
		for(var c=0;c<array_height_2d(contracts.contract);c++) {
			var name = contracts.contract[c,contract_name]
			var active = contracts.contract[c,contract_online]
			
			if active and ds_list_find_index(list,name) > -1 {
				amount++
			}
		}
		ds_list_destroy(list)
		
		//	If at least one of the above contracts are online
		if amount > 0 {
			
			var list = ds_list_create()
			//	Find an ETH/USD data source and lets corrupt it 
			for(var d=0;d<array_height_2d(shop.item_data);d++) {
				var name = shop.item_data[d,item_name]
				var placed = shop.item_data[d,item_placed]
				
				if placed and is_price(name) and is_price(name,true) == "ETH/USD" {
					ds_list_add(list,d)
				}
			}	
				
			while data_amount > 0 {
				if !ds_list_empty(list) {
					if ds_list_size(list) > 1 var random_data = irandom_range(0,ds_list_size(list)-1)
					else var random_data = 0
						
					var d = list[| random_data]
					var name = shop.item_data[d,item_name]
					
					ds_list_delete(list,random_data)
					
					if ds_list_size(list) == 0 data_amount = 0
						
					var Random = choose(0,1)
					if Random {
						shop.item_data[d,item_corruption] = 100
						ds_list_add(affected_data,d)
						data_amount--
						create_textbox(name+" is experiencing an API outage",s_event_outage)
					} else {
						shop.item_data[d,item_corruption] = 50
						ds_list_add(affected_data,d)
						data_amount--
						create_textbox(name+" is experiencing an API degradation",s_event_outage)
					}
				}
			}
			var max_wait = 1
			timer = time.minutes + irandom_range(1,max_wait)
		}
		//	None of the required contracts are online, lets wait to check again
		else {
				
			debug_log("1500 VALUE CORRUPTION [0] required contracts online")
				
			var max_wait = 1
			timer = time.minutes + irandom_range(1,max_wait)
		}
		
	} 
	//	We already have an event in progress, lets end it
	else {
		
		for(var d=0;d<ds_list_size(affected_data);d++) {
			var index = affected_data[| d]
			shop.item_data[index, item_corruption] = 0
		}
		
		ds_list_clear(affected_data)
		
		debug_log("Ending event")
		
		var max_wait = 1
		timer = time.minutes + irandom_range(1,max_wait)
		
	}
	
	
}