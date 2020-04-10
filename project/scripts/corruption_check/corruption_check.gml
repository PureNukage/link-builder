if player.value <= 1501 {
	var amount = 0
	var list = ds_list_create()
	list[| 0] = "LinkPal"
	list[| 1] = "BountiBot"
	list[| 2] = "Smart Marketing Campaign"
	list[| 3] = "TradingSet"
	for(var c=0;c<array_height_2d(contracts.contract);c++) {
		var name = contracts.contract[c, contract_name]
		var online = contracts.contract[c, contract_online]
		if ds_list_find_index(list,name) > -1 and online {
			amount++
		}
	}
	if amount > 0 {
		chaosEvents.timer = time.minutes + irandom_range(1,1)
		chaosEvents.queue = chaos_events.corruption	
	}
	ds_list_destroy(list)
}