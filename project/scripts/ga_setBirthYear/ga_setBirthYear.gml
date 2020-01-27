/// @description set birth year
/// @param {real} birth year

if(os_browser == browser_not_a_browser)
{
	if(os_type == os_android)
	{
		setBirthYear_android(argument[0]);
	}
	else if(os_type == os_ios)
	{
		setBirthYear_ios(argument[0]);
	}
	else if(os_type == os_windows)
	{
		setBirthYear_windows(argument[0]);
	}
	else if(os_type == os_macosx)
	{
		setBirthYear_mac(argument[0]);
	}
	else if(os_type == os_linux)
	{
		setBirthYear_linux(argument[0]);
	}
	else if(os_type == os_uwp)
	{
		setBirthYear_uwp(argument[0]);
	}
}
else
{
	setBirthYear_html(argument[0]);
}