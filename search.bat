@ECHO OFF

SET filename=ChilloutVR.exe

ECHO Looking for ChilloutVR please wait..

FOR /R \ %%a IN (\) DO (
   IF EXIST "%%a\%filename%" (

      SET fullpath=%%a%filename%
      GOTO FoundIt
   )
)
:FoundIt

ECHO %fullpath%
ECHO you can now close this Window by pressing any Button.
pause
Exit