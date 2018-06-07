@echo off
@REM Set MISDIR to the Miscreated directory in your steam library.
@REM Set RELDIR to where you would like to maintain your "live release" copy.
set MISDIR=D:\Program Files (x86)\Steam\steamapps\common\Miscreated
set RELDIR=D:\Games\Miscreated

echo In Steam, if the Miscreated entry in the games list says "Miscreated [dev]",
echo then do the following:
echo.
echo   If the [dev] client and the release client are currently the same
echo   version (this typically is only true when the servers have been brought
echo   offline for a client/server update or hotfix), go ahead and press a key
echo   now to continue.
echo.
echo   If the above scenario isn't true:
echo   Right-mouse-click on the Miscreated [dev] entry and select Properties.
echo   Select the BETAS tab and change the beta drop down list to NONE. The
echo   game will start to update. Once the updated has completed, press a key
echo   to continue.
echo.
pause
echo Copying Miscreated files:
robocopy "%MISDIR%" "%RELDIR%" /MT /E /Z /PURGE
echo Creating Desktop shortcut to the Miscreated "live release" version:
shortcut /F:"%USERPROFILE%\Desktop\Miscreated Live Release.lnk" /A:C /T:"%RELDIR%\Miscreated.exe" /W:"%RELDIR%"
echo.
echo The copy is now complete. In Steam, right-mouse-click on the Miscreated
echo entry, select the BETAs tab, and change the beta drop down list to "dev".
echo Once the update is complete, you will then be able to play the Miscreated
echo [dev] version from within Steam, or use the "Miscreated Live Release" link
echo on the Desktop to play the live release version.
echo.
pause