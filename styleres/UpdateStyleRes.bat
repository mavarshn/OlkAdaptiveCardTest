@echo off
setlocal

if "%1" NEQ "" (
echo Setting platform to %1
set PLATFORM=%1
) else (
set PLATFORM=x64
)

cd %SRCROOT%\netui\test\viewer\styleres\

sd edit * > NUL

for %%F in ( %SRCROOT%\mso\nui\styleres\*.png ) do if not exist %%~nF.png (
copy %BUILDROOT%\%PLATFORM%\debug\mso\inc\%%~nF.png > NUL
sd add %%~nF.png
) else (
copy %BUILDROOT%\%PLATFORM%\debug\mso\inc\%%~nF.png > NUL
)

for %%F in ( %SRCROOT%\mso\nui\styleres\*.bmp ) do if not exist %%~nF.bmp (
copy %%~F %%~nF.bmp > NUL
sd add %%~nF.bmp
) else (
copy %%~F %%~nF.bmp > NUL
)

:: Put the header at the top of the Cached*SmartBitmapDefinitions.h file
sd edit %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapDefinitions.h
echo /*------------------------------------------------------------------------------ >  %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapDefinitions.h
echo 	%%%%Owner: UEX                                                                >> %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapDefinitions.h
echo 	%%%%Id: 010A3BC4-D701-48F5-96B6-78D81F9FBBE6                                  >> %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapDefinitions.h
echo ------------------------------------------------------------------------------*/ >> %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapDefinitions.h
type %TARGETROOT%\%PLATFORM%\debug\mso\x-none\Mso40UISmartBitmapDefinitions.h >> %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapDefinitions.h

sd edit %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapDefinitions.h
echo /*------------------------------------------------------------------------------ >  %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapDefinitions.h
echo 	%%%%Owner: UEX                                                                >> %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapDefinitions.h
echo 	%%%%Id: 12E5CE13-317B-4795-A23A-98FDDCB29A0F                                  >> %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapDefinitions.h
echo ------------------------------------------------------------------------------*/ >> %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapDefinitions.h
type %TARGETROOT%\%PLATFORM%\debug\mso\x-none\Mso99LSmartBitmapDefinitions.h >> %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapDefinitions.h

:: Put the header at the top of the CachedNUISmartBitmapDefinitions.h file
sd edit %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapDefinitions.h
echo /*------------------------------------------------------------------------------ >  %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapDefinitions.h
echo 	%%%%Owner: UEX                                                                >> %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapDefinitions.h
echo 	%%%%Id: d52bd05b-e7cb-4c40-8b62-97776af5b6f9                                  >> %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapDefinitions.h
echo ------------------------------------------------------------------------------*/ >> %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapDefinitions.h
type %TARGETROOT%\%PLATFORM%\debug\mso\x-none\NUISmartBitmapDefinitions.h >> %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapDefinitions.h

sd edit %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapTable.h
echo /*------------------------------------------------------------------------------ >  %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapTable.h
echo 	This is a cached copy of the Mso40UISmartBitmapTable.h, don't modify manually.>> %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapTable.h
echo 	Run UpdateStyleRes.bat to update this file, along with all the SmartBitmaps   >> %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapTable.h
echo ------------------------------------------------------------------------------*/ >> %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapTable.h
type %OTOOLS%\inc\netui\Mso40UISmartBitmapTable.h >> %SRCROOT%\netui\test\viewer\CachedMso40UISmartBitmapTable.h

sd edit %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapTable.h
echo /*------------------------------------------------------------------------------ >  %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapTable.h
echo 	This is a cached copy of the Mso99LSmartBitmapTable.h, don't modify manually. >> %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapTable.h
echo 	Run UpdateStyleRes.bat to update this file, along with all the SmartBitmaps   >> %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapTable.h
echo ------------------------------------------------------------------------------*/ >> %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapTable.h
type %OTOOLS%\inc\netui\Mso99LSmartBitmapTable.h >> %SRCROOT%\netui\test\viewer\CachedMso99LSmartBitmapTable.h

sd edit %SRCROOT%\netui\test\viewer\CachedMso99SmartBitmapTable.h
echo /*------------------------------------------------------------------------------ >  %SRCROOT%\netui\test\viewer\CachedMso99SmartBitmapTable.h
echo 	This is a cached copy of the Mso99SmartBitmapTable.h, don't modify manually.  >> %SRCROOT%\netui\test\viewer\CachedMso99SmartBitmapTable.h
echo 	Run UpdateStyleRes.bat to update this file, along with all the SmartBitmaps   >> %SRCROOT%\netui\test\viewer\CachedMso99SmartBitmapTable.h
echo ------------------------------------------------------------------------------*/ >> %SRCROOT%\netui\test\viewer\CachedMso99SmartBitmapTable.h
type %OTOOLS%\inc\netui\Mso99SmartBitmapTable.h >> %SRCROOT%\netui\test\viewer\CachedMso99SmartBitmapTable.h

sd edit %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapThemes.h
echo /*------------------------------------------------------------------------------ >  %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapThemes.h
echo 	This is a cached copy of the NUISmartBitmapThemes.h, don't modify manually.   >> %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapThemes.h
echo 	Run UpdateStyleRes.bat to update this file, along with all the SmartBitmaps   >> %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapThemes.h
echo ------------------------------------------------------------------------------*/ >> %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapThemes.h
type %OTOOLS%\inc\netui\NUISmartBitmapThemes.h >> %SRCROOT%\netui\test\viewer\CachedNUISmartBitmapThemes.h

sd revert -a * > NUL

set SRCROOTPATH=%MSO:~3%
sd edit %SRCROOT%\netui\test\viewer\mso40uistyle.rc
sd edit %SRCROOT%\netui\test\viewer\mso99lstyle.rc
sd edit %SRCROOT%\netui\test\viewer\nuistyle.rc
copy %BUILDROOT%\%PLATFORM%\debug\mso\mso40uires\objd\i386\nuistyle.rc %SRCROOT%\netui\test\viewer\mso40uistyle.rc
copy %BUILDROOT%\%PLATFORM%\debug\mso\mso99lres\objd\i386\nuistyle.rc %SRCROOT%\netui\test\viewer\mso99lstyle.rc
copy %BUILDROOT%\%PLATFORM%\debug\mso\msores\objd\i386\nuistyle.rc %SRCROOT%\netui\test\viewer\nuistyle.rc

endlocal
