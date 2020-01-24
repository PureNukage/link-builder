if !instance_exists(camera) instance_create_layer(0,0,"Instances",camera)

in_game = false

mainMenu = []

mainMenu[0, menu_name] = "Play"
mainMenu[0, menu_selected] = false

mainMenu[1, menu_name] = "Tutorials"
mainMenu[1, menu_selected] = false

mainMenu[2, menu_name] = "Options"
mainMenu[2, menu_selected] = false

options[0, menu_name] = "Resolution"

resolutions[0, menu_name] = "1920 x 1080"
resolutions[0, menu_selected] = false
resolutions[0, menu_active] = false
resolutions[0, menu_data0] = 1920
resolutions[0, menu_data1] = 1080

resolutions[1, menu_name] = "1280 x 720"
resolutions[1, menu_selected] = false
resolutions[1, menu_active] = false
resolutions[1, menu_data0] = 1280
resolutions[1, menu_data1] = 720

//	Set resolution
if app.resolution_width == 1920 {
	resolutions[0, menu_active] = true
} else if app.resolution_width == 1280 {
	resolutions[1, menu_active]	= true
} 

options[0, menu_submenu] = resolutions

//	Tutorials
tutorials[tutorial.basics, tutorial_name] = "1. Smart Contract Builder basics"
tutorials[tutorial.basics, tutorial_selected] = true

tutorials[tutorial.my_first_contract, tutorial_name] = "2. The Oracle Problem, or Your First dApp"
tutorials[tutorial.my_first_contract, tutorial_selected] = true

tutorials[tutorial.decentralizing, tutorial_name] = "3. The Need to Decentralize"
tutorials[tutorial.decentralizing, tutorial_selected] = true

tutorials[tutorial.price_feed, tutorial_name] = "How to build a Decentralized Price Feed"
tutorials[tutorial.price_feed, tutorial_selected] = false

menu = menu.main