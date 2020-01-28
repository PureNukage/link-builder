room_width = app.world_width
room_height = app.world_height

if !instance_exists(camera) instance_create_layer(0,0,"Instances",camera)

instance_create_layer(0,0,"Instances",time)
instance_create_layer(0,0,"Instances",input)
instance_create_layer(0,0,"Instances",lighting)
instance_create_layer(0,0,"Instances",contracts)
instance_create_layer(0,0,"Instances",shop)
instance_create_layer(0,0,"Instances",gridController)
instance_create_layer(0,0,"Instances",plaque)
instance_create_layer(0,0,"Instances",systemController)
instance_create_layer(0,0,"Instances",debug)
instance_create_layer(0,0,"Instances",personController)
instance_create_layer(0,0,"Instances",player)
instance_create_layer(0,0,"Instances",textboxController)	


if app.tutorial > -1 {
	var _tutorial = instance_create_layer(0,0,"Instances",tutorialHelper)
	_tutorial.tutorial = app.tutorial
}