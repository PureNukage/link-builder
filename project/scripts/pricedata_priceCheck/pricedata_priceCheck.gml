var eth_count = 0
var link_count = 0
var btc_count = 0

for(var d=0;d<array_height_2d(shop.item_data);d++) {
	var name = shop.item_data[d, item_name]
	if shop.item_data[d, item_purchased] {
		if is_price(name) and is_price(name,true) == "ETH/USD" eth_count++	
		if is_price(name) and is_price(name,true) == "LINK/USD" link_count++
		if is_price(name) and is_price(name,true) == "BTC/USD" btc_count++
	}
}

var eth_price = 0
switch(eth_count)
{
	case 0:	eth_price = 500  break
	case 1: eth_price = 750  break
	case 2: eth_price = 1000 break
	case 3: eth_price = 3500 break
	case 4: eth_price = 4250 break
	case 5: eth_price = 5000 break
	case 6: eth_price = 8000 break
	case 7: eth_price = 12000 break
	case 8: eth_price = 16000 break	
}

var link_price = 0
switch(link_count)
{
	case 0:	link_price = 750  break
	case 1: link_price = 1250  break
	case 2: link_price = 1500 break
	case 3: link_price = 3500 break
	case 4: link_price = 4500 break
	case 5: link_price = 5500 break
	case 6: link_price = 2500 break
	case 7: link_price = 2500 break
	case 8: link_price = 2500 break 	
}
var btc_price = 0
switch(btc_count)
{
	case 0:	btc_price = 2000  break
	case 1: btc_price = 2750  break
	case 2: btc_price = 3500 break
	case 3: btc_price = 5000 break
	case 4: btc_price = 6000 break
	case 5: btc_price = 7000 break
	case 6: btc_price = 2500 break
	case 7: btc_price = 2500 break
	case 8: btc_price = 2500 break	
}

for(var d=0;d<array_height_2d(shop.item_data);d++) {
	var data_name = shop.item_data[d, item_name]
	if is_price(data_name) and is_price(data_name,true) == "ETH/USD" shop.item_data[d, item_price] = eth_price
	if is_price(data_name) and is_price(data_name,true) == "LINK/USD" shop.item_data[d, item_price] = link_price
	if is_price(data_name) and is_price(data_name,true) == "BTC/USD" shop.item_data[d, item_price] = btc_price
}