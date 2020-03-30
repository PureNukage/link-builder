///	@param w1
/// @param h1
/// @param w2
/// @param h2

var X = argument[0]
var Y = argument[1]
var ID = argument[2]
//var w2 = argument[2]
//var h2 = argument[3]
var Direction = 0

if X < ID.topleft_cell_x {
	Direction = 180
} else if X > ID.bottomright_cell_x {
	Direction = 0	
} else if Y < ID.topleft_cell_y { 
	Direction = 90	
} else if Y > ID.bottomright_cell_y {
	Direction = 270	
}

//if w1 < w2 {//and (h1 == h2 {	//	Right
//	Direction = 0
//}

//if h1 > h2 {	//	Up
//	Direction = 90
//}

//if w1 > w2 {	//	Left
//	Direction = 180
//}

//if h1 < h2 {	//	Down
//	Direction = 270
//}

//if w1 == w2 and h1 == h2 {	//	No change?
//	Direction = 0
//}	

return Direction 
