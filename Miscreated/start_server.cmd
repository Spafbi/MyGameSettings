@echo OFF
REM - This grabs and parses the directory in which this CMD file exists.
set BASEPATH=%~dp0
set BASEPATH=%BASEPATH:~0,-1%
goto setup

:setservername
if exist "%VARIABLESDIR%\server_name.txt" (
  set /p SERVERNAME=<"%VARIABLESDIR%\server_name.txt"
) else (
  echo Enter a server name. This is the name which will appear in the in game server list
  set /p SERVERNAME="Enter server name: " || set SERVERNAME=DONTJUSTPRESSENTER
)
if "%SERVERNAME%"=="DONTJUSTPRESSENTER" goto setservername
echo %SERVERNAME%>"%VARIABLESDIR%\server_name.txt"
echo CONFIG: The servername will be: %SERVERNAME%
goto :eof

:setwhitelisted
if exist "%VARIABLESDIR%\whitelisted.txt" (
  set /p WHITELISTED=<"%VARIABLESDIR%\whitelisted.txt"
) else (
  echo Would like for the server to be whitelisted? Enter Y for yes, N for no.
  set /p WHITELISTED="Whitelist the server [Y/N]: " || set WHITELISTED=DONTJUSTPRESSENTER
)
if /I "%WHITELISTED%"=="y" (
  echo CONFIG: The server will be whitelisted.
  echo         You will need to add your Steam64ID to the whitelist before joining the server.
) else if /I "%WHITELISTED%"=="n" (
  echo CONFIG: The server will not be whitelisted...
) else (
  echo Please enter Y for yes, or N for no.
  echo.
  goto setwhitelisted
)
echo %WHITELISTED%>"%VARIABLESDIR%\whitelisted.txt"
goto :eof

:setmaxplayers
if exist "%VARIABLESDIR%\maxplayers.txt" (
  set /p MAXPLAYERS=<"%VARIABLESDIR%\maxplayers.txt"
) else (
  set /p MAXPLAYERS="Enter the maximum number of players [1-50]: " || set MAXPLAYERS=DONTJUSTPRESSENTER
)
if "%MAXPLAYERS%"=="DONTJUSTPRESSENTER" goto setservername
SET "var="&for /f "delims=0123456789" %%i in ("%MAXPLAYERS%") do set var=%%i
if defined var (
  echo Enter only numeric values.
  goto setmaxplayers
)
if %MAXPLAYERS% gtr 50 (
  echo The entered value must be no more than 50
  if exist "%VARIABLESDIR%\maxplayers.txt" (del "%VARIABLESDIR%\maxplayers.txt")
  goto setmaxplayers
)
echo %MAXPLAYERS%>"%VARIABLESDIR%\maxplayers.txt"
echo CONFIG: The maximum number of players will be set to: %MAXPLAYERS%
goto :eof

:setrconpassword
if exist "%VARIABLESDIR%\rcon_password.txt" (
  set /p RCONPASS=<"%VARIABLESDIR%\rcon_password.txt"
) else (
  echo Enter the password you would like to use with your server's RCON
  set /p RCONPASS="Password: " || set RCONPASS=DONTJUSTPRESSENTER
)
if "%RCONPASS%"=="DONTJUSTPRESSENTER" goto setrconpassword
echo %RCONPASS%>"%VARIABLESDIR%\rcon_password.txt"
echo Syncing RCON password with set variable...
if not exist "%SERVERDIR%\hosting.cfg" (
  echo http_password=%RCONPASS%>>"%SERVERDIR%\hosting.cfg"
) else (
  copy /v /y "%SERVERDIR%\hosting.cfg" "%SERVERDIR%\hosting.cfg.bak"
  type "%SERVERDIR%\hosting.cfg" | findstr /v "http_password=">>"%SERVERDIR%\hosting.cfg.new"
  echo http_password=%RCONPASS%>>"%SERVERDIR%\hosting.cfg.new"
  move /y "%SERVERDIR%\hosting.cfg.new" "%SERVERDIR%\hosting.cfg"
)
echo.
goto :eof

:start
echo.
echo.
"%STEAMCMDBIN%" +login anonymous +force_install_dir %SERVERDIR% +app_update 302200 validate +quit
set MISSERVERBIN=%SERVERDIR%\Bin64_dedicated\MiscreatedServer.exe
if not exist "%MISSERVERBIN%" (
  echo Something went wrong: The server may not have been installed by steamcmd.
  pause
  exit /B
)
"%MISSERVERBIN%" %OPTIONS% +sv_maxplayers %MAXPLAYERS% +map islands +sv_servername "%SERVERNAME%" +http_startserver
goto start

:getsteamcmd
set STEAMARCHIVE="%BASEPATH%\steamcmd.zip"
curl -L https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip -o "%STEAMARCHIVE%"
@powershell Expand-Archive -LiteralPath "%STEAMARCHIVE%" -DestinationPath "%STEAMCMDPATH%"
goto :eof

:setup
REM - Make sure a script variables directory exists
set VARIABLESDIR=%BASEPATH%\scriptvars
if not exist "%VARIABLESDIR%" (
  echo Creating subdirectory: %VARIABLESDIR%
  md "%VARIABLESDIR%"
  echo.
)
call :setservername
call :setwhitelisted
if /I %WHITELISTED%=="y" (
  set WHITELISTED=-mis_whitelist
) else (
  set WHITELISTED=
)
call :setmaxplayers

set SERVERDIR=%BASEPATH%\MiscreatedServer

if not exist "%SERVERDIR%" (
  echo Creating directory: "%SERVERDIR%"...
  md "%SERVERDIR%"
)

call :setrconpassword

set STEAMCMDPATH=%BASEPATH%\SteamCMD
set STEAMCMDBIN=%STEAMCMDPATH%\steamcmd.exe

if not exist "%STEAMCMDPATH%" (
  echo Creating directory: "%STEAMCMDPATH%"...
  md "%STEAMCMDPATH%"
)

if not exist "%STEAMCMDBIN%" (
  call :getsteamcmd
)

set OPTIONS=%WHITELISTED%
if defined OPTIONS (
  echo Additional command line options: %OPTIONS%
)

call :start
