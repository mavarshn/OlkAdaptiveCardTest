/*****************************************************************************

	Module  : viewer.cpp
	Owner   : MCrider

	Copyright (c) Microsoft Corporation. All rights reserved.

******************************************************************************

	This is a small test application that allows a biped to open and view
	NetUI files in a semi-nice interface.

	%%Owner:  MCrider
	%%Id:  7b65182d-4c19-499c-9d64-50decdee3aec
*****************************************************************************/

#include "stdafx.h"

// Windows Header Files:
#include <windows.h>
#include <shellapi.h>
#include <winuser.h>
#include <shlwapi.h>  /* For PathCompactPathEx() and wnsprintf */

// C RunTime Header Files
#include <stdlib.h>
#include <stdio.h>
#include <malloc.h>
#include <memory.h>
#include <tchar.h>

// We want to use our cached SmartBitmapTable to avoid build breaks
#define NETUI_VIEWER 1
namespace NetUI
{
	enum CachedSmartBitmapId
	{
#define NUI_SB(name, numFrames, left, top, right, bottom, fAlphaBlend, fNineGrid, fStretch, fKeepRatio, fFlipInRTL, fSmallestInSet) \
	sbid##name,
#include "CachedMso40UISmartBitmapTable.h"
#include "CachedMso99LSmartBitmapTable.h"
#include "CachedMso99SmartBitmapTable.h"
	};
}
#include "NUISmartBitmap.h"

// Local Header Files
#include <nui_inc.h>
#include <nuitoolwindow.h>
#include <nuimarkupcontainer.h>
#include <nuicommandbutton.h>
#include <nuiclient.h>
#include <nuidddragimage.h>
#include <nuinetuielement.h>
#include <nuiricheditlistbox.h>
#include <nuialloc.h>
#include <nuidallayout.h>
#include <nuictxuiuser.h>

#include <gdiplus.h>

#include "resource.h"
#include <nuitest.h>

#include "FlexUI.h"
#include "FlexAdapter.h"
#include "FlexList.h"

#include "FlexPackageParser.h"

#include <NUICtxUIMgr.h>

#include "MsoTheme.h"
#include "MsoVisuals.h"
#include <msotb.h>
#include <msoapp/appinfo.h>
#include <UIColor/CBVisuals.h>

/*********************************************************/
// Added by srikar.
#include "AdaptiveNetUIViewer.h"
#include "..\AdaptiveObjectModel\SharedAdaptiveCard.h"
#include "AdaptiveColumnSet.h"
#include "AdaptiveLabel.h"

/*********************************************************/

/* Allow MSO clients without a toolbar set to update MSO's system colors on their
WM_SYSCOLORCHANGE handler */
MSOAPI_(void) MsoUpdateSysColors(void);

#define WINDOWSIZEW 1024
#define WINDOWSIZEH 768

using namespace NetUI;
using namespace FlexUI;

#ifndef WM_THEMECHANGED
	#define WM_THEMECHANGED                 0x031A
#endif

