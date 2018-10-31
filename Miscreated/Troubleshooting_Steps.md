# Troubleshooting steps for Miscreated
If you are having issues with Miscreated, be sure to follow these steps.

***Note: It's a good idea to reboot after performing each the following steps, then try playing to see if your issue has been resolved.***
## Essential Steps
### REBOOT!
Yes, rebooting your PC is good practice whenever troubleshooting any Windows or gaming issues. Do it!
### Validate game files
Valve has [instructions for validating game files](https://support.steampowered.com/kb_article.php?ref=2037-QEUH-3335). Apply the given instructions to your Miscreated installation.
### Update Windows
It's very important that all Windows updates are current. Before proceeding, please make sure Windows updates, including optional updates, are all installed. Reboot after installing any updates.
## General Performance Issues and/or Graphics Anomalies
***Note: Make sure you have Validated game files before proceeding.***

*Why doesn't Miscreated run as well as ForkKnife, GUBP, DaisY, or Mineshaft?* - Keep in mind that Miscreated is a CryEngine game which pushes CPUs and GPUs harder than most other games. Miscreated uses the *oomph* provided by CryEngine to look as fantastic as it does. Miscreated's in game beauty does come at a cost - less powerful PCs will not be able to run Miscreated at the same performance levels of those less demanding games. Most other games shoot for being able to run on integrated GPUs; Miscreated has no such illustions. (I have played Miscreated on an iGPU... it was terrible.)

*Okay, so Miscreated is a beast to run. But what can I do to help it run better and reduce stuttering?* - There are several things you can do:
1. Make sure you are running in *Fullscreen* mode - Windowed and Fullscreen Window modes both take performance hits.
1. Run the game from an SSD - As you move around the game world Miscreated is loading a lot of data from your drive; slower drives will cause stuttering as you move around.
1. Don't be afraid to reduce in game graphics settings and resolutions - Miscreated doesn't suffer as much visually compared to other games when running at reduced settings and resolutions. I have happily played on a laptop at 720p and all low settings - the game still looks and plays great. As not all settings changes take effect immediately, restart the game after changing settings.
1. *Close *ALL* other applications* (especially browsers, apps, non-driver-related utilities, etc.) and see if the problem persists.
  Many users have reported success using a game booster, such as *Windows Game Mode* (built into Windows 10 Creators Update or later) or [Razer Cortex (free download)](https://www2.razerzone.com/cortex/boost), to manage background processes and assist with system tuning.
1. Press *Winkey+R* to open a *Run* dialog. Enter `%homepath%\Saved Games` in the *Open* field and then click *Ok*. This will open Windows File Explorer to your saved games directory. Delete the `miscreated` directory from this location. Note: When performing this step, all in game Miscreated settings will be reset to their default state. The game must be closed to be able to perform this step.
### Minimum system requirements
Verify your system meets the Miscreated system requirements. You may find the current system requirements at the botton of the [Steam Store page for Miscreated](https://store.steampowered.com/app/299740/Miscreated/).
### Update your video card drivers
Make sure you have the latest video card drivers. Download and install the appropriate driver if you are not running the most current release.
* [NVIDIA](https://www.geforce.com/drivers)
* [AMD](http://support.amd.com/en-us/download)
## Can't run/start Miscreated
First, follow the above steps for *General Performance Issues and/or Graphics Anomalies*.

The following four steps are a *quick fix* for many Miscreated ails. Do them in order, and test to see if Miscreated is working for you after each numbered step:

1. Reboot
1. Verify integrity of the Miscreated game files. Follow [this Steam support](https://support.steampowered.com/kb_article.php?ref=2037-QEUH-3335) article on how to do this.
1. Reinstall EAC
Uninstall EAC, reboot your PC, then go to the Miscreated install folder. By default it should be: `C:\Program Files (x86)\steam\steamapps\common\Miscreated`
Next go to EasyAntiCheat and run `EasyAntiCheat_Setup`. Be sure to select *Miscreated* as the target game.
1. Reinstall support libraries
   1. Go to the Miscreated install folder. By default it should be: `C:\Program Files (x86)\steam\steamapps\common\Miscreated`
   1. Then go to `_CommonRedist\DirectX\Jun2010`
   1. Look for the `DXSETUP.exe` and run it, it will install the proper version of DirectX for the game. 
   1. Then go back to the `CommonRedist` folder.
   1. Go into `vcredist` folder. 
   1. You will see three folders; 2010, 2012, and 2013
   1. Go into the 2010 folder, it should contain two executables, an x64 and a x86 version. Go ahead and run both of them, if prompted to repair or remove, select repair. This will patch your C++ with the files needed to run Miscreated.
   1. Go back to the vcredist folder, then go into the next folder. 
   1. Repeat the same steps for 2012 and 2013, just as you did for the 2010 folder. Install both, and select repair if needed.

## Connection issues 
1. Restart your router/internet gateway device...yes, again.
1. Perform a Winsock reset. A good set of instructions for this may be found here: https://goo.gl/hbvcxq. Be sure to reboot after performing these steps.
1. Open a command prompt as Administrator and execute the following: 
```dos
net stop w32time && w32tm /unregister && w32tm /register && net start w32time && w32tm /resync
```
1. As a last resort troubleshooting step, uninstall Miscreated, restart your PC, and then reinstall Miscreated.

***Note: The following step should be used only for testing purposes and should not be used for gameplay. Detailed instructions for the following step are outside the scope of this help channel.***
* Try using a VPN service. If you can connect to Miscreated servers using a VPN, but not without a VPN, you have a local network issue which needs to be resolved to be able to play the game.

## If all else fails...
Some users have had some success in simply reinstalling the game. It should be noted that if you have followed the above instructions without skipping any steps, you will have already done everything a reinstall does on a basic level.

If a reinstall of the game fails to help, it could be an issue with Windows. Yes, really. Try reinstalling Windows as the last resort. For Windows 10 users, Microsoft has a simplified [reset process](https://support.microsoft.com/en-us/help/4026528/windows-reset-or-reinstall-windows-10) which may be used.
