frames++
stream++

if frames >= 60 {
	seconds++
	stream_seconds++
	frames = 0
	seconds_switch = 1
} else {
	seconds_switch = 0	
}

if seconds >= 60 {
	minutes++
	seconds = 0
	minutes_switch = 1
} else {
	minutes_switch = 0	
}

var timer = 180

if outOfETH_timer < timer {
	outOfETH_timer++	
} else if outOfETH_timer == timer {
	outOfETH_timer = 0
	outOfETH++
}

if outOfLINK_timer < timer {
	outOfLINK_timer++
} else if outOfLINK_timer == timer {
	outOfLINK_timer = 0
	outOfLINK++
}