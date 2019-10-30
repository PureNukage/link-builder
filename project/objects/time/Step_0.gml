frames++
stream++

if frames >= 60 {
	seconds++
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