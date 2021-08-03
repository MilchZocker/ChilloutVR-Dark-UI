@echo off

:: CONFIGURATION

set config_download_unhollower=true

:: Installer

CLS

echo:
echo [36m
echo ///
echo ///
echo /// POWERSHELL PROGRESS OUTPUT
echo ///
echo ///
echo [0m
echo ^    --------------------------------------------------
echo ^    ^|  ChilloutVR UI by Neradon (Installer by UCC)   ^|
echo:

:: Is ChilloutVR Folder?

echo [33m---------------------- Pre-Setup -----------------------[0m

IF NOT exist "ChilloutVR_Data" (
	echo [31m
	echo It seems that this folder isn't the ChilloutVR Game Folder.

SET choice=
SET /p choice=Should we Search for the ChilloutVR Folder? That Could Take a Long Time you should move this installer into the ChilloutVR Folder if you dont want to wait. [N][Y]: 
)
IF NOT exist "ChilloutVR_Data" (
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
)
:: Go to "UIResources"

:skip
cd /d "ChilloutVR_Data\StreamingAssets\Cohtml\UIResources"

:: Download 7zip.

echo Downloading 7zip...
powershell -Command "Invoke-WebRequest https://github.com/Slaynash/MelonLoaderAutoInstaller/raw/master/7z.exe -OutFile 7z.exe"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/Slaynash/MelonLoaderAutoInstaller/master/7z.dll -OutFile 7z.dll"
echo:

:: Download Neradon-UI Stable from Github.

echo [33m----------------- Custome UI ------------------[0m

echo Downloading newest UI from github...
powershell -Command "Invoke-WebRequest https://codeload.github.com/Neradon/Dasui/zip/refs/heads/main -OutFile UI.zip"
if %errorlevel% neq 0 (
	echo [31m
	echo CRITICAL ERROR: Failed to download UI zip file.
	echo Please report this error to the UCC^).
	echo [0m
	pause
	exit /b %errorlevel%
   )
:: Decompress .zip.
)
echo Decompressing UI...
powershell Expand-Archive UI.zip -DestinationPath . -Force
if %errorlevel% neq 0 (
	echo [31m
	echo CRITICAL ERROR: Failed to extract the UI zip file.
	echo Please report this error to the UCC^).
	echo [0m
	pause
	exit /b %errorlevel%
   )
:: Delete .zip.
)	
del UI.zip
   )
:: Move Files into DestinationPath.
)
echo [33m-------------------- Moving Files.. ---------------------[0m
ROBOCOPY /E /MOVE "Dasui-main" "CVRTest"
   )
:: Cleanup Unused Files.
)
echo [33m-------------------- Final Cleanup ---------------------[0m
del /Q /F 7z.exe
del /Q /F 7z.dll
rmdir /Q /S "Dasui-main"
   )
:: Installation Finished.
)
echo:
echo:
echo [32m
echo ^    --------------------------------------------------
echo ^    ^|         Custome UI is now Installed!          ^|
echo ^    --------------------------------------------------
echo [0m
echo:
echo:
TIMEOUT /T 10
exit
   )
:: no variable.
)
:no
pause
Exit
   )
:: yes variable.
)
:yes

SET filename=ChilloutVR.exe

ECHO Looking for ChilloutVR please wait..

FOR /R \ %%a IN (\) DO (
   IF EXIST "%%a\%filename%" (

      SET fullpath=%%a
      SET fullpathexe=%%a%filename%	  
      GOTO FoundIt
   )
)
:: FoundIt variable.
)
:FoundIt
ECHO thats your ChilloutVR Path: %fullpathexe%
ECHO We will now Continue the Installation...
pause
cd /d "%fullpath%"
GOTO skip
)