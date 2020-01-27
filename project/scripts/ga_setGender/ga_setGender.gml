/// @description set gender
/// @param {real} gender type

if(os_browser == browser_not_a_browser)
{
	if(os_type == os_android)
	{
		setGender_android(argument[0]);
	}
	else if(os_type == os_ios)
	{
		setGender_ios(argument[0]);
	}
	else if(os_type == os_windows)
	{
		setGender_windows(argument[0]);
	}
	else if(os_type == os_macosx)
	{
		setGender_mac(argument[0]);
	}
	else if(os_type == os_linux)
	{
		setGender_linux(argument[0]);
	}
	else if(os_type == os_uwp)
	{
		setGender_uwp(argument[0]);
	}
}
else
{
	setGender_html(argument[0]);
}