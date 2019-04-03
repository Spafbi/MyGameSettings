@ECHO OFF
REM - SERVERNAME is the display name of the server as seen in the in game and Steam
REM - server browsers.
set SERVERNAME=My Private Server

REM Remove "REM" from the following line to whitelist your server
REM set WHITELISTED=true

REM ##### - DO NOT EDIT BELOW THIS LINE!!! - #####
REM ... unless you really know what you are doing ...

if defined WHITELISTED (
  set WHITELISTED=-mis_whitelist
) else (
  set WHITELISTED=
)

REM - This grabs and parses the directory in which this CMD file exists.
set BASEPATH=%~dp0
set BASEPATH=%BASEPATH:~0,-1%

REM - Checking to make sure steamcmd.exe is here, too.
if not exist "%BASEPATH%\steamcmd.exe" (
  echo Please make sure steamcmd.exe exists in the same folder as this script. This
  echo file may be downloaded from
  echo   https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
  echo.
  echo Be sure to unzip the file and place the steamcmd.exe file in this folder
  echo.
  echo.
  pause
  exit /B
)

REM - STEAMCMDPATH is the folder to where our SteamCMD will be copied.
set STEAMCMDPATH=%BASEPATH%\SteamCMD
set STEAMCMDBIN=%STEAMCMDPATH%\steamcmd.exe

if not exist "%STEAMCMDPATH%" (
  echo Creating directory: "%STEAMCMDPATH%"...
  md "%STEAMCMDPATH%"
)

if not exist "%STEAMCMDBIN%" (
  echo Copying steamcmd.exe to %STEAMCMDBIN%...
  copy "%BASEPATH%\steamcmd.exe" "%STEAMCMDBIN%"
)

REM - SERVERDIR is folder where the Miscreated Server will be installed. Keep
REM - in mind that this MUST be a separate folder from your Miscreated game
REM - folder.
set SERVERDIR=%BASEPATH%\MiscreatedServer

if not exist "%SERVERDIR%" (
  echo Creating directory: "%SERVERDIR%"...
  md "%SERVERDIR%"
)

REM - MAXPLAYERS is the maximum number of players the server will allow. This
REM - value has a hard cap of 50, the below example sets the number of players
REM - to 36
set MAXPLAYERS=36

REM most people will want to leave options blank, but I've also supplied some
REM possible use cases in the below comment.
REM set OPTIONS="-sv_bind 172.16.64.111 -sv_port 64090 -mis_whitelist"
set OPTIONS=%WHITELISTED%

goto start
:start
"%STEAMCMDBIN%" +login anonymous +force_install_dir %SERVERDIR% +app_update 302200 validate +quit
set MISSERVERBIN=%SERVERDIR%\Bin64_dedicated\MiscreatedServer.exe
if not exist "%MISSERVERBIN%" (
  echo Something went wrong: The server may not have been installed by steamcmd.
  pause
  exit /B
)
"%MISSERVERBIN%" %OPTIONS% +sv_maxplayers %MAXPLAYERS% +map islands -mis_gameserverid 100 +sv_servername "%SERVERNAME%" +http_startserver
goto start
