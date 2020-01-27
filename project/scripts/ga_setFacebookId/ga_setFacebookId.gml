/// @description set facebook id
/// @param {string} facebook id

if(os_browser == browser_not_a_browser)
{
	if(os_type == os_android)
	{
		setFacebookId_android(argument[0]);
	}
	else if(os_type == os_ios)
	{
		setFacebookId_ios(argument[0]);
	}
	else if(os_type == os_windows)
	{
		setFacebookId_windows(argument[0]);
	}
	else if(os_type == os_macosx)
	{
		setFacebookId_mac(argument[0]);
	}
	else if(os_type == os_linux)
	{
		setFacebookId_linux(argument[0]);
	}
	else if(os_type == os_uwp)
	{
		setFacebookId_uwp(argument[0]);
	}
}
else
{
	setFacebookId_html(argument[0]);
}