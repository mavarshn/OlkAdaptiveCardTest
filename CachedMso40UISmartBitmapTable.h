/*------------------------------------------------------------------------------ 
	This is a cached copy of the Mso40UISmartBitmapTable.h, don't modify manually.
	Run UpdateStyleRes.bat to update this file, along with all the SmartBitmaps   
------------------------------------------------------------------------------*/ 
/*****************************************************************************
	Mso40UISmartBitmapTable.h

	SmartBitmap definitions.  This file is processed by nuicl.exe and is
	included into multiple other files.

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

	Alternate themes can be defined in NUISmartBitmapThemes.h.  If
	a bitmap with the name Name.Theme.png exists then it will be used when
	that theme is active otherwise the original bitmap will be rendered.

	Copyright (c) Microsoft Corporation. All rights reserved.
*****************************************************************************/

//
// Scaling Sets
// It is possible to have a set of bitmaps which represent the same image at different sizes (similar to tcid icons).
// Each of these bitmaps can have different nine-grid margins, etc, which describe how it is drawn.
// Scaling sets should be placed in the SmartBitmap table sorted from largest to smallest in consecutive order.
// The last bitmap in the set (the smallest or single bitmap sets) should have the "Smallest In Scaling Set" column set to true.
//

#ifdef NUI_SB

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Ribbon                                NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( FsChunk,                             3,       1,    42,    3,    42,        true,       true,     true,     false,      true,         true   )
NUI_SB( FsCollapsedChunk,                    3,       1,    42,    3,    42,        true,       true,     true,     false,      true,         true   )
NUI_SB( FsChunkHover,                        1,       4,     4,    4,     4,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsCollapsedChunkUnderlay,            1,       4,     4,    5,     5,        true,       true,     true,      true,     false,         true   )
NUI_SB( FsUpperRibbonShadow,                 1,       0,     0,    0,     0,        true,      false,     true,     false,     false,         true   )
NUI_SB( FsLowerBackground_Bottom,            1,       0,     1,    2,     5,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsOfficeButton,                      7,      27,     8,   27,    15,        true,       true,     true,     false,      true,         true   )
NUI_SB( FsPopupChunkBackground,              1,       5,     5,    5,    47,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsSeparator,                         1,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )
NUI_SB( FsSeparatorSmall,                    1,       0,     0,    0,     0,        true,      false,    false,     false,     false,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Common Controls                       NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( FsButtonArrow_192,                   5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsButtonArrow_144,                   5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsButtonArrow_120,                   5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsButtonArrow,                       5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( FsButtonArrowLarge_192,              5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsButtonArrowLarge_144,              5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsButtonArrowLarge_120,              5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsButtonArrowLarge,                  5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( FsLightScrollbarBottomArrowVert_192, 4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarBottomArrowVert_144, 4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarBottomArrowVert_120, 4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarBottomArrowVert,     4,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsLightScrollbarLeftArrowHoriz_192,  4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarLeftArrowHoriz_144,  4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarLeftArrowHoriz_120,  4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarLeftArrowHoriz,      4,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsLightScrollbarRightArrowHoriz_192, 4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarRightArrowHoriz_144, 4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarRightArrowHoriz_120, 4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarRightArrowHoriz,     4,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsLightScrollbarThumbBarHoriz_192,   3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarThumbBarHoriz_144,   3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarThumbBarHoriz_120,   3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarThumbBarHoriz,       3,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsLightScrollbarThumbBarVert_192,    3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarThumbBarVert_144,    3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarThumbBarVert_120,    3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarThumbBarVert,        3,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsLightScrollbarTopArrowVert_192,    4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarTopArrowVert_144,    4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarTopArrowVert_120,    4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsLightScrollbarTopArrowVert,        4,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsScrollbarBottomArrowVert_192,      4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarBottomArrowVert_144,      4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarBottomArrowVert_120,      4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarBottomArrowVert,          4,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsScrollbarLeftArrowHoriz_192,       4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarLeftArrowHoriz_144,       4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarLeftArrowHoriz_120,       4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarLeftArrowHoriz,           4,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsScrollbarRightArrowHoriz_192,      4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarRightArrowHoriz_144,      4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarRightArrowHoriz_120,      4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarRightArrowHoriz,          4,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsScrollbarThumbBarHoriz_192,        3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarThumbBarHoriz_144,        3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarThumbBarHoriz_120,        3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarThumbBarHoriz,            3,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsScrollbarThumbBarVert_192,         3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarThumbBarVert_144,         3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarThumbBarVert_120,         3,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarThumbBarVert,             3,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsScrollbarTopArrowVert_192,         4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarTopArrowVert_144,         4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarTopArrowVert_120,         4,       1,     1,    1,     1,       false,       true,     true,     false,     false,        false   )
NUI_SB( FsScrollbarTopArrowVert,             4,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// QAT                                   NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( FsSeparatorQAT,                      1,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// App Frame                             NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( FsFrameCloseGlyph_192,               5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameCloseGlyph_144,               5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameCloseGlyph_120,               5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameCloseGlyph,                   5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( FsFrameFullScreenModeGlyph_192,      5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameFullScreenModeGlyph_144,      5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameFullScreenModeGlyph_120,      5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameFullScreenModeGlyph,          5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( FsFrameRibbonModeGlyph_192,          5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameRibbonModeGlyph_144,          5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameRibbonModeGlyph_120,          5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameRibbonModeGlyph,              5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( FsFrameMaximizeGlyph_192,            5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameMaximizeGlyph_144,            5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameMaximizeGlyph_120,            5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameMaximizeGlyph,                5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( FsFrameMinimizeGlyph_144,            5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameMinimizeGlyph_120,            5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameMinimizeGlyph,                5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( FsFrameRestoreGlyph_192,             5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameRestoreGlyph_144,             5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameRestoreGlyph_120,             5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFrameRestoreGlyph,                 5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( FsFrameHelpGlyph_192,                5,       0,     0,    0,     0,        true,      false,    false,      true,      true,        false   )
NUI_SB( FsFrameHelpGlyph_144,                5,       0,     0,    0,     0,        true,      false,    false,      true,      true,        false   )
NUI_SB( FsFrameHelpGlyph_120,                5,       0,     0,    0,     0,        true,      false,    false,      true,      true,        false   )
NUI_SB( FsFrameHelpGlyph,                    5,       0,     0,    0,     0,        true,      false,    false,      true,      true,         true   )
NUI_SB( FsFrameFullScreenModeTriggerButton_192,3,     0,     0,    0,     0,        true,      false,    false,      true,      true,        false   )
NUI_SB( FsFrameFullScreenModeTriggerButton_144,3,     0,     0,    0,     0,        true,      false,    false,      true,      true,        false   )
NUI_SB( FsFrameFullScreenModeTriggerButton_120,3,     0,     0,    0,     0,        true,      false,    false,      true,      true,        false   )
NUI_SB( FsFrameFullScreenModeTriggerButton,  3,       0,     0,    0,     0,        true,      false,    false,      true,      true,         true   )
NUI_SB( FsFsmRibbonModeGlyph_192,            5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFsmRibbonModeGlyph_144,            5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFsmRibbonModeGlyph_120,            5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( FsFsmRibbonModeGlyph,                5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Ribbon Tabs                           NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( FsContextualFlag01_Bottom,           1,       2,     2,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag01_Top,              1,       2,     4,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag02_Bottom,           1,       2,     2,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag02_Top,              1,       2,     4,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag03_Bottom,           1,       2,     2,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag03_Top,              1,       2,     4,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag04_Bottom,           1,       2,     2,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag04_Top,              1,       2,     4,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag05_Bottom,           1,       2,     2,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag05_Top,              1,       2,     4,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag06_Bottom,           1,       2,     2,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag06_Top,              1,       2,     4,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag07_Bottom,           1,       2,     2,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualFlag07_Top,              1,       2,     4,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualTab,                     4,       3,     2,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsContextualTabOverlay,              1,       3,     0,    3,     0,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsTab01,                             2,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsTab02,                             2,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsTab03,                             2,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsTab04,                             2,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsTab05,                             2,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsTab06,                             2,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsTab07,                             2,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )
NUI_SB( FsTabDividerLine,                    1,       0,     0,    0,     0,        true,      false,    false,     false,     false,         true   )
NUI_SB( FsTabOutlineDivider,                 1,       0,     0,    0,     1,        true,       true,     true,     false,     false,         true   )
NUI_SB( FsTab,                               2,       1,     1,    1,     1,       false,       true,     true,     false,     false,         true   )


//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Menus                                 NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( MenuBigBtnItemContent,               4,       2,     2,    2,     2,        true,       true,     true,     false,      true,         true   )
NUI_SB( MenuBigBtnItemSelected,              1,       6,     6,    6,     6,        true,       true,     true,     false,     false,         true   )
NUI_SB( MenuBigBtnItemSplit,                 4,       2,     6,    6,     6,        true,       true,     true,     false,      true,         true   )
NUI_SB( MenuDisabledBigBtnItemSelected,      1,       6,     6,    6,     6,        true,       true,     true,     false,     false,         true   )
NUI_SB( MenuDisabledItemSelected,            1,       6,     6,    6,     6,        true,       true,     true,     false,     false,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Galleries                             NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( GalleryScrollArrowDown_192,          7,       0,     0,    0,     0,        true,      false,     true,     false,      true,        false   )
NUI_SB( GalleryScrollArrowDown_144,          7,       0,     0,    0,     0,        true,      false,     true,     false,      true,        false   )
NUI_SB( GalleryScrollArrowDown_120,          7,       0,     0,    0,     0,        true,      false,     true,     false,      true,        false   )
NUI_SB( GalleryScrollArrowDown,              7,       0,     0,    0,     0,        true,      false,     true,     false,      true,         true   )
NUI_SB( GalleryScrollArrowUp_192,            4,       0,     0,    0,     0,        true,      false,     true,     false,      true,        false   )
NUI_SB( GalleryScrollArrowUp_144,            4,       0,     0,    0,     0,        true,      false,     true,     false,      true,        false   )
NUI_SB( GalleryScrollArrowUp_120,            4,       0,     0,    0,     0,        true,      false,     true,     false,      true,        false   )
NUI_SB( GalleryScrollArrowUp,                4,       0,     0,    0,     0,        true,      false,     true,     false,      true,         true   )
NUI_SB( GalleryBottomRightCornerGrippie,     1,       0,     0,    0,     0,        true,      false,     true,     false,      true,         true   )
NUI_SB( GalleryTopRightCornerGrippie,        1,       0,     0,    0,     0,        true,      false,     true,     false,      true,         true   )
NUI_SB( GalleryVertGrippie,                  1,       0,     0,    0,     0,        true,      false,     true,     false,     false,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Status Bar                            NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( SbBgDivider,                         1,       0,     0,    0,     0,       false,       true,     true,      true,      true,         true   )
NUI_SB( SbFarBg,                             1,       0,     0,    0,     0,       false,      false,     true,     false,     false,         true   )
NUI_SB( SbGrippie,                           1,       0,     0,    0,     0,        true,      false,     true,      true,      true,         true   )
NUI_SB( SbGroupDivider,                      1,       0,     0,    0,     0,        true,      false,     true,     false,     false,         true   )
NUI_SB( SbPBarDet_192,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarDet_168,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarDet_144,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarDet_120,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarDet,                           1,       0,     0,    0,     0,       false,      false,     true,     false,      true,         true   )
NUI_SB( SbPBarErr_192,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarErr_168,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarErr_144,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarErr_120,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarErr,                           1,       0,     0,    0,     0,       false,      false,     true,     false,      true,         true   )
NUI_SB( SbPBarInd_192,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarInd_168,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarInd_144,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarInd_120,                       1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarInd,                           1,       0,     0,    0,     0,       false,      false,     true,     false,      true,         true   )
NUI_SB( SbPBarIndErr_192,                    1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarIndErr_168,                    1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarIndErr_144,                    1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarIndErr_120,                    1,       0,     0,    0,     0,       false,      false,     true,     false,      true,        false   )
NUI_SB( SbPBarIndErr,                        1,       0,     0,    0,     0,       false,      false,     true,     false,      true,         true   )
NUI_SB( SbSliderMinus_192,                   4,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( SbSliderMinus_120,                   4,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( SbSliderMinus,                       4,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )
NUI_SB( SbSliderPlus_192,                    4,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( SbSliderPlus_120,                    4,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( SbSliderPlus,                        4,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )
NUI_SB( SbSliderTextSizeMinus_120,           4,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( SbSliderTextSizeMinus,               4,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )
NUI_SB( SbSliderTextSizePlus_120,            4,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( SbSliderTextSizePlus,                4,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )
NUI_SB( SbSliderThumb_192,                   4,       0,     0,    0,     0,        true,      false,     true,     false,     false,        false   )
NUI_SB( SbSliderThumb,                       4,       0,     0,    0,     0,        true,      false,     true,     false,     false,         true   )
NUI_SB( SbStatusItemBg,                      2,      20,     8,   21,    10,        true,       true,     true,     false,     false,         true   )
NUI_SB( SbViewButtonBg,                      3,       3,     2,    3,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( SbViewNormal_240,                    2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewNormal_192,                    2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewNormal_144,                    2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewNormal_120,                    2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewNormal,                        2,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( SbViewOutline_240,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewOutline_192,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewOutline_144,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewOutline_120,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewOutline,                       2,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( SbViewPage_240,                      2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewPage_192,                      2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewPage_144,                      2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewPage_120,                      2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewPage,                          2,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( SbViewReading_240,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewReading_192,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewReading_144,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewReading_120,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewReading,                       2,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( SbViewSlideNormal_240,               2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideNormal_192,               2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideNormal_144,               2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideNormal_120,               2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideNormal,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( SbViewSlideShow_240,                 2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideShow_192,                 2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideShow_144,                 2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideShow_120,                 2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideShow,                     2,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( SbViewSlideSorter_240,               2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideSorter_192,               2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideSorter_144,               2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideSorter_120,               2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewSlideSorter,                   2,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( SbViewWeb_240,                       2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewWeb_192,                       2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewWeb_144,                       2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewWeb_120,                       2,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( SbViewWeb,                           2,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( SbWidgetArrow,                       4,       2,     2,    2,     2,        true,       true,     true,     false,     false,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Work Pane                             NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( WpButtonArrow_192,                   5,       0,     0,    0,     0,        true,      false,    false,      true,      false,       false   )
NUI_SB( WpButtonArrow_144,                   5,       0,     0,    0,     0,        true,      false,    false,      true,      false,       false   )
NUI_SB( WpButtonArrow_120,                   5,       0,     0,    0,     0,        true,      false,    false,      true,      false,       false   )
NUI_SB( WpButtonArrow,                       5,       0,     0,    0,     0,        true,      false,    false,      true,      false,        true   )
NUI_SB( WpLabelButton,                       7,       3,    10,    3,    11,        true,       true,     true,     false,     false,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Miscellaneous                         NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( CommentChecksIcon_120,               8,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( CommentChecksIcon,                   8,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )
NUI_SB( CommentToggleBoxesIcon,              8,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )
NUI_SB( MenuRadioButtonsExtraLarge,          4,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( MenuRadioButtonsLarge,               4,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( MenuRadioButtons,                    4,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( WpDottedLineVert,                    2,       0,     0,    0,     0,        true,       true,    false,     false,     false,         true   )
NUI_SB( WpTabDivider,                        1,       1,     8,    0,     8,        true,       true,    false,     false,      true,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Notifications                         NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( UnlicensedNotification,              1,       1,    19,    1,     1,        true,       true,     true,     false,     false,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Office Start UX                       NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( AppLogoAnimated,                    35,       0,     0,    0,     0,        true,      false,    false,      true,      true,         true   )

//                                                  |-Nine-grid margins-------|                                  Keep Aspect               Smallest In
// Outspace                              NumFrames   Left   Top  Right  Bottom   fAlphaBlend  fNineGrid fStretch    Ratio    fFlipInRTL    Scaling Set
NUI_SB( OCCatPaneOverlay,                    1,       2,     2,    2,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( OsAppFrameHelper,                    1,       0,     6,    0,     2,       false,       true,     true,     false,      true,         true   )
NUI_SB( OsAppFrameHelperInactive,            1,       0,     6,    0,     2,       false,       true,     true,     false,      true,         true   )
NUI_SB( OsButton,                            7,       9,     9,    9,    10,        true,       true,     true,     false,     false,         true   )
NUI_SB( OsButtonArrow_192,                   5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( OsButtonArrow_144,                   5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( OsButtonArrow,                       5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( OsCanvasArrow_192,                   5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( OsCanvasArrow_144,                   5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( OsCanvasArrow_120,                   5,       0,     0,    0,     0,        true,      false,    false,      true,     false,        false   )
NUI_SB( OsCanvasArrow,                       5,       0,     0,    0,     0,        true,      false,    false,      true,     false,         true   )
NUI_SB( OsCheckbox_192,                      8,       3,     3,    3,     3,        true,       true,     true,      true,     false,        false   )
NUI_SB( OsCheckbox_144,                      8,       3,     3,    3,     3,        true,       true,     true,      true,     false,        false   )
NUI_SB( OsCheckbox_120,                      8,       3,     3,    3,     3,        true,       true,     true,      true,     false,        false   )
NUI_SB( OsCheckbox,                          8,       3,     3,    3,     3,        true,       true,     true,      true,     false,         true   )
NUI_SB( OsComboboxDropButton,                7,       6,     6,    6,     6,        true,       true,     true,     false,      true,         true   )
NUI_SB( OsGalleryRichDropdown,               5,       5,     5,    5,     5,        true,       true,     true,     false,      true,         true   )
NUI_SB( OsLoudSlab,                          1,       1,     2,    1,     2,        true,       true,     true,     false,     false,         true   )
NUI_SB( OsLoudestSlab,                       1,       1,     4,    1,     1,        true,       true,     true,     false,     false,         true   )
NUI_SB( OsOfficeButton_192,                  3,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( OsOfficeButton_144,                  3,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( OsOfficeButton_120,                  3,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( OsOfficeButton,                      3,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )
NUI_SB( OsOfficeButton_Flipped_192,          3,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( OsOfficeButton_Flipped_144,          3,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( OsOfficeButton_Flipped_120,          3,       0,     0,    0,     0,        true,      false,     true,      true,     false,        false   )
NUI_SB( OsOfficeButton_Flipped,              3,       0,     0,    0,     0,        true,      false,     true,      true,     false,         true   )
NUI_SB( OsPushPinButton_192,                 4,       0,     0,    0,     0,        true,      false,    false,      true,      true,        false   )
NUI_SB( OsPushPinButton_144,                 4,       0,     0,    0,     0,        true,      false,    false,      true,      true,        false   )
NUI_SB( OsPushPinButton_120,                 4,       0,     0,    0,     0,        true,      false,    false,      true,      true,        false   )
NUI_SB( OsPushPinButton,                     4,       0,     0,    0,     0,        true,      false,    false,      true,      true,         true   )
NUI_SB( OsSpinnerDown,                       3,       4,     4,    4,     4,        true,       true,     true,     false,      true,         true   )
NUI_SB( OsSpinnerUp,                         3,       4,     4,    4,     4,        true,       true,     true,     false,      true,         true   )
NUI_SB( OsTextbox,                           5,       5,     5,    5,     5,        true,       true,     true,     false,      true,         true   )
NUI_SB( OsZoomSliderMinus_192,               4,       0,     0,    0,     0,        true,      false,     true,      true,      true,        false   )
NUI_SB( OsZoomSliderMinus_144,               4,       0,     0,    0,     0,        true,      false,     true,      true,      true,        false   )
NUI_SB( OsZoomSliderMinus_120,               4,       0,     0,    0,     0,        true,      false,     true,      true,      true,        false   )
NUI_SB( OsZoomSliderMinus,                   4,       0,     0,    0,     0,        true,      false,     true,      true,      true,         true   )
NUI_SB( OsZoomSliderPlus_192,                4,       0,     0,    0,     0,        true,      false,     true,      true,      true,        false   )
NUI_SB( OsZoomSliderPlus_144,                4,       0,     0,    0,     0,        true,      false,     true,      true,      true,        false   )
NUI_SB( OsZoomSliderPlus_120,                4,       0,     0,    0,     0,        true,      false,     true,      true,      true,        false   )
NUI_SB( OsZoomSliderPlus,                    4,       0,     0,    0,     0,        true,      false,     true,      true,      true,         true   )
NUI_SB( OsZoomSliderThumb_192,               4,       0,     0,    0,     0,        true,       true,     true,      true,      true,        false   )
NUI_SB( OsZoomSliderThumb_144,               4,       0,     0,    0,     0,        true,       true,     true,      true,      true,        false   )
NUI_SB( OsZoomSliderThumb_120,               4,       0,     0,    0,     0,        true,       true,     true,      true,      true,        false   )
NUI_SB( OsZoomSliderThumb,                   4,       0,     0,    0,     0,        true,       true,     true,      true,      true,         true   )

#endif //NUI_SB


