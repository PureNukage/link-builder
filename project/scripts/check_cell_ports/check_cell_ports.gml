var _x1 = argument[0]
var _y1 = argument[1]

for(var i=0;i<4;i++) {
	switch(i)
	{
		case 0:	//	Right
			var _x2 = _x1 + 1
			var _y2 = _y1
		break
		case 1:	//	Up
			var _x2 = _x1
			var _y2 = _y1 - 1
		break	
		case 2:	//	Left
			var _x2 = _x1 - 1
			var _y2 = _y1
		break
		case 3:	//	Down
			var _x2 = _x1
			var _y2 = _y1 + 1
		break
	}
	
	
	
}
