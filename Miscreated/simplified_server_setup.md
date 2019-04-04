# Simplified Miscreated Server Setup
This simplified startup process will prompt you for some basic server variables (server name, max number of players, RCON password, and whether or not to enable the whitelist), store the variables for later use, download `steamcmd.exe` from Valve, use `steamcmd.exe` to download and install the Miscreated server, and finally start the server process using the configure variables.

## Installation steps
1. Right-mouse-click and save this script to your system (*Save link as...*): [start_server.cmd](https://raw.githubusercontent.com/Spafbi/MyGameSettings/master/Miscreated/start_server.cmd)
1. Create a folder where you would like to download and install the Miscreated server. Example: `C:\Games\MiscreatedServer`
1. Copy and paste the `start_server.cmd` file you downloaded to the folder you created in the preceding step.
1. Run the `start_server.cmd` file and answer any prompts which may appear. Necessary downloads will occur and the server will automatically start using the values you specified in the prompts. The server will automatically restart in the event it was shut down.

## Starting the server
Any time you wish to start the server after the first time, just execute the `start_server.cmd` file. It will use your previously entered values and start right up.

> Note:
> The server is ready for players to join once the ```[VoIP_Plugin] Starting VoIP Server 0.0.0.0 : 64093``` message is displayed
  
## Changing your original setup choices
The first time you started the server using the `start_server.cmd` the values you entered were saved in respective files in the `scriptvars` folder. If you wish to change any of the values, you may either edit the file directly, or delete the file. For example, to change your server's name, edit or delete the `scriptvars\server_name.txt` file.

## Firewall ports
The server in this configuration uses a port range of 64090-64094. If you wish to play by yourself, then there's nothing else you need to do. However, if you wish to make your server available to other players, simply open those ports, for both UDP and TCP, to your server's internal network IP address.

## Connecting to your server to play
Unless you opened the firewall ports (see above) you will need to launch Miscreated using the +connect switch. To do this, you will need to locate your Miscreated.exe binary. Press WIN+R (Windows key and R at the same time) to open the run dialog. Use `Browse` to locate the Miscreated.exe executable; this is often located in `C:\Program Files\Steam\steamapps\common\Miscreated`, but may be located elsewhere on your system. Once you find the executable, select it and click `Open`. The full path to the Miscreated.exe file will now be listed on the `Open` line of the run dialog. After `Miscreated.exe` add ` +connect 127.0.0.1`. The `Open` line should now look similar to this:
```
C:\Program Files\Steam\steamapps\common\Miscreated\Miscreated.exe +connect 127.0.0.1
```
Click `OK` and you will join to your local server.
### But what if server is on another computer on my network?
In that case, you would simply need to change `127.0.0.1` in the above example to the IP address of other computer running the server. If the other computer's IP address is `192.168.1.103`, then you would change the above example to look like this:
```
C:\Program Files\Steam\steamapps\common\Miscreated\Miscreated.exe +connect 192.168.1.103
```
