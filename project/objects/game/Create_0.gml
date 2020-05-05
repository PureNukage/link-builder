room_width = app.world_width
room_height = app.world_height

if !instance_exists(camera) instance_create_layer(0,0,"Instances",camera)

instance_create_layer(0,0,"Instances",time)					debug_log("Spawning time object")
instance_create_layer(0,0,"Instances",topmenu)				debug_log("Spawning topmenu object")
instance_create_layer(0,0,"Instances",input)				debug_log("Spawning input object")
instance_create_layer(0,0,"Instances",lighting)				debug_log("Spawning lighting object")
instance_create_layer(0,0,"Instances",contracts)			debug_log("Spawning contracts object")
instance_create_layer(0,0,"Instances",shop)					debug_log("Spawning shop object")
instance_create_layer(0,0,"Instances",gridController)		debug_log("Spawning gridController object")
instance_create_layer(0,0,"Instances",plaque)				debug_log("Spawning plaque object")
instance_create_layer(0,0,"Instances",systemController)		debug_log("Spawning systemController object")
instance_create_layer(0,0,"Instances",debug)				debug_log("Spawning debug object")
instance_create_layer(0,0,"Instances",personController)		debug_log("Spawning personController object")
instance_create_layer(0,0,"Instances",player)				debug_log("Spawning player object")
instance_create_layer(0,0,"Instances",textboxController)	debug_log("Spawning textboxController object")
instance_create_layer(0,0,"Instances",chaosEvents)			debug_log("Spawning chaosEvents object")

vision = false
temp_vision = false

in_debt = false
in_debt_timer = irandom_range(120,180)

bailout1_amount_trigger = 0
bailout1_amount_net = -1
bailout1_amount = 1000

bailout2_amount_trigger = 0
bailout2_amount_net = -1
bailout2_amount = 2000

lose_game_trigger = 0
game_over = false
game_over_timer = 180

if app.new_game {
	shop.wire_active = false
	player.resources_active = false
	shop.exchange_active = false
	topmenu.data_active = false
	topmenu.nodes_active = false
	topmenu.contracts_active = false
	personController.heromenu_active = false
	textboxController.draw_active = false
}

if app.tutorial > -1 {
	var _tutorial = instance_create_layer(0,0,"Instances",tutorialHelper)
	_tutorial.tutorial = app.tutorial
}