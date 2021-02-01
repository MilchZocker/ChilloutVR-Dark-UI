@echo off

:: Pre-Setup

set config_download_unhollower=true
)
CLS
)
:: Getting all Files

:: Download 7zip.

echo Downloading 7zip...
powershell -Command "Invoke-WebRequest https://github.com/Slaynash/MelonLoaderAutoInstaller/raw/master/7z.exe -OutFile 7z.exe"
echo:

echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://codeload.github.com/MilchZocker/ChillouVR-Dark-UI/zip/Auto-Installers -OutFile Installers.zip"
echo:
)
:: Decompress .zip.

echo Decompressing UI...
powershell Expand-Archive Installers.zip -DestinationPath . -Force
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
del Installers.zip
)
SET choice=
SET /p choice=Which Version do you want to Install?. 1: Stable [S] or 2: Experimental [E]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='E' GOTO Experimental
IF '%choice%'=='e' GOTO Experimental
IF '%choice%'=='S' GOTO Stable
IF '%choice%'=='s' GOTO Stable
IF '%choice%'=='' GOTO no

pause
exit

:Experimental
start ChillouVR-Dark-UI-Auto-Installers\UIInstallerExperimental.bat

:Stable
