#macro version "0.2.1"
me = "@PureNukage"

#region Platform
	// Browser HTML5
	//debug_log(string(os_browser))
	if os_browser != browser_not_a_browser {
		platform = "html5"
	}
	if os_type == os_windows {
		platform = "windows"	
	}
	//debug_log(string(os_type))
#endregion

world_width = 1920
world_height  = 1088

resolution_width = 1280	
resolution_height = 720

game_loading = false

data_corruption = -1

#region App Time
frames = 0
stream = 0
stream_seconds = 0
seconds = 0
minutes = 0 

seconds_switch = 0
minutes_switch = 0
#endregion

tutorial = -1

if !instance_exists(soundSystem) instance_create_layer(0,0,"Instances",soundSystem)