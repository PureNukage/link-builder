draw_set_font(fnt_shop)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

var buffer = 16
var menuX = 0
var menuY = 0
var menu_string = "Menu"
var menu_width = string_width(menu_string) + (buffer*2)

var dataX = menuX + menu_width
var dataY = menuY
var data_string = "Data"
var data_width = string_width(data_string) + (buffer*2)

var nodesX = dataX + data_width
var nodesY = menuY
var nodes_string = "Nodes"
var nodes_width = string_width(nodes_string) + (buffer*2)

contractsX = nodesX+ nodes_width
contractsY = menuY
var contracts_string = "Contracts"
contracts_width = string_width(contracts_string) + (buffer*2)

//	menu
if point_in_rectangle(gui_mouse_x,gui_mouse_y,menuX,menuY,menuX+menu_width,menuY+48) {
	draw_set_color(c_ltgray)
	if input.mouse_left_press {
		if instance_exists(mainmenu) instance_destroy(mainmenu)
		else {
			var _menu = instance_create_layer(0,0,"Instances",mainmenu)
			_menu.menu = menu.options
			_menu.in_game = true
		}	
	}
} else {
	draw_set_color(c_dkgray)	
}
if instance_exists(mainmenu) draw_set_color(c_ltgray)

draw_rectangle(menuX,menuY,menuX+menu_width,menuY+48,false)
draw_set_color(c_black)
draw_text(menuX+menu_width/2,menuY+24,menu_string)

//	data
if point_in_rectangle(gui_mouse_x,gui_mouse_y,dataX,dataY,dataX+data_width,dataY+48) {
	draw_set_color(c_ltgray)	
} else {
	draw_set_color(c_dkgray)	
}
draw_rectangle(dataX,dataY,dataX+data_width,dataY+48,false)
draw_set_color(c_black)
draw_text(dataX+data_width/2,dataY+24,data_string)

//	nodes
if point_in_rectangle(gui_mouse_x,gui_mouse_y,nodesX,nodesY,nodesX+nodes_width,nodesY+48) {
	draw_set_color(c_ltgray)	
} else {
	draw_set_color(c_dkgray)	
}
draw_rectangle(nodesX,nodesY,nodesX+nodes_width,nodesY+48,false)
draw_set_color(c_black)
draw_text(nodesX+nodes_width/2,nodesY+24,nodes_string)

//contracts
if point_in_rectangle(gui_mouse_x,gui_mouse_y,contractsX,contractsY,contractsX+contracts_width,contractsY+48) {
	draw_set_color(c_ltgray)	
} else {
	draw_set_color(c_dkgray)
}	
draw_rectangle(contractsX,contractsY,contractsX+contracts_width,contractsY+48,false)
draw_set_color(c_black)
draw_text(contractsX+contracts_width/2,contractsY+24,contracts_string)