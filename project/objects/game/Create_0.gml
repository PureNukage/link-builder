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

vision = false
temp_vision = false


if app.tutorial > -1 {
	var _tutorial = instance_create_layer(0,0,"Instances",tutorialHelper)
	_tutorial.tutorial = app.tutorial
}