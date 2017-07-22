/*------------------------------------------------------------------------------ 
	This is a cached copy of the NUISmartBitmapThemes.h, don't modify manually.   
	Run UpdateStyleRes.bat to update this file, along with all the SmartBitmaps   
------------------------------------------------------------------------------*/ 
/*****************************************************************************
	NUISmartBitmapThemes.h

	Theme definitions.  This file is processed by nuicl.exe and is
	included into multiple other files.

	This file is also included into LyncSmartBitmapTable.h, which lists
	the smart bitmaps exclusive to Lync.

	DETAILS:
	SmartBitmap entries (NUI_SB) give a name and information about how
	to render the bitmap.  The bitmap must exist in %mso%\nui\styleres
	as Name.png.

	If this bitmap should render in low-color and high contrast
	modes then a bitmap should exist in the same directory named Name-Low.bmp.
	This bitmap should be a 256 indexed color bitmap.  The first 30 colors
	are remapped to system colors (COLOR_SCROLLBAR .. COLOR_MENUBAR).
	If a low color version of this bitmap does not exist then it will not
	be rendered in low color and high contrast modes.

	Alternate themes can be defined using the NUI_DEFINE_THEME macro.  If
	a bitmap with the name Name.Theme.png exists then it will be used when
	that theme is active otherwise the original bitmap will be rendered.

	Copyright (c) Microsoft Corporation. All rights reserved.
*****************************************************************************/

// Supported Themes
// Note: the default theme doesn't require a declaration.
#ifdef NUI_DEFINE_THEME
NUI_DEFINE_THEME( VeryDark )
NUI_DEFINE_THEME( Black )
NUI_DEFINE_THEME( Colorful )
#endif //NUI_DEFINE_THEME

