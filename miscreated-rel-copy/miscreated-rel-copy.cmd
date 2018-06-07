@echo off
@REM Set MISDIR to the Miscreated directory in your steam library.
@REM Set RELDIR to where you would like to maintain your "live release" copy.
set MISDIR=D:\Program Files (x86)\Steam\steamapps\common\Miscreated
set RELDIR=D:\Games\Miscreated
mode con: cols=120 lines=32
echo In Steam, if the Miscreated entry in the games list says "Miscreated [dev]", echo then do the following:
echo.
echo   If the [dev] client and the release client are currently the same version (this typically is only true when the
echo   servers have been brought offline for a client/server update or hotfix), go ahead and press a key now to continue.
echo.
echo   If the above scenario isn't true, or you are unsure:
echo   Right-mouse-click on the Miscreated [dev] entry in Steam and select Properties. Select the BETAS tab and change the
echo   beta drop down list to NONE. The game will start to update. Once the updated has completed, press a key to continue.
echo.
pause

echo Copying Miscreated files:
robocopy "%MISDIR%" "%RELDIR%" /MT /E /Z /PURGE
echo Creating Desktop shortcut to the Miscreated "live release" version:
shortcut /F:"%USERPROFILE%\Desktop\Miscreated Live Release.lnk" /A:C /T:"%RELDIR%\Miscreated.exe" /W:"%RELDIR%"

echo.
echo The copy is now complete. In Steam right-mouse-click on the Miscreated entry, select the BETAs tab, and change the beta
echo drop down list to "dev" if it is not already on the "dev" version. Once the update is complete, you will then be able
echo to play the Miscreated [dev] version from within Steam, or use the "Miscreated Live Release" link on the Desktop to
echo play the live release version.
echo.
pause
