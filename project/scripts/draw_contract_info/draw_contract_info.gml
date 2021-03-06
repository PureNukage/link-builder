///@param x
///@param y
///@param contract_index
///@param [shop?]

var _xx = argument[0]
var _yy = argument[1]
var contract_index = argument[2]
if argument_count >= 4 var _shop = argument[3] else var _shop = false

var _name = contracts.contract[contract_index, contract_name]
var _price = contracts.contract[contract_index, contract_price]
var _online = contracts.contract[contract_index, contract_online]
var _reliability = contracts.contract[contract_index, contract_reliability]
var _gasfee = contracts.contract[contract_index, contract_gasfee_total]
var _linkfee = contracts.contract[contract_index, contract_linkfee]

var name_spacer = 32
var icon_width = 32
var icon_spacer = 16

var _price_width = string_width(string(_price))

var default_window_width = 260
var default_window_height = 240

var line_width = default_window_width
//	Calculate width
if string_width(_name) < 51 {
	//line_width = default_window_width + (string_width(_name)) + 64
}
if string_width(_name) > 51  and string_width(_name) < 120 { 
	line_width = default_window_width + (string_width(_name)) + 32
} else var line_width = default_window_width
if string_width(_name) > 120 {
	line_width += string_width(_name)	
}

if _price_width > 29 {
	//line_width = line_width + _price_width - 29
}	

if _shop == false {
	var data_open = contracts.data_open
	var stats_open = contracts.stats_open
} else {
	var data_open = true
	var stats_open = true
}

//	Calculate height
if data_open {
	var data_header_string = "- Required Data"
	var line_height = default_window_height + (array_height_2d(contracts.contract[contract_index, contract_data]) * 32)
} else {
	var data_header_string = "+ Required Data"	
	var line_height = default_window_height
}
if stats_open {
	var stats_header_string = "- Stats"
	
	//	Calculate how many Stats
	var stats = 5
	
	var conditions_amount = array_height_2d(contracts.contract[contract_index, contract_conditions])
	
	if contracts.contract[contract_index, contract_type] == contract_types.utility {
		var conditions_amount = 0	
	}
	
	stats += conditions_amount
	
	line_height += 48*stats
} else {
	var stats_header_string = "+ Stats"
}

var portrait_radius = 164
var portrait_buffer = 32

var contract_text_string = contracts.contract[contract_index, contract_text]
var contract_text_width = string_width_ext(contract_text_string,string_height(contract_text_string),200)
var contract_text_height = string_height_ext(contract_text_string,string_height(contract_text_string),contract_text_width)

if line_width <= portrait_radius+(portrait_buffer*2) + contract_text_width { 
	var hypothetical_line_width = line_width + contract_text_width
	var difference = hypothetical_line_width - line_width
	line_width += difference
}

line_height += max(portrait_radius+(portrait_buffer*2), contract_text_height)

//debug_log("price width: "+string(_price_width))
//debug_log("name width: "+string(string_width(_name)))

//	Draw window outline
draw_set_color(c_black)
draw_roundrect(_xx-2,_yy-2,_xx+line_width+2,_yy+line_height+2,false)

//	Draw window background
draw_set_color(c_dkgray)
draw_roundrect(_xx,_yy,_xx+line_width,_yy+line_height,false)
				
//	Draw name
draw_set_color(c_white)
draw_set_font(fnt_shop_menu_name)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_outlined(_xx+name_spacer-16,_yy+(name_spacer/2),_name,c_white,c_black)
draw_set_font(fnt_shop)
				
//	Draw either Active or Price
if !contracts.contract[contract_index, contract_purchased] {
					
	draw_set_halign(fa_right)
	draw_set_valign(fa_middle)
	draw_text_outlined(_xx+line_width-_price_width,_yy+name_spacer,string(_price),c_white,c_black)
					
	//	Draw lock sprite
	draw_sprite(s_lock,0,_xx+line_width-_price_width-64,_yy+name_spacer)
					
} else {
					
	if _online {
		draw_set_color(c_green)	
	} else draw_set_color(c_red)
					
	icon_width = 18
	draw_circle(_xx+line_width-icon_width-(icon_spacer*2)+18,_yy+name_spacer,icon_width,false)
					
}

var portraitX = _xx
var portraitY = _yy + (name_spacer/2+90)

//	Draw the portrait
draw_sprite_part(contracts.contract[contract_index, contract_portrait],0,14,46,164,164,portraitX+32,portraitY-32)

//	Draw the contract text
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var _string = contracts.contract[contract_index, contract_text]
draw_text_ext(portraitX+portrait_radius+portrait_buffer+32,portraitY,_string,string_height(_string),contract_text_width)

_yy += portrait_radius+(portrait_buffer*2)
				
var data_spacerX = 32
var data_spacerY = 90

draw_set_valign(fa_middle)

//	Draw Data Header
var dh_xx = _xx+data_spacerX
var dh_yy = _yy+(name_spacer/2)+data_spacerY-32
var buffer = 32
if point_in_rectangle(gui_mouse_x,gui_mouse_y,dh_xx-buffer,dh_yy-(buffer/2),dh_xx+string_width(data_header_string)+buffer,dh_yy+string_height(data_header_string)+buffer) {
	if input.mouse_left_press {
		contracts.data_open = !contracts.data_open	
		data_open = contracts.data_open
	}
	draw_set_color(c_white)	
} else {
	draw_set_color(c_black)
}
draw_set_halign(fa_left)
draw_text(dh_xx,dh_yy,data_header_string)

