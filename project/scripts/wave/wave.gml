///wave

///@param from
///@param to
///@param duration
///@param offset

var a4 = (argument1 - argument0) * 0.5
return argument0 + a4 + sin((((current_time * 0.0001) + argument2 * argument3) / argument2) * (pi*2)) * a4