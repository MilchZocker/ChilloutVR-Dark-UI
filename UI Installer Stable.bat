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
echo ^    ^|  ChilloutVR Dark UI by UCC installer    ^|
echo:

:: Is ChilloutVR Folder?

echo [33m---------------------- Pre-Setup -----------------------[0m

IF NOT exist "ChilloutVR_Data" (
	echo [31m
	echo It seems that this folder isn't the ChilloutVR Game Folder.
)
SET choice=
SET /p choice=Should we Search for the ChilloutVR Folder? That Could Take a Long Time you should move this installer into the ChilloutVR Folder if you dont want to wait. [N][Y]: 
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
echo:

:: Download UI Stable from Github.

echo [33m----------------- Custome UI ------------------[0m

echo Downloading newest UI from github...
powershell -Command "Invoke-WebRequest https://github.com/MilchZocker/ChillouVR-Dark-UI/archive/Stable.zip -OutFile UI.zip"
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
move /Y "ChillouVR-Dark-UI-Stable\ui.css" "CVRTest"
move /Y "ChillouVR-Dark-UI-Stable\index.html" "CVRTest"
move /-Y "ChillouVR-Dark-UI-Stable\background.png" "CVRTest"
   )
:: Cleanup Unused Files.
)
echo [33m-------------------- Final Cleanup ---------------------[0m
del /Q /F 7z.exe
del /Q /F "ChillouVR-Dark-UI-Stable\README.md"
del /Q /F "ChillouVR-Dark-UI-Stable\LICENSE"
del /Q /F "ChillouVR-Dark-UI-Stable\news!.png"
rmdir /Q /S "ChillouVR-Dark-UI-Stable"
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
pause
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