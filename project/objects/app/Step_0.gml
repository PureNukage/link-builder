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

ini_open(working_directory + "savedgame.ini")
var savedgame = ini_read_real("General","Saved Game",0)
ini_close()

if ((instance_exists(input) and input.f9) or (game_loading) or load_game_please) and tutorial == -1 and savedgame {
	if load_game_please load_game_please = false
	load_game()
	if !game_loading create_textbox("Game has been loaded...",-1,60)
}