@echo off

:: Pre-Setup

set config_download_unhollower=true
)
CLS
)
echo [33m---------------------- Pre-Setup -----------------------[0m
)
:: Download 7zip.

echo Downloading 7zip...
powershell -Command "Invoke-WebRequest https://github.com/Slaynash/MelonLoaderAutoInstaller/raw/master/7z.exe -OutFile 7z.exe"
echo:

echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://codeload.github.com/MilchZocker/ChillouVR-Dark-UI/zip/Auto-Installers -OutFile Installers.zip"
echo:
)
echo [33m---------------------- Decompressing UI... -----------------------[0m
)
:: Decompress .zip.

echo Decompressing Installers...
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
echo [33m---------------------- Select Custome UI Typ -----------------------[0m
)
:: Selection of UI's

SET choice=
SET /p choice=Which UI you want to Install?. 1: MilchZockers [M] or 2: Slime's [S]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='M' GOTO MilchZockers
IF '%choice%'=='m' GOTO MilchZockers
IF '%choice%'=='S' GOTO Slimes
IF '%choice%'=='s' GOTO Slimes
IF '%choice%'=='' GOTO no
)
echo [33m---------------------- Select UI Version -----------------------[0m
)
:MilchZockers
SET choice=
SET /p choice=Which Version do you want to Install?. 1: Stable [S] or 2: Experimental [E]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='E' GOTO Experimental-MilchZocker
IF '%choice%'=='e' GOTO Experimental-MilchZocker
IF '%choice%'=='S' GOTO Stable-MilchZocker
IF '%choice%'=='s' GOTO Stable-MilchZocker
IF '%choice%'=='' GOTO no
)
pause
exit
)
echo [33m---------------------- Select UI Version -----------------------[0m
)
:Slimes
SET choice=
SET /p choice=Which Version do you want to Install?. 1: Stable [S] or 2: Experimental [E]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='E' GOTO Experimental-Slime
IF '%choice%'=='e' GOTO Experimental-Slime
IF '%choice%'=='S' GOTO Stable-Slime
IF '%choice%'=='s' GOTO Stable-Slime
IF '%choice%'=='' GOTO no
)
pause
exit
)
:Experimental-MilchZocker
start ChillouVR-Dark-UI-Auto-Installers\UIInstallerExperimental.bat
goto CleanUP
exit
)
:Stable-MilchZocker
start ChillouVR-Dark-UI-Auto-Installers\UIInstallerStable.bat
goto CleanUP
exit
)
:Experimental-Slime
start ChillouVR-Dark-UI-Auto-Installers\UiInstallerExperimentalSlime.bat
goto CleanUP
exit
)
:Stable-Slime
start ChillouVR-Dark-UI-Auto-Installers\UiInstallerStableSlime.bat
goto CleanUP
exit
)


:CleanUP
)
echo [33m-------------------- Final Cleanup ---------------------[0m
del /Q /F 7z.exe
)
exit
