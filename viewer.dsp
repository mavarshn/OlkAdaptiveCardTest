# Microsoft Developer Studio Project File - Name="viewer" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) External Target" 0x0106

CFG=viewer - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "viewer.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "viewer.mak" CFG="viewer - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "viewer - Win32 Release" (based on "Win32 (x86) External Target")
!MESSAGE "viewer - Win32 Debug" (based on "Win32 (x86) External Target")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName "viewer"
# PROP Scc_LocalPath "."

!IF  "$(CFG)" == "viewer - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Cmd_Line "NMAKE /f viewer.mak"
# PROP BASE Rebuild_Opt "/a"
# PROP BASE Target_File "viewer.exe"
# PROP BASE Bsc_Name "viewer.bsc"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Cmd_Line "obuild.bat ship"
# PROP Rebuild_Opt "full"
# PROP Target_File "netuiview.exe"
# PROP Bsc_Name ""
# PROP Target_Dir ""

!ELSEIF  "$(CFG)" == "viewer - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Cmd_Line "NMAKE /f viewer.mak"
# PROP BASE Rebuild_Opt "/a"
# PROP BASE Target_File "viewer.exe"
# PROP BASE Bsc_Name "viewer.bsc"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Cmd_Line "obuild.bat debug"
# PROP Rebuild_Opt "full"
# PROP Target_File "netuiview.exe"
# PROP Bsc_Name ""
# PROP Target_Dir ""

!ENDIF 

# Begin Target

# Name "viewer - Win32 Release"
# Name "viewer - Win32 Debug"

!IF  "$(CFG)" == "viewer - Win32 Release"

!ELSEIF  "$(CFG)" == "viewer - Win32 Debug"

!ENDIF 

# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\viewer.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\buffer.nui
# End Source File
# Begin Source File

SOURCE=.\errorwin.nui
# End Source File
# Begin Source File

SOURCE=.\OfficeStyles.nui
# End Source File
# Begin Source File

SOURCE=.\resource.h
# End Source File
# Begin Source File

SOURCE=.\shell.ico
# End Source File
# Begin Source File

SOURCE=.\shellsm.ico
# End Source File
# Begin Source File

SOURCE=.\viewer.rc
# End Source File
# End Group
# Begin Group "Demos"

# PROP Default_Filter "*.xml;*.ui;*.nui"
# Begin Source File

SOURCE=.\samples\accessibility.xml
# End Source File
# Begin Source File

SOURCE=.\samples\checkboxes.xml
# End Source File
# Begin Source File

SOURCE=..\cit\cit1.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALAbsolute.xml
# End Source File
# Begin Source File

SOURCE=.\samples\dalall.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALanim.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALCheckBox.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALCit.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALFlow.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALFrameGroup.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALGroupBox.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALHierarchy.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALHorizDistribute.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALhorizVert.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALHyperLink.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALImage.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALLabel.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALLayout.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALListView.xml
# End Source File
# Begin Source File

SOURCE=.\samples\dalmargin.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALNoMargin.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALOverLap.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALPcc.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALRTL.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALScrollViewer.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALSelfLayout.xml
# End Source File
# Begin Source File

SOURCE=.\samples\dalShrinkWidthCrash.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALtable.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALTable2.xml
# End Source File
# Begin Source File

SOURCE=.\samples\DALZoom.xml
# End Source File
# Begin Source File

SOURCE=.\samples\dui1.xml
# End Source File
# Begin Source File

SOURCE=.\samples\dui2.xml
# End Source File
# Begin Source File

SOURCE=".\samples\dui3-multicond.xml"
# End Source File
# Begin Source File

SOURCE=".\samples\dui3-StyleDefs.xml"
# End Source File
# Begin Source File

SOURCE=.\samples\dui3.xml
# End Source File
# Begin Source File

SOURCE=.\samples\dui4.xml
# End Source File
# Begin Source File

SOURCE=.\samples\dui5.xml
# End Source File
# Begin Source File

SOURCE=.\samples\externalStyles.xml
# End Source File
# Begin Source File

SOURCE=.\samples\image.xml
# End Source File
# Begin Source File

SOURCE=.\samples\imagebutton.xml
# End Source File
# Begin Source File

SOURCE=.\samples\mytest.xml
# End Source File
# Begin Source File

SOURCE=".\samples\perf-2000buttons.xml"
# End Source File
# Begin Source File

SOURCE=.\samples\radiobuttons.xml
# End Source File
# Begin Source File

SOURCE=.\samples\richedit.xml
# End Source File
# Begin Source File

SOURCE=.\samples\richlabel.xml
# End Source File
# Begin Source File

SOURCE=.\samples\scrollviewer.xml
# End Source File
# End Group
# End Target
# End Project