#if( !DEBUG && !defined(AssertSz) )
#undef AssertSz
#define AssertSz(b, str) \
OACR_WARNING_SUPPRESS(4127, "Expression may be knowingly constant (debug-only code)"); \
	do{ if(!(b)) MessageBoxA(0, #str, "Error: ##b", MB_OK | MB_ICONERROR); } while (0)
#undef Assert
#define Assert(b) AssertSz(b, #b)
#endif

///////////////////////////////////////////////////////////////////////////////
//                 Variables specific to viewer.cpp
///////////////////////////////////////////////////////////////////////////////

#include <commdlg.h>   /* Needed for OPENFILENAME struct */

#define MAX_LOADSTRING 100
#define TOOLBARSIZEH 50
#define IDW_RUNTIME_WINDOW    8
#define IDW_TOOLBAR_WINDOW    9

// Global instance.
HINSTANCE g_hInst;                 // current instance
TCHAR szWindowClass[MAX_LOADSTRING];   // The main window class name
TCHAR szToolbarWindowClass[] = L"TimeToolbar";

WCHAR g_wzIniFilename[MAX_PATH] = {0};

const unsigned int s_numMRUFiles = 9;
WCHAR g_wzMRUFiles[s_numMRUFiles][MAX_PATH] = {0};

const unsigned int s_numFavorites = 36;
WCHAR g_wzFavorites[s_numFavorites][MAX_PATH] = {0};

WCHAR g_wzPackageFilename[MAX_PATH] = {0};

NUIDocument *g_pDocument = NULL;
ToolWindow  *g_pBufferToolWin = NULL;
bool         g_fCurrentDocIsBuffer = false;
bool         g_fCurrentFileIsPackage = false;
HWND         g_hwndViewer = NULL;

class ViewerParseErrorHandler;
ViewerParseErrorHandler *g_pParseErrorHandler = NULL;

DataSourceSP g_pCurrentDataSource;

ULONG_PTR   s_gplToken = 0;

// Foward declarations of functions included in this code module:
void           DestroyParseErrorHandler();
void           ReadINIFile();
void           SetWindowTitle(const WCHAR *wzFilename);
bool           FOpenDocumentFile(NUIDocument *pDocument, const WCHAR *wzFile, HINSTANCE hInst);
void           UpdateMRU(HWND hwndMenu, const WCHAR *wzLatestFile);
static bool    FUpdateMenus(HWND hwnd);
void           ParseCommandLineParameters( WCHAR **pwzFileToOpen, bool * pfQuitOnIdle1, bool * pfScale);
bool           FocusDemandsEvent(const MSG &msg);
void           AddDragDropHandler(NUIDocument *pDocument);
void           EnsureErrorHandlerAndReset();
ATOM           MyRegisterClass(HINSTANCE hInstance);
BOOL           InitInstance(HINSTANCE, int);
LRESULT CALLBACK  WndProc(HWND, UINT, WPARAM, LPARAM);
LRESULT CALLBACK  About(HWND, UINT, WPARAM, LPARAM);
LRESULT CALLBACK  TimeControlsWndProc( HWND, UINT, WPARAM, LPARAM );
void ResizeAll( HWND hwnd );
void UninitGDIPlus();
HRESULT RegisterViewerNetUIControls();
void UpdateDefaultStyle( int wmId );
static bool FToggleTaskPaneLayout();
void ReleaseDefaultStyles();
void SetParserErrorStatus();
void SetFlexSmartBitmapTable();
HRESULT CreateViewerCtxUIUser(IMsoCtxUIUser **ppUser);

std::shared_ptr<AdaptiveColumnSet> m_spAdaptiveColumnSet;

/*-----------------------------------------------------------------------------
	%%Owner:  MikeBor
	%%Id:  9fcbf93d-acad-41c2-9b2b-05a851637021
-----------------------------------------------------------------------------*/
class ViewerPackageEventHandler : public FlexPackageEventHandler
{
public:
	/*-----------------------------------------------------------------------------
		%%Owner:  MikeBor
		%%Id:  175f1148-4c9e-4312-87d9-d78151716585
	-----------------------------------------------------------------------------*/
	void LogError(LPCWSTR wzError) override
	{
		MessageBox(g_hwndViewer, wzError, L"Parser Error", MB_OK);
	}

	/*-----------------------------------------------------------------------------
		%%Owner:  MikeBor
		%%Id:  aa99235f-5f1d-4f27-84c0-7aa70303f547
	-----------------------------------------------------------------------------*/
	IParseErrorHandler * GetParseErrorHandler() override
	{
		return g_pParseErrorHandler;
	}
};



///////////////////////////////////////////////////////////////////////////////
//                                Code
///////////////////////////////////////////////////////////////////////////////

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  0bd0f662-92d1-48b5-afca-266e41eaa9fb
-----------------------------------------------------------------------------*/
int APIENTRY WinMain(HINSTANCE hInstance,
							HINSTANCE hPrevInstance,
							LPSTR     lpCmdLine,
							int       nCmdShow)
{
	UNREFERENCED_PARAMETER(hPrevInstance);
	UNREFERENCED_PARAMETER(lpCmdLine);
	UNREFERENCED_PARAMETER(nCmdShow);

	// Set up function overrides to scale scrollbar sizes for DPI.
	InstallFunctionOverrides(NSH_ScaleForDPI);

	MSG msg;
	HACCEL hAccelTable = NULL;
	HWND hwnd = NULL;
	WCHAR *wzFileToOpen = NULL;
	bool fQuitOnIdle1 = false;
	bool fScale = false;
	bool fComInited = false;
	bool fInitCtxUIMgr = false;
	CntPtrTo<IMsoCtxUIUser> spCtxUIUser;

	// Store instance handle in our global variable
	g_hInst = hInstance;

	// Parse command line parameters
	ParseCommandLineParameters( &wzFileToOpen, &fQuitOnIdle1, &fScale );

	// Now that we might know our INI location, read in our INI info (including MRU).
	ReadINIFile();

	NETUI_EXPORT_API_(void) NetUIInitLiblets();
	NetUIInitLiblets();

	// Initialize the core of NetUI;
	HRESULT hr = NUIDocument::Initialize();
	if (FAILED(hr))
		goto LError;

	fComInited = SUCCEEDED(::CoInitializeEx(NULL, COINIT_APARTMENTTHREADED));

	if (FAILED(CreateViewerCtxUIUser(&spCtxUIUser)))
		goto LError;

	fInitCtxUIMgr = CtxUIMgr::FInitializeCtxUIMgr(spCtxUIUser);
	if (!fInitCtxUIMgr)
		goto LError;

	// Register our controls.  Do this after setting the MSOCBVCRHandler, to ensure
	// it can parse MSO colors in <netpane> styles.
	hr = RegisterViewerNetUIControls();
	if (FAILED(hr))
		goto LError;

	SetFlexSmartBitmapTable();

	// Perform application initialization:
	if (!InitInstance (hInstance, nCmdShow))
		goto LError;

	// Find the window handle of the main window (for translating accelerators).
	hwnd = FindWindow( szWindowClass, NULL );

	Node::StartDefer();

	// Create a document and a document window.
	hr = NUIDocument::CreateDocumentWindow( hInstance, hwnd, 0, 0, WINDOWSIZEW, WINDOWSIZEH, WS_CHILD, &g_pDocument );
	if (FAILED(hr))
		goto LError;

	// Set an ID on the document window to make our resizing code simpler.
	SetWindowLongPtrW( g_pDocument->GetWindowHWND(), GWL_ID, IDW_RUNTIME_WINDOW );

	// Size the subwindows properly.
	ResizeAll( hwnd );

	// Set key focus into the NetUI window.
	::SetFocus(g_pDocument->GetWindowHWND());

	EnsureErrorHandlerAndReset();
	SetParserErrorStatus();

	// open NetUI markup from a file
	if (wzFileToOpen != NULL)
	{
		if (!FOpenDocumentFile(g_pDocument, wzFileToOpen, g_hInst))
		{
			const int bufsize = MAX_PATH+200;
			WCHAR buf[bufsize];
			NetUIWzCopy( buf, bufsize, L"Error: Loading document from command line failed:\n     " );
			NetUIRgwchCwcAppend( buf, bufsize, wzFileToOpen, bufsize-IntFromSize_t(wcslen(buf)) );
			MessageBox( 0, buf, L"NetUIView Error", MB_OK | MB_ICONWARNING );
		}
		else
		{
			// Opened the file successfully.  Add it to the MRU.
			SetWindowTitle( wzFileToOpen );
			UpdateMRU( hwnd, wzFileToOpen );
		}
	}

	AddDragDropHandler( g_pDocument );

	AssertDoTag(FUpdateMenus(hwnd), ASSERTTAG('1y2g'));

	Node::EndDefer();

	hAccelTable = LoadAccelerators(hInstance, (LPCTSTR)IDC_VIEWER);

	BOOL fRet;

	// Main message loop:
	while (0 != (fRet = fQuitOnIdle1 ? PeekMessage(&msg, NULL, 0, 0, PM_REMOVE) :
	                                  GetMessage(&msg, NULL, 0, 0)))
	{
		if (fRet == -1)
			goto LError;

		CtxUIMgr::HandleMsg(&msg, true);

		if (FocusDemandsEvent(msg) || !TranslateAccelerator(hwnd, hAccelTable, &msg))
		{
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
	}

LError:
	NETUI_EXPORT_API_(void) NetUIUninitLiblets();
	NetUIUninitLiblets();

	g_pCurrentDataSource = NULL;
	spCtxUIUser = NULL;

	// Clean-up DUser and the anim core.
	if (g_pDocument)
	{
		g_pDocument->Destroy();
		g_pDocument = NULL;
	}

	// This must happen BEFORE Uninitialize().
	DestroyParseErrorHandler();
	ReleaseDefaultStyles();

	// uninitialize resB resources
	MsoUnregisterLocLibrary(g_hInst);

	if (fInitCtxUIMgr)
		CtxUIMgr::UninitializeCtxUIMgr();

	// Turn on NetUI leak detection before Uninitializing.  That support only exists in debug, though.
#if (DEBUG)
	NetUI::EnableLeakAsserts();
#endif

	NUIDocument::Uninitialize();

	if (fComInited)
		::CoUninitialize();

	if (wzFileToOpen != NULL)
	{
		delete wzFileToOpen;
		wzFileToOpen = NULL;
	}

	if (s_gplToken != 0)
		UninitGDIPlus();

	return 0;
}


///////////////////////////////////////////////////////////////////////
// FocusDemandsEvent
//
// This method tests to see if the focus window requires this event,
// instead of us swallowing it for an accelerator.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  a231dace-0402-4063-99d3-cf19154cacf7
-----------------------------------------------------------------------------*/
bool FocusDemandsEvent(const MSG &msg)
{
	// Test to see if it is a "clipboard" key -
	// one of the standard accelerators for cut/copy/paste/delete
	//
	bool isEditKey = false;

	if (msg.message == WM_KEYDOWN)
	{
		if (msg.wParam == VK_DELETE)
		{
			isEditKey = true;
		}
		else if (GetKeyState(VK_CONTROL) < 0)
		{
			isEditKey =
				(msg.wParam == 'Z') ||
				(msg.wParam == 'X') || (msg.wParam == 'C') || (msg.wParam == 'V');
		}
	}

	if (!isEditKey)
		return false;

	// Now test to see if the current focus is an editable control
	//
	HWND focusHWND = GetFocus();
	if (focusHWND == NULL)
		return false;

	// This works by asking the control if it is editable.
	// Note that this will return true for things like
	// tree views, so be sure to filter, if necessary
	//
	bool isEditableControl = false;
	LRESULT dlgCode = SendMessage(focusHWND, WM_GETDLGCODE, 0, 0);
	if ((dlgCode & DLGC_WANTCHARS) != 0)
		isEditableControl = true;

	return isEditableControl;
}


///////////////////////////////////////////////////////////////////////
// ParseCommandLineParameters
//
// Parse command line parameters.  Return a specified filename to open,
// if there is one.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  8f77a87d-6d76-4e1e-ad91-c0efd414003a
-----------------------------------------------------------------------------*/
void ParseCommandLineParameters( WCHAR **pwzFileToOpen, bool * pfQuitOnIdle1, bool * pfScale)
{
	if (pwzFileToOpen != NULL)
		*pwzFileToOpen = NULL;

	if (pfScale)
		*pfScale = false;

	int numArgs;
	WCHAR **pwzArgs = CommandLineToArgvW( GetCommandLineW(), &numArgs );
	if (pwzArgs == NULL || numArgs == 0)
		return;

	// Parse the args!
	int idx = 1; // start at 1, to skip the name of this .exe
	while (idx < numArgs)
	{
		//OutputDebugString( pwzArgs[idx] ); OutputDebugString( L"\n" );
		if (pwzArgs[idx][0] == '-' || pwzArgs[idx][0] == '/')
		{
			// It is a switch.  Parse it.
			switch (pwzArgs[idx][1])
			{
			case '?':
				MessageBox( 0,
					L"Usage:  netuiview [options] [file to open]\n\n"
					L"          -?          This help text.\n"
					L"          -d dpi      Have NetUI render as if you are running on a screen with the given dpi\n"
					L"          -i mrufile  Specifies a name for a .ini file to store MRU names in.\n"
					L"          -ltr        Force LTR layout.\n"
					L"          -q          Quits after first idle.\n"
					L"          -rtl        Force RTL layout.\n"
					L"          -s          Scales based on system fonts (only use with file)"
					L"\n"
					L"          [file to open]  This file will be opened at startup."
					, L"NetUIView Usage", MB_OK );
				break;

			case 'd':
			case 'D':
				// The next argument should be desired dpi mode.
				idx++;
				if (idx < numArgs && pwzArgs[idx][0] != '-' && pwzArgs[idx][0] != '/')
				{
					int nDPI;
					int nMatched = swscanf_s( pwzArgs[idx], L"%d", &nDPI );
					if (nMatched == 1)
					{
						SetForcedDPI( nDPI );
					}
				}
				else
				{
					MessageBox(0, L"Error: No dpi setting given for -d option.  Use -? for help.", L"NetUIView Error", MB_OK | MB_ICONERROR);
				}
				break;

			case 'i':
			case 'I':
				// The next argument should be a filename for the MRU.
				idx++;
				if (idx < numArgs && pwzArgs[idx][0] != '-' && pwzArgs[idx][0] != '/')
				{
					wcsncpy( g_wzIniFilename, pwzArgs[idx], MAX_PATH );
				}
				else
				{
					MessageBox(0, L"Error: No filename given for mrufile -i option.  Use -? for help.", L"NetUIView Error", MB_OK | MB_ICONERROR);
				}
				break;

			case 'q':
			case 'Q':
				*pfQuitOnIdle1 = true;
				break;

			case 'l':
			case 'L':
			case 'r':
			case 'R':
				if (_wcsicmp(L"rtl", &pwzArgs[idx][1]) == 0 || _wcsicmp(L"ltr", &pwzArgs[idx][1]) == 0)
				{
					bool fRTL = (_wcsicmp(L"rtl", &pwzArgs[idx][1]) == 0);
					NetUISetForceBiDi(fRTL);
				}
				break;

			case 's':
			case 'S':
				if (pfScale)
					*pfScale = true;
				break;

			default:
				{
					const int bufsize = 1024;
					WCHAR buf[bufsize];
					NetUIWzCopy( buf, bufsize, L"Error: Unknown argument: " );
					NetUIWzAppend( buf, bufsize, pwzArgs[idx] );
					NetUIWzAppend(buf, bufsize, L".  Use -? for help.");
					MessageBox( 0, buf, L"NetUIView Error", MB_OK | MB_ICONERROR );
				}
				break;
			}
		}
		else
		{
			// Filename to open.
			if (pwzFileToOpen != NULL)
			{
				if (*pwzFileToOpen != NULL)
					MessageBox( 0, L"Error: Command line specified more than one file to open.", L"NetUIView Error", MB_OK | MB_ICONWARNING );
				else
				{
					// Copy the string and point pwzFileToOpen to it.
					size_t len = wcslen( pwzArgs[idx] );
					if (len > 0)
					{
						*pwzFileToOpen = new WCHAR[len+1];
						wcsncpy( *pwzFileToOpen, pwzArgs[idx], len+1 );
					}
				}
			}
		}
		idx++;
	}

	HGLOBAL gfreeResult = GlobalFree( pwzArgs );
	AssertSzTag( gfreeResult == NULL, "Unable to free command line args." , ASSERTTAG('dyxc'));
	UNREFERENCED( gfreeResult );
}


///////////////////////////////////////////////////////////////////////
// InitGDIPlus
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  cab3765e-25c0-438a-b0ba-73cf1197003e
-----------------------------------------------------------------------------*/
void InitGDIPlus()
{
	static Gdiplus::GdiplusStartupOutput s_gpgso;
	if (s_gplToken == 0)
	{
		Gdiplus::GdiplusStartupInput gpgsi(NULL, TRUE);
		Gdiplus::GdiplusStartup(&s_gplToken, &gpgsi, &s_gpgso);
	}
}


///////////////////////////////////////////////////////////////////////
// UninitGDIPlus
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  ee2778b0-917a-4328-8993-a7891fd804ef
-----------------------------------------------------------------------------*/
void UninitGDIPlus()
{
	if (s_gplToken != 0)
	{
		Gdiplus::GdiplusShutdown(s_gplToken);
		s_gplToken = 0;
	}
}

OACR_WARNING_PUSH
OACR_WARNING_DISABLE(SPECIFY_SELECTANY, "Unneeded, it is static data")

// The entries for each SmartBitmap
const SmartBitmapDefinition g_Mso40UISmartBitmapDefs[] =
{
#define NUI_SMARTBITMAP_DEFINITION(name, resId, lowResId, file, cx, cy, frameCy, numFrames, left, top, right, bottom, fAlphaBlend, fShowLowColor, fNineGrid, fStretch, fKeepRatio, fFlipInRTL, fSmallestInSet) \
	{ resId, lowResId, cx, cy, numFrames, frameCy, left, top, right, bottom, fAlphaBlend, fShowLowColor, fNineGrid, fStretch, fKeepRatio, fFlipInRTL, fSmallestInSet },
#include "CachedMso40UISmartBitmapDefinitions.h"
#undef NUI_SMARTBITMAP_DEFINITION
};

// This table should be sorted
const EnumMap g_pMso40UISmartBitmapEnumMap[] =
{
#define NUI_SORTED_SMARTBITMAP(name) \
	{ L"sbid" L#name, sbid##name },
#include "CachedMso40UISmartBitmapDefinitions.h"
#undef NUI_SORTED_SMARTBITMAP
	{ nullptr, 0 },
};

// The entries for each SmartBitmap
const SmartBitmapDefinition g_Mso99LSmartBitmapDefs[] =
{
#define NUI_SMARTBITMAP_DEFINITION(name, resId, lowResId, file, cx, cy, frameCy, numFrames, left, top, right, bottom, fAlphaBlend, fShowLowColor, fNineGrid, fStretch, fKeepRatio, fFlipInRTL, fSmallestInSet) \
	{ resId, lowResId, cx, cy, numFrames, frameCy, left, top, right, bottom, fAlphaBlend, fShowLowColor, fNineGrid, fStretch, fKeepRatio, fFlipInRTL, fSmallestInSet },
#include "CachedMso99LSmartBitmapDefinitions.h"
#undef NUI_SMARTBITMAP_DEFINITION
};

// This table should be sorted
const EnumMap g_pMso99LSmartBitmapEnumMap[] =
{
#define NUI_SORTED_SMARTBITMAP(name) \
	{ L"sbid" L#name, sbid##name },
#include "CachedMso99LSmartBitmapDefinitions.h"
#undef NUI_SORTED_SMARTBITMAP
	{ nullptr, 0 },
};

// The entries for each SmartBitmap
const SmartBitmapDefinition g_Mso99SmartBitmapDefs[] =
{
#define NUI_SMARTBITMAP_DEFINITION(name, resId, lowResId, file, cx, cy, frameCy, numFrames, left, top, right, bottom, fAlphaBlend, fShowLowColor, fNineGrid, fStretch, fKeepRatio, fFlipInRTL, fSmallestInSet) \
	{ resId, lowResId, cx, cy, numFrames, frameCy, left, top, right, bottom, fAlphaBlend, fShowLowColor, fNineGrid, fStretch, fKeepRatio, fFlipInRTL, fSmallestInSet },
#include "CachedNUISmartBitmapDefinitions.h"
#undef NUI_SMARTBITMAP_DEFINITION
};

// This table should be sorted
const EnumMap g_pMso99SmartBitmapEnumMap[] =
{
#define NUI_SORTED_SMARTBITMAP(name) \
	{ L"sbid" L#name, sbid##name },
#include "CachedNUISmartBitmapDefinitions.h"
#undef NUI_SORTED_SMARTBITMAP
	{ nullptr, 0 },
};

OACR_WARNING_POP

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id: 2a0dcc26-ed63-49d7-9b74-4ad8a0d5bd38
-----------------------------------------------------------------------------*/
void SetFlexSmartBitmapTable()
{
	NetUI::SetSmartBitmapTable(
		SBP_Mso40UI,
		SmartBitmapRange_MSO40UI_Begin,
		_countof(g_Mso40UISmartBitmapDefs), 
		g_Mso40UISmartBitmapDefs,
		g_pMso40UISmartBitmapEnumMap,
		g_hInst);

	NetUI::SetSmartBitmapTable(
		SBP_Mso99L,
		SmartBitmapRange_MSO99L_Begin,
		_countof(g_Mso99LSmartBitmapDefs),
		g_Mso99LSmartBitmapDefs,
		g_pMso99LSmartBitmapEnumMap,
		g_hInst);

	NetUI::SetSmartBitmapTable(
		SBP_Mso99,
		SmartBitmapRange_MSO99_Begin,
		_countof(g_Mso99SmartBitmapDefs),
		g_Mso99SmartBitmapDefs,
		g_pMso99SmartBitmapEnumMap,
		g_hInst);

	NetUI::SetAppSpecificSmartBitmapInfo(
		nullptr,
		nullptr,
		SmartBitmapRange_App_Begin, // simply choosing the next range after Mso99
		0,
		msoTestApp, // no specific reason to choose this, can change this if needed
		nullptr,
		0,
		g_hInst); // no resources in viewer, so it doesn't matter what we put here
}


///////////////////////////////////////////////////////////////////////
// ChangeForcedDPI
//
// TODO:
// Unfortunately, this method does not currently work, because some
// sizes are being cached in NetUI.  For example, GetDefaultFont
// needs to be updated, along with Element::s_pvDefaultFont*.  Just
// updating these were not sufficient to make this work, though, so
// I gave up for now.  (mcrider)
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  63d010b3-13d3-4786-802f-05bb727e6fea
-----------------------------------------------------------------------------*/
void ChangeForcedDPI()
{
	static const int DPImodes[] = { 96, 120, 150, 180, 220, 72 };
	static int s_currentMode = 0;

	s_currentMode++;
	if (s_currentMode >= NUIARRAYSIZE(DPImodes))
		s_currentMode = 0;

	SetForcedDPI( DPImodes[s_currentMode] );

	WCHAR buf[1024];
	// NRobarge: Ok - Constant format string, non-shipping code
	OACR_REVIEWED_CALL(NRobarge, _snwprintf_s(buf, _TRUNCATE, L"Changed forced DPI to %d", DPImodes[s_currentMode]));
	MessageBox( NULL, buf, L"Forced DPI Setting Changed", MB_OK );

	InvalidateRect( g_pDocument->GetWindowHWND(), NULL, FALSE );
}


///////////////////////////////////////////////////////////////////////
// class ViewerBaseElementListener
//
// A base IElementListener implementation, to ease implementation
// for subclasses.  This should go away once there is one of these
// directly in NetUI.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  8447fef5-09d8-4aca-84c1-b070d6be477b
-----------------------------------------------------------------------------*/
class ViewerBaseElementListener : public BaseElementListenerNoRefCount
{
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  a4fc615c-3c3e-4771-8521-147ce709c4b2
-----------------------------------------------------------------------------*/
public:
	ViewerBaseElementListener() : m_refCount(0) {}

	// IElementListener
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  89193f82-ec77-497a-8bf2-ef7b699293bd
-----------------------------------------------------------------------------*/
	ULONG __stdcall AddRef() override
	{
		return (ULONG) InterlockedIncrement(&m_refCount);
	}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  50e27604-8f7d-4adf-b90a-b33029cf8b00
-----------------------------------------------------------------------------*/
	ULONG __stdcall Release() override
	{
		ULONG remaining = (ULONG)InterlockedDecrement(&m_refCount);

		if (remaining == 0)
			delete this;

		return remaining;
	}

	// Set the bits for the events you want to listen to, using the ELF_ flags above.
/*-----------------------------------------------------------------------------
	%%Owner:  IgorZ
	%%Id:  d7f16dc6-e0bb-452c-9fa7-72990d5f7b2e
-----------------------------------------------------------------------------*/
	DWORD GetEventFilter() override { return ELF_Event; }
private:
	LONG m_refCount;
};


///////////////////////////////////////////////////////////////////////
// EnsureErrorHandlerAndReset
//
// Ensure that a ParseErrorHandler exists and has been set on the
// document, creating and setting it if it hasn't been done.  If one
// already exists, reset its string list.  This function should be
// called before parsing another file/buffer so the error list only
// contains errors from the most recent parse.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  7fc8f563-73ea-43ca-b2c9-4cf131e6f587
-----------------------------------------------------------------------------*/
void EnsureErrorHandlerAndReset()
{
	AssertSzTag( g_pDocument != NULL, "EnsureErrorHandlerAndReset() called when there is no document." , ASSERTTAG('dyxd'));
	if (g_pDocument == NULL)
		return;

	if (g_pParseErrorHandler == NULL)
	{
		g_pParseErrorHandler = new ViewerParseErrorHandler();
		g_pDocument->SetParseErrorHandler( g_pParseErrorHandler );
	}
	else
	{
		g_pParseErrorHandler->ResetStringsList();
	}
}


///////////////////////////////////////////////////////////////////////
// DestroyParseErrorHandler
//
// Destroy the ParseErrorHandler if it exists.  Note that at shutdown
// this method must be called BEFORE NUIDocument::Uninitialize, since
// the ParseErrorHandler uses a DynamicArray which uses HNew/HDelete
// which require the NetUI heaps to still exist.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  ead00572-93d7-47ed-ad09-749d594a2179
-----------------------------------------------------------------------------*/
void DestroyParseErrorHandler()
{
	if (g_pParseErrorHandler != NULL)
	{
		delete g_pParseErrorHandler;
		g_pParseErrorHandler = NULL;
	}
}


///////////////////////////////////////////////////////////////////////
// SetParserErrorStatus
//
// Called after a file/buffer is loaded or reloaded, this function
// checks if there were any parser errors, and enables and highlights
// the Errors menu item if there were.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  502b115c-52ec-4094-948d-d40e49788416
-----------------------------------------------------------------------------*/
void SetParserErrorStatus()
{
	bool fErrors = false;

	if (g_pParseErrorHandler != NULL && g_pParseErrorHandler->EnumErrors(0) != NULL)
		fErrors = true;

	HMENU hmenu = GetMenu(g_hwndViewer);

	// When there aren't errors, use OwnerDraw type so the menu item disapepars.
	// When there are errors, set it back to string type show it shows on the menubar.
	MENUITEMINFO mii;
	mii.cbSize = sizeof(MENUITEMINFO);
	mii.fMask = MIIM_TYPE;
	mii.fType = fErrors ? MFT_STRING : MFT_OWNERDRAW;
	mii.dwTypeData = const_cast<WCHAR*>(L"&Errors in File!");
	SetMenuItemInfo(hmenu, IDM_SHOWERRORS, FALSE, &mii);

	DrawMenuBar(g_hwndViewer);
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  132dc67f-7010-4d2e-b57e-4d3c0fd2621c
-----------------------------------------------------------------------------*/
void SetWindowTitle(const WCHAR *wzFilename)
{
	AssertSzTag( g_pDocument != NULL, "No document in SetWindowTitle." , ASSERTTAG('dyxe'));

	const size_t buflen = 256;
	WCHAR wzBuffer[buflen];

	TCHAR szTitle[MAX_LOADSTRING]; // The title bar text
	LoadString(g_hInst, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);

	NetUIWzCopy( wzBuffer, buflen, szTitle );
	NetUIWzAppend( wzBuffer, buflen, L" - [" );

	BOOL fRet = PathCompactPathEx( wzBuffer+wcslen(wzBuffer), wzFilename, IntFromSize_t(buflen-wcslen(wzBuffer))-1, 0 );
	if (fRet)
	{
		NetUIRgwchCwcAppend( wzBuffer, buflen, L"]", buflen-IntFromSize_t(wcslen(wzBuffer)) );
	}
	else
	{
		WCHAR *wzSep = wcschr( wzBuffer, L'-' );
		if (wzSep != NULL)
			*wzSep = '\0';
	}

	HWND hwnd = g_pDocument->GetWindowHWND();
	HWND hwndParent;
	while ((hwndParent = GetParent(hwnd)) != NULL)
		hwnd = hwndParent;

	if (hwnd != NULL)
		SetWindowText( hwnd, wzBuffer );
}


///////////////////////////////////////////////////////////////////////
//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
//  COMMENTS:
//
//    This function and its usage is only necessary if you want this code
//    to be compatible with Win32 systems prior to the 'RegisterClassEx'
//    function that was added to Windows 95. It is important to call this function
//    so that the application will get 'well formed' small icons associated
//    with it.
//
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  768d41e5-5c3c-4cbc-b807-4e39a1fc88d7
-----------------------------------------------------------------------------*/
ATOM MyRegisterClass(HINSTANCE hInstance)
{
	WNDCLASSEX wcex = {};
	ATOM atom;

	// Register the main window class
	wcex.cbSize = sizeof(WNDCLASSEX);
	wcex.style         = CS_HREDRAW | CS_VREDRAW;
	wcex.lpfnWndProc   = (WNDPROC)WndProc;
	wcex.cbClsExtra    = 0;
	wcex.cbWndExtra    = 0;
	wcex.hInstance     = hInstance;
	wcex.hIcon         = LoadIcon(hInstance, (LPCTSTR)IDI_SHELL);
	wcex.hCursor       = LoadCursor(NULL, IDC_ARROW);
	wcex.hbrBackground = (HBRUSH)(COLOR_WINDOW+1);
	wcex.lpszMenuName  = (LPCWSTR)IDC_VIEWER;
	wcex.lpszClassName = szWindowClass;

	// Setting the small icon as well doesn't look as good.  Letting Windows grab the
	// small size out of the large icon, when appropriate, gives better results.
	//wcex.hIconSm       = LoadIcon(wcex.hInstance, (LPCTSTR)IDI_SHELLSM);

	atom = RegisterClassEx(&wcex);

	return atom;
}


///////////////////////////////////////////////////////////////////////
// MakeMRUName
//
// Takes the given MRU number and filename and produces a nice menu
// string.  The string may include an accelerator number (such as "&1"
// for the first menu item), and will be shortened as necessary (by
// putting in ... for some of the middle of the path name) to keep it
// from being too long.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  895166a1-24f7-4ec8-9ef0-85bfe5cad47d
-----------------------------------------------------------------------------*/
WCHAR* MakeMRUName(int mruNum, const WCHAR *wzFilename, _Out_z_cap_(cwchBuffer) WCHAR *wzBuffer, int cwchBuffer )
{

	WCHAR *wzToReturn = wzBuffer;

	AssertSzTag(cwchBuffer >= 10, "Need at least a little room for MRU names", ASSERTTAG('dyxf'));
	if (cwchBuffer >= 10)
	{
		if (mruNum < 10)
		{
			*wzBuffer++ = '&';
			*wzBuffer++ = (WCHAR)('0'+mruNum);
			*wzBuffer++ = ' ';
			cwchBuffer -= 3;
		}
		else
		{
			*wzBuffer++ = '&';
			*wzBuffer++ = (WCHAR)('a'+mruNum-10);
			*wzBuffer++ = ' ';
			cwchBuffer -= 3;
		}
	}

	const int MAX_MRU_PATH_LENGTH = 50;
	if (cwchBuffer > MAX_MRU_PATH_LENGTH)
		cwchBuffer = MAX_MRU_PATH_LENGTH;

#ifdef DEBUG
	BOOL fRet =
#endif
		PathCompactPathEx( wzBuffer, wzFilename, cwchBuffer, 0 );
	AssertSzTag( fRet, "PathCompactPathEx failed." , ASSERTTAG('dyxg'));

	return wzToReturn;
}


///////////////////////////////////////////////////////////////////////
// InitMRUorFavoritesMenu
//
// NOTE: MRU ID's must be sequential (IDM_MRUFILE1 = XX, IDM_MRUFILE2 = XX+1, etc.)
//
// Updates the MRU menu items to match the current MRU file state.
// The MRU files must be loaded or initialized before this method
// is called for it to display state properly.  Menu items will be
// removed or added as needed to display all of the MRU files.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  fb48c8d0-60f0-4f2e-9c3f-4566000786ac
-----------------------------------------------------------------------------*/
void InitMRUorFavoritesMenu(HMENU hmenuFile, DWORD dwIDFileFirst, WCHAR rgwzFilenames[][MAX_PATH], unsigned int numFilenames )
{
	const int insertPosUnknown = -1;
	int insertPos = insertPosUnknown;

	// Set all the MRU names.
	unsigned int mruNum = 0;
	while (mruNum < numFilenames && rgwzFilenames[mruNum][0] != '\0')
	{
		WCHAR buf[100];

		if (GetMenuString(hmenuFile, dwIDFileFirst+mruNum, buf, 2, MF_BYCOMMAND) > 0)
		{
			// Item already exists, just update the string
			MENUITEMINFO mii;
			mii.cbSize = sizeof( MENUITEMINFO );
			mii.fMask = MIIM_TYPE;
			mii.fType = MFT_STRING;
			mii.dwTypeData = MakeMRUName( mruNum+1, rgwzFilenames[mruNum], buf, sizeof(buf)/sizeof(WCHAR) );
			SetMenuItemInfo( hmenuFile, dwIDFileFirst+mruNum, FALSE, &mii );
		}
		else
		{
			// Need to create the item.
			if (insertPos == insertPosUnknown)
			{
				insertPos = 0; // Worst case, insert at the top.

				// Need to find where to insert.
				for (int i = GetMenuItemCount(hmenuFile)-1; i > 0; i--)
				{
					MENUITEMINFO gmii;
					ZeroMemory( &gmii, sizeof( MENUITEMINFO ) );
					gmii.cbSize = sizeof( MENUITEMINFO );
					gmii.fMask = MIIM_TYPE | MIIM_ID;
					GetMenuItemInfo( hmenuFile, i, TRUE, &gmii );
					if (gmii.wID >= dwIDFileFirst && gmii.wID <= dwIDFileFirst+numFilenames)
					{
						insertPos = i+1;
						break;
					}

					// If we're inserting the first item, then we need to create the
					// separator as well.  In this case, just stop at the first separator.
					if (mruNum == 0 && gmii.fType == MFT_SEPARATOR)
					{
						insertPos = i;

						// Add in the separator
						MENUITEMINFO mii;
						mii.cbSize = sizeof( MENUITEMINFO );
						mii.fMask = MIIM_TYPE;
						mii.fType = MFT_SEPARATOR;
						InsertMenuItem( hmenuFile, insertPos++, TRUE, &mii );
						break;
					}
				}
			} // end if insertPos unknown

			// Insert the menu item.
			MENUITEMINFO mii;
			mii.cbSize = sizeof( MENUITEMINFO );
			mii.fMask = MIIM_TYPE | MIIM_ID;
			mii.fType = MFT_STRING;
			mii.wID = dwIDFileFirst+mruNum;
			mii.dwTypeData = MakeMRUName( mruNum+1, rgwzFilenames[mruNum], buf, sizeof(buf)/sizeof(WCHAR) );
			InsertMenuItem( hmenuFile, insertPos++, TRUE, &mii );
		}

		mruNum++;
	}

	// Remove any menu items not in use.
	if (mruNum == 0)
	{
		// No menu items at all, so find and remove the separator.
		for (int i = 1; i < GetMenuItemCount(hmenuFile); i++)
		{
			if (GetMenuItemID(hmenuFile, i) == dwIDFileFirst)
			{
				RemoveMenu( hmenuFile, i-1, MF_BYPOSITION );
				break;
			}
		}
	}

	for (unsigned int i = mruNum; i < numFilenames; i++)
		RemoveMenu( hmenuFile, dwIDFileFirst+i, MF_BYCOMMAND );
}


///////////////////////////////////////////////////////////////////////
// InitMRUMenu
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  8a49466a-4c46-471d-9261-74b8742a4e0a
-----------------------------------------------------------------------------*/
void InitMRUMenu(HWND hwnd)
{
	HMENU hmenu = GetMenu( hwnd );
	HMENU hmenuFile = GetSubMenu( hmenu, 0 );

	InitMRUorFavoritesMenu( hmenuFile, IDM_MRUFILE1, g_wzMRUFiles, s_numMRUFiles );
}


///////////////////////////////////////////////////////////////////////
// InitFavorites
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  a5ec92c8-5387-4fcd-9bf6-27e280423bb2
-----------------------------------------------------------------------------*/
void InitFavorites(HWND hwnd)
{
	HMENU hmenu = GetMenu( hwnd );
	HMENU hmenuFavorites = GetSubMenu( hmenu, 2 );

	InitMRUorFavoritesMenu( hmenuFavorites, IDM_FAVORITEFILE1, g_wzFavorites, s_numFavorites );
}


///////////////////////////////////////////////////////////////////////
// FUpdateMenus
///////////////////////////////////////////////////////////////////////
/*------------------------------------------------------------------------------
	%%Owner: LeeHu
	%%Id: 4eaa387d-83ae-4161-a2ba-23ed480fa891
------------------------------------------------------------------------------*/
static bool FUpdateMenus(HWND hwnd)
{
	if (hwnd == NULL)
		return false;

	if (g_pDocument == NULL)
		return false;

	const HWNDElement *peRoot = nui_control_cast<HWNDElement>(g_pDocument->GetRootElement());
	if (peRoot == NULL)
		return false;

	HMENU hmenu = GetMenu(hwnd);
	if (hmenu == NULL)
		return false;

	bool fUseTaskPaneLayout = peRoot->GetUseTaskPaneLayout();
	return CheckMenuItem(hmenu, IDM_USETASKPANELAYOUT, MF_BYCOMMAND |
		(fUseTaskPaneLayout ? MF_CHECKED : MF_UNCHECKED)) != -1;
}


///////////////////////////////////////////////////////////////////////
// InitMenus
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  ddb4ced6-7263-4cb1-94a8-aa5f2acafb6c
-----------------------------------------------------------------------------*/
void InitMenus(HWND hwnd)
{
	InitMRUMenu( hwnd );
	InitFavorites( hwnd );
}


#if( OACR )
// This isn't shipping code, so we're not going to waste time converting this code
// from using an INI file to using the registry just because "the registry is the
// wave of the future".  (Not to mention that using INI files was explicitly chosen
// here due to the ability to share the file between machines or keep it through a
// system reformat.)
#undef GetPrivateProfileString
extern DWORD OACRGetPrivateProfileString(...);
#define GetPrivateProfileString OACRGetPrivateProfileString
#undef WritePrivateProfileString
extern DWORD OACRWritePrivateProfileString(...);
#define WritePrivateProfileString OACRWritePrivateProfileString
#endif

///////////////////////////////////////////////////////////////////////
// ReadINIFile
//
// Reads in MRU lists (if any) from the INI file.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  edacc0fd-9b22-49b2-8661-0e301d637c20
-----------------------------------------------------------------------------*/
void ReadINIFile()
{
	if (g_wzIniFilename[0] == '\0')
		return; // no INI file

	// Read in the MRUs.
	int mruNum = 0;
	while (mruNum < s_numMRUFiles)
	{
		const int keysize = 32;
		WCHAR wzMRUKey[keysize];
		NetUIWzCopy( wzMRUKey, keysize, L"File" );
		int curLen = IntFromSize_t(wcslen(wzMRUKey));
		// NRobarge: Ok - Constant format string, non-shipping code
		OACR_REVIEWED_CALL( NRobarge, _snwprintf_s( wzMRUKey+curLen, NUIARRAYSIZE(wzMRUKey)-curLen, _TRUNCATE, L"%d", mruNum ) );

		DWORD res = GetPrivateProfileString( L"MRUFiles", wzMRUKey, L"", g_wzMRUFiles[mruNum], MAX_PATH, g_wzIniFilename );

		// If res is 0, then it didn't find that key, so we're done.
		if (res == 0)
			break;

		mruNum++;
	}

	// Read in the Favorites.
	int favNum = 0;
	while (favNum < s_numFavorites)
	{
		const int keysize = 32;
		WCHAR wzFavKey[keysize];
		NetUIWzCopy( wzFavKey, keysize, L"File" );
		int curLen = IntFromSize_t(wcslen(wzFavKey));
		// NRobarge: Ok - Constant format string, non-shipping code
		OACR_REVIEWED_CALL( NRobarge, _snwprintf_s( wzFavKey+curLen, NUIARRAYSIZE(wzFavKey)-curLen, _TRUNCATE, L"%d", favNum ) );

		DWORD res = GetPrivateProfileString( L"Favorites", wzFavKey, L"", g_wzFavorites[favNum], MAX_PATH, g_wzIniFilename );

		// If res is 0, then it didn't find that key, so we're done.
		if (res == 0)
			break;

		favNum++;
	}
}


///////////////////////////////////////////////////////////////////////
// UpdateMRU
//
// When a file is opened, this method should be called to add that
// file to the MRU.  If the file is already in the MRU, it will be
// moved to the top of the list.  If an INI file has been specified,
// it will be updated with the new MRU list.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  c6dadb19-58ef-4a1d-880e-9f6336837467
-----------------------------------------------------------------------------*/
void UpdateMRU(HWND hwndMenu, const WCHAR *wzLatestFile)
{
	AssertSzTag( wzLatestFile != NULL && wzLatestFile[0] != '\0', "Invalid filename given to UpdateMRU" , ASSERTTAG('dyxh'));
	if (wzLatestFile == NULL)
		return;

	// First see if this file is already in the MRU list, in
	// which case it only needs to be promoted to the top.
	int mruNum = 0;
	while (mruNum < s_numMRUFiles && g_wzMRUFiles[mruNum][0] != '\0')
	{
		if (_wcsicmp(wzLatestFile, g_wzMRUFiles[mruNum]) == 0)
		{
			// It was in there!  If it was first, we don't need to do anything.
			if (mruNum == 0)
				return;

			// Just quit the loop so the copy can happen normally.  Items will
			// be copied down only as far as this item.
			break;
		}

		mruNum++;
	}

	if (mruNum >= s_numMRUFiles) // then it wasn't in there, and all items must be moved
		mruNum = s_numMRUFiles-1;

	// Go backwards sliding all of the items down.
	while (mruNum > 0)
	{
		wcsncpy( g_wzMRUFiles[mruNum], g_wzMRUFiles[mruNum-1], MAX_PATH );
		mruNum--;
	}

	// Copy the new file into the first slot
	wcsncpy( g_wzMRUFiles[0], wzLatestFile, MAX_PATH );

	// Update the ini file, if we have one.
	if (g_wzIniFilename[0] != '\0')
	{
		mruNum = 0;
		while (mruNum < s_numMRUFiles && g_wzMRUFiles[mruNum][0] != '\0')
		{
			const int keysize = 32;
			WCHAR wzMRUKey[keysize];
			NetUIWzCopy( wzMRUKey, keysize, L"File" );
			int curLen = IntFromSize_t(wcslen(wzMRUKey));
			// NRobarge: Ok - Constant format string, non-shipping code
			OACR_REVIEWED_CALL( NRobarge, _snwprintf_s( wzMRUKey+curLen, NUIARRAYSIZE(wzMRUKey)-curLen, _TRUNCATE, L"%d", mruNum ) );

			WritePrivateProfileString( L"MRUFiles", wzMRUKey, g_wzMRUFiles[mruNum], g_wzIniFilename );

			mruNum++;
		}
	}

	// Update the actual menu items.
	InitMRUMenu(hwndMenu);
}


///////////////////////////////////////////////////////////////////////
// AddFavorite
//
// Add the current file to the favorites list.  If it is already in
// the list, do nothing.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  6af66eeb-0558-4b06-bc3d-d25a3a361154
-----------------------------------------------------------------------------*/
void AddFavorite(HWND hwndMenu, const WCHAR *wzFile)
{
	AssertSzTag( wzFile != NULL && wzFile[0] != '\0', "Invalid filename given to AddFavorite" , ASSERTTAG('dyxi'));
	if (wzFile == NULL)
		return;

	// First see if this file is already in the MRU list, in
	// which case it only needs to be promoted to the top.
	int favNum = 0;
	while (favNum < s_numFavorites && g_wzFavorites[favNum][0] != '\0')
	{
		if (_wcsicmp(wzFile, g_wzFavorites[favNum]) == 0)
		{
			// It was in there!  Do nothing
			return;
		}

		favNum++;
	}

	if (favNum >= s_numFavorites)
	{
		MessageBox(hwndMenu, L"You must remove some of your favorites from your .ini file before you can add more.", L"Too many favorites", MB_ICONEXCLAMATION);
		return;
	}

	// Add the item.
	wcsncpy( g_wzFavorites[favNum], wzFile, MAX_PATH );

	// Update the ini file, if we have one.
	if (g_wzIniFilename[0] != '\0')
	{
		const int keysize = 32;
		WCHAR wzFavKey[keysize];
		NetUIWzCopy( wzFavKey, keysize, L"File" );
		int curLen = IntFromSize_t(wcslen(wzFavKey));
		// NRobarge: Ok - Constant format string, non-shipping code
		OACR_REVIEWED_CALL( NRobarge, _snwprintf_s( wzFavKey+curLen, NUIARRAYSIZE(wzFavKey)-curLen, _TRUNCATE, L"%d", favNum ) );

		WritePrivateProfileString( L"Favorites", wzFavKey, g_wzFavorites[favNum], g_wzIniFilename );
	}

	// Update the actual menu items.
	InitFavorites(hwndMenu);
}


//
//   FUNCTION: InitInstance(HANDLE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  1b814525-e35b-4d34-831c-ee4f6ebccb80
-----------------------------------------------------------------------------*/
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
	HWND hWnd;

	TCHAR szTitle[MAX_LOADSTRING]; // The title bar text

	// Initialize local and global strings.
	LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);
	LoadString(hInstance, IDC_VIEWER, szWindowClass, MAX_LOADSTRING);
	MyRegisterClass(hInstance);

	hWnd = CreateWindow( szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
	                     CW_USEDEFAULT, CW_USEDEFAULT, WINDOWSIZEW, WINDOWSIZEH, NULL, NULL, hInstance, NULL );

	if (!hWnd)
		return FALSE;

	// When we initialize MsoStat the color table initializes the theme
	// stuff before it has a chance to realize that we are themed
	// (we have no HWNDs so it detects that we are not themed).
	MsoThemeOnThemeChanged();

	SetIsRibbonApp(true);

	g_hwndViewer = hWnd;
	InitMenus( hWnd );

	ShowWindow(hWnd, nCmdShow);
	UpdateWindow(hWnd);

	return TRUE;
}


//
//  FUNCTION: ResizeAll( HWND )
//
//  PURPOSE:  Resizes the shell window and all child windows, including
//    Runtime window
//    Edit sidebar
//    Time sidebar
//
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  30fac713-d448-4eec-8443-574b918280e6
-----------------------------------------------------------------------------*/
void ResizeAll( HWND hwnd )
{
	// Get the properties of the main window
	RECT rect;
	GetClientRect( hwnd, &rect );
	int iWidth = rect.right-rect.left;
	int iHeight = rect.bottom-rect.top;

	// Get pointers to the open subwindows
	HWND hwndRuntime = GetDlgItem( hwnd, IDW_RUNTIME_WINDOW );
	HWND hwndTime = GetDlgItem( hwnd, IDW_TOOLBAR_WINDOW );

	// Compute the new locations and move the windows
	int iRuntimeTop = 0;
	if (hwndTime)
	{
		iRuntimeTop = TOOLBARSIZEH;
		MoveWindow( hwndTime, 0, 0, iWidth, TOOLBARSIZEH, true );
	}

	MoveWindow( hwndRuntime, 0, iRuntimeTop, iWidth, iHeight-iRuntimeTop, true );
}


///////////////////////////////////////////////////////////////////////
// UpdateDocFromBuffer
//
// Update the current document with the contents of the buffer element.
// If pElem is passed in, its string will be used for the buffer.  If
// pElem is not passed in, this method will search for it off the
// global g_pBufferToolWin element.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MikeBor
	%%Id:  0e9f05a7-84f4-43eb-9a7a-902ffefb19bd
-----------------------------------------------------------------------------*/
void UpdateDocFromBuffer(const Element *pElem = NULL)
{
	if (pElem == NULL)
	{
		// Need to find it.
		if (g_pBufferToolWin == NULL)
			return;

		pElem = g_pBufferToolWin->FindSelfOrDescendentByID( L"xmlbuffer" );
	}

	if (pElem != NULL)
	{
		Value *pv = NULL;
		const WCHAR *wzBuffer = pElem->GetTextString( &pv );

		if (wzBuffer != NULL && wzBuffer[0] != L'\0')
		{
			// Clean up the current document contents before opening a new doc.
			g_pDocument->ResetContents();

			EnsureErrorHandlerAndReset();
			SetWindowTitle( L"Buffer" );

			const WCHAR * strXml = wcschr(wzBuffer, L'<');

			if (strXml != NULL && ((wcsncmp(L"<FlexUI>", strXml, 8) == 0)
				|| (wcsncmp(L"<DataSource", strXml, NUIARRAYSIZE(L"<DataSource")-1) == 0)))
			{
				CntPtrTo<IMarkupContainer> pMC;
				if (SUCCEEDED(g_pDocument->CreateMarkupContainer(g_pDocument->GetRootElement(), NUIDocument::FCMC_KeepParsedStyles, &pMC)))
				{
					pMC->SetDllInstance(g_hInst);
					ViewerPackageEventHandler handler;
					LoadFlexPackageFromBuffer(wzBuffer, pMC, &handler);
					SetParserErrorStatus();
					g_fCurrentDocIsBuffer = true;
					g_fCurrentFileIsPackage = true;
				}
			}
			else
			{
				g_pDocument->OpenBuffer( wzBuffer, g_hInst );
				g_pDocument->SetDataContext(g_pCurrentDataSource);
				SetParserErrorStatus();
				g_fCurrentDocIsBuffer = true;
			}
		}

		if (pv != NULL)
			pv->Release();
	}
}


///////////////////////////////////////////////////////////////////////
// class ViewerToolWindowListener
//
// Handle clicks on the buttons.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  bc07e1ed-292a-4487-9bf1-f76ee20f6fcf
-----------------------------------------------------------------------------*/
class ViewerToolWindowListener : public ViewerBaseElementListener
{
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  452e42bf-f749-4d09-8832-1747816cce1b
-----------------------------------------------------------------------------*/
public:
	ViewerToolWindowListener(HWND hwndMain) : ViewerBaseElementListener(), m_hwndMain(hwndMain) {}

/*-----------------------------------------------------------------------------
	%%Owner:  HannesR
	%%Id:  0e3f274b-3936-4831-bb86-3c54765c0710
-----------------------------------------------------------------------------*/
	DWORD GetEventFilter() override { return ( ELF_Event | ELF_Destroy ); }
	void OnListenedEvent(Element* peFrom, Event* pEvent) override;
	void OnListenedDestroy(Node* peFrom) override;

private:
	HWND m_hwndMain;
};


///////////////////////////////////////////////////////////////////////
// ViewerToolWindowListener::OnListenedEvent
//
// Handle clicks on the buttons.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  9bec20be-b202-4be5-9472-ebcaef938bc0
-----------------------------------------------------------------------------*/
void ViewerToolWindowListener::OnListenedEvent(Element* peFrom, Event* pEvent)
{
	if (pEvent->nStage == GMF_BUBBLED && pEvent->uidType == SimpleButton::UIDClick() && pEvent->peTarget != NULL)
	{
		if (pEvent->peTarget->IsSubclassOf(Button::GetStaticClassInfo()))
		{
			const Button *pButton = static_cast<const Button*>( pEvent->peTarget );

			bool fHideWindow = false;

			if (pButton->GetIsDefaultButton())
			{
				fHideWindow = true;

				UpdateDocFromBuffer( peFrom->FindSelfOrDescendentByID( L"xmlbuffer" ) );
			}
			else if (pButton->GetIsCancelButton())
			{
				// TODO: We don't currently undo, we just don't set the new string.
				fHideWindow = true;
			}
			else
			{
				// Some other button.  Get its ID to find out what it is.
				ATOM atom = pButton->GetID();
				if (atom != NULL && atom == FindAtomW(L"parseNow"))
					UpdateDocFromBuffer( peFrom->FindSelfOrDescendentByID( L"xmlbuffer" ) );
			}

			if (fHideWindow)
			{
				if (peFrom->IsSubclassOf(HWNDElement::GetStaticClassInfo()))
				{
					HWND hwndTool = GetParent( static_cast<HWNDElement*>(peFrom)->GetHWND() );
					ShowWindow( hwndTool, SW_HIDE );
				}
			}
		}
	}
}


///////////////////////////////////////////////////////////////////////
// ViewerToolWindowListener::OnListenedDestroy
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  2dbcfbae-453c-4f68-ab8a-8e6b0732b63e
-----------------------------------------------------------------------------*/
void ViewerToolWindowListener::OnListenedDestroy(Node* peFrom)
{
	if (peFrom == g_pBufferToolWin)
		g_pBufferToolWin = NULL;
}


///////////////////////////////////////////////////////////////////////
// ExecuteAnimateWindow
//
// Show or hide the given hwnd using a specified (or random) animation type.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  265c6a03-d815-4861-aff1-39956796d2ec
-----------------------------------------------------------------------------*/
void ExecuteAnimateWindow(HWND hwnd, bool fHide, int animType)
{
	static const struct AnimateWindowOptions
	{
		DWORD flags;
		DWORD dwTime;
	} s_awOptions[] =
		{
		{ AW_BLEND,                    500 }, // Uses a fade effect.
		{ AW_CENTER,                   250 }, // Makes the window appear to collapse inward if AW_HIDE is used or expand outward if the AW_HIDE is not used.
		{ AW_HOR_POSITIVE,             500 }, // Animates the window from left to right. This flag can be used with roll or slide animation. It is ignored when used with AW_CENTER or AW_BLEND.
		{ AW_HOR_NEGATIVE,             500 }, // Animates the window from right to left. This flag can be used with roll or slide animation. It is ignored when used with AW_CENTER or AW_BLEND.
		{ AW_VER_POSITIVE,             500 }, // Animates the window from top to bottom. This flag can be used with roll or slide animation. It is ignored when used with AW_CENTER or AW_BLEND.
		{ AW_VER_NEGATIVE,             500 }, // Animates the window from bottom to top. This flag can be used with roll or slide animation. It is ignored when used with AW_CENTER or AW_BLEND.
		{ AW_SLIDE | AW_CENTER,        250 }, // slide...
		{ AW_SLIDE | AW_HOR_POSITIVE,  500 }, // slide...
		{ AW_SLIDE | AW_HOR_NEGATIVE,  500 }, // slide...
		{ AW_SLIDE | AW_VER_POSITIVE,  500 }, // slide...
		{ AW_SLIDE | AW_VER_NEGATIVE,  500 }, // slide...
		};

	if (animType < 0)
	{
		srand( GetTickCount() );
		animType = rand() % NUIARRAYSIZE(s_awOptions);
	}

	AnimateWindow( hwnd, s_awOptions[animType].dwTime, s_awOptions[animType].flags | (fHide ? AW_HIDE : AW_ACTIVATE) );
	ShowWindow( hwnd, fHide ? SW_HIDE : SW_SHOW );

	// If showing, force an invalidate of the richedit control in the buffer window
	// to ensure it paints correctly, since it apparently doesn't support WM_PRINTCLIENT.
	if (!fHide && g_pBufferToolWin != NULL)
	{
		// Else, set focus to the buffer window, and also force an invalidate so
		// it repaints the richedit control.
		HWNDHost *pElem = nui_control_cast<HWNDHost>(g_pBufferToolWin->FindSelfOrDescendentByID( L"xmlbuffer" ));
		if (pElem != NULL)
			InvalidateRect( pElem->GetHWND(HWNDHost::DoNotTriggerDelayLoad), NULL, FALSE );
	}
}


///////////////////////////////////////////////////////////////////////
// ThreadStart_DoAnimateWindow
//
// The starter method on a background thread that is to do any window
// animation.  A background thread must be used for AnimateWindow calls
// if any window on the main thread may need to repaint during the
// animation.
//
// Param: pv - the HWND of the window to toggle visibility on.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  5edea893-47c0-40b1-b63c-2579fc6b2c5e
-----------------------------------------------------------------------------*/
DWORD CALLBACK ThreadStart_DoAnimateWindow(void* pv)
{
	HWND hwndTool = (HWND)pv;

	DWORD style = static_cast<DWORD>(GetWindowLongPtrW( hwndTool, GWL_STYLE ));
	bool fVisible = ((style & WS_VISIBLE) != 0);
	bool fHiding = fVisible; // we're hiding the window if it is currently visible

	ExecuteAnimateWindow( hwndTool, fHiding, -1 );

	return 0;
}


///////////////////////////////////////////////////////////////////////
// HandleBuffer
//
// Show or hide the buffer window.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  a2901b78-7951-44c1-9ccb-d8db0c03abba
-----------------------------------------------------------------------------*/
void HandleBuffer(HWND hwnd)
{
	AutoDeferBlock adf;

	if (g_pBufferToolWin == NULL)
	{
		ToolWindow::Create( WS_EX_TOOLWINDOW, L"NetUI XML Buffer",
			WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, WINDOWSIZEW*2/3,
			WINDOWSIZEH*2/3, hwnd,
			NHHO_IgnoreClose | TWNHHO_DontDestroyWhenInactive | TWNHHO_NotTopmost, NULL,
			(Element **) &g_pBufferToolWin );
		g_pBufferToolWin->SetOptions( 0, 0 );                     // Have to do this because m_uOptions is not initialized otherwise
		g_pBufferToolWin->SetBackgroundColor( RGB(255,255,255) ); // Have to do this to get an edit control to appear (that weird issue)

		IMarkupContainer *pMC = NULL;
		CreateMarkupContainer( g_pBufferToolWin, &pMC );
		pMC->ParseResourceA( g_hInst, IDUI_BUFFER, NULL );
		pMC->Release();

		g_pBufferToolWin->AddListener( new ViewerToolWindowListener(hwnd) );

		g_pBufferToolWin->Show();

		// Setting focus must be done after the window is visible, since it can't really have focus before then.
		Element *pElem = g_pBufferToolWin->FindSelfOrDescendentByID( L"xmlbuffer" );
		if (pElem != NULL)
			pElem->SetKeyFocus();
	}
	else
	{
		// Toggle its visibility
		HWND hwndTool = GetParent( g_pBufferToolWin->GetHWND() );
		DWORD style = static_cast<DWORD>(GetWindowLongPtrW( hwndTool, GWL_STYLE ));
		bool fVisible = ((style & WS_VISIBLE) != 0);
		bool fHiding = fVisible; // we're hiding the window if it is currently visible

		//ExecuteAnimateWindow( hwndTool, fHiding, -1 );

		DWORD tid;
		HANDLE htAssert = CreateThread(NULL, 0, ThreadStart_DoAnimateWindow, hwndTool, 0, &tid);
		if (htAssert == NULL) // thread creation failed!  Just set visibility then.
			ShowWindow( hwndTool, fHiding ? SW_HIDE : SW_SHOW );

		// If hiding, set focus back to the main window, otherwise set it to the buffer window.
		if (fHiding)
			SetFocus( g_pDocument->GetWindowHWND() );
		else
			SetFocus( hwndTool );
	}
}


///////////////////////////////////////////////////////////////////////
// class ViewerErrorWindowListener
//
// Closes the window when the user clicks OK
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  7019b7a3-9858-4fa3-b5d4-743b355ae195
-----------------------------------------------------------------------------*/
class ViewerErrorWindowListener : public ViewerBaseElementListener
{
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  22db3b25-12ab-4d5d-b184-61748304375b
-----------------------------------------------------------------------------*/
public:
	ViewerErrorWindowListener() : ViewerBaseElementListener() {}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  4026141b-afc0-4848-b074-8d4387a147a6
-----------------------------------------------------------------------------*/
	void OnListenedEvent(Element* peFrom, Event* pEvent) override
	{
		if (pEvent->nStage == GMF_BUBBLED && pEvent->uidType == SimpleButton::UIDClick() && pEvent->peTarget != NULL)
		{
			AssertTag( peFrom->IsSubclassOf( ToolWindow::GetStaticClassInfo() ) , ASSERTTAG('dyxj'));
			if (peFrom->IsSubclassOf(ToolWindow::GetStaticClassInfo()))
				static_cast<ToolWindow*>(peFrom)->DestroyWindow();
		}
	}
};


///////////////////////////////////////////////////////////////////////
// ShowErrorWindow
//
// Show error list window.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  3660907c-24b9-44ab-aaa7-2569c0d30bb3
-----------------------------------------------------------------------------*/
void ShowErrorWindow(HWND hwnd)
{
	AssertSzTag( g_pParseErrorHandler != NULL, "No ParseErrorHandler." , ASSERTTAG('dyxk'));
	if (g_pParseErrorHandler == NULL)
		return;

	AutoDeferBlock adf;

	//if( g_pBufferToolWin == NULL )
	{
		ToolWindow *pErrorWin = NULL;
		ToolWindow::Create( WS_EX_TOOLWINDOW, L"NetUI Error List",
			WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, WINDOWSIZEW*2/3,
			WINDOWSIZEH*2/3, hwnd,
			NHHO_NoSendQuitMessage|NHHO_DeleteOnHWNDDestroy, NULL,
			(Element **) &pErrorWin );

		IMarkupContainer *pMC = NULL;
		CreateMarkupContainer( pErrorWin, &pMC );
		pMC->ParseResourceA( g_hInst, IDUI_ERRORWIN, NULL );
		pMC->Release();

		pErrorWin->AddListener( new ViewerErrorWindowListener() );

		Element *pElem = pErrorWin->FindSelfOrDescendentByID( L"template" );
		AssertSzTag( pElem != NULL, "Template element doesn't exist.  Don't know where to insert strings." , ASSERTTAG('dyxl'));
		if (pElem != NULL)
		{
			Element *pParent = pElem->GetParent();
			if (pParent != NULL)
			{
				int idx = 0;
				const ParserErrorInfo *pPEI = NULL;
				while ((pPEI = g_pParseErrorHandler->EnumErrors(idx)) != NULL)
				{
					idx++;

					// Build up the error string.
					WCHAR wzTemp[1024 + 64];
					const WCHAR *wzErrorLevel = L"Error";
					WCHAR wzLine[32];

					switch (pPEI->GetErrorLevel())
					{
					default:
						// treat default as a error
						AssertSzTag( false, "Unknown NUIParserErrorLevel." , ASSERTTAG('dyxm'));
						__fallthrough;
					case PEL_Error:      wzErrorLevel = L"Error";       break;
					case PEL_MsoWarning: wzErrorLevel = L"MSO Warning"; break;
					case PEL_RuntimeWarning:
					case PEL_Warning:    wzErrorLevel = L"Warning";     break;
					}

					wzLine[0] = '\0'; // default to empty string.
					if (pPEI->GetLineNum() != -1)
					{
						// NRobarge: Ok - Constant format string, non-shipping code
						OACR_REVIEWED_CALL( NRobarge, _snwprintf_s( wzLine, _TRUNCATE, L"(Line: %d)", pPEI->GetLineNum() ) );
						wzTemp[NUIARRAYSIZE(wzLine) - 1] = '\0';
					}

					// NRobarge: Ok - Constant format string, non-shipping code
					OACR_REVIEWED_CALL( NRobarge, _snwprintf_s(wzTemp, _TRUNCATE, L"%s %s: %s", wzErrorLevel, wzLine, pPEI->GetErrorString()) );

					// Clone the template node, set the error string into the clone, and add it to the tree.
					Element *pErrElem = nui_control_cast<Element>(pElem->CloneTree());
					if (pErrElem != NULL)
					{
						pErrElem->SetTextString( wzTemp );
						pParent->Add( pErrElem );
					}
				}

				// Delete the template element if we inserted error elements.
				if (idx > 0)
				{
					pElem->Destroy();
					pElem = NULL;
				}
			}
		}

		pElem = pErrorWin->FindSelfOrDescendentByID( L"OK" );
		if (pElem != NULL)
			pElem->SetKeyFocus();

		pErrorWin->Show();
	}
	/*
	else
	{
		// Toggle its visibility
		HWND hwndTool = GetParent( g_pBufferToolWin->GetHWND() );
		LONG style = GetWindowLongPtrW( hwndTool, GWL_STYLE );
		bool fVisible = ((style & WS_VISIBLE) != 0);
		ShowWindow( hwndTool, fVisible ? SW_HIDE : SW_SHOW );
	}*/
}


///////////////////////////////////////////////////////////////////////
// FOpenDocumentFile
//
// Open a document file, as either a direct NetUI/FlexUI file
// (.nui/.ui/.flexml) or as a Flex Package (.flex).
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  13b30531-1485-4d0e-a358-5d3fcbf7630f
-----------------------------------------------------------------------------*/
bool FOpenDocumentFile(NUIDocument *pDocument, const WCHAR *wzFile, HINSTANCE hInst)
{
	if (pDocument == NULL)
		return false;

	bool fRet = false;

	const WCHAR *wzDot = wcsrchr(wzFile, L'.');
	if (wzDot != NULL && _wcsicmp(wzDot, L".flex") == 0)
	{
		// First change into the .flex directory, since it may use relative filenames for
		// images and such, and NetUI can't automatically find them since it is asked to
		// parse as a buffer which does not have a path to work relative from.
		WCHAR wzPath[MAX_PATH];
		NetUIWzCopy(RgC(wzPath), wzFile);
		WCHAR *wzLastSlash = wcsrchr(wzPath, L'\\');
		if (wzLastSlash != NULL)
		{
			// The +1 will leave the slash, so paths like "C:\" will work to switch to the root directory.
			*(wzLastSlash+1) = L'\0';
			SetCurrentDirectoryW(wzPath);
		}


		// Open the file.
		EnsureErrorHandlerAndReset();

		CntPtrTo<IMarkupContainer> pMC;
		if (FAILED(g_pDocument->CreateMarkupContainer(g_pDocument->GetRootElement(), NUIDocument::FCMC_KeepParsedStyles, &pMC)))
			return false;

		pMC->SetDllInstance(g_hInst);

		ViewerPackageEventHandler handler;
		fRet = LoadFlexPackageFromFile(wzFile, pMC, &handler);
		SetParserErrorStatus();

		wcsncpy(g_wzPackageFilename, wzFile, NUIARRAYSIZE(g_wzPackageFilename));

		g_fCurrentFileIsPackage = true;
	}
	else
	{
		fRet = pDocument->OpenNetUIFile(NULL, wzFile, hInst);
		g_fCurrentFileIsPackage = false;
		pDocument->SetDataContext(g_pCurrentDataSource);
	}

	SetParserErrorStatus();

	// Loaded a file, so we're not using the buffer now.
	g_fCurrentDocIsBuffer = false;

	if (fRet)
	{
		// Set default key focus in the document, the same way nuidlg.cpp does.
		// Pass false for fSetWindowFocus so it doesn't take window focus from the
		// buffer window.
		Element *peRoot = pDocument->GetRootElement();
		Element *pElem = peRoot->GetAdjacent(peRoot, NAV_FIRST, GA_TabStop | GA_Keyable);
		if (pElem != NULL)
			pElem->SetKeyFocus(ESCR_OTHER, false/*fSetWindowFocus*/);
	}

	return fRet;
}


///////////////////////////////////////////////////////////////////////
// RefreshFile
//
// Reload the current file or buffer.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MikeBor
	%%Id:  7fdabe10-cdee-4319-8ebe-ac064035d6d9
-----------------------------------------------------------------------------*/
void RefreshFile()
{
	// If the current doc is the buffer, or if the document does not currently have a filename (indicating
	// either no file is open or it last came from the buffer), then try to update the doc from the buffer.
	// Otherwise, the document does have a filename, so refresh that file.
	EnsureErrorHandlerAndReset();
	if (g_fCurrentFileIsPackage && !g_fCurrentDocIsBuffer)
	{
		g_pDocument->ResetContents();

		CntPtrTo<IMarkupContainer> pMC;
		if (SUCCEEDED(g_pDocument->CreateMarkupContainer(g_pDocument->GetRootElement(), NUIDocument::FCMC_KeepParsedStyles, &pMC)))
		{
			pMC->SetDllInstance(g_hInst);
			ViewerPackageEventHandler handler;
			LoadFlexPackageFromFile(g_wzPackageFilename, pMC, &handler);
		}
	}
	else if (g_fCurrentDocIsBuffer || g_pDocument->GetCurrentFileName() == NULL)
		UpdateDocFromBuffer();
	else
	{
		g_pDocument->RefreshFile();
		g_pDocument->SetDataContext(g_pCurrentDataSource);
	}

	SetParserErrorStatus();

	// Set default key focus in the document, the same way nuidlg.cpp does.
	// Pass false for fSetWindowFocus so it doesn't take window focus from the
	// buffer window.
	Element *peRoot = g_pDocument->GetRootElement();
	Element *pElem = peRoot->GetAdjacent(peRoot, NAV_FIRST, GA_TabStop | GA_Keyable);
	if (pElem != NULL)
		pElem->SetKeyFocus(ESCR_OTHER, false/*fSetWindowFocus*/);
}

void RefreshNetUI()
{
	if (g_pDocument)
	{
		Element *peRoot = g_pDocument->GetRootElement();
		if (peRoot && m_spAdaptiveColumnSet == nullptr)
		{
			AdaptiveLabel::Register();
			m_spAdaptiveColumnSet = std::make_shared<AdaptiveColumnSet>(peRoot);
			m_spAdaptiveColumnSet->AddColumnSet();
			m_spAdaptiveColumnSet->LayoutColumnSet();
		}
	}
}

void RefreshAdaptiveCard()
{
	if (g_pDocument)
	{
		Element *peRoot = g_pDocument->GetRootElement();

		if (peRoot)
		{
			Element *card = nullptr;
			AdaptiveNetUIViewer netUIHelper;
			netUIHelper.BuildAdaptiveCardFromTextFile(&card);
			peRoot->AddElement(card);
		}
	}
}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  cb56f620-dbb6-426b-81d9-bfa65dca37df
-----------------------------------------------------------------------------*/
class NetUIDDDropSource : public IDropSource
{
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  d0f8a687-b3a6-4e0b-a996-52093fc539cd
-----------------------------------------------------------------------------*/
public:
	static HRESULT CreateNetUIDDDropSource(HWND hwndRoot, NetUIDDDropSource **ppNUIDDDropSource)
	{
		*ppNUIDDDropSource = NULL;

		NetUIDDDropSource *pNUIDDDropSource = HNew( NetUIDDDropSource );
		if (pNUIDDDropSource == NULL)
			return E_OUTOFMEMORY;

		if (FAILED(pNUIDDDropSource->Initialize(hwndRoot)))
		{
			HDelete( NetUIDDDropSource, pNUIDDDropSource );
			return E_FAIL;
		}

		*ppNUIDDDropSource = pNUIDDDropSource;

		return S_OK;
	}


	////////////////////////////////////////////////////////
	//  IDropSource
	////////////////////////////////////////////////////////

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  9113ef95-21e4-47e3-adaf-acb5297898a8
-----------------------------------------------------------------------------*/
	HRESULT STDMETHODCALLTYPE QueryContinueDrag(BOOL fEscapePressed, DWORD grfKeyState) override
	{
		// Check to see if the drag returned to the NetUI window.  If it did, cancel
		// the external drag and return to a simple internal drag.
		POINT pt;
		::GetCursorPos(&pt);
		HWND hwnd = WindowFromPoint( pt );
		if (hwnd == m_hwndRoot)
		{
			m_fDragReturned = true;
			return DRAGDROP_S_CANCEL;
		}

		// Are the following checks enough?
		if (fEscapePressed)
			return DRAGDROP_S_CANCEL;
		if ((grfKeyState & (MK_LBUTTON | MK_RBUTTON)) == 0)
			return DRAGDROP_S_DROP;
		return S_OK;
	}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  566ddecf-f887-4012-a944-60cf8b2ac5b2
-----------------------------------------------------------------------------*/
	HRESULT STDMETHODCALLTYPE GiveFeedback(DWORD dwEffect) override
	{
		UNREFERENCED(dwEffect);
		return DRAGDROP_S_USEDEFAULTCURSORS;
	}

	////////////////////////////////////////////////////////
	//  IUnknown
	////////////////////////////////////////////////////////

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  e5b9d442-e612-4d3f-be47-a88537f3a0fc
-----------------------------------------------------------------------------*/
	HRESULT STDMETHODCALLTYPE QueryInterface(REFIID iid, void** pvObj) override
	{
		if (pvObj == NULL)
			return E_INVALIDARG;

		if (iid == IID_IDropSource)
		{
			*pvObj = (IDropSource*)this;
			AddRef();
			return S_OK;
		}
		if (iid == IID_IUnknown)
		{
			*pvObj = (IUnknown*)this;
			AddRef();
			return S_OK;
		}

		return E_NOTIMPL;
	}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  e3b6c9f7-c27a-4aaf-8c7e-36ffb4e848d4
-----------------------------------------------------------------------------*/
	ULONG STDMETHODCALLTYPE AddRef() override
	{
		return (ULONG) InterlockedIncrement(&m_refCount);
	}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  63bb2986-4a28-4e41-af48-364b1ff37048
-----------------------------------------------------------------------------*/
	ULONG STDMETHODCALLTYPE Release() override
	{
		ULONG remaining = (ULONG)InterlockedDecrement(&m_refCount);

		if (remaining == 0)
			HDelete(NetUIDDDropSource, this);

		return remaining;
	}

	////////////////////////////////////////////////////////
	//  Other
	////////////////////////////////////////////////////////

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  9dd2deda-8d9b-4717-9e97-053824df9ef4
-----------------------------------------------------------------------------*/
	bool FDragReturned() const { return m_fDragReturned; }

	// Constructor.  Do NOT call directly -- call NetUIDDDropSource::CreateNetUIDDDropSource()
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  bdff6e77-86a9-48c7-9e58-b2c27a44c509
-----------------------------------------------------------------------------*/
	NetUIDDDropSource() : m_refCount(1) {}

	// Destructor.  Do NOT delete this class -- Release() it.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  57aec9f1-a0c5-4416-8a2c-8ed8b101ee18
-----------------------------------------------------------------------------*/
	virtual ~NetUIDDDropSource() {}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  3f423551-cab4-4ea8-af14-eda9f4922784
-----------------------------------------------------------------------------*/
protected:
	virtual HRESULT Initialize(HWND hwndRoot) { m_hwndRoot = hwndRoot; m_fDragReturned = false; return S_OK; }

private:
	LONG   m_refCount;
	HWND   m_hwndRoot;
	bool   m_fDragReturned; // true if the drag returned inside the m_hwndRoot window
};
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////
// class ReorderDragDropHandler
//
// Handles reordering in the dragoutlook.nui sample.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  7ae6fb0a-0046-491f-b1dc-16122d1d5051
-----------------------------------------------------------------------------*/
class ReorderDragDropHandler : public IDragDropHandler, public IExternalDragDropHandler
{
public:
	///////////////////////////////////////////////////////////////////////
	// IDragDropHandler
	///////////////////////////////////////////////////////////////////////

	// Return false if this drag should not even start
	bool DragStart(Element *peDrag, DWORD &dwStartFlags) override;

	// Called instead of DragDrop if the drag is cancelled (such as by pressing the Escape key).
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  e91e8a60-2d89-495f-881f-5f55a92e2b79
-----------------------------------------------------------------------------*/
	void DragCancelled(Element *peDrag) override { UNREFERENCED(peDrag); }

	// Return false if this target is not a valid drop for this drag element
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  a824eaa0-09eb-481c-a6a0-dda6b6526147
-----------------------------------------------------------------------------*/
	bool DragEnter(Element *peDrag, Element *pePossibleTarget) override { UNREFERENCED(peDrag&&pePossibleTarget); OutputDebugString( L"DragEnter called.\n" ); return true; }

	// Just informative, in case state needs to be reset
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  296c432e-637c-4354-9fd5-786f46d54776
-----------------------------------------------------------------------------*/
	void DragExit(Element *peDrag, Element *pePossibleTarget) override { UNREFERENCED(peDrag&&pePossibleTarget); OutputDebugString( L"DragExit called.\n" ); }

	// Allows seeing every single move, for extra handling. X and Y are
	// relative to peRelative.  Use Element::MapElementPoint() to convert
	// it to be relative to some other element.
	void DragMove(Element *peDrag, Element *peRelative, int x, int y, DWORD keyStateFlags, NUIDropEffect &dropEffect) override;

	// Handle the actual drop. X and Y are relative to peDropTarget.  Return true
	// if a drop was successful.  If false is returned, then dropEffect will be
	// ignored and any visuals will acts as if dropEffect=NDE_NoDrop.  NOTE:
	// peDropTarget CAN be NULL if the drop occured when there was no valid
	// dropTarget from the last DragEnter.
	bool DragDrop(Element *peDrag, Element *peDropTarget, int x, int y, DWORD keyStateFlags, NUIDropEffect &dropEffect) override;

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  99184c4b-cf1f-4864-834a-2ed233215879
-----------------------------------------------------------------------------*/
	static const WCHAR* GetTargetText(const Element *peDrag, Value **ppValue)
	{
		SPValue spValue;
		const WCHAR *wzText = NULL;

		wzText = peDrag->GetTextString(&spValue);
		if (wzText == NULL || wzText[0] == '\0')
		{
			// Find the first descendent of this element with a string Text
			TreeIterator iter( peDrag );
			const Element *peNext = iter.FirstElement();
			do
			{
				wzText = peNext->GetTextString(&spValue);
				peNext = iter.NextSubTreeElement(peNext);
			} while ((wzText == NULL || wzText[0] == '\0') && peNext != NULL);
		}

		*ppValue = spValue.Extract();
		return wzText;
	}

	// This method is called when a drag has moved outside of the NetUI window.  At this point,
	// the DragDropHandler can decide if it wants to begin an external drag using standard
	// OLE drag-n-drop (via ::DoDragDrop(), IDataObject's, and IDropSource's).  The handler
	// should return true if the drag was handled externally such that the internal drag
	// should cease, or if the internal drag should continue.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  de1e8250-889d-435b-b3ba-3bdf4ed28a53
-----------------------------------------------------------------------------*/
	bool StartExternalDrag(Element *peDrag) override
	{
		if (OpenClipboard(NULL))
		{
			EmptyClipboard();

			SPValue spValue;
			const WCHAR *wzText = GetTargetText(peDrag, &spValue);

OACR_WARNING_SUPPRESS(W2A_BEST_FIT, "Round-tripping to Unicode isn't a concern in non-shipping code")
			int alen = WideCharToMultiByte( CP_ACP, 0, wzText, -1, NULL, 0, NULL, NULL );

			HGLOBAL h = GlobalAlloc( GMEM_MOVEABLE, alen );
			char *szText = (char*)GlobalLock( h );
			if (szText != NULL)
			{
				WideCharToMultiByte( CP_ACP, 0, wzText, -1, szText, alen, NULL, NULL );
				szText[alen-1] = '\0';

				GlobalUnlock( h );

OACR_WARNING_SUPPRESS(CLIPBOARD_ANSI, "ANSI API okay for DEBUG")
				SetClipboardData( CF_TEXT, h );
				GlobalFree( h );
			}
			CloseClipboard();
		}

		CntPtrTo<IDataObject> pDataObject;
		OleGetClipboard( &pDataObject );

		if (pDataObject == NULL)
			return false;

		CntPtrTo<NetUIDDDropSource> pDropSource;
		NetUIDDDropSource::CreateNetUIDDDropSource( peDrag->GetHostingHWND(), &pDropSource );

		OleInitialize(NULL);

		DWORD dwEffect;
		HRESULT hr = ::DoDragDrop( pDataObject, pDropSource, DROPEFFECT_COPY, &dwEffect );
		UNREFERENCED_SHIP(hr);
		NUITrace( "::DoDragDrop returned: %x\n", hr );

		OleUninitialize();

		// If the drop was cancelled, then only say we handled the drag if the drag didn't
		// return to the NetUI window.  If it did return to the NetUI window, return false
		// so we'll continue the simple internal drag.
		// TODO: This doesn't currently work, apparently because some CLIPBRDWIN takes
		//       focus when ::DoDragDrop() is called.  Perhaps not using the OleGetClipboard()
		//       implementation would allow us to not lose focus.
		if (hr == DRAGDROP_S_CANCEL)
			return !pDropSource->FDragReturned();

		return true;
	}

	// This method is called by NetUI's IDropTarget implementation when the user is dragging
	// from an external window into NetUI.  The IExternalDragDropHandler interface is used
	// to handle that kind of drop request.  If DragGetCallbackFlags() does not include the
	// NDC_ExternalDrag flag in its return value, then external to internal drops will not
	// be allowed, and this method will never be called.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  70e1fdfd-33cf-4268-a70d-c76071c07b4a
-----------------------------------------------------------------------------*/
	IExternalDragDropHandler* GetExternalToInternalDragInterface() override
	{
		return this;
	}

	// Allows handler to indicate which methods it wants to be called for.  See the NDC_* flags.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  7dbebf7b-44ff-4f9c-bf75-821a8224c0dd
-----------------------------------------------------------------------------*/
	DWORD DragGetCallbackFlags() override { return NDC_Defaults; }


	///////////////////////////////////////////////////////////////////////
	// IExternalDragDropHandler
	///////////////////////////////////////////////////////////////////////

	// A notification for when the IDropTarget::DragEnter() gets called when a drag
	// first enters the NetUI window.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  72381f24-609f-455e-888d-51343c465a29
-----------------------------------------------------------------------------*/
	HRESULT ExternalDragStart(IDataObject *pdoSrc, DWORD grfKeyState, POINTL ptDesktopPxl, DWORD &dwEffect, ExternalDragImageInfo &imgInfo) override
	{
		UNREFERENCED(pdoSrc&&grfKeyState&&dwEffect);
		UNREFERENCED(ptDesktopPxl);
		UNREFERENCED(imgInfo);
		OutputDebugString( L"ExternalDragStart called.\n" );
		return S_OK;
	}

	// A notification for when the IDropTarget::DragLeave() gets called when a drag
	// exits the NetUI window.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  c9a7b4e6-3163-4fd7-aa8f-096c29f754f5
-----------------------------------------------------------------------------*/
	HRESULT ExternalDragLeave() override
	{
		OutputDebugString( L"ExternalDragLeave called.\n" );
		return S_OK;
	}

	// This gets called when the drag first enters a new possible drop target.  Return false
	// if this target is not a valid drop for this data.  When true is returned, a call to
	// ExternalDragOver will immediately follow.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  d835adc0-181d-4201-ada5-e5d4a04d5a5e
-----------------------------------------------------------------------------*/
	bool    ExternalDragEnter(IDataObject *pdoSrc, Element *pePossibleTarget) override
	{
		UNREFERENCED(pdoSrc&&pePossibleTarget);
		OutputDebugString( L"ExternalDragEnter called.\n" );
		return true;
	}

	// Just informative, in case state needs to be reset.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  2d9af0c7-60a4-4611-a6f5-bf14ca399687
-----------------------------------------------------------------------------*/
	void    ExternalDragExit(IDataObject *pdoSrc, Element *pePossibleTarget) override
	{
		UNREFERENCED(pdoSrc&&pePossibleTarget);
		OutputDebugString( L"ExternalDragExit called.\n" );
	}

	// Allows seeing every single move, for extra handling. X and Y are
	// relative to peRelative.  Use Element::MapElementPoint() to convert
	// it to be relative to some other element.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  56d955be-6559-465a-a85a-f93ed81d98da
-----------------------------------------------------------------------------*/
	HRESULT ExternalDragOver(IDataObject *pdoSrc, Element *pePossibleTarget, int x, int y, DWORD grfKeyState, DWORD &dwEffect) override
	{
		UNREFERENCED(pdoSrc&&pePossibleTarget&&x&&y&&grfKeyState&&dwEffect);
		OutputDebugString( L"ExternalDragOver called.\n" );
		dwEffect = DROPEFFECT_COPY;
		return S_OK;
	}

	// Handle the actual drop. X and Y are relative to peDropTarget.  NOTE:
	// peDropTarget CAN be NULL if the drop occured when there was no valid
	// dropTarget from the last DragEnter.
	HRESULT ExternalDragDrop(IDataObject *pdoSrc, Element *peDropTarget, int x, int y, DWORD grfKeyState, DWORD &dwEffect) override;

	// Allows handler to indicate which methods it wants to be called for.  See the NEDC_* flags.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  380907fc-d2b2-4036-b638-0313991ef02e
-----------------------------------------------------------------------------*/
	DWORD ExternalDragGetCallbackFlags() override { return NEDC_Defaults; }
};


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  afde782a-37a3-4e84-ad59-ad6e3c757c55
-----------------------------------------------------------------------------*/
bool ReorderDragDropHandler::DragStart(Element *peDrag, DWORD &dwStartFlags)
{
	OutputDebugString( L"DragStart called.\n" );
	ATOM atomDrag = peDrag->GetStyleClass();
	if (atomDrag == NULL)
	{
		// Do nothing.
	}
	else if (peDrag->GetStyleClass() == NetUI::GetSearchAtom(L"NoDragImage"))
		dwStartFlags |= NDSF_NoImage;
	else if (peDrag->GetStyleClass() == NetUI::GetSearchAtom(L"NoDragImageIfNoTarget"))
		dwStartFlags |= NDSF_NoImageIfNoTarget;

	return true;
}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  75776cca-5895-4455-a33c-58db4fcf036a
-----------------------------------------------------------------------------*/
void ReorderDragDropHandler::DragMove(Element *peDrag, Element *peRelative, int x, int y, DWORD keyStateFlags, NUIDropEffect &dropEffect)
{
	UNREFERENCED(x&&y);
	OutputDebugString( L"DragMove called.\n" );

	// Default to move.
	dropEffect = NDE_Move;

	if (peRelative == NULL)
		return;


	// Handle the hacky mode to hide the drag image iff the class "NoDropHide<sourceclassname"
	// is used for the style on the target or a parent element.
	{
		WCHAR wzNoDropHideAtom[256];
		NetUIWzCopy( wzNoDropHideAtom, NUIARRAYSIZE(wzNoDropHideAtom), L"NoDropHide" );

		const WCHAR *wzClassName = peDrag->GetIClassInfo()->GetName();
		NetUIRgwchCwcAppend( wzNoDropHideAtom, NUIARRAYSIZE(wzNoDropHideAtom), wzClassName, IntFromSize_t(wcslen(wzClassName))+1 );
		if (peRelative->FindNodeSelfOrAncestorOfStyleClass(wzNoDropHideAtom))
		{
			dropEffect = NDE_NoDropHideImage;
			return;
		}
	}

	// Handle the hacky mode to not set the cursor at all (the cursor will just be whatever
	// was last set for it).
	if (peRelative->FindNodeSelfOrAncestorOfStyleClass(L"NoDragCursor"))
	{
		dropEffect = NDE_CursorAlreadySet;
		return;
	}

	// Handle the hacky mode to not set the cursor at all and also hide the drag image.
	if (peRelative->FindNodeSelfOrAncestorOfStyleClass(L"NoDragCursorAndHide"))
	{
		dropEffect = NDE_CursorAlreadySetHideImage;
		return;
	}

	// If the control key is down, use the copy cursor.
	if (keyStateFlags & MK_CONTROL)
		dropEffect = NDE_Copy;

	// If the shift key is down, use the link cursor.
	if (keyStateFlags & MK_SHIFT)
		dropEffect = NDE_Link;
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  7cbb7e9d-af9f-4d63-bc73-d1d6eeda1fee
-----------------------------------------------------------------------------*/
bool ReorderDragDropHandler::DragDrop(Element *peDrag, Element *peDropTarget, int x, int y, DWORD keyStateFlags, NUIDropEffect &dropEffect)
{
	UNREFERENCED(x&&y);
	OutputDebugString( L"DragDrop called.\n" );
	if (peDrag == peDropTarget)
		return false;
	if (peDropTarget == NULL)
		return false;

	if (keyStateFlags & MK_CONTROL)
	{
		MessageBox(0, L"This dialog tests if the drag image disappears correctly despite DragDrop holding up the thread.",
			L"Synchronous callback test", MB_OK );
	}
	else if (keyStateFlags & MK_SHIFT)
	{
		UpdateWindow(peDrag->GetHostingHWND());
		::SetCursor( ::LoadCursor( NULL, IDC_WAIT ) );
		Sleep(3000);
		::SetCursor( ::LoadCursor( NULL, IDC_ARROW ) );
	}

	if (peDrag->GetParent() != NULL)
		peDrag->GetParent()->Remove( peDrag );
	peDropTarget->GetParent()->InsertBefore(peDrag, peDropTarget);

	dropEffect = NDE_Move;
	return true;
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  9bc175ab-8bfe-4575-957b-49cf9f02c938
-----------------------------------------------------------------------------*/
HRESULT ReorderDragDropHandler::ExternalDragDrop(IDataObject *pdoSrc, Element *peDropTarget, int x, int y, DWORD grfKeyState, DWORD &dwEffect)
{
	UNREFERENCED(pdoSrc&&x&&y&&grfKeyState);
	OutputDebugString( L"ExternalDragDrop called.\n" );
	if (peDropTarget == NULL)
	{
		dwEffect = DROPEFFECT_NONE;
		return S_OK;
	}

	if (pdoSrc == NULL)
		return E_INVALIDARG;

	FORMATETC formatetc;
	ZeroMemory(&formatetc, sizeof(formatetc));
	formatetc.cfFormat = CF_TEXT;
	formatetc.dwAspect = DVASPECT_CONTENT;
	formatetc.lindex   = -1;
	formatetc.tymed    = TYMED_HGLOBAL;
	formatetc.ptd      = NULL;

	if (SUCCEEDED(pdoSrc->QueryGetData(&formatetc)))
	{
		STGMEDIUM medium;
		HRESULT hr = pdoSrc->GetData(&formatetc, &medium);
		if (SUCCEEDED(hr))
		{
			// Get the text out of it.
			if (medium.tymed == TYMED_HGLOBAL && medium.hGlobal)
			{
				const void *pSrc = NULL;
				int wideLen = 0;
				WCHAR *wzText = NULL;
				Element *peNew = NULL;

				// Allocate a buffer
				size_t allocBytes = GlobalSize(medium.hGlobal) + 1;
				char *szText = (char*)NUIAlloc( allocBytes );
				if (szText == NULL)
				{
					hr = E_OUTOFMEMORY;
					goto lCleanup;
				}

				// Copy the string, and ensure it is null terminated
				pSrc = GlobalLock(medium.hGlobal);
				memcpy( szText, pSrc, allocBytes-1 );
				GlobalUnlock(medium.hGlobal);
				szText[allocBytes-1] = '\0';

				// Convert to WCHAR*
				wideLen = MultiByteToWideChar( CP_ACP, 0, szText, -1, NULL, 0 );
				wzText = (WCHAR*)NUIAllocArray( WCHAR, wideLen );
				if (wzText == NULL)
				{
					hr = E_OUTOFMEMORY;
					goto lCleanup;
				}

				MultiByteToWideChar( CP_ACP, 0, szText, -1, wzText, wideLen );

				// Create an Element
				hr = Label::Create( &peNew );
				if (SUCCEEDED(hr))
				{
					peNew->SetTextString( wzText );
					hr = peDropTarget->GetParent()->InsertBefore(peNew, peDropTarget);
					if (SUCCEEDED(hr)) // Now that we've successfully inserted peNew, NULL it out so we don't delete it.
						peNew = NULL;
				}

lCleanup:
				if (FAILED(hr) && peNew != NULL)
					peNew->Destroy();

				// Free the buffers and the StgMedium
				if (wzText)
					NUIFree( wzText );
				if (szText)
					NUIFree( szText );
				ReleaseStgMedium( &medium );
			}
		}

		return hr;
	}

	dwEffect = DROPEFFECT_NONE;
	return S_OK;
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  cc488817-9ddb-4d17-ba93-736ce02d4c3d
-----------------------------------------------------------------------------*/
void AddDragDropHandler(NUIDocument *pDocument)
{
	if (pDocument != NULL)
	{
		static ReorderDragDropHandler ddh;
		nui_control_cast<HWNDElement>( pDocument->GetRootElement() )->AddDragDropHandler( &ddh );
	}
}

///////////////////////////////////////////////////////////////////////
// DbgBatchInsertListViewItem
//
// Used to test dynamic insertion of listview items.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  rolandr
	%%Id:  54d6ea7f-e1c9-4aaf-a354-a45d55165189
-----------------------------------------------------------------------------*/
void DbgBatchInsertListViewItem()
{
	Listbox *pb;
	Listbox::Create( (Element**)&pb );
	pb->AddListItem( L"Item #1", L"Val #1", false );
	pb->AddListItem( L"Item #2", L"Val #2", false );
	pb->AddListItem( L"Item #3", L"Val #3", false );
	pb->SetSelectedIndex( 1 );
	pb->OnParsingCompleted();

	g_pDocument->GetRootElement()->Add( pb );
}

///////////////////////////////////////////////////////////////////////
// DbgInsertListViewItem
//
// Used to test dynamic insertion of listview items.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  9a4264df-7f63-43a6-970d-4f2a4dea1a40
-----------------------------------------------------------------------------*/
void DbgInsertListViewItem()
{
	Element *peListView = g_pDocument->GetRootElement()->FindDescendent( ListView::GetStaticClassInfo() );
	if (peListView == NULL)
	{
		MessageBox( NULL, L"There is no ListView in this document.", L"Error: No ListView", MB_OK | MB_ICONERROR );
		return;
	}

	Element *peOrig = peListView->FindDescendentByID( L"cloneme" );
	if (peOrig == NULL)
	{
		// Just find the first listviewitem then.
		peOrig = peListView->FindDescendent( ListViewItem::GetStaticClassInfo() );
		if (peOrig == NULL)
		{
			MessageBox( NULL, L"There is no ListViewItem to copy in this document.", L"Error: No ListViewItem", MB_OK | MB_ICONERROR );
			return;
		}
	}

	Element *peClone = (Element*)peOrig->CloneTree();
	if (peClone == NULL)
		return;

	peListView->AddElement( peClone );
	return;
}

///////////////////////////////////////////////////////////////////////
// DbgToggleButtonText
//
// Used to test dynamic button text changing.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  PaulCole
	%%Id:  8620806f-4df1-4b16-9f90-5e4fd59b0d40
-----------------------------------------------------------------------------*/
void DbgToggleButtonText()
{
	Button * pb = (Button *)(g_pDocument->GetRootElement()->FindDescendent(
	                                             Button::GetStaticClassInfo()));

	if (pb)
	{
		Value * pvText = NULL;

		if (_wcsicmp(pb->GetTextString(&pvText), L"OK") == 0)
			pb->SetTextString(L"&Finish");
		else
			pb->SetTextString(L"OK");

		if (pvText)
			pvText->Release();
	}
	else
	{
		MessageBox(NULL,
		           L"There is no button to toggle.",
		           L"Error: No Button",
		           MB_OK | MB_ICONERROR);
	}
}

///////////////////////////////////////////////////////////////////////
// DbgDeleteListViewItem
//
// Used to test dynamic deletion of listview items.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  cf446b4f-8044-442f-a914-fb849be05c10
-----------------------------------------------------------------------------*/
void DbgDeleteListViewItem()
{
	Element *peListView = g_pDocument->GetRootElement()->FindDescendent( ListView::GetStaticClassInfo() );
	if (peListView == NULL)
	{
		MessageBox( NULL, L"There is no ListView in this document.", L"Error: No ListView", MB_OK | MB_ICONERROR );
		return;
	}

	Element *peOrig = peListView->FindDescendentByID( L"cloneme" );
	if (peOrig == NULL)
	{
		// Just find the first listviewitem then.
		peOrig = peListView->FindDescendent( ListViewItem::GetStaticClassInfo() );
		if (peOrig == NULL)
		{
			MessageBox( NULL, L"There is no ListViewItem to delete in this document.", L"Error: No ListViewItem", MB_OK | MB_ICONERROR );
			return;
		}
	}

	peListView->Remove( peOrig );
	peOrig->Destroy();

	return;
}


///////////////////////////////////////////////////////////////////////
// DbgDisableSelectedListViewItem
//
// Used to test disabling selected ListViewItems.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  CatMorr
	%%Id:  88098f05-9888-41b2-aff3-e10c46afed8f
-----------------------------------------------------------------------------*/
void DbgDisableSelectedListViewItem()
{
	ListView *peListView = (ListView *) g_pDocument->GetRootElement()->
		FindDescendent(ListView::GetStaticClassInfo());

	if (peListView == NULL)
	{
		MessageBox(NULL, L"There is no ListView in this document.",
			L"Error: No ListView", MB_OK | MB_ICONERROR );

		return;
	}

	ListViewItem *peListViewItem = peListView->GetSelectedItem();
	if (peListViewItem == NULL)
	{
		MessageBox(NULL, L"This command applies only to the first ListView in "
			L"the document, and that ListView has no selected item.",
			L"Error: No ListViewItem", MB_OK | MB_ICONERROR );

		return;
	}

	peListViewItem->SetIsEnabled(false);
}


///////////////////////////////////////////////////////////////////////
// DbgToggleDirection
//
// Used to test dynamic chanding the direction of the root HWNDElement.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MinZhu
	%%Id:  44c62879-9c00-4881-9886-43e199c647b2
-----------------------------------------------------------------------------*/
void DbgToggleDirection()
{
	Element *pRoot = g_pDocument->GetRootElement();
	if (pRoot == NULL)
	{
		MessageBox( NULL, L"There is no HWNDElement root in this document.", L"Error: No root", MB_OK | MB_ICONERROR );
		return;
	}

	int dir = pRoot->GetDirection();
	if (dir == DIRECTION_LTR)
	{
		pRoot->SetDirection( DIRECTION_RTL );
	}
	else
	{
		pRoot->SetDirection( DIRECTION_LTR );
	}

	return;
}


//////////////////////////////////////////////////////////////////////////
// Custom data-source



/*-----------------------------------------------------------------------------
	%%Owner:  AndrewH
	%%Id:  62d4d656-b298-4fef-8840-9b8fb6e68b84
-----------------------------------------------------------------------------*/
void InsertFlexListEntry(FlexUI::IFlexList* pList, const WCHAR *wz, int iInsert, int iIndex)
{
	HRESULT hr;
	WCHAR wzLabel[256];
	const WCHAR* rgwzLeafName[2] = { L"Label", L"ImageSource" };
	CntPtrTo<CustomDataSource> spDS;
	FlexUI::FlexValueSP spv, spv2;
	FlexUI::FlexValue* rgpv[2];
	BYTE rgbState[2];
	int iItems = 2;

	FlexUI::IDataSourceListSP pfl(pList);

	HBITMAP hbmp = (HBITMAP)LoadImage(g_hInst, MAKEINTRESOURCE(IDB_LIGHTBULB), IMAGE_BITMAP, 0, 0,
		LR_SHARED | LR_CREATEDIBSECTION | LR_DEFAULTSIZE);

	OACR_REVIEWED_CALL(IgorZ, _snwprintf_s(wzLabel, _TRUNCATE, L"%s %d", wz, iIndex));

	// Create leaf data source which has a single Label string property
	FlexUI::FlexValue::CreateString(wzLabel, spv);
	AssertTag(spv != NULL, ASSERTTAG('dyxn'));
	if (spv == NULL)
		return;

	FlexUI::FlexValue::CreateImage(hbmp, spv2);
	AssertTag(spv2 != NULL, ASSERTTAG('dyxo'));
	if (spv2 == NULL)
		return;

	rgpv[0] = spv;
	rgpv[1] = spv2;
	rgbState[0] = 0;
	if ((iIndex % 2) == 0)
		rgbState[0] |= (1 << PST_IsReadOnly);
	if ((iIndex % 4) == 0 && iInsert != 0)
		rgbState[0] |= (1 << PST_IsUndefined);
	rgbState[1] = rgbState[0];
	hr = CustomDataSource::Create(rgpv, rgwzLeafName, rgbState, iItems, *&spDS);
	AssertTag(SUCCEEDED(hr), ASSERTTAG('dyxp'));
	if (FAILED(hr))
		return;

	pfl.Insert(NULL, iInsert, spDS);
}

///////////////////////////////////////////////////////////////////////
// DbgAddBinding
//
// Used to test property binding
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  IgorZ
	%%Id:  1ebd163a-4954-4476-b587-0014b33df1fa
-----------------------------------------------------------------------------*/
void DbgAddBinding(void)
{
	HRESULT hr = NOERROR;
	FlexUI::FlexValueSP spv;
	FlexUI::FlexValue* rgpv[1];
	CntPtrTo<CustomDataSource> spDS;

	AutoDeferBlock adf;

	DWORD dwTime = GetTickCount();


	// create FlexList of leaf data sources
	FlexUI::IDataSourceListSP spfl;
	if (!FlexList::Create(10 /*initialCapacity*/, (FlexList **)&spfl))
	{
		AssertTag(false, ASSERTTAG('dzbp'));
		return;
	}

	for (int i = 0; i < 10; i++)
	{
		InsertFlexListEntry(spfl, L"Label", i, i);
	}

	// create root data source
	const WCHAR* rgwzRootName[] = { L"Items" };

	// Create a sorted list
	FlexUI::FlexListViewSP pSortedList;
	if (!FlexUI::FlexListView::Create(spfl, pSortedList.Address()))
	{
		AssertTag(false, ASSERTTAG('dzci'));
		return;
	}

	pSortedList->SetSortPropertyByName(L"Label");
	pSortedList->SetSortOrder(NULL, FlexUI::SortAscending);


	FlexUI::FlexValue::CreateList(pSortedList, spv);
	AssertTag(spv != NULL, ASSERTTAG('dzdo'));
	if (spv == NULL)
		return;


	rgpv[0] = spv;
	hr = CustomDataSource::Create(rgpv, rgwzRootName, NULL, 1, *&spDS);
	AssertTag(SUCCEEDED(hr), ASSERTTAG('dzex'));
	if (FAILED(hr))
		return;

	g_pDocument->SetDataContext(spDS);
	g_pCurrentDataSource = NULL;

	// remove all elements
	spfl->Clear(NULL);

	// add them again
	for (int i = 0; i < 10; i++)
	{
		InsertFlexListEntry(spfl, L"Label", i, i);
	}

	// add more FlexList elements to test dynamic updates
	for (int i = 10; i < 20; i++)
	{
		InsertFlexListEntry(spfl, L"Label", i, i);
	}

	// insert more elements in the middle
	for (int i = 20; i < 1000; i++)
	{
		InsertFlexListEntry(spfl, L"Label", i - 10, i);
	}

	// insert more elements in the middle
	for (int i = 0; i < 10; i++)
	{
		InsertFlexListEntry(spfl, L"Label", 0, i+10);
	}

	// remove some elements
	spfl->Remove(NULL, 999);
	spfl->Remove(NULL, 0);
	spfl->Remove(NULL, 28);

	InsertFlexListEntry(spfl, L"AAA-Time (in ms) to do list stuff ", 0, GetTickCount()-dwTime);
}

///////////////////////////////////////////////////////////////////////
// DbgAddGalleryBindings
//
// Used to test property binding on galleries
///////////////////////////////////////////////////////////////////////
#include "ViewerGalleryRootDS.h"
#include "GalleryCategoryDS.h"
#include "GalleryItemDS.h"
#include "GalleryMenuDS.h"
#include "GalleryMenuCategoryDS.h"
#include "GalleryMenuItemDS.h"
#include "GalleryFilterDS.h"
// Creates a DataSource loaded from the given FlexDL description
// Used by smart pointers in generated header files
/*-----------------------------------------------------------------------------
	%%Owner:  AndrewH
	%%Id:  79fd2492-1948-43b5-b199-f4e5b38e5875
-----------------------------------------------------------------------------*/
bool CreateGalDataSource(int rcidFlexDL, IDataSource ** ppDataSource, HINSTANCE hInstance)
{
	if (ppDataSource == NULL)
		return false;

	*ppDataSource = NULL;

	DataSourceDescriptionSP pDesc;
	if (!DataSourceDescription::LoadFromResource(hInstance, rcidFlexDL, pDesc.Address()) || pDesc == NULL)
		return false;

	DataSourceSP pDataSource;
	if (!DataSource::Create(NULL, pDesc, NULL, pDataSource.Address()) || pDataSource == NULL)
		return false;

	*ppDataSource = pDataSource.Extract();
	return true;
}

/*-----------------------------------------------------------------------------
	%%Owner:  AndrewH
	%%Id:  125cee16-5ee6-4756-8437-996e057cc0f5
-----------------------------------------------------------------------------*/
bool DbgAddGalleryBindingsCategory(NetUI::NUIDocument *pDocument, HINSTANCE hInstance, ViewerGalleryRootDSSP& spGalleryRet)
{
	// create root data source
	WCHAR wzTemp[2048];

	AutoDeferBlock adf;
	const int cItems = 8;
	const int cMenuItems = 8;

	ViewerGalleryRootDSSP spGal;
	GalleryFilterDSSP spFilter;
	if (!CreateGalDataSource(IDUI_VIEWERGALLERYROOT_FLEXDL, spGal.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzfp'));
		return false;
	}
	spGal.CreateCategories(3);
	spGal.CreateItems(cItems);
	spGal.CreateFilterItems(5);
	FlexUI::IDataSourceListSP spCategories = spGal.GetCategories();
	FlexUI::IDataSourceListSP spItemsAlways, spItemsOdd, spItemsEven;
	FlexUI::IDataSourceListSP spFilters = spGal.GetFilterItems();
	
	if (spFilters == NULL)
		{
		// create FlexList of filter data sources
		if (!spFilters.Create(5/*iListCapacity*/))
			return false;
			
		spGal.SetFilterItems(spFilters);
		}

	spGal.SetItemsHeight(-1);
	spGal.SetItemsWidth(1);
	spGal.SetIsBitFiltering(true);
	spGal.SetIsFilterVisible(true);
	{
		HBITMAP hbmp = (HBITMAP)LoadImage(hInstance, MAKEINTRESOURCE(IDB_LIGHTBULB), IMAGE_BITMAP, 0, 0,
			LR_SHARED | LR_CREATEDIBSECTION | LR_DEFAULTSIZE);
		FlexValueSP spv;
		if (!FlexValue::CreateImage(hbmp, spv))
		{
			AssertTag(false, ASSERTTAG('dzgb'));
			return false;
		}

		spGal.SetImageSource(spv);
	}

	// Add Categories
	GalleryCategoryDSSP spCatAlways, spCatOdd, spCatEven;
	if (!CreateGalDataSource(IDUI_GALLERYCATEGORY_FLEXDL, spCatAlways.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzgc'));
		return false;
	}
	if (!CreateGalDataSource(IDUI_GALLERYCATEGORY_FLEXDL, spCatOdd.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzgd'));
		return false;
	}
	if (!CreateGalDataSource(IDUI_GALLERYCATEGORY_FLEXDL, spCatEven.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzhc'));
		return false;
	}
	spCatAlways.CreateItems(cItems);
	spCatEven.CreateItems(cItems);
	spCatOdd.CreateItems(cItems);
	spItemsAlways = spCatAlways.GetItems();
	spItemsEven = spCatEven.GetItems();
	spItemsOdd = spCatOdd.GetItems();
	spCategories.Add(NULL, spCatAlways);
	spCategories.Add(NULL, spCatEven);
	spCategories.Add(NULL, spCatOdd);

	spCatAlways.SetGroupID(0);
	spCatOdd.SetGroupID(1 | 1<<4);
	spCatEven.SetGroupID(2 | 2 <<4);
	spCatAlways.SetLabel(L"Always");
	spCatOdd.SetLabel(L"Odd");
	spCatEven.SetLabel(L"Even");

	// Add a menu
	GalleryMenuDSSP spMenu;
	if (!CreateGalDataSource(IDUI_GALLERYMENU_FLEXDL, spMenu.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzhv'));
		return false;
	}

	spMenu.CreateCategories(1);
	FlexUI::IDataSourceListSP spMenuCategories = spMenu.GetCategories();
	GalleryMenuCategoryDSSP spMenuCategory;
	if (!CreateGalDataSource(IDUI_GALLERYMENUCATEGORY_FLEXDL, spMenuCategory.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzhw'));
		return false;
	}
	{
		FlexValueSP fvClass;
		FlexValue::CreateAtom(L"StandardItems", fvClass);
		spMenuCategory->SetValue(NULL, GalleryMenuCategoryDS::idClass, fvClass);
	}
	spMenuCategories.Add(NULL, spMenuCategory);

	spMenuCategory.CreateMenuItems(cMenuItems);
	FlexUI::IDataSourceListSP spMenuItems = spMenuCategory.GetMenuItems();
	spMenu.SetMenuId(0x1000);
	for (int i = 0; i < cMenuItems; i++)
	{
		if (_snwprintf_s(wzTemp, _TRUNCATE, L"%s %d", L"Menu Item", i) < 0)
		{
			AssertTag(false, ASSERTTAG('dzhy'));
			return false;
		}
		GalleryMenuItemDSSP spMenuItem;
		if (!CreateGalDataSource(IDUI_GALLERYMENUITEM_FLEXDL, spMenuItem.Address(), hInstance))
		{
			AssertTag(false, ASSERTTAG('dzif'));
			return false;
		}
		spMenuItem.SetLabel(wzTemp);
		spMenuItems.Add(NULL, spMenuItem);
	}

	// Add Items
	for (int i = 0; i < cItems; i++)
	{
		if (_snwprintf_s(wzTemp, _TRUNCATE, L"%s %d", L"Label", i) < 0)
		{
			AssertTag(false, ASSERTTAG('dzig'));
			return false;
		}
		GalleryItemDSSP spItem;
		if (!CreateGalDataSource(IDUI_GALLERYITEM_FLEXDL, spItem.Address(), hInstance))
		{
			AssertTag(false, ASSERTTAG('dzih'));
			return false;
		}
		HBITMAP hbmp = (HBITMAP)LoadImage(hInstance, MAKEINTRESOURCE(IDB_LIGHTBULB), IMAGE_BITMAP, 0, 0,
			LR_SHARED | LR_CREATEDIBSECTION | LR_DEFAULTSIZE);
		FlexValueSP spv;
		if (!FlexValue::CreateImage(hbmp, spv))
		{
			AssertTag(false, ASSERTTAG('dzii'));
			return false;
		}

		spItem.SetImageSource(spv);
		spItem.SetImageHeight(-1);
		spItem.SetImageWidth(-1);
		spItem.SetTextPercentImage(100);
		spItem.SetLargePreviewPercentImage(-1);
		spItem.SetLabel(wzTemp);

		if (i == cItems-1)
		{
			spItem.SetContextMenuDataSource(spMenu);
			spItem.SetContextMenuFlexMLContentID(msoctxuircidflexmlGalleryContextMenu);
		}

		if (i == 0)
			spItemsAlways.Add(NULL, spItem);
		else if (i % 2 == 0)
			spItemsEven.Add(NULL, spItem);
		else if (i % 2 == 1)
			spItemsOdd.Add(NULL, spItem);
	}

	// Add some filters
	if (!CreateGalDataSource(IDUI_GALLERYFILTER_FLEXDL, spFilter.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzij'));
		return false;
	}
	spFilter.SetLabel(L"All");
	spFilter.SetFilterMask(0xffffffff);
	spFilters.Add(NULL, spFilter);
	if (!CreateGalDataSource(IDUI_GALLERYFILTER_FLEXDL, spFilter.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzik'));
		return false;
	}
	spFilter.SetLabel(L"Odd");
	spFilter.SetFilterMask(0x00000011); // Match odd, or in exact match item 1
	spFilters.Add(NULL, spFilter);
	if (!CreateGalDataSource(IDUI_GALLERYFILTER_FLEXDL, spFilter.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzil'));
		return false;
	}
	spFilter.SetLabel(L"Even");
	spFilter.SetFilterMask(0x00000002);
	spFilters.Add(NULL, spFilter);

	// set root data source
	pDocument->SetDataContext(spGal);

	spGalleryRet = spGal;
	return true;
}

// Non-Category version:
/*-----------------------------------------------------------------------------
	%%Owner:  AndrewH
	%%Id:  0cc91765-d8c6-4e6d-bc93-a14159cea73e
-----------------------------------------------------------------------------*/
bool DbgAddGalleryBindings(NetUI::NUIDocument *pDocument, HINSTANCE hInstance, ViewerGalleryRootDSSP& spGalleryRet)
{
	// create root data source
	WCHAR wzTemp[2048];

	AutoDeferBlock adf;
	const int cItems = 8;
	const int cMenuItems = 8;

	ViewerGalleryRootDSSP spGal;
	GalleryFilterDSSP spFilter;
	if (!CreateGalDataSource(IDUI_VIEWERGALLERYROOT_FLEXDL, spGal.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzim'));
		return false;
	}
	spGal.CreateItems(cItems);
	FlexUI::IDataSourceListSP spItems = spGal.GetItems();

	spGal.SetItemsHeight(-1);
	spGal.SetItemsWidth(1);
	spGal.SetIsBitFiltering(true);
	spGal.SetIsFilterVisible(true);
	{
		HBITMAP hbmp = (HBITMAP)LoadImage(hInstance, MAKEINTRESOURCE(IDB_LIGHTBULB), IMAGE_BITMAP, 0, 0,
			LR_SHARED | LR_CREATEDIBSECTION | LR_DEFAULTSIZE);
		FlexValueSP spv;
		if (!FlexValue::CreateImage(hbmp, spv))
		{
			AssertTag(false, ASSERTTAG('dzin'));
			return false;
		}

		spGal.SetImageSource(spv);
	}

	// Add a menu
	GalleryMenuDSSP spMenu;
	if (!CreateGalDataSource(IDUI_GALLERYMENU_FLEXDL, spMenu.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzio'));
		return false;
	}

	spMenu.CreateCategories(1);
	FlexUI::IDataSourceListSP spMenuCategories = spMenu.GetCategories();
	GalleryMenuCategoryDSSP spMenuCategory;
	if (!CreateGalDataSource(IDUI_GALLERYMENUCATEGORY_FLEXDL, spMenuCategory.Address(), hInstance))
	{
		AssertTag(false, ASSERTTAG('dzip'));
		return false;
	}
	{
		FlexValueSP fvClass;
		FlexValue::CreateAtom(L"StandardItems", fvClass);
		spMenuCategory->SetValue(NULL, GalleryMenuCategoryDS::idClass, fvClass);
	}
	spMenuCategories.Add(NULL, spMenuCategory);

	spMenuCategory.CreateMenuItems(cMenuItems);
	FlexUI::IDataSourceListSP spMenuItems = spMenuCategory.GetMenuItems();
	spMenu.SetMenuId(0x1000);
	for (int i = 0; i < cMenuItems; i++)
	{
		if (_snwprintf_s(wzTemp, _TRUNCATE, L"%s %d", L"Menu Item", i) < 0)
		{
			AssertTag(false, ASSERTTAG('dziq'));
			return false;
		}
		GalleryMenuItemDSSP spMenuItem;
		if (!CreateGalDataSource(IDUI_GALLERYMENUITEM_FLEXDL, spMenuItem.Address(), hInstance))
		{
			AssertTag(false, ASSERTTAG('dzir'));
			return false;
		}
		spMenuItem.SetLabel(wzTemp);
		spMenuItems.Add(NULL, spMenuItem);
	}

	// Add Items
	for (int i = 0; i < cItems; i++)
	{
		if (_snwprintf_s(wzTemp, _TRUNCATE, L"%s %d", L"Label", i) < 0)
		{
			AssertTag(false, ASSERTTAG('dzis'));
			return false;
		}
		GalleryItemDSSP spItem;
		if (!CreateGalDataSource(IDUI_GALLERYITEM_FLEXDL, spItem.Address(), hInstance))
		{
			AssertTag(false, ASSERTTAG('dzit'));
			return false;
		}
		HBITMAP hbmp = (HBITMAP)LoadImage(hInstance, MAKEINTRESOURCE(IDB_LIGHTBULB), IMAGE_BITMAP, 0, 0,
			LR_SHARED | LR_CREATEDIBSECTION | LR_DEFAULTSIZE);
		FlexValueSP spv;
		if (!FlexValue::CreateImage(hbmp, spv))
		{
			AssertTag(false, ASSERTTAG('dziu'));
			return false;
		}

		spItem.SetImageSource(spv);
		spItem.SetImageHeight(-1);
		spItem.SetImageWidth(-1);
		spItem.SetTextPercentImage(100);
		spItem.SetLargePreviewPercentImage(-1);
		spItem.SetLabel(wzTemp);

		if (i == cItems-1)
		{
			spItem.SetContextMenuDataSource(spMenu);
			spItem.SetContextMenuFlexMLContentID(msoctxuircidflexmlGalleryContextMenu);
		}
		spItems.Add(NULL, spItem);
	}

	// set root data source
	pDocument->SetDataContext(spGal);

	spGalleryRet = spGal;
	return true;
}

///////////////////////////////////////////////////////////////////////
// DbgChangeClass
//
// Used to test changing the class="" of an element for dynamic tree
// styling changes.
///////////////////////////////////////////////////////////////////////
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  dcba2705-5a0d-4bba-8828-769a971bc65d
-----------------------------------------------------------------------------*/
void DbgChangeClass()
{
	Node *pn = g_pDocument->GetRootElement()->FindNodeDescendentByID( L"root" );

	if (pn)
	{
		if (pn->GetStyleClass() == NetUI::GetSearchAtom(L"nostyletree"))
			pn->SetStyleClass( L"default" );
		else if (pn->GetStyleClass() == NetUI::GetSearchAtom(L"pretty"))
			pn->SetStyleClass( L"nostyletree" );
		else
			pn->SetStyleClass( L"pretty" );
	}
	else
	{
		MessageBox( NULL, L"There is no node with id=\"root\".", L"Error: No Node with target ID", MB_OK | MB_ICONERROR );
	}
}


/*------------------------------------------------------------------------
	Tests the flex data-binding code.

	%%Owner:  MikeBor
	%%Id:  2bf67990-bd5d-40a4-8268-b3ec503dc8b0
--------------------------------------------------------------- MikeBor -*/
void DbgTestFlexData()
{
	// TODO:
	//FlexUI::DataSourceDescriptionBuilder::ExecuteUnitTest();
}


//
//  FUNCTION: WndProc(HWND, unsigned, WORD, LONG)
//
//  PURPOSE:  Processes messages for the main window.
//
//  WM_COMMAND - process the application menu
//  WM_PAINT   - Paint the main window
//  WM_DESTROY - post a quit message and return
//
//
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  346d2e8f-1949-4be2-8b45-af3920d9330b
-----------------------------------------------------------------------------*/
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int wmId, wmEvent;

	// do this block outside the switch because it may have to happen for
	// multiple message types and also because it needs to do the default
	// case of the switch.
	if (message == WM_ACTIVATEAPP)
	{
		MSG msg;

		memset(&msg, 0, sizeof(msg));
		msg.hwnd = hWnd;
		msg.message = message;
		msg.wParam = wParam;
		msg.lParam = lParam;

		// Let the contextual UI manager know about this message
		CtxUIMgr::HandleMsg(&msg, /*fAtPeek*/false);
	}

	switch (message)
	{
	case WM_ERASEBKGND:
		return 0;
	case WM_COMMAND:
		wmId    = LOWORD(wParam);
		wmEvent = HIWORD(wParam);
		// Parse the menu selections:
		switch (wmId)
		{
		case ID_ACCELOPEN:
		case IDM_FILE_OPEN:
			{
				OPENFILENAME ofn;
				WCHAR wzFile[ MAX_PATH ];
				WCHAR wzFileTitle[ MAX_PATH ];

				ZeroMemory( &ofn, sizeof( ofn ) );
				wzFile[0] = '\0';
				wzFileTitle[0] = '\0';

				ofn.lStructSize       = sizeof( ofn );
				ofn.hwndOwner         = hWnd;
				ofn.lpstrFilter       = L"NetUI Files (*.nui, *.flexml, *.flexb, *.flex, *.nub)\0*.nui;*.flexml;*.flexb;*.flex;*.ui;*.nub\0"
				                        L"FlexML Files (*.flexml, *.flexb)\0*.flexml;*.flexb\0"
				                        L"FlexUI Package Files (*.flex)\0*.flex\0"
				                        L"All Files (*.*)\0*.*\0";
				ofn.nMaxFile          = MAX_PATH;
				ofn.lpstrFile         = wzFile;
				ofn.nMaxFileTitle     = MAX_PATH;
				ofn.lpstrFileTitle    = wzFileTitle;
				ofn.Flags             = OFN_FILEMUSTEXIST;
				ofn.lpstrDefExt       = L"nui";
				if (GetOpenFileName(&ofn))
				{
					// Clean up the current document contents before opening a new doc.
					g_pDocument->ResetContents();

					EnsureErrorHandlerAndReset();

					SetWindowTitle( wzFile );

					FOpenDocumentFile(g_pDocument, wzFile, g_hInst);

					UpdateMRU( hWnd, wzFile );
				}

				break;
			}
		case ID_ACCELREFRESH:
			RefreshFile();
			break;
		case IDM_REFRESH_NETUI:
			RefreshNetUI();
			break;
		case IDM_REFRESH_ADAPTIVECARD:
			RefreshAdaptiveCard();
			break;
		case IDM_VIEWSOURCE:
		case ID_ACCELVIEWSOURCE:
			{
				const WCHAR *wzFile = g_pDocument->GetCurrentFileName();
				if (g_fCurrentFileIsPackage)
					wzFile = g_wzPackageFilename;

				if (wzFile == NULL)
					goto LAccelBuffer;
				else
				{
					// Create the full command string
					WCHAR *pCmdStr = NULL;

					WCHAR buf[1024];
					// NRobarge: Ok - Constant format string, non-shipping code
					OACR_REVIEWED_CALL( NRobarge, _snwprintf_s( buf, _TRUNCATE, L" \"%lS\"", wzFile ) );
					pCmdStr = buf;

					// Init some process vars
					PROCESS_INFORMATION pi;
					STARTUPINFO si;
					ZeroMemory( &si, sizeof(STARTUPINFO) );
					si.cb = sizeof(STARTUPINFO);

					// Launch the process.
					WCHAR wzWinDir[256];
					if (GetWindowsDirectory(wzWinDir, NUIARRAYSIZE(wzWinDir)) == 0)
						MessageBox( NULL, L"Unable to get the Windows directory", L"Error", MB_OK );

					WCHAR wzAppBuf[300];
					// NRobarge: Ok - Constant format string, non-shipping code
					OACR_REVIEWED_CALL( NRobarge, _snwprintf_s( wzAppBuf, _TRUNCATE, L"%s\\notepad.exe", wzWinDir ) );

					// NRobarge: Ok - Non-NULL first argument, non-shipping code
					OACR_REVIEWED_CALL( NRobarge, CreateProcess( wzAppBuf, pCmdStr, NULL, NULL, FALSE, 0, NULL, NULL, &si, &pi ) );

					if (pi.hProcess == NULL)
						MessageBox( NULL, L"Unable to launch Notepad on the source file.", L"Error", MB_OK );

					CloseHandle(pi.hProcess);
					CloseHandle(pi.hThread);
				}
			}
			break;

		case ID_ACCELBUFFER:
LAccelBuffer:
			HandleBuffer( hWnd );
			break;

		case IDM_SHOWERRORS:
		case ID_ACCELERRORS:
			ShowErrorWindow( hWnd );
			break;

		case IDM_ABOUT:
			DialogBox(g_hInst, (LPCTSTR)IDD_ABOUTBOX, hWnd, (DLGPROC)About);
			break;
		case IDM_EXIT:
			DestroyWindow(hWnd);
			break;
		case IDM_INITGDIPLUS:
			InitGDIPlus();
			break;
		case IDM_FORCE_DPI:
			ChangeForcedDPI();
			break;
		case IDM_ADD_FAVORITE:
			if (g_fCurrentDocIsBuffer)
				MessageBox( hWnd, L"Can't add the buffer window to the favorites.", L"Can't add favorite.", MB_ICONEXCLAMATION );
			else if (g_fCurrentFileIsPackage)
				AddFavorite(hWnd, g_wzPackageFilename);
			else
			{
				const WCHAR *wzFile = g_pDocument->GetCurrentFileName();
				if (wzFile != NULL)
					AddFavorite( hWnd, wzFile );
			}
			break;
		case IDM_STYLE_NETUI:
		case IDM_STYLE_NETPANE:
		case IDM_STYLE_NUIDIALOG:
			UpdateDefaultStyle( wmId );
			break;
		case IDM_USETASKPANELAYOUT:
			AssertDoTag(FToggleTaskPaneLayout(), ASSERTTAG('1y2h'));
			break;
		case IDM_USENEWGRAPHICSMODE:
			g_pDocument->GetRootElement()->SetUsingNewGraphicsMode(!(GetMenuState(GetMenu(hWnd), IDM_USENEWGRAPHICSMODE, MF_BYCOMMAND) & MF_CHECKED));
			CheckMenuItem(GetMenu(hWnd), IDM_USENEWGRAPHICSMODE, g_pDocument->GetRootElement()->IsUsingNewGraphicsMode() ? MF_CHECKED : MF_UNCHECKED);
			RedrawWindow(hWnd, NULL, NULL, RDW_INVALIDATE | RDW_UPDATENOW | RDW_ALLCHILDREN);
			break;
		case IDM_DBG_INSERTLISTITEM:
			DbgInsertListViewItem();
			break;
		case IDM_DBG_REMOVELISTITEM:
			DbgDeleteListViewItem();
			break;
		case IDM_DGB_DISABLESELECTEDLISTITEM:
			DbgDisableSelectedListViewItem();
			break;
		case IDM_DBG_TOGGLEBTNTXT:
			DbgToggleButtonText();
			break;
		case IDM_DGB_TOGGLEDIRECTION:
			DbgToggleDirection();
			break;
		case IDM_DGB_BATCHINSERT:
			DbgBatchInsertListViewItem();
			break;
		case IDM_DGB_ADDBINDING:
			DbgAddBinding();
			break;
		case IDM_DGB_ADDGALLERYBINDING:
			{
			ViewerGalleryRootDSSP spGal;
			DbgAddGalleryBindings(g_pDocument, g_hInst, spGal);
			}
			break;
		case IDM_DGB_ADDGALLERYCATBINDING:
			{
			ViewerGalleryRootDSSP spGal;
			DbgAddGalleryBindingsCategory(g_pDocument, g_hInst, spGal);
			}
			break;
		case IDM_DBG_TESTFLEXDATA:
			DbgTestFlexData();
			break;
		case IDM_DGB_CHANGECLASS:
			DbgChangeClass();
			break;
		case IDM_DGB_REMOVELOCALLAYOUT:
			{
			Element *pe = g_pDocument->GetRootElement();

			if (pe)
				pe = pe->FindDescendent(L"LAYOUTELEMENT");

			if (pe)
				{
				pe->SetLayout(DLT_Flow);
				AssertTag(pe->GetLayout() == DLT_Flow, ASSERTTAG('dziv'));

				pe->RemoveLocalValue(Element::LayoutPropInfo());
				}
			else
				{
				MessageBox(NULL,
				           L"There is no element with ID=\"LAYOUTELEMENT\"",
				           L"Error: No suitable element",
				           MB_OK | MB_ICONERROR );
				}
			}
			break;

		case IDM_DGB_TRIGGERMSAACREATE:
			{
			HWNDElement::TriggerAccessibleEvent(g_pDocument->GetRootElement(),
			                                    HWNDElement::TAE_MajorContentChange);
			}
			break;
		default:
			// Is it an MRU file?
			if (wmId >= IDM_MRUFILE1 && wmId <= IDM_MRUFILE1+s_numMRUFiles)
			{
				// MRU!
				// Clean up the current document contents before opening a new doc.
				g_pDocument->ResetContents();

				EnsureErrorHandlerAndReset();
				SetWindowTitle( g_wzMRUFiles[wmId-IDM_MRUFILE1] );

				FOpenDocumentFile(g_pDocument, g_wzMRUFiles[wmId-IDM_MRUFILE1], g_hInst);

				// TODO: Should we update the MRU when using the MRU?
				//UpdateMRU( hWnd, g_wzMRUFiles[wmId-IDM_MRUFILE1] );
				break;
			}
			// Is it a favorite?
			if (wmId >= IDM_FAVORITEFILE1 && wmId <= IDM_FAVORITEFILE1+s_numFavorites)
			{
				// Favorite!
				// Clean up the current document contents before opening a new doc.
				g_pDocument->ResetContents();

				EnsureErrorHandlerAndReset();
				SetWindowTitle( g_wzFavorites[wmId-IDM_FAVORITEFILE1] );

				FOpenDocumentFile(g_pDocument, g_wzFavorites[wmId-IDM_FAVORITEFILE1], g_hInst);
				break;
			}
			return DefWindowProc(hWnd, message, wParam, lParam);
		}
		break;

	case WM_SETFOCUS:
		{
			// Give focus to the NetUI window.
			if (g_pDocument != NULL && !IsChild(g_pDocument->GetWindowHWND(), (HWND)wParam))
				SetFocus( g_pDocument->GetWindowHWND() );
		}
		break;

	case WM_SYSCOMMAND:
		{
			LRESULT lRet = DefWindowProc(hWnd, message, wParam, lParam);

			// On restoring a minimized window, Windows tries to force focus
			// to the app, so we need push focus into the NetUI window.
			if (wParam == SC_RESTORE && g_pDocument != NULL)
				SetFocus(g_pDocument->GetWindowHWND());

			return lRet;
		}
		break;

	// Messages to top-level window only, forward
	case WM_PALETTECHANGED:
	case WM_QUERYNEWPALETTE:
	case WM_DISPLAYCHANGE:
	case WM_SETTINGCHANGE:
	case WM_SYSCOLORCHANGE:
	case WM_THEMECHANGED:
		{
			MsoUpdateSysColors();
			MsoThemeOnThemeChanged();
			if (g_pDocument != NULL)
			{
				return SendMessageW(g_pDocument->GetWindowHWND(), message, wParam, lParam);
			}
		}
		break;

	case WM_SIZE:
		{
			ResizeAll( hWnd );
		}
		break;

	case WM_KEYDOWN:
		if (wParam == VK_SUBTRACT && (GetAsyncKeyState(VK_CONTROL) < 0) && (GetAsyncKeyState(VK_SHIFT) < 0))
		{
			static UINT g_uMsgEnableSpy = RegisterWindowMessageW(L"NetUISpy Enable");
			if (g_pDocument != NULL && g_pDocument->GetRootElement() != NULL)
				SendMessage(g_pDocument->GetRootElement()->GetHostingHWND(), g_uMsgEnableSpy, 0, 0);
		}
		return DefWindowProc(hWnd, message, wParam, lParam);

	case WM_DESTROY:
		PostQuitMessage(0);
		break;

	case WM_NCACTIVATE:
		return DefWindowProc(hWnd, message, wParam, lParam);

	default:
		return DefWindowProc(hWnd, message, wParam, lParam);
	}
	return 0;
}


// Message handler for about box.
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  de91f65a-9974-420d-b970-58379d457b1d
-----------------------------------------------------------------------------*/
LRESULT CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	UNREFERENCED_PARAMETER(lParam);

	switch (message)
	{
	case WM_INITDIALOG:
		return TRUE;

	case WM_COMMAND:
		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)
		{
			EndDialog(hDlg, LOWORD(wParam));
			return TRUE;
		}
		break;
	}
	return FALSE;
}


///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
/////////////////////// Element subclasses ////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////






DEFINE_DEFAULT_VALUES;




///////////////////////////////////////////////////////////////////////
// NetPane
///////////////////////////////////////////////////////////////////////

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  c132450c-82b7-4e73-afbf-a54a98855ac6
-----------------------------------------------------------------------------*/
class NetPane : public NetUIElement
{
public:
	static HRESULT Create(Element** ppElement);
	static HRESULT OnRegistered();
	static void    OnUnRegistered();

	// ClassInfo accessors (static and virtual instance-based)
	DEFINE_NETUI_CLASS_INFO;

	static Value* GetDefaultStyle();

/*-----------------------------------------------------------------------------
	%%Owner:  AndrewH
	%%Id:  9ae73d83-2214-4920-945a-8848791f0c35
-----------------------------------------------------------------------------*/
	static void ReleaseDefaultStyle() { s_spStyleValue = NULL; }

private:
	static SPValue s_spStyleValue;
};

SPValue NetPane::s_spStyleValue(NULL);

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  420d0baf-d7ea-4c12-b191-305adf4f85c3
-----------------------------------------------------------------------------*/
HRESULT NetPane::Create(Element** ppElement)
{
	*ppElement = NULL;

	NetPane* pb = HNew(NetPane);
	if (!pb)
		return E_OUTOFMEMORY;

	HRESULT hr = pb->Initialize(AE_Inactive);
	if (FAILED(hr))
	{
		pb->Destroy();
		return hr;
	}

	pb->SetOrientation( NPO_Vertical );

	// Set our style
	pb->SetValue( Node::SheetPropInfo(), GetDefaultStyle() );

	*ppElement = pb;

	return S_OK;
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  6a107296-d5ad-4005-825f-56a7f031ce57
-----------------------------------------------------------------------------*/
Value* NetPane::GetDefaultStyle()
{
	GetStoredStyle(GSID_NetPaneAirSpaceStyles, s_spStyleValue.Address());
	return s_spStyleValue;
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  9e6a899d-19d1-415c-b653-5df215b8c14b
-----------------------------------------------------------------------------*/
HRESULT NetPane::OnRegistered()
{
	return NOERROR;
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  2f94f1c4-8291-4324-a6d6-4d0c7f356744
-----------------------------------------------------------------------------*/
void NetPane::OnUnRegistered()
{
	// Get rid of our style.
	s_spStyleValue = NULL;
}


// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO_NOPROP(NetPane, NetUIElement, L"netpane", NUICloneSupported);


///////////////////////////////////////////////////////////////////////
// NetUIDialog
///////////////////////////////////////////////////////////////////////

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  45c7fd1f-95c5-405e-ae1e-bdd1fb20f6d9
-----------------------------------------------------------------------------*/
class NetUIDialog : public NetUIElement
{
public:
	static HRESULT Create(OUT Element** ppElement);
	static void    OnUnRegistered();

	QUICKSTR(Title);
	DEFINE_NETUI_PROPERTY(MinWidthProp);  // Minimums.  Used for resizable dialogs.
	DEFINE_NETUI_PROPERTY(MinHeightProp);
	DEFINE_NETUI_PROPERTY(DefWidthProp);  // Defaults.  Used for the initial size of
	DEFINE_NETUI_PROPERTY(DefHeightProp); // the dialog.
	DEFINE_NETUI_PROPERTY(IsResizableProp);
	DEFINE_NETUI_PROPERTY(MaxWidthProp);  // Maximums.  Used for resizable dialogs.
	DEFINE_NETUI_PROPERTY(MaxHeightProp);
	QUICKINT(HelpId);


	// ClassInfo accessors (static and virtual instance-based)
	DEFINE_NETUI_CLASS_INFO;

	static Value* GetDefaultStyle();

/*-----------------------------------------------------------------------------
	%%Owner:  AndrewH
	%%Id:  ee9f815c-c440-4583-b9ef-668798ef3333
-----------------------------------------------------------------------------*/
	static void ReleaseDefaultStyle() { s_spStyleValue = NULL; }

private:
	static SPValue s_spStyleValue;
};

SPValue NetUIDialog::s_spStyleValue(NULL);


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  622da47b-2ba1-4204-81b5-c2d1b978d217
-----------------------------------------------------------------------------*/
HRESULT NetUIDialog::Create(OUT Element** ppElement)
{
	*ppElement = NULL;

	NetUIDialog * pnd = HNew(NetUIDialog);
	if (!pnd)
		return E_OUTOFMEMORY;

	HRESULT hr = pnd->Initialize(AE_Inactive);

	if (FAILED(hr))
	{
		pnd->Destroy();
		return hr;
	}

	// Set our style
	pnd->SetValue( Node::SheetPropInfo(), GetDefaultStyle() );

	*ppElement = pnd;

	return S_OK;
}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  5171fd50-4e3c-45ef-aafc-d68c5f564c1b
-----------------------------------------------------------------------------*/
Value* NetUIDialog::GetDefaultStyle()
{
	GetStoredStyle(GSID_DialogStyles, s_spStyleValue.Address());
	return s_spStyleValue;
}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  278486dd-1335-4737-b25b-7c64a87c0aba
-----------------------------------------------------------------------------*/
void NetUIDialog::OnUnRegistered()
{
	// Get rid of our style.
	s_spStyleValue = NULL;
}

// DefHeight
IMPLEMENT_NETUI_PROPERTY_EX(NetUIDialog, DefHeight, PF_Normal, PG_None, ValueStatics::vvIntOrIntUnits, NULL, ValueStatics::pvIntZero);

// DefWidth
IMPLEMENT_NETUI_PROPERTY_EX(NetUIDialog, DefWidth, PF_Normal, PG_None, ValueStatics::vvIntOrIntUnits, NULL, ValueStatics::pvIntZero);

// HelpId
IMPLEMENT_NETUI_PROPERTY_EX(NetUIDialog, HelpId, PF_Normal, PG_None, ValueStatics::vvInt, NULL, ValueStatics::pvIntZero);

// IsResizable
IMPLEMENT_NETUI_PROPERTY_EX(NetUIDialog, IsResizable, PF_Normal, PG_None, ValueStatics::vvBool, NULL, ValueStatics::pvBoolFalse);

// MaxHeight
IMPLEMENT_NETUI_PROPERTY_EX(NetUIDialog, MaxHeight, PF_Normal, PG_None, ValueStatics::vvIntOrIntUnits, NULL, ValueStatics::pvIntNegOne /* NO_MAX */);

// MaxWidth
IMPLEMENT_NETUI_PROPERTY_EX(NetUIDialog, MaxWidth, PF_Normal, PG_None, ValueStatics::vvIntOrIntUnits, NULL, ValueStatics::pvIntNegOne /* NO_MAX */);

// MinHeight
IMPLEMENT_NETUI_PROPERTY_EX(NetUIDialog, MinHeight, PF_Normal, PG_None, ValueStatics::vvIntOrIntUnits, NULL, ValueStatics::pvIntZero);

// MinWidth
IMPLEMENT_NETUI_PROPERTY_EX(NetUIDialog, MinWidth, PF_Normal, PG_None, ValueStatics::vvIntOrIntUnits, NULL, ValueStatics::pvIntZero);

// Title
IMPLEMENT_NETUI_PROPERTY_EX(NetUIDialog, Title, PF_Normal, PG_None, ValueStatics::vvString, NULL, ValueStatics::pvStringNull);

const PropertyInfo* const _aPI[] =
{
	NetUIDialog::DefHeightProp,
	NetUIDialog::DefWidthProp,
	NetUIDialog::HelpIdProp,
	NetUIDialog::IsResizableProp,
	NetUIDialog::MaxHeightProp,
	NetUIDialog::MaxWidthProp,
	NetUIDialog::MinHeightProp,
	NetUIDialog::MinWidthProp,
	NetUIDialog::TitleProp,
};

IMPLEMENT_NETUI_CLASS_INFO(NetUIDialog, NetUIElement, L"NetUIDialog", _aPI, NUIARRAYSIZE(_aPI), NUICloneSupported);


///////////////////////////////////////////////////////////////////////
// Menu
///////////////////////////////////////////////////////////////////////

/*-----------------------------------------------------------------------------
	%%Owner:  AndrewH
	%%Id:  becd64bd-dc88-4aa4-96ac-3e6374d234aa
-----------------------------------------------------------------------------*/
#include <nuicontextmenu.h>
class Menu : public MenuBase
{
/*-----------------------------------------------------------------------------
	%%Owner:  AndrewH
	%%Id:  7d358181-3083-4a9f-af10-efda182108d3
-----------------------------------------------------------------------------*/
public:
	static HRESULT Create(OUT Element** ppElement)
	{
		CommonElementCreate(Menu, ppElement)
	}
	// ClassInfo accessors (static and virtual instance-based)
	DEFINE_NETUI_CLASS_INFO;
};

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO_NOPROP(Menu, MenuBase, L"menu", NetUI::NUICloneSupported);

///////////////////////////////////////////////////////////////////////
// AviPlayer
///////////////////////////////////////////////////////////////////////

// Class definition
/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  609060d0-cd2e-4bf2-88a3-4597c4556393
-----------------------------------------------------------------------------*/
class AviPlayer : public HWNDHost
{
public:
	static HRESULT NETUI_API Create(OUT Element** ppElement);

	// System events
	void OnPropertyChanged(PropertyInfo* ppi, int iIndex, Value* pvOld, Value* pvNew) override;

	// Control notifications
	void OnAfterInitHWND() override;

	// ClassInfo accessors (static and virtual instance-based)
	DEFINE_NETUI_CLASS_INFO;

	// Property definitions
	QUICKINT(AviResID);
	QUICKINT(AviResHinst);

	HRESULT Initialize(UINT nCreate, UINT nActive);
/*-----------------------------------------------------------------------------
	%%Owner:  LeeHu
	%%Id:  f375d296-bde3-4654-8269-6b8e6075a49e
-----------------------------------------------------------------------------*/
	HRESULT Initialize(UINT nActive) { return Initialize( HHC_CacheFont | HHC_SyncText | HHC_SyncPaint | HHC_MouseForward, nActive ); }  // REVIEW (leehu): is HHC_MouseForward really needed here?

	~AviPlayer();

protected:

	HWND CreateHWND(HWND hwndParent) override;

	void EnsureAVISet();

private:

	static BOOL CALLBACK _AviSinkWndProc(void* pThis, HWND hwnd, UINT nMsg, WPARAM wParam, LPARAM lParam, LRESULT* plRet);

	HBRUSH m_hBgBrush;
};


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  eb49bebc-b55a-4e61-a7df-b1842c32e39c
-----------------------------------------------------------------------------*/
AviPlayer::~AviPlayer()
{
	if (m_hBgBrush)
	{
		DeleteObject(m_hBgBrush);
		m_hBgBrush = NULL;
	}
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  c520d2da-a7d2-41ca-bada-6dd466140952
-----------------------------------------------------------------------------*/
HRESULT AviPlayer::Create(Element** ppElement)
{
	*ppElement = NULL;

	AviPlayer* pe = HNew(AviPlayer);
	if (!pe)
		return E_OUTOFMEMORY;

	HRESULT hr = pe->Initialize(AE_Inactive);
	if (FAILED(hr))
	{
		pe->Destroy();
		return E_OUTOFMEMORY;
	}

	*ppElement = pe;

	return S_OK;
}


/*-----------------------------------------------------------------------------
	%%Owner:  LeeHu
	%%Id:  1b51cd51-786f-4a3c-9fee-2414379e7f59
-----------------------------------------------------------------------------*/
HRESULT AviPlayer::Initialize(UINT nCreate, UINT nActive)
{
	HRESULT hr;

	m_hBgBrush = NULL;

	// Initialize Base
	hr = HWNDHost::Initialize(nCreate, nActive);
	if (FAILED(hr))
		return hr;

	return S_OK;
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  e61f49d5-3c1d-4d1b-93ad-a075486326f8
-----------------------------------------------------------------------------*/
HWND AviPlayer::CreateHWND(HWND hwndParent)
{
	// Subclass
	AttachWndProcW(hwndParent, _AviSinkWndProc, this);

    // Create the animation control.
    return Animate_Create( hwndParent, 0, WS_CHILD | WS_VISIBLE | ACS_AUTOPLAY | ACS_CENTER | ACS_TRANSPARENT, NULL );
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  1d07b1de-4cf7-4905-8c0c-e819178889d1
-----------------------------------------------------------------------------*/
BOOL CALLBACK AviPlayer::_AviSinkWndProc(void* pThis, HWND hwnd, UINT nMsg, WPARAM wParam, LPARAM lParam, LRESULT* plRet)
{
	UNREFERENCED(hwnd);
	UNREFERENCED(lParam);

	// If ACS_TRANSPARENT style is used, we'll get this message.
	if (nMsg == WM_CTLCOLORSTATIC)
	{
		AviPlayer* pAviPlayer = (AviPlayer*)pThis;

		if (pAviPlayer->m_hBgBrush)
		{
			DeleteObject( pAviPlayer->m_hBgBrush );
			pAviPlayer->m_hBgBrush = NULL;
		}

		SPValue spValue;
		const Fill* pFill = pAviPlayer->GetBackgroundColor(&spValue);
		if (pFill != NULL)
		{
			COLORREF color = pFill->GetPrimaryRGBColor();
			SetBkColor( (HDC)wParam, color );
			pAviPlayer->m_hBgBrush = CreateSolidBrush( color );
			*plRet = (LRESULT)pAviPlayer->m_hBgBrush;
			return TRUE;
		}
	}

	return FALSE;  // Pass to subclassed window proc
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  6b4408cd-a992-413c-a556-b6a1533e063f
-----------------------------------------------------------------------------*/
void AviPlayer::OnAfterInitHWND()
{
	// Call base
	HWNDHost::OnAfterInitHWND();

	EnsureAVISet();
}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  ad4b6282-6b2c-4694-9519-2e549fc7815c
-----------------------------------------------------------------------------*/
void AviPlayer::EnsureAVISet()
{
    // Open the AVI clip, and show the animation control.

	LPCWSTR resName = NULL;
	SPValue spvResID;

	int hInst = GetAviResHinst();

	spvResID.TransferFrom( GetValue(AviResIDPropInfo(), PI_Local) );

	if (spvResID != NULL)
	{
		if (spvResID->GetType() == DUIV_INT)
			resName = MAKEINTRESOURCE( spvResID->GetInt() );
		else if (spvResID->GetType() == DUIV_STRING)
			resName = spvResID->GetString();
	}

	Animate_OpenEx( GetHWND(), hInst, resName );

	//Animate_Play( GetHWND(), 0, -1, -1 );
}

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  1974d112-9911-4be4-8d0c-f9f389da043a
-----------------------------------------------------------------------------*/
void AviPlayer::OnPropertyChanged(PropertyInfo* ppi, int iIndex, Value* pvOld, Value* pvNew)
{
	if (IsProp(AviResID))
	{
		EnsureAVISet();
	}
	else if (IsProp(AviResHinst))
	{
		EnsureAVISet();
	}
	else if (IsProp(Background))
	{
		// Need to update transparent color, since SetBkColor() only has an effect
		// if set when first loading the AVI.
		EnsureAVISet();
	}

	HWNDHost::OnPropertyChanged(ppi, iIndex, pvOld, pvNew);
}


////////////////////////////////////////////////////////
// Property definitions

// AviResID property
IMPLEMENT_NETUI_PROPERTY_EX(AviPlayer, AviResID, PF_Normal, 0, ValueStatics::vvIntOrString, NULL, ValueStatics::pvIntZero);

// AviResHinst property
IMPLEMENT_NETUI_PROPERTY_EX(AviPlayer, AviResHinst, PF_Normal, 0, ValueStatics::vvInt, NULL, ValueStatics::pvIntZero );

////////////////////////////////////////////////////////
// ClassInfo (must appear after property definitions)

// Class properties
// NOTE:  This array must be sorted in case-insensitive alphabetical order by
// property name as stored in PropertyInfo::szName!!
const PropertyInfo* const _aAviPlayerPI[] =
{
	AviPlayer::AviResHinstProp,
	AviPlayer::AviResIDProp,
};

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_CLASS_INFO(AviPlayer, HWNDHost, L"AviPlayer", _aAviPlayerPI, NUIARRAYSIZE(_aAviPlayerPI), NUICloneNotSupported);

////////////////////////////////////////////////////////
// MyEventHandler - Registered event handler
//
// Registered event handler which can be used from XML
// for testing actions when listening to events.  To use,
// just set eventHandler="MyEventHandler", and away you go!
////////////////////////////////////////////////////////

/*-----------------------------------------------------------------------------
	%%Owner:  NRobarge
	%%Id:  da2dafba-832f-4e6e-87a9-0513cc5643a4
-----------------------------------------------------------------------------*/
class MyEventHandler : public BaseElementListener
{
public:
	DEFINE_NETUI_REGISTERED_ELEMENTLISTENER_INFO;
	static HRESULT Create(OUT IElementListener** ppEventListener);

/*-----------------------------------------------------------------------------
	%%Owner:  NRobarge
	%%Id:  1e0145ed-b88f-4375-9126-4a2c471d7273
-----------------------------------------------------------------------------*/
	DWORD GetEventFilter() override { return ELF_All; }

	bool OnListenedPropertyChanging(Node* peFrom, PropertyInfo* ppi, int iIndex, Value* pvOld, Value* pvNew) override;
	void OnListenedPropertyChanged(Node* peFrom, PropertyInfo* ppi, int iIndex, Value* pvOld, Value* pvNew) override;
	void OnListenedEvent(Element* peFrom, Event* pEvent) override;
	void OnListenedInput(Element* peFrom, InputEvent* pInput) override;
	void OnListenedAdjustLayout(Element * peAdjust, int cpxWidth, int cpxHeight, NUIDalManager& rDM, int iAttempt, bool &rfForceRetry) override;

	//__override void OnListenerAttach(Node* peFrom);
	//__override void OnListenerDetach(Node* peFrom);
	//__override void OnListenedDestroy(Node* peFrom);
	//__override void OnListenedChildAdded(Node* peParent, Node* peNewNode);
	//__override void OnListenedChildRemoved(Node* peParent, Node* peRemovedNode);
};

/*-----------------------------------------------------------------------------
	%%Owner:  PaulCole
	%%Id:  379b0458-fd5b-4bbc-a42c-4337d11a29ed
-----------------------------------------------------------------------------*/
class AdaptiveLayoutTestEventHandler : public BaseElementListener
{
public:
	DEFINE_NETUI_REGISTERED_ELEMENTLISTENER_INFO;
	static HRESULT Create(OUT IElementListener** ppEventListener);

/*-----------------------------------------------------------------------------
	%%Owner:  PaulCole
	%%Id:  c9b20648-f60f-434e-b10c-3edf1d1a6813
-----------------------------------------------------------------------------*/
	DWORD GetEventFilter() override { return ELF_AdjustLayout; }
	void OnListenedAdjustLayout(Element * peAdjust, int cpxWidth, int cpxHeight, NUIDalManager& rDM, int iAttempt, bool &rfForceRetry) override;
};



///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
/////////////////////// End Element subclasses ////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  812e189f-ecc8-4351-8731-a358b9e6ae6d
-----------------------------------------------------------------------------*/
HRESULT RegisterViewerNetUIControls()
{
	HRESULT hr;

	hr = NetPane::Register();
	if (FAILED(hr))
		goto LExit;

	AviPlayer::Register();
	MyEventHandler::Register();
	AdaptiveLayoutTestEventHandler::Register();
	Menu::Register();

	hr = NetUIDialog::Register();
	if (FAILED(hr))
		goto LExit;

LExit:
	return hr;
}


/*-----------------------------------------------------------------------------
	%%Owner:  MCrider
	%%Id:  42ce6937-a4d1-4c92-8c13-0bc83b89c173
-----------------------------------------------------------------------------*/
void UpdateDefaultStyle( int wmId )
{
	Value *pvStyle = NULL;

	switch (wmId)
	{
	case IDM_STYLE_NETUI:
		GetStoredStyle(GSID_OfficeStyles, &pvStyle);
		break;
	case IDM_STYLE_NETPANE:
		pvStyle = NetPane::GetDefaultStyle();
		break;
	case IDM_STYLE_NUIDIALOG:
		pvStyle = NetUIDialog::GetDefaultStyle();
		break;
	}

	if (g_pDocument != NULL)
	{
		g_pDocument->SetDefaultStyle( pvStyle );
		if (g_pDocument->GetRootElement() != NULL)
			g_pDocument->GetRootElement()->SetValue( Node::SheetPropInfo(), pvStyle );

		// And refresh, so the UI can be seen with the new default style.
		RefreshFile();
	}
}


/*-----------------------------------------------------------------------------
	%%Owner:  LeeHu
	%%Id: 793ee13e-8396-480d-844f-4209788c3cc5
-----------------------------------------------------------------------------*/
static bool FToggleTaskPaneLayout()
{
	if (g_pDocument == NULL)
		return false;

	HWNDElement *peRoot = nui_control_cast<HWNDElement>(g_pDocument->GetRootElement());
	if (peRoot == NULL)
		return false;

	peRoot->SetUseTaskPaneLayout(!peRoot->GetUseTaskPaneLayout());	

	if (g_hwndViewer != NULL)
		return FUpdateMenus(g_hwndViewer);

	return true;
}


/*-----------------------------------------------------------------------------
	%%Owner:  AndrewH
	%%Id:  119b4e44-3e0e-4e8c-8a8b-52de362774d6
-----------------------------------------------------------------------------*/
void ReleaseDefaultStyles()
{
	NetPane::ReleaseDefaultStyle();
	NetUIDialog::ReleaseDefaultStyle();
}


/*-----------------------------------------------------------------------------
	%%Owner:  PaulCole
	%%Id:  21fdecc7-d5ac-4a95-9315-ba852e82e4ca
-----------------------------------------------------------------------------*/
void AdaptiveLayoutTestEventHandler_OnListenedAdjustLayout(Element * peAdjust,
	int cpxWidth, int cpxHeight, NUIDalManager& rDM, int iAttempt)
{
	Element * peFindMe = NULL;
	const RECT * prc = NULL;
	Value * pv = NULL;

	if (cpxWidth > 0)
	{
		// right padding -> left padding -> hidden
		peFindMe = peAdjust->FindDescendentByID(L"findme");
		if (peFindMe)
		{
			prc = peFindMe->GetPadding( &pv ); // Padding.

			if (cpxWidth < 60)
				peFindMe->SetPadding(60, prc->top, 0, prc->bottom);
			else if (cpxWidth < 100)
				peFindMe->SetPadding(0, prc->top, 0, prc->bottom);
			else
				peFindMe->SetLayoutPos(LP_None);

			pv->Release();
			pv = NULL;

			return;
		}

		// right padding -> left padding
		peFindMe = peAdjust->FindDescendentByID(L"hpadding");
		if (peFindMe)
		{
			prc = peFindMe->GetPadding( &pv ); // Padding.

			if (cpxWidth < 60)
				peFindMe->SetPadding(60, prc->top, 0, prc->bottom);
			else
				peFindMe->SetPadding(0, prc->top, 0, prc->bottom);

			pv->Release();
			pv = NULL;

			return;
		}

		WCHAR wzRemoveMe[] = L"hremoveme0";
		AssertTag(0 <= iAttempt && iAttempt <= 9, ASSERTTAG('dziw'));
		wzRemoveMe[NUIARRAYSIZE(wzRemoveMe)-2] = '0' + static_cast<WCHAR>(iAttempt);
		peFindMe = peAdjust->FindDescendentByID(wzRemoveMe);
		if (peFindMe)
		{
			peFindMe->SetLayoutPos(LP_None);
			return;
		}

		peFindMe = peAdjust->FindDescendentByID(L"toh");
		if (peFindMe && peFindMe->GetLayout() != DLT_Horiz)
		{
			peFindMe->SetLayout(DLT_Horiz);
			DALLayout::RecreateFrame(peFindMe, rDM);
			return;
		}

		peFindMe = peAdjust->FindDescendentByID(L"tov");
		if (peFindMe && peFindMe->GetLayout() != DLT_Vert)
		{
			peFindMe->SetLayout(DLT_Vert);
			DALLayout::RecreateFrame(peFindMe, rDM);
			return;
		}

		if (iAttempt == 0)
		{
			WCHAR wzBigButton[] = L"bigbutton0";
			for(WCHAR wch = L'0'; wch <= '9';wch++)
			{
				wzBigButton[NUIARRAYSIZE(wzBigButton)-2] = wch;
				peFindMe = peAdjust->FindDescendentByID(wzBigButton);
				if (!peFindMe)
					break;

				peFindMe = peFindMe->FindSelfOrDescendent(SimpleButton::GetStaticClassInfo());
				if (!peFindMe)
					return;

				Element * peImage = peFindMe->FindDescendent(Image::GetStaticClassInfo());
				if (!peImage)
					return;

				peFindMe->SetExpandToFillVert(false);
				peImage->SetWidth(16);
				peImage->SetHeight(16);
				peFindMe->SetLayout(DLT_Horiz);
				DALLayout::RecreateFrame(peFindMe, rDM);
			}
		}
	}

	if (cpxHeight > 0)
	{
		// bottom padding -> top padding
		peFindMe = peAdjust->FindDescendentByID(L"vpadding");
		if (peFindMe)
		{
			prc = peFindMe->GetPadding( &pv ); // Padding.

			if (cpxHeight < 60)
				peFindMe->SetPadding(prc->left, 60, prc->right, 0);
			else
				peFindMe->SetPadding(prc->left, 0, prc->right, 0);

			pv->Release();
			pv = NULL;

			return;
		}

		bool fRemovedSome = false;
		WCHAR wzRemoveMe[] = L"vremoveme0";
		for(WCHAR wch = L'0'; cpxHeight > 0 && wch <= '9';wch++)
		{
			wzRemoveMe[NUIARRAYSIZE(wzRemoveMe)-2] = wch;
			peFindMe = peAdjust->FindDescendentByID(wzRemoveMe);

			if (peFindMe)
			{
				fRemovedSome = true;
				peFindMe->SetLayoutPos(LP_None);
				cpxHeight -= peFindMe->GetSizeDuringLayout(rDM).cy;
			}
		}
		if (fRemovedSome)
			return;
	}
}


///////////////////////////////////////////////////////////////////////
// MyEventHandler implementation
///////////////////////////////////////////////////////////////////////

IMPLEMENT_REGISTERED_ELEMENTLISTENERINFO(MyEventHandler);

/*-----------------------------------------------------------------------------
	%%Owner:  NRobarge
	%%Id:  99c621b3-fede-4cf2-b5a6-7b1b8607705a
-----------------------------------------------------------------------------*/
HRESULT MyEventHandler::Create( OUT IElementListener** ppEventListener )
{
	if (ppEventListener == NULL)
		return E_INVALIDARG;

	MyEventHandler* peh = HNew(MyEventHandler);
	if (!peh)
		return E_OUTOFMEMORY;

	*ppEventListener = peh;

	return S_OK;
}

/*-----------------------------------------------------------------------------
	%%Owner:  NRobarge
	%%Id:  daace100-f7a3-4575-b655-35e17ece0984
-----------------------------------------------------------------------------*/
bool MyEventHandler::OnListenedPropertyChanging(Node* peFrom, PropertyInfo* ppi, int iIndex, Value* pvOld, Value* pvNew)
{
	peFrom; ppi; iIndex; pvOld; pvNew;
	//DUITrace( "MyEventHandler received property changing: %s\n", ppi->szName );
	if (ppi == Element::TextPropInfo() && iIndex == PI_Local)
	{
		DUITrace( "Text property changing.\n" );
	}
	return true;
}

/*-----------------------------------------------------------------------------
	%%Owner:  NRobarge
	%%Id:  3ec9abf2-e48a-4b43-af77-279d998ad009
-----------------------------------------------------------------------------*/
void MyEventHandler::OnListenedPropertyChanged(Node* peFrom, PropertyInfo* ppi, int iIndex, Value* pvOld, Value* pvNew)
{
	peFrom; ppi; iIndex; pvOld; pvNew;
	//DUITrace( "MyEventHandler received property changed: %s\n", ppi->szName );
	if (ppi == Element::TextPropInfo() && iIndex == PI_Local)
	{
		DUITrace( "Text property changed.\n" );
	}
}

/*-----------------------------------------------------------------------------
	%%Owner:  NRobarge
	%%Id:  f996bac4-446a-4877-a702-13fe3c8b6a6e
-----------------------------------------------------------------------------*/
void MyEventHandler::OnListenedEvent(Element* peFrom, Event* pEvent)
{
	peFrom; pEvent;
	if (pEvent->nStage == GMF_DIRECT)
	{
		//DUITrace( "MyEventHandler 0x%p received event 0x%p\n", this, pEvent->uidType, pEvent->nStage );
		//::MessageBox( NULL, L"Event Handler called", L"MyEventHandler", MB_OK | MB_TASKMODAL );
		if (pEvent->uidType == SimpleButton::UIDClick())
		{
		}
		//else if (pEvent->uidType == Checkbox::UIDCheckboxStateChange())
		//{
		//}
		else if (pEvent->uidType == ListControl::UIDSelectionChange())
		{
		}
	}
	else if (pEvent->nStage == GMF_BUBBLED)
	{
		//DUITrace( "MyEventHandler 0x%p received bubbled event 0x%p\n", this, pEvent->uidType, pEvent->nStage );
		//::MessageBox(NULL, L"Event Handler called for bubbled event", L"MyEventHandler", MB_OK | MB_TASKMODAL);
	}
}

/*-----------------------------------------------------------------------------
	%%Owner:  NRobarge
	%%Id:  713a7022-b0ee-483c-900c-e1ae88a45294
-----------------------------------------------------------------------------*/
void MyEventHandler::OnListenedInput(Element* peFrom, InputEvent* pInput)
{
	peFrom;
	if (pInput->nStage == GMF_DIRECT)
	{
		//DUITrace( "MyEventHandler %u received input event %u\n", this, pInput->nCode );
	}
}

/*-----------------------------------------------------------------------------
	%%Owner:  PaulCole
	%%Id:  84e187a4-1f08-462c-aad4-fa7cd9804ff9
-----------------------------------------------------------------------------*/
void MyEventHandler::OnListenedAdjustLayout(Element * peAdjust, int cpxWidth,
	int cpxHeight, NUIDalManager& rDM, int iAttempt, bool &rfForceRetry)
{
	UNREFERENCED_PARAMETER(rfForceRetry);

	AdaptiveLayoutTestEventHandler_OnListenedAdjustLayout(peAdjust, cpxWidth,
		cpxHeight, rDM, iAttempt);
}


///////////////////////////////////////////////////////////////////////
// AdaptiveLayoutTestEventHandler implementation
///////////////////////////////////////////////////////////////////////

IMPLEMENT_REGISTERED_ELEMENTLISTENERINFO(AdaptiveLayoutTestEventHandler);

/*-----------------------------------------------------------------------------
	%%Owner:  PaulCole
	%%Id:  52f23da8-1a6b-4955-bca4-99eb06e693b1
-----------------------------------------------------------------------------*/
HRESULT AdaptiveLayoutTestEventHandler::Create( OUT IElementListener** ppEventListener )
{
	if (ppEventListener == NULL)
		return E_INVALIDARG;

	AdaptiveLayoutTestEventHandler* peh = HNew(AdaptiveLayoutTestEventHandler);
	if (!peh)
		return E_OUTOFMEMORY;

	*ppEventListener = peh;

	return S_OK;
}

/*-----------------------------------------------------------------------------
	%%Owner:  PaulCole
	%%Id:  c17c73a4-90ef-4588-8ee3-2780a94c0159
-----------------------------------------------------------------------------*/
void AdaptiveLayoutTestEventHandler::OnListenedAdjustLayout(Element * peAdjust,
	int cpxWidth, int cpxHeight, NUIDalManager& rDM, int iAttempt, bool &rfForceRetry)
{
	UNREFERENCED_PARAMETER(rfForceRetry);

	AdaptiveLayoutTestEventHandler_OnListenedAdjustLayout(peAdjust, cpxWidth,
		cpxHeight, rDM, iAttempt);
}


///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
// AnchorContentIDMap and ViewerCtxUIUser
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////


/*-----------------------------------------------------------------------------
	class AnchorContentIDMap

	AnchorContentIDMap supports being able to specify a FlexMLContentID to
	Filename map which allows this other file to be used as the content for
	a popup CtxUI window.  Example use:

	     <AnchorContentIDMap FlexMLContentID="555" Filename="D:\AutoCompleteDropdown.flexml" />
	     <FlyoutAnchor ... FlexMLContentID="555" />

	%%Owner:  MCrider
	%%Id: 0144905e-09a3-4f05-957d-da34ffc78246
-----------------------------------------------------------------------------*/
class AnchorContentIDMap : public Node
{
public:
	/*---------------------------------------------------------------------------
		%%Owner: MCrider
		%%Id: 39d1ccd8-75ec-4ed3-8103-e95c3e023b47
	---------------------------------------------------------------------------*/
	static HRESULT Create(Node **ppNode)
	{
		CommonNodeCreate(AnchorContentIDMap, ppNode)
	}

	QUICKINT(FlexMLContentID);
	QUICKSTR(Filename);

	bool OnPropertyChanging(PropertyInfo *ppi, int iIndex, Value *pvOld, Value *pvNew) override;

	static const WCHAR* FindFilenameForContentID(const Node *pnRoot, int id, Value **ppv);

	// ClassInfo accessors (static and virtual instance-based)
	DEFINE_NETUI_CLASS_INFO;
};


/*-----------------------------------------------------------------------------
	AnchorContentIDMap::OnPropertyChanging

	%%Owner:  MCrider
	%%Id: e0492737-5194-406a-841e-47a0d06ce085
-----------------------------------------------------------------------------*/
bool AnchorContentIDMap::OnPropertyChanging(PropertyInfo *ppi, int iIndex, Value *pvOld, Value *pvNew)
{
	if (ppi == FlexMLContentIDProp && !Value::IsNull(pvNew))
	{
		int rcidFlexML = pvNew->GetInt();

		if ((rcidFlexML >= msoctxuircidflexmlNil) && (rcidFlexML <= msoctxuircidflexmlReserved))
		{
			CASSERT(msoctxuircidflexmlReserved == 99);
			AssertSzTag(false, "FlexMLContentID on AnchorContentIDMap must be greater than 100.", ASSERTTAG('xhek'));
			return false;
		}
	}
	return __super::OnPropertyChanging(ppi, iIndex, pvOld, pvNew);
}


/*-----------------------------------------------------------------------------
	AnchorContentIDMap::FindFilenameForContentID

	%%Owner:  MCrider
	%%Id: 8de6db27-dcfc-4b18-996d-0c7708ddd413
-----------------------------------------------------------------------------*/
/*static*/ const WCHAR* AnchorContentIDMap::FindFilenameForContentID(const Node *pnRoot, int id, Value **ppv)
{
	TreeIterator iter(pnRoot);
	Node *pnCur = iter.FirstNode();
	while (pnCur != NULL)
	{
		AnchorContentIDMap *pnMap = nui_control_cast<AnchorContentIDMap>(pnCur);
		if (pnMap != NULL && pnMap->GetFlexMLContentID() == id)
		{
			// Found a match.
			*ppv = pnMap->GetValue(FilenameProp, RetIdx(FilenameProp));
			if (!Value::IsNull(*ppv))
				return (*ppv)->GetString();
		}

		pnCur = iter.NextSubTreeNode(pnCur);
	}

	return NULL;
}


// FlexMLContentID Property
IMPLEMENT_NETUI_PROPERTY_EX(AnchorContentIDMap, FlexMLContentID, PF_Normal, PG_None, ValueStatics::vvInt, NULL, &ValueStatics::svIntNegOne);

// Filename Property
IMPLEMENT_NETUI_PROPERTY_EX(AnchorContentIDMap, Filename, PF_Normal, PG_None, ValueStatics::vvString, NULL, &ValueStatics::svStringNull);

const PropertyInfo* const _aPIAnchorContentIDMap[] =
{
	AnchorContentIDMap::FilenameProp,
	AnchorContentIDMap::FlexMLContentIDProp,
};

// Define class info with type and base type, set static class pointer
IMPLEMENT_NETUI_NODE_CLASS_INFO(AnchorContentIDMap, Node, L"AnchorContentIDMap", _aPIAnchorContentIDMap, _countof(_aPIAnchorContentIDMap), NetUI::NUICloneSupported);


/*-----------------------------------------------------------------------------
	class ViewerCtxUIUser

	%%Owner:  MCrider
	%%Id: 04d3d8be-613e-46d9-bb87-6ea22d93f0a9
-----------------------------------------------------------------------------*/
class ViewerCtxUIUser : public NetUI::CtxUIUser
{
public:
	static HRESULT Create(IMsoCtxUIUser **ppUser);

	HRESULT HrCreateContent(IMsoCtxUITarget *picuit, Element **ppeContent) override;
};


/*-----------------------------------------------------------------------------
	CreateViewerCtxUIUser

	%%Owner:  MCrider
	%%Id: e52cf170-c4db-4807-8972-8a2cd48d7589
-----------------------------------------------------------------------------*/
HRESULT CreateViewerCtxUIUser(IMsoCtxUIUser **ppUser)
{
	// Register the AnchorContentIDMap so FlexMLContentID -> Filename mappings can
	// be specified in .flexml/.flex files.
	AnchorContentIDMap::Register();

	// Create the ViewerCtxUIUser which will use any AnchorContentIDMap-pings.
	return ViewerCtxUIUser::Create(ppUser);
}


/*-----------------------------------------------------------------------------
	ViewerCtxUIUser::Create

	%%Owner:  MCrider
	%%Id: 567e84e8-2e64-4b09-bfab-b09714e2e5c7
-----------------------------------------------------------------------------*/
HRESULT ViewerCtxUIUser::Create(IMsoCtxUIUser **ppUser)
{
	*ppUser = HNew(ViewerCtxUIUser);
	return (*ppUser == NULL) ? E_OUTOFMEMORY : S_OK;
}


/*-----------------------------------------------------------------------------
	ViewerCtxUIUser::HrCreateContent

	Creates content from FlexML files specified via AnchorContentIDMap nodes,
	or calls the base class for any built-in FlexUI content.

	%%Owner:  MCrider
	%%Id: 665a9422-8a2d-48da-822b-a50c5b598709
-----------------------------------------------------------------------------*/
HRESULT ViewerCtxUIUser::HrCreateContent(IMsoCtxUITarget *picuit, Element **ppeContent)
{
	if ((ppeContent == NULL) || (picuit == NULL))
		return E_INVALIDARG;

	// Check to see if there is an AnchorContentIDMap specifying a filename
	// for the specified FlexMLContentID in this CtxUI Target.
	SPValue spvFilename;
	const WCHAR *wzFilename = AnchorContentIDMap::FindFilenameForContentID(
		g_pDocument->GetRootElement(),
		picuit->GetRcidFlexML(),
		&spvFilename);

	// If there was no mapping, just let the base implementation take care of it.
	if (wzFilename == NULL)
		return __super::HrCreateContent(picuit, ppeContent);

	// There was a mapping, so create a MarkupContainer to load it.
	CntPtrTo<IMarkupContainer> spMC;
	HRESULT hr = CreateMarkupContainer(NULL, &spMC);
	AssertTag(SUCCEEDED(hr), ASSERTTAG('xhel'));
	if (FAILED(hr))
		return hr;

	// Parse in the FlexML from the specified file.
	hr = spMC->ParseFile(wzFilename);
	AssertTag(SUCCEEDED(hr), ASSERTTAG('xhem'));
	if (FAILED(hr))
		return hr;

	// Extract the root element.
	*ppeContent = spMC->ExtractRootElement();
	return (*ppeContent == NULL) ? E_FAIL : S_OK;
}

