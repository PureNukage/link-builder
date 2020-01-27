/// @description returns an array with the arguments as elements
/// @param ... arguments to use as array elements

var array;

for(var i = 0; i < argument_count; ++i)
{
    if(is_string(argument[i]))
    {
        array[i] = string(argument[i]);
    }
    else if(is_real(argument[i]))
    {
        array[i] = real(argument[i]);
    }
	else
	{
		ga_trace("ga_array() argument" + i + " is not a string or number");
	}
}

return array;