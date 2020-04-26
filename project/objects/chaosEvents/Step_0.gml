if time.minutes >= timer {
	
	if ds_list_empty(affected_data) {
		
		//var list = ds_list_create()
		
			//list[| 0] = "LinkPal"
			//list[| 1] = "BountiBot"
			//list[| 2] = "Smart Marketing Campaign"
			//list[| 3] = "TradingSet"
			
			////	check how many eth/usd data sources the player has down
			//var data_list = ds_list_create()
			//for(var d=0;d<array_height_2d(shop.item_data);d++) {
			//	var name = shop.item_data[d,item_name]
			//	var purchased = shop.item_data[d,item_purchased]
			//	if purchased and is_price(name) and is_price(name,true) == "ETH/USD" {
			//		ds_list_add(data_list,d)	
			//	}
			//}
			//if ds_list_size(data_list) > 5 and ds_list_size(data_list) <= 7 {
			//	var data_amount = 4
			//} else if ds_list_size(data_list) > 3 and ds_list_size(data_list) <= 5 and player.money >= 2500 {
			//	var data_amount = 3
			//} else if ds_list_size(data_list) <= 3 and player.money >= 1500 {
			//	var data_amount = 2	
			//} else {
			//	var data_amount = 1
			//}
			
			var ethusd_sources = 0
			var linkusd_sources = 0
			if instance_exists(data) {
				with data {
					var data_name = shop.item_data[item_index, item_name]
					if is_price(data_name) and is_price(data_name,true) == "ETH/USD" {
						ethusd_sources++	
					}
					if is_price(data_name) and is_price(data_name,true) == "LINK/USD" {
						linkusd_sources++	
					}
				}
			}
			
			var eth_wealth = player.eth * shop.eth_price
			var link_wealth = player.link * shop.link_price
			
			var total_wealth = player.money + eth_wealth + link_wealth
			
			#region	Check which Chaos Event to throw the player
				
				var data_amount = 0
				
				//	the Player is squatting with 1 ETH/USD source
				var trigger = 1750
				if (total_wealth > trigger) and ethusd_sources == 1 {
					debug_log("The Player is squatting with 1 ETH/USD source")
					data_amount = 1
				}
				
				//	the Player is squatting with 2 or 3 ETH/USD sources
				var trigger = 2500
				if (total_wealth > trigger) and ethusd_sources > 1 and ethusd_sources < 4 {
					debug_log("The Player is squatting with 2 or 3 ETH/USD sources")
					if ethusd_sources == 2 data_amount = 1
					if ethusd_sources == 3 data_amount = 2
				}
				
				//	the Player is squatting with 4 or 5 ETH/USD sources
				var trigger = 3500
				if (total_wealth > trigger) and ethusd_sources > 3 and ethusd_sources < 6 {
					debug_log("The Player is squatting with 4 or 5 ETH/USD sources")
					if (player.money > 5000 or eth_wealth > 2500 or link_wealth > 2500) data_amount = 3
					else data_amount = 2
				}
				
				//	the Player is squatting with more than 5 ETH/USD sources
				var trigger = 4000
				if (total_wealth > trigger) and ethusd_sources > 5 {
					debug_log("The Player is squatting with more than 5 ETH/USD sources")
					data_amount = 3	
				}
				
				
			#endregion	
			
			//ds_list_destroy(data_list)

		
		var amount = 1
		//for(var c=0;c<array_height_2d(contracts.contract);c++) {
		//	var name = contracts.contract[c,contract_name]
		//	var active = contracts.contract[c,contract_online]
			
		//	if active and ds_list_find_index(list,name) > -1 {
		//		amount++
		//	}
		//}
		//ds_list_destroy(list)
		
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