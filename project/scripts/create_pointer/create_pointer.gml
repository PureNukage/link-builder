///@param x
///@param y
///@param goalX
///@param goalY
///@param gui
///@param [uniqueID]

var xx = argument[0]
var yy = argument[1]
var goalx = argument[2]
var goaly = argument[3]
var gui = argument[4]
if argument_count >= 6 var _uniqueID = argument[5] else var _uniqueID = -1

var _finger = instance_create_layer(xx,yy,"Instances",finger)

_finger.goalX = goalx
_finger.goalY = goaly
_finger.gui = gui
_finger.uniqueID = _uniqueID