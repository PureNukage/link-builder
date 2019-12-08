///	@param w1
/// @param h1
/// @param w2
/// @param h2

var w1 = argument[0]
var h1 = argument[1]
var w2 = argument[2]
var h2 = argument[3]
var Direction = 0

if w1 < w2 and h1 == h2 {	//	Right
	Direction = 0
}

if w1 == w2 and h1 > h2 {	//	Up
	Direction = 90
}

if w1 > w2 and h1 == h1 {	//	Left
	Direction = 180
}

if w1 == w2 and h1 < h2 {	//	Down
	Direction = 270
}

if w1 == w2 and h1 == h2 {	//	No change?
	Direction = 0
}	

return Direction 