var _x = _xx + line_width/2 //+ data_spacerX
var _y = _yy + (name_spacer/2) + data_spacerY
				
draw_set_halign(fa_right)

//	Draw needed data
if data_open {
	if contracts.contract[contract_index, contract_kiosk] > -1 var needed_contract_data = contracts.contract[contract_index, contract_kiosk].data_needed
	else var needed_contract_data = contracts.contract[contract_index, contract_data]
	//var needed_contract_data = contracts.contract[contract_index, contract_kiosk].data_needed
	for(var d=0;d<array_height_2d(needed_contract_data);d++) {
		var data_enum = needed_contract_data[d,0]
		var getting_it = needed_contract_data[d,1]
		var data_string = shop.item_data[data_enum, item_name]
	
		//	Check if price data
		if is_price(data_string) {
			data_string = is_price(data_string,true)	
		}
					
		draw_set_color(c_white)
		draw_text(_x,_y,data_string)
					
		//	Am I getting this data?
		if getting_it {
			draw_set_color(c_green)		
		} else draw_set_color(c_red)
					
		draw_circle(_x + (data_spacerX*2),_y,12,false)
					
		_y += 48
					
	}
} else {
	_y += 48
}

//	Draw Stats Header
if point_in_rectangle(gui_mouse_x,gui_mouse_y,_xx+data_spacerX,_y-16,_xx+data_spacerX+string_width(stats_header_string),_y+string_height(stats_header_string)) {
	draw_set_color(c_white)
	if input.mouse_left_press {
		contracts.stats_open = !contracts.stats_open
		stats_open = contracts.stats_open
	}
} else {
	draw_set_color(c_black)
}
draw_set_halign(fa_left)
//_y += 64
draw_text(_xx+data_spacerX,_y,stats_header_string)

_y += 48

if stats_open {
	//	Draw the reliability
	draw_set_color(c_white)
	draw_set_halign(fa_right)
	draw_text(_x,_y,"Reliability")

	draw_set_halign(fa_center)
	draw_text_transformed(_x+(data_spacerX*2),_y-4,string(_reliability)+"%",1.5,1.5,0)
	
	_y += 48
	
	//	Draw the Reward
	draw_set_halign(fa_right)
	draw_text(_x,_y,"$$ Reward")
	
	draw_set_halign(fa_center)
	var reward = contracts.contract[contract_index, contract_reward]
	draw_text_transformed(_x+(data_spacerX*2),_y-4,string(reward),1.5,1.5,0)
	
	draw_set_font(fnt_shop_menu_name)
	draw_text_outlined(_x+(data_spacerX*2)+64,_y-4,"$$",c_green,c_black)
	draw_set_font(fnt_shop)
	draw_set_color(c_white)
	
	_y += 48
	
	//	Draw the Gas Fee
	draw_set_halign(fa_right)
	draw_text(_x,_y,"ETH fee")
	
	draw_set_halign(fa_center)
	draw_text_transformed(_x+(data_spacerX*2),_y-4,string(_gasfee),1.5,1.5,0)
	
	draw_sprite(s_resource_eth_shop,0,_x+(data_spacerX*2)+64,_y-4)
	
	_y += 48
	
	//	Draw the Link fee
	draw_set_halign(fa_right)
	draw_text(_x,_y,"LINK fee")
	
	draw_set_halign(fa_center)
	draw_text_transformed(_x+(data_spacerX*2),_y-4,string(_linkfee),1.5,1.5,0)
	
	draw_sprite(s_resource_link_shop,0,_x+(data_spacerX*2)+64,_y-4)
	
	_y += 48
	
	//	Draw the total $$ fee
	draw_set_halign(fa_right)
	draw_text(_x,_y,"Total $$ Cost")
	
	draw_set_halign(fa_center)
	var fee = (_linkfee * shop.link_price) + (_gasfee * shop.eth_price)
	draw_text_transformed(_x+(data_spacerX*2),_y-4,string(fee),1.5,1.5,0)
	
	draw_set_font(fnt_shop_menu_name)
	draw_text_outlined(_x+(data_spacerX*2)+64,_y-4,"$$",c_red,c_black)
	draw_set_color(c_white)
	draw_set_font(fnt_shop)
	
	_y += 48
	
	if contracts.contract[contract_index, contract_type] == contract_types.people {
		//	Draw VALUE Header
		draw_set_halign(fa_right)
		draw_text(_x-32,_y,"VALUE")
		_y += 36
	
		//	Draw the Value Gained from Conditions
		var Conditions = contracts.contract[contract_index, contract_conditions]
		for(var c=0;c<array_height_2d(Conditions);c++) {
			var String = Conditions[c,condition_string]
			var Value = Conditions[c, condition_value]
		
			draw_set_halign(fa_right)
			draw_text(_x,_y,String)
		
			draw_set_halign(fa_center)
			draw_text_transformed(_x+(data_spacerX*2),_y-4,string(Value),1.5,1.5,0)
			
			draw_sprite(s_resource_value_shop,0,_x+(data_spacerX*2)+64,_y-4)
		
			_y += 48
		
		}
	}
}

//	Return the width and height of this window if they are different than default
if line_width != default_window_width or line_height != default_window_height {
	var array = []
	array[0] = line_width
	array[1] = line_height
	return array
}