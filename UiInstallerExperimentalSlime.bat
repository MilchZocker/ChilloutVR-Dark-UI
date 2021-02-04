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
echo ^    ^|  ChilloutVR UI by Slime (Installer by UCC)   ^|
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
echo:

:: Download Slime-UI Experimental from Github.

echo [33m----------------- Custome UI ------------------[0m

echo Downloading newest UI from github...
powershell -Command "Invoke-WebRequest https://codeload.github.com/Slime-Senpai/SlimyCVRUI/zip/experimental -OutFile UI.zip"
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
move /Y "SlimyCVRUI-experimental\CVRTest\classlist.js" "CVRTest"
move /Y "SlimyCVRUI-experimental\CVRTest\feed.js" "CVRTest"
move /Y "SlimyCVRUI-experimental\CVRTest\index.html" "CVRTest"
move /Y "SlimyCVRUI-experimental\CVRTest\slimyConfig.js" "CVRTest"
move /Y "SlimyCVRUI-experimental\CVRTest\ui.css" "CVRTest"
move /Y "SlimyCVRUI-experimental\CVRTest\ui2.css" "CVRTest"
move /Y "SlimyCVRUI-experimental\CVRTest\ui3.css" "CVRTest"
move /Y "SlimyCVRUI-experimental\CVRTest\ui.js" "CVRTest"
move /Y "SlimyCVRUI-experimental\CVRTest\ui2.js" "CVRTest"
   )
:: Cleanup Unused Files.
)
echo [33m-------------------- Final Cleanup ---------------------[0m
del /Q /F 7z.exe
del /Q /F "SlimyCVRUI-experimental\README.md"
rmdir /Q /S "SlimyCVRUI-experimental\CVRTest"
rmdir /Q /S "SlimyCVRUI-experimental"
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