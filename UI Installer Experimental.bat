@echo off

:: CONFIGURATION

set config_download_unhollower=true

:: CODE

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

echo [33m---------------------- Pre-Setup -----------------------[0m

IF NOT exist "ChilloutVR_Data" (
	echo [31m
	echo It seems that this folder isn't the ChilloutVR Game Folder.

SET choice=
SET /p choice=Should we Search for the ChilloutVR Folder? That Could Take a Long Time you should move this installer into the ChilloutVR Folder if you dont want to wait. [N][Y]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
)

cd /d "ChilloutVR_Data\StreamingAssets\Cohtml\UIResources"
:skip
echo Downloading 7zip...
powershell -Command "Invoke-WebRequest https://github.com/Slaynash/MelonLoaderAutoInstaller/raw/master/7z.exe -OutFile 7z.exe"
powershell -Command "Invoke-WebRequest https://github.com/Slaynash/MelonLoaderAutoInstaller/raw/master/7z.dll -OutFile 7z.dll"
echo:

echo [33m----------------- Custome UI ------------------[0m

echo Downloading newest UI from github...
powershell -Command "Invoke-WebRequest https://github.com/MilchZocker/ChillouVR-Dark-UI/archive/Experimental.zip -OutFile UI.zip"
if %errorlevel% neq 0 (
	echo [31m
	echo CRITICAL ERROR: Failed to download UI zip file.
	echo Please report this error to the UCC^).
	echo [0m
	pause
	exit /b %errorlevel%
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
del UI.zip
)
echo [33m-------------------- Moving Files.. ---------------------[0m
move /Y "ChillouVR-Dark-UI-Experimental\ui.css" "CVRTest"
move /Y "ChillouVR-Dark-UI-Experimental\index.html" "CVRTest"
move /-Y "ChillouVR-Dark-UI-Experimental\background.png" "CVRTest"
)
echo [33m-------------------- Final Cleanup ---------------------[0m
del /Q /F 7z.exe
del /Q /F 7z.dll
del /Q /F "ChillouVR-Dark-UI-Experimental\README.md"
del /Q /F "ChillouVR-Dark-UI-Experimental\LICENSE"
del /Q /F "ChillouVR-Dark-UI-Experimental\news!.png"
rmdir /Q /S "ChillouVR-Dark-UI-Experimental"
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
:no
pause
Exit

)
:yes
for /r \ %%a in (ChilloutVR) do set "location=%%~dpa"
GOTO found
)
:found
cd /d "%%~dpa"
GOTO skip
)