///@param x
///@param y
///@param object_index
///@param index

var X = argument[0]
var Y = argument[1]
var type = argument[2]
var Index = argument[3]

Plaque = instance_create_layer(0,0,"Instances",plaque)
Plaque.windowX = X
Plaque.windowY = Y
Plaque.object_type = type
Plaque.index = Index
Plaque.mode = mode.on

return Plaque