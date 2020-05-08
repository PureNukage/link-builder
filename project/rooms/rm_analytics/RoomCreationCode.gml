// Browser HTML5
//debug_log(string(os_browser))
if os_browser != browser_not_a_browser {
	var platform = "html5"
}
if os_type == os_windows {
	var platform = "windows"	
}
//debug_log(string(os_type))

//	Game Analytics
var game_key = "12afd0fd74a12d84b2a920bf0700fb84"
var secret_key = "b9984eb76ba5955b6b0fcaea5c6dd6135649724d"

ga_configureBuild(platform+" "+ version)

//	Configure Whitelisted Resources
var array = ga_array("value", "money", "link", "eth")
ga_configureAvailableResourceCurrencies(array)

var array = ga_array("bailout", "purchase", "contract online")
ga_configureAvailableResourceItemTypes(array)

//ga_addDesignEvent("")

ga_setEnabledVerboseLog(true)
ga_setEnabledInfoLog(true)

ga_initialize(game_key, secret_key)

var App = instance_create_layer(0,0,"Instances",app)
App.persistent = true

room_goto_next()