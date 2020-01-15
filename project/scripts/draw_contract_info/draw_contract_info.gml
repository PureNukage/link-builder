///@param x
///@param y
///@param width
///@param height
///@param contract_index

var _xx = argument[0]
var _yy = argument[1]
var line_width = argument[2]
var line_height = argument[3]
var contract_index = argument[4]

var _name = contracts.contract[contract_index, contract_name]
var _price = contracts.contract[contract_index, contract_price]
var _online = contracts.contract[contract_index, contract_online]
var _reliability = contracts.contract[contract_index, contract_reliability]

var name_spacer = 32
var icon_width = 32
var icon_spacer = 16

var _price_width = string_width(string(_price))

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
				
var data_spacerX = 32
var data_spacerY = 90
				
var _x = _xx + data_spacerX
var _y = _yy + (name_spacer/2) + data_spacerY
				
draw_set_halign(fa_left)
				
//	Draw needed data
var needed_contract_data = contracts.contract[contract_index, contract_data]
for(var d=0;d<array_height_2d(needed_contract_data);d++) {
	var data_enum = needed_contract_data[d,0]
	var getting_it = needed_contract_data[d,1]
	var data_string = shop.item_data[data_enum, item_name]
					
	draw_set_color(c_white)
	draw_text(_x,_y,data_string)
					
	//	Am I getting this data?
	if getting_it {
		draw_set_color(c_green)		
	} else draw_set_color(c_red)
					
	draw_circle(_xx+340-128,_y,12,false)
					
					
	_y += 64
					
}

//	Draw the reliability
draw_set_color(c_white)
draw_text_transformed(_x,_y,"Reliability",1.5,1.5,0)

draw_set_halign(fa_center)
draw_text_transformed(_xx+340-128,_y,string(_reliability),1.5,1.5,0)