if ds_list_empty(affected_data) {
		
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
	
	var ethusd_data_price = shop.item_data[0, item_price] + (shop.item_data[0, item_price]/2)
	var linkusd_data_price = shop.item_data[10, item_price] + (shop.item_data[10, item_price]/2)
	
	total_wealth_trigger = min(ethusd_data_price)
			
	var eth_wealth = player.eth * shop.eth_price
	var link_wealth = player.link * shop.link_price
			
	var total_wealth = player.money + eth_wealth + link_wealth
			
	#region	Check which Chaos Event to throw the player
				
		var data_eth_amount = 0
		var data_link_amount = 0
		
		if time.minutes >= 4 {
			
			if total_wealth >= ethusd_data_price {
				//	the Player is squatting with 1 ETH/USD source
				if ethusd_sources == 1 {
					debug_log("The Player is squatting with 1 ETH/USD source")
					data_eth_amount = 1
				}
				
				//	the Player is squatting with 2 or 3 ETH/USD sources
				if ethusd_sources > 1 and ethusd_sources < 4 {
					debug_log("The Player is squatting with 2 or 3 ETH/USD sources")
					if ethusd_sources == 2 data_eth_amount = 1
					if ethusd_sources == 3 data_eth_amount = 2
				}
				
				//	the Player is squatting with 4 or 5 ETH/USD sources
				if ethusd_sources > 3 and ethusd_sources < 6 {
					debug_log("The Player is squatting with 4 or 5 ETH/USD sources")
					if (player.money > 5000 or eth_wealth > 2500 or link_wealth > 2500) data_eth_amount = 3
					else data_eth_amount = 2
				}
				
				//	the Player is squatting with more than 5 ETH/USD sources
				if ethusd_sources > 5 {
					debug_log("The Player is squatting with more than 5 ETH/USD sources")
					data_eth_amount = 3	
				}	
								
			}
			
			
			if total_wealth >= linkusd_data_price and player.value >= 4500 and linkusd_sources > 0 {
				if linkusd_sources == 1 {
					debug_log("The Player is squatting with 1 LINK/USD source")
					data_link_amount = 1	
				}
				if linkusd_sources > 1 and linkusd_sources < 4 {
					debug_log("The Player is squatting with 2 or 3 LINK/USD sources")
					data_link_amount = 2
				}
				if linkusd_sources > 3 and linkusd_sources < 6 {
					debug_log("The Player is squatting with 4 or 5 LINK/USD sources")
					data_link_amount = 2
				}
				if linkusd_sources > 5 {
					debug_log("The Player has more than 5 LINK/USD sources")
					data_link_amount = 3
				}
				
				total_wealth_trigger = min(ethusd_data_price,linkusd_data_price)
			}
			
		}
				
				
	#endregion	
		
	if time.minutes >= timer and total_wealth_trigger > -1 and total_wealth > total_wealth_trigger {
			
		#region ETH/USD
			var list = ds_list_create()
			//	Find an ETH/USD data source and lets corrupt it 
			for(var d=0;d<array_height_2d(shop.item_data);d++) {
				var name = shop.item_data[d,item_name]
				var placed = shop.item_data[d,item_placed]
				
				if placed and is_price(name) and is_price(name,true) == "ETH/USD" {
					ds_list_add(list,d)
				}
			}
			
			////	GAME ANALYTICS Custom ETH chaosEvent
			if data_eth_amount > 0 {
				ga_addDesignEvent("chaos events:eth", data_eth_amount)
			}
				
			while data_eth_amount > 0 {
				if !ds_list_empty(list) {
					if ds_list_size(list) > 1 var random_data = irandom_range(0,ds_list_size(list)-1)
					else var random_data = 0
						
					var d = list[| random_data]
					var name = shop.item_data[d,item_name]
					
					ds_list_delete(list,random_data)
					
					if ds_list_size(list) == 0 data_eth_amount = 0
						
					var Random = choose(0,1)
					if Random {
						shop.item_data[d,item_corruption] = 100
						ds_list_add(affected_data,d)
						data_eth_amount--
						create_textbox(name+" is experiencing an API outage",s_event_outage)
					} else {
						shop.item_data[d,item_corruption] = 50
						ds_list_add(affected_data,d)
						data_eth_amount--
						create_textbox(name+" is experiencing an API degradation",s_event_outage)
					}
				}
			}
			
			#endregion
		
		#region LINK/USD
			var list = ds_list_create()
			//	Find a LINK/USD data source and lets corrupt it 
			for(var d=0;d<array_height_2d(shop.item_data);d++) {
				var name = shop.item_data[d,item_name]
				var placed = shop.item_data[d,item_placed]
				
				if placed and is_price(name) and is_price(name,true) == "LINK/USD" {
					ds_list_add(list,d)
				}
			}	
			
			////	GAME ANALYTICS Custom ETH chaosEvent
			if data_link_amount > 0 {
				ga_addDesignEvent("chaos events:link", data_link_amount)
			}
			
			while data_link_amount > 0 {
				if !ds_list_empty(list) {
					if ds_list_size(list) > 1 var random_data = irandom_range(0,ds_list_size(list)-1)
					else var random_data = 0
						
					var d = list[| random_data]
					var name = shop.item_data[d,item_name]
					
					ds_list_delete(list,random_data)
					
					if ds_list_size(list) == 0 data_link_amount = 0
						
					var Random = choose(0,1)
					if Random {
						shop.item_data[d,item_corruption] = 100
						ds_list_add(affected_data,d)
						data_link_amount--
						create_textbox(name+" is experiencing an API outage",s_event_outage)
					} else {
						shop.item_data[d,item_corruption] = 50
						ds_list_add(affected_data,d)
						data_link_amount--
						create_textbox(name+" is experiencing an API degradation",s_event_outage)
					}
				}
			}
			
			
		#endregion
			
		var max_wait = 1
		timer = time.minutes + irandom_range(1,max_wait)
		ds_list_destroy(list)
	} else {
		var max_wait = 1
		timer = time.minutes + irandom_range(1,max_wait)	
	}
} 
//	We already have an event in progress, lets end it
else if time.minutes >= timer {
		
	for(var d=0;d<ds_list_size(affected_data);d++) {
		var index = affected_data[| d]
		shop.item_data[index, item_corruption] = 0
	}
		
	ds_list_clear(affected_data)
		
	debug_log("Ending event")
		
	var max_wait = 1
	timer = time.minutes + irandom_range(1,max_wait)
		
}