/// @function                       scale_canvas(base width, base height, current width, current height, center);
/// @param {int}    base width      The base width for the game room
/// @param {int}    base height     The base height for the game room
/// @param {int}    current width   The current width of the game canvas
/// @param {int}    current height  The current height of the game canvas
/// @param {bool}   center          Set whether to center the game window on the canvas or not

var _base_width = argument0
var _base_height = argument1
var _current_width = argument2
var _current_height = argument3
var _center = argument4
var _aspect = (_base_width/_base_height)

if ((_current_width /_aspect) > _current_height)
    {
    window_set_size((_current_height*_aspect),_current_height)
    }
else
    {
    window_set_size(_current_width,(_current_width/_aspect))
    }
if (_center)
    {
    window_center()
    }

var extra_quality = 2

surface_resize(application_surface,min(window_get_width(),_base_width)*extra_quality,min(window_get_height(),_base_height)*extra_quality)