instance_create_layer(0,0,"Instances",camera)

mainMenu = []

mainMenu[0, menu_name] = "Play"
mainMenu[0, menu_selected] = false

mainMenu[1, menu_name] = "Options"
mainMenu[1, menu_selected] = false

options[0, menu_name] = "Resolution"

resolutions[0, menu_name] = "1920 x 1080"
resolutions[0, menu_selected] = false
resolutions[0, menu_active] = true
resolutions[0, menu_data0] = 1920
resolutions[0, menu_data1] = 1080

resolutions[1, menu_name] = "1280 x 720"
resolutions[1, menu_selected] = false
resolutions[1, menu_active] = false
resolutions[1, menu_data0] = 1280
resolutions[1, menu_data1] = 720

options[0, menu_submenu] = resolutions

menu = menu.main