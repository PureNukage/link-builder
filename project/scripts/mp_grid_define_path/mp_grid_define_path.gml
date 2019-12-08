/// @function scr_mp_grid_define_path(startingx,startingy,goalx,goaly,path,grid,allowdiag)
/// @description Calculates a path to a goal
/// @param {real} startingx The starting X position of the unit
/// @param {real} startingy The starting Y position of the unit
/// @param {real} goalx The Goal X position
/// @param {real} goaly The Goal Y position
/// @param path Which path to use?
/// @param grid Which grid to use?
/// @param allowdiag? Are we allowing diagonal movement?

var _startingx = argument[0]
var _startingy = argument[1]
var _goalx = argument[2]
var _goaly = argument[3]
var _path = argument[4]
var _grid = argument[5]
var _allowdiag = argument[6]

if !mp_grid_path(_grid,_path,_startingx,_startingy,_goalx,_goaly,_allowdiag) {
	debug_log("ERROR: mp_grid_define_path() - no path created")
	return false
} else {
	path_set_kind(_path,1)
	path_set_precision(_path,8)
	return true
}