@echo off

:: Pre-Setup

IF NOT exist "ChilloutVR_Data" (
	echo [31m
	echo It seems that this folder isn't the ChilloutVR Game Folder please move this bat into the ChilloutVR Game Folder!.
pause
GOTO NotFound
)

set config_download_unhollower=true
)
CLS
)
echo [33m---------------------- Pre-Setup -----------------------[0m
)
if not exist "ChillouVR-Dark-UI-Auto-Installers" mkdir ChillouVR-Dark-UI-Auto-Installers
)
For /F %%A In ('
    MsHTA VBScript:Execute("Set o=CreateObject(""Scripting.FileSystemObject""):o.GetStandardStream(1).Write(o.GetFileVersion(""ChilloutVR.exe"")):Close"^)
') Do Set "CVR=%%A"
echo current CVR executable version is %CVR%
set current=2019.4.13.34615
if %CVR%==%current% (
goto current
)
if not %CVR%==%current% (
goto outdated
)
:current
)
echo [33m---------------------- Select Custome UI Typ -----------------------[0m
)
:: Selection of UI's

SET choice=
SET /p choice=Which UI you want to Install?. 1: MilchZockers [M] , 2: Slime's [S] , 3: Neradon's [N]: or 3: Deinstall Custom UI (could delete UI settings) [D]:
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='M' GOTO MilchZockers
IF '%choice%'=='m' GOTO MilchZockers
IF '%choice%'=='S' GOTO Slimes
IF '%choice%'=='s' GOTO Slimes
IF '%choice%'=='N' GOTO Neradons
IF '%choice%'=='n' GOTO Neradons
IF '%choice%'=='D' GOTO Default
IF '%choice%'=='d' GOTO Default
IF '%choice%'=='' GOTO no
)
:MilchZockers
echo [33m---------------------- Select UI Version -----------------------[0m
)
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
:Slimes
echo [33m---------------------- Select UI Version -----------------------[0m
)
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
)
:Neradons
echo [33m---------------------- Select UI Version -----------------------[0m
)
SET choice=
SET /p choice=Which Version do you want to Install?. 1: Stable [S] or 2: Experimental [E]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='E' GOTO Experimental-Neradon
IF '%choice%'=='e' GOTO Experimental-Neradon
IF '%choice%'=='S' GOTO Stable-Neradon
IF '%choice%'=='s' GOTO Stable-Neradon
IF '%choice%'=='' GOTO no
)
pause
exit
)
:Experimental-MilchZocker
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChillouVR-Dark-UI/Auto-Installers/UiInstallerExperimental.bat -OutFile ChillouVR-Dark-UI-Auto-Installers\UIInstallerExperimental.bat"
echo:
start ChillouVR-Dark-UI-Auto-Installers\UIInstallerExperimental.bat
SET UI=UiInstallerExperimental
goto CleanUP
exit
)
:Stable-MilchZocker
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChillouVR-Dark-UI/Auto-Installers/UiInstallerStable.bat -OutFile ChillouVR-Dark-UI-Auto-Installers\UiInstallerStable.bat"
echo:
start ChillouVR-Dark-UI-Auto-Installers\UIInstallerStable.bat
SET UI=UiInstallerStable
goto CleanUP
exit
)
:Experimental-Slime
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChillouVR-Dark-UI/UiInstallerExperimentalSlime.bat -OutFile ChillouVR-Dark-UI-Auto-Installers\UiInstallerExperimentalSlime.bat"
echo:
start ChillouVR-Dark-UI-Auto-Installers\UiInstallerExperimentalSlime.bat
SET UI=UiInstallerExperimentalSlime
goto CleanUP
exit
)
:Stable-Slime
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChillouVR-Dark-UI/Auto-Installers/UiInstallerStableSlime.bat -OutFile ChillouVR-Dark-UI-Auto-Installers\UiInstallerStableSlime.bat"
echo:
start ChillouVR-Dark-UI-Auto-Installers\UiInstallerStableSlime.bat
SET UI=UiInstallerStableSlime
goto CleanUP
exit
)
:Experimental-Neradon
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChillouVR-Dark-UI/Auto-Installers/UiInstallerExperimentalNeradon.bat -OutFile ChillouVR-Dark-UI-Auto-Installers\UiInstallerExperimentalNeradon.bat"
echo:
start ChillouVR-Dark-UI-Auto-Installers\UiInstallerExperimentalNeradon.bat
SET UI=UiInstallerExperimentalNeradon
goto CleanUP
exit
)
:Stable-Neradon
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChillouVR-Dark-UI/Auto-Installers/UiInstallerStableNeradon.bat -OutFile ChillouVR-Dark-UI-Auto-Installers\UiInstallerStableNeradon.bat"
echo:
start ChillouVR-Dark-UI-Auto-Installers\UiInstallerStableNeradon.bat
SET UI=UiInstallerStableNeradon
goto CleanUP
exit
)
:Default
echo Downloading Experimental UI Installer...
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/MilchZocker/ChillouVR-Dark-UI/Auto-Installers/UIInstallerStableDefault.bat -OutFile ChillouVR-Dark-UI-Auto-Installers\UIInstallerStableDefault.bat"
echo:
start ChillouVR-Dark-UI-Auto-Installers\UIInstallerStableDefault.bat
SET UI=UIInstallerStableDefault
goto CleanUP
exit
)
:NotFound
)
exit
)
:outdated
echo Custome Ui's might be outdated do you wanna continue anyway?!
SET choice=
SET /p choice=do you want to continue anyway? that could couse problemes. 1: Yes [Y] or 2: No [N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO current
IF '%choice%'=='y' GOTO current
IF '%choice%'=='N' GOTO not
IF '%choice%'=='N' GOTO not
IF '%choice%'=='' GOTO not
)
pause
exit
)
:no
echo Installer will now close if you want to install an UI type the corresponding letter!
del /Q /F "ChillouVR-Dark-UI-Auto-Installers\*"
TIMEOUT /T 10
del /Q /F 7z.exe
del /Q /F 7z.dll
exit
)
:not
echo Installer will now close if you need any help join us on Discord: https://discord.gg/yApCk5atsa
TIMEOUT /T 10
exit
)
:CleanUP
)
echo [33m-------------------- Final Cleanup ---------------------[0m
del /Q /F 7z.exe
del /Q /F 7z.dll
attrib +R "ChillouVR-Dark-UI-Auto-Installers\%UI%.bat"
del /Q "ChillouVR-Dark-UI-Auto-Installers\*"
)
TIMEOUT /T 3
exit
